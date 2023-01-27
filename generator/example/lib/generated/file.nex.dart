import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;

class EnumA extends $nex.NexemaEnumType {
  final $core.int _index;
  final $core.String _name;

  const EnumA._internal(this._name, this._index);

  static const EnumA unknown = EnumA._internal('unknown', 0);
  static const EnumA red = EnumA._internal('red', 1);
  static const EnumA green = EnumA._internal('green', 2);
  static const EnumA blue = EnumA._internal('blue', 3);

  $core.int get index => _index;
  $core.String get name => _name;

  static EnumA? byIndex($core.int index) {
    try {
      return values[index];
    } catch (_) {
      return null;
    }
  }

  static EnumA? byName($core.String name) {
    return _map[name];
  }

  static const $core.List<EnumA> values = [unknown, red, green, blue];
  static const _map = <$core.String, EnumA>{
    "unknown": unknown,
    "red": red,
    "green": green,
    "blue": blue
  };

  @$core.override
  $td.Uint8List encode() {
    var writer = $nex.getWriter(1);
    writer.encodeUint8(_index);
    return writer.takeBytes();
  }

  @$core.override
  $core.int get hashCode => _index;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! EnumA) {
      return false;
    }

    return other._index == _index;
  }

  @$core.override
  $core.String toString() => "EnumA($_name: $_index)";
}

/// Documentation for StructA
class StructA extends $nex.NexemaType {
  static final StructAFields fields = StructAFields._();

  final $nex.StructTypeState<StructA> _state;

  StructA._empty()
      : _state = $nex.StructTypeState([
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null
        ]),
        super();
  StructA._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super();

  factory StructA(
      {required $core.String stringField,
      required $core.int uint8Field,
      required $core.int uint16Field,
      required $core.int uint32Field,
      required $core.BigInt uint64Field,
      required $core.int int8Field,
      required $core.int int16Field,
      required $core.int int32Field,
      required $core.int int64Field,
      required $td.Uint8List binaryField,
      required $core.bool boolField,
      required $core.int intField,
      required $core.BigInt uintField,
      required $core.double float32Field,
      required $core.double float64Field,
      required EnumA enumField,
      EnumA? nullableEnum}) {
    return StructA._internal([
      stringField,
      uint8Field,
      uint16Field,
      uint32Field,
      uint64Field,
      int8Field,
      int16Field,
      int32Field,
      int64Field,
      binaryField,
      boolField,
      intField,
      uintField,
      float32Field,
      float64Field,
      enumField,
      nullableEnum
    ]);
  }

