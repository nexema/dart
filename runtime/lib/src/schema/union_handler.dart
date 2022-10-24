import 'dart:typed_data';

import 'package:messagepack_schema/messagepack_schema.dart';

/// Class used to get and set fields from a type
/// using an intermidiate class to avoid set
/// getters and setters as public.
class UnionHandler<T extends SchemaUnion<T, TField>, TField extends Enum> {
  final SchemaUnionDefinition<T, TField> _schema;

  const UnionHandler(this._schema);

  bool get isSet => _schema.isSet;
  int get currentValueHash => !_schema.isSet ? 0 : _schema.getCurrentValue().hashCode;
  int? get currentSetField => _schema.getCurrentSetField();
  dynamic get currentValue => _schema.getCurrentValue();

  E getValue<E extends Object>(int fieldIndex) {
    if(_schema.getCurrentSetField() != fieldIndex) {
      throw UnionNotSetError(fieldIndex);
    }

    return _schema.getCurrentValue() as E;
  }

  void setValue<E extends Object>(int fieldIndex, E value) {
    _schema.setCurrentValue(fieldIndex, value);
  }

  void clear() {
    _schema.setCurrentValue(null, null);
  }

  FieldInfo getCurrentField() {
    return _schema.fields[_schema.getCurrentSetField()!];
  }

  Uint8List getBuffer() {
    var writer = MessagePackWriter();
    if(!isSet) {
      writer.writeNull();
    } else {
      var fieldInfo = _schema.fields[currentSetField!];
      writer.writeUint32(currentSetField!);
      writer.write(fieldInfo.valueType, currentValue, fieldInfo.typeArguments);
    }

    return writer.takeBytes();
  }

  void merge(Uint8List buffer) {
    var reader = MessagePackReader(buffer);
    if(reader.tryReadNull()) {
      return;
    }

    int setFieldIndex = reader.readUint32();
    var field = _schema.fields[setFieldIndex];

    dynamic defaultValue = field.valueType == FieldValueType.custom && !field.isEnum ? _schema.getDefaultValue(setFieldIndex) as dynamic : null;
    dynamic value = reader.read(
      field.valueType, 
      typeArguments: field.typeArguments, 
      customType: defaultValue,
      enumResolver: field.isEnum ? (index) => _schema.getDefaultValue(setFieldIndex, [index]) as dynamic : null
    );

    _schema.setCurrentValue(setFieldIndex, value);
  }

  void mergeUsing(UnionHandler<T, TField> other) {
    _schema.setCurrentValue(other._schema.getCurrentSetField(), other._schema.getCurrentValue());
  }
  
}