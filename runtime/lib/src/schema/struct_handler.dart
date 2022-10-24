import 'dart:typed_data';

import 'package:messagepack_schema/messagepack_schema.dart';

/// Class used to get and set fields from a type
/// using an intermidiate class to avoid set
/// getters and setters as public.
class StructHandler<T extends SchemaStruct<T>> {
  final SchemaStructDefinition<T> _schema;
  final String _id = DateTime.now().microsecondsSinceEpoch.toString();

  String get id => _id;

  StructHandler(this._schema);

  E getValue<E extends Object?>(int fieldIndex) {

    // get raw value
    Object? rawValue;
    try {
      rawValue = _schema.getFieldValue(fieldIndex);
    } catch(_) {
      throw UnknownFieldError(fieldIndex);
    }

    // if null return the default value of field
    if(rawValue == null && !_schema.fields[fieldIndex].nullable && !_schema.isFieldSet(fieldIndex)) {
      rawValue = _schema.getDefaultValue(fieldIndex);
      setValueSkipCheck(fieldIndex, rawValue);
    }

    try {
      var realValue = rawValue as E;
      return realValue;
    } catch(_) {
      throw InvalidFieldTypeError(fieldIndex, rawValue, _schema.fields[fieldIndex].valueType, E);
    }
  }

  void setValue<E extends Object?>(int fieldIndex, E? value) {
    // verify if field exists
    FieldInfo? fieldInfo;
    try {
      fieldInfo = _schema.fields[fieldIndex];
    } catch(_) {
      throw UnknownFieldError(fieldIndex);
    }

    // verify if field is nullable
    if(value == null && !fieldInfo.nullable) {
      throw FieldNotNullableError(fieldIndex);
    }

    // verify field type
    bool valid = _verifyFieldType(fieldInfo.valueType, value);
    if(!valid) {
      throw InvalidFieldTypeError(fieldIndex, value, fieldInfo.valueType, value);
    }

    _schema.setFieldValue(fieldIndex, value);
  }

  void setList<E extends List>(int fieldIndex, E list) {
    _schema.setFieldValue(fieldIndex, list);
  }

  void setMap<E extends Map>(int fieldIndex, E map) {
    _schema.setFieldValue(fieldIndex, map);
  }

  void setValueSkipCheck(int fieldIndex, Object? value) {
    _schema.setFieldValue(fieldIndex, value);
  }

  bool _verifyFieldType(FieldValueType fieldType, Object? value) {
    if(value == null) {
      return true;
    }

    switch(fieldType) {
      case FieldValueType.string:
        if(value is! String) {
          return false;
        }
        break;

      case FieldValueType.boolean:
        if(value is! bool) {
          return false;
        }
        break;

        case FieldValueType.int8:
        case FieldValueType.int16:
        case FieldValueType.int32:
        case FieldValueType.int64:
        case FieldValueType.uint8:
        case FieldValueType.uint16:
        case FieldValueType.uint32:
        case FieldValueType.uint64:
          if(value is! int) {
            return false;
          }
          break;

        case FieldValueType.float32:
        case FieldValueType.float64:
          if(value is! double) {
            return false;
          }
        break;

        case FieldValueType.custom:
          break;

      default:
        return false;
    }

    return true;
  }

  int getHash(int Function() createHash) {
    int? hash = _schema.hash;
    if(hash == null) {
      hash = createHash();
      _schema.hash = hash;
    }

    return hash;
  }

  Uint8List getBuffer() {
    var writer = MessagePackWriter();
    int idx = 0;
    for(var field in _schema.fields) {
      var fieldValue = _schema.getFieldValue(idx);
      writer.write(field.valueType, fieldValue, field.typeArguments);
      idx++;
    }

    return writer.takeBytes();
  }

  void merge(Uint8List buffer) {
    var reader = MessagePackReader(buffer);
    int idx = 0;
    for(var field in _schema.fields) {
      dynamic defaultValue = field.valueType == FieldValueType.custom && !field.isEnum ? _schema.getDefaultValue(idx) as dynamic : null;
      dynamic value = reader.read(
        field.valueType, 
        typeArguments: field.typeArguments, 
        customType: defaultValue,
        enumResolver: field.isEnum ? (index) => _schema.getDefaultValue(idx, [index]) as dynamic : null
      );
      _schema.setFieldValue(idx, value);
      idx++;
    }
  }

  void mergeUsing(StructHandler<T> other) {
    for(var field in _schema.fields) {
      var otherFieldValue = other._schema.getFieldValue(field.index);
      if(field.valueType == FieldValueType.list) {
        // get default value for list
        var list = other._schema.getDefaultValue(field.index) as List;
        list.addAll(otherFieldValue as List);
        _schema.setFieldValue(field.index, list);
      } else if(field.valueType == FieldValueType.map) {
        var map = other._schema.getDefaultValue(field.index) as Map;
        map.addAll(otherFieldValue as Map);
        _schema.setFieldValue(field.index, map);
      } else if(field.valueType == FieldValueType.custom && !field.isEnum) {
        var type = other._schema.getDefaultValue(field.index) as SchemaType;
        type.mergeUsing(otherFieldValue as SchemaType);
        _schema.setFieldValue(field.index, type);
      } else {
        _schema.setFieldValue(field.index, otherFieldValue);
      }
    }
  }

  @override
  String toString() => "StructHandler($_id)";
}