  factory StructA.decode($td.Uint8List buffer) {
    var instance = StructA._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.String get stringField => _state.get(0) as $core.String;
  set stringField($core.String value) {
    _state.set(0, value);
  }

  $core.int get uint8Field => _state.get(1) as $core.int;
  set uint8Field($core.int value) {
    _state.set(1, value);
  }

  $core.int get uint16Field => _state.get(2) as $core.int;
  set uint16Field($core.int value) {
    _state.set(2, value);
  }

  $core.int get uint32Field => _state.get(3) as $core.int;
  set uint32Field($core.int value) {
    _state.set(3, value);
  }

  $core.BigInt get uint64Field => _state.get(4) as $core.BigInt;
  set uint64Field($core.BigInt value) {
    _state.set(4, value);
  }

  $core.int get int8Field => _state.get(5) as $core.int;
  set int8Field($core.int value) {
    _state.set(5, value);
  }

  $core.int get int16Field => _state.get(6) as $core.int;
  set int16Field($core.int value) {
    _state.set(6, value);
  }

  $core.int get int32Field => _state.get(7) as $core.int;
  set int32Field($core.int value) {
    _state.set(7, value);
  }

  $core.int get int64Field => _state.get(8) as $core.int;
  set int64Field($core.int value) {
    _state.set(8, value);
  }

  $td.Uint8List get binaryField => _state.get(9) as $td.Uint8List;
  set binaryField($td.Uint8List value) {
    _state.set(9, value);
  }

  $core.bool get boolField => _state.get(10) as $core.bool;
  set boolField($core.bool value) {
    _state.set(10, value);
  }

  $core.int get intField => _state.get(11) as $core.int;
  set intField($core.int value) {
    _state.set(11, value);
  }

  $core.BigInt get uintField => _state.get(12) as $core.BigInt;
  set uintField($core.BigInt value) {
    _state.set(12, value);
  }

  $core.double get float32Field => _state.get(13) as $core.double;
  set float32Field($core.double value) {
    _state.set(13, value);
  }

  $core.double get float64Field => _state.get(14) as $core.double;
  set float64Field($core.double value) {
    _state.set(14, value);
  }

  EnumA get enumField => _state.get(15) as EnumA;
  set enumField(EnumA value) {
    _state.set(15, value);
  }

  EnumA? get nullableEnum => _state.get(16) as EnumA?;
  set nullableEnum(EnumA? value) {
    _state.set(16, value);
  }

  @$core.override
  $td.Uint8List encode() {
    var writer = $nex.getWriter();
    writer.encodeString(stringField);
    writer.encodeUint8(uint8Field);
    writer.encodeUint16(uint16Field);
    writer.encodeUint32(uint32Field);
    writer.encodeUint64(uint64Field);
    writer.encodeInt8(int8Field);
    writer.encodeInt16(int16Field);
    writer.encodeInt32(int32Field);
    writer.encodeInt64(int64Field);
    writer.encodeBinary(binaryField);
    writer.encodeBool(boolField);
    writer.encodeVarint(intField);
    writer.encodeUvarint(uintField);
    writer.encodeFloat32(float32Field);
    writer.encodeFloat64(float64Field);
    writer.encodeUint8(enumField.index);
    if (nullableEnum == null) {
      writer.encodeNull();
    } else {
      writer.encodeUint8(nullableEnum!.index);
    }

    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    var reader = $nex.getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      reader.decodeUint8(),
      reader.decodeUint16(),
      reader.decodeUint32(),
      reader.decodeUint64(),
      reader.decodeInt8(),
      reader.decodeInt16(),
      reader.decodeInt32(),
      reader.decodeInt64(),
      reader.decodeBinary(),
      reader.decodeBool(),
      reader.decodeVarint(),
      reader.decodeUvarint(),
      reader.decodeFloat32(),
      reader.decodeFloat64(),
      EnumA.byIndex(reader.decodeUint8()) ?? EnumA.unknown,
      reader.isNextNull()
          ? null
          : (EnumA.byIndex(reader.decodeUint8()) ?? EnumA.unknown)
    ]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! StructA) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      "StructA(stringField: $stringField, uint8Field: $uint8Field, uint16Field: $uint16Field, uint32Field: $uint32Field, uint64Field: $uint64Field, int8Field: $int8Field, int16Field: $int16Field, int32Field: $int32Field, int64Field: $int64Field, binaryField: $binaryField, boolField: $boolField, intField: $intField, uintField: $uintField, float32Field: $float32Field, float64Field: $float64Field, enumField: $enumField, nullableEnum: $nullableEnum)";
}

class StructAFields {
  StructAFields._();

  static final $nex.StateGetter<$nex.StructTypeState<StructA>, StructA>
      _stateGetter = _resolveState;

  static $nex.StructTypeState<StructA> _resolveState(StructA instance) =>
      instance._state;

  final stringField = $nex.FieldInfo<StructA>(_stateGetter,
      name: "string_field",
      dartName: "stringField",
      index: 0,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.string,
          typeArguments: null));

  final uint8Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "uint8_field",
      dartName: "uint8Field",
      index: 1,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.uint8,
          typeArguments: null));

  final uint16Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "uint16_field",
      dartName: "uint16Field",
      index: 2,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.uint16,
          typeArguments: null));

  final uint32Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "uint32_field",
      dartName: "uint32Field",
      index: 3,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.uint32,
          typeArguments: null));

  final uint64Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "uint64_field",
      dartName: "uint64Field",
      index: 4,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.uint64,
          typeArguments: null));

  final int8Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "int8_field",
      dartName: "int8Field",
      index: 5,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.int8,
          typeArguments: null));

  final int16Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "int16_field",
      dartName: "int16Field",
      index: 6,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.int16,
          typeArguments: null));

  final int32Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "int32_field",
      dartName: "int32Field",
      index: 7,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.int32,
          typeArguments: null));

  final int64Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "int64_field",
      dartName: "int64Field",
      index: 8,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.int64,
          typeArguments: null));

  final binaryField = $nex.FieldInfo<StructA>(_stateGetter,
      name: "binary_field",
      dartName: "binaryField",
      index: 9,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.binary,
          typeArguments: null));

  final boolField = $nex.FieldInfo<StructA>(_stateGetter,
      name: "bool_field",
      dartName: "boolField",
      index: 10,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.bool,
          typeArguments: null));

  final intField = $nex.FieldInfo<StructA>(_stateGetter,
      name: "int_field",
      dartName: "intField",
      index: 11,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.int,
          typeArguments: null));

  final uintField = $nex.FieldInfo<StructA>(_stateGetter,
      name: "uint_field",
      dartName: "uintField",
      index: 12,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.uint,
          typeArguments: null));

  final float32Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "float32_field",
      dartName: "float32Field",
      index: 13,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.float32,
          typeArguments: null));

  final float64Field = $nex.FieldInfo<StructA>(_stateGetter,
      name: "float64_field",
      dartName: "float64Field",
      index: 14,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.float64,
          typeArguments: null));

  final enumField = $nex.FieldInfo<StructA>(_stateGetter,
      name: "enum_field",
      dartName: "enumField",
      index: 15,
      valueType: const $nex.FieldValueType(
          isNullable: false,
          kind: $nex.FieldValueKind.type,
          typeArguments: null));

  final nullableEnum = $nex.FieldInfo<StructA>(_stateGetter,
      name: "nullable_enum",
      dartName: "nullableEnum",
      index: 16,
      valueType: const $nex.FieldValueType(
          isNullable: true,
          kind: $nex.FieldValueKind.type,
          typeArguments: null));
}

class UnionB extends $nex.NexemaType {
  final $nex.UnionTypeState<UnionB, UnionBField> _state;

  UnionB._empty() : _state = $nex.UnionTypeState(null, UnionBField.notSet);
  UnionB._($core.dynamic value, UnionBField field)
      : _state = $nex.UnionTypeState(value, field);

  UnionBField get whichField => _state.currentField;
  $core.bool get hasValue => _state.currentField != UnionBField.notSet;

  factory UnionB.stringField({required $core.String value}) {
    return UnionB._(value, UnionBField.stringField);
  }

  factory UnionB.boolField({required $core.bool value}) {
    return UnionB._(value, UnionBField.boolField);
  }

  factory UnionB.decode($td.Uint8List buffer) {
    var empty = UnionB._empty();
    empty.mergeFrom(buffer);
    return empty;
  }

  factory UnionB({$core.String? stringField, $core.bool? boolField}) {
    if (stringField != null) {
      return UnionB.stringField(value: stringField);
    }

    if (boolField != null) {
      return UnionB.boolField(value: boolField);
    }

    return UnionB._(null, UnionBField.notSet);
  }

  $core.String get stringField =>
      _state.get<$core.String>(UnionBField.stringField);
  set stringField($core.String value) {
    _state.setCurrentValue(value, UnionBField.stringField);
  }

  $core.bool get boolField => _state.get<$core.bool>(UnionBField.boolField);
  set boolField($core.bool value) {
    _state.setCurrentValue(value, UnionBField.boolField);
  }

  void clear() {
    _state.setCurrentValue(null, UnionBField.notSet);
  }

  @$core.override
  $td.Uint8List encode() {
    var writer = $nex.getWriter();
    switch (_state.currentField) {
      case UnionBField.notSet:
        writer.encodeNull();
        break;

      case UnionBField.stringField:
        writer.encodeVarint(1);
        writer.encodeString(stringField);
        break;

      case UnionBField.boolField:
        writer.encodeVarint(2);
        writer.encodeBool(boolField);
        break;
    }

    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    var reader = $nex.getReader(buffer);
    if (reader.isNextNull()) {
      clear();
    } else {
      $core.int field = reader.decodeVarint();
      switch (field) {
        case 1:
          stringField = reader.decodeString();
          break;

        case 2:
          boolField = reader.decodeBool();
          break;
      }
    }
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! UnionB) {
      return false;
    }

    return other._state == _state;
  }
}

enum UnionBField { notSet, stringField, boolField }
