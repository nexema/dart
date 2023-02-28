import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/generator/struct/struct_generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group("Test StructGenerator", () {
    test("Struct with primitives", () {
      final file = NexemaFile(
        id: 1,
        fileName: "my_file.nex",
        packageName: "root",
        path: "root/my_file.nex",
        types: []
      );

      final input = getStructType("StructA", [
        getField(0, "string_field", getPrimitiveValueType("string")),
        getField(1, "bool_field", getPrimitiveValueType("bool")),
        getField(2, "int_field", getPrimitiveValueType("int")),
        getField(3, "uint_field", getPrimitiveValueType("uint")),
        getField(4, "int8_field", getPrimitiveValueType("int8")),
        getField(5, "int16_field", getPrimitiveValueType("int16")),
        getField(6, "int32_field", getPrimitiveValueType("int32")),
        getField(7, "int64_field", getPrimitiveValueType("int64")),
        getField(8, "uint8_field", getPrimitiveValueType("uint8")),
        getField(9, "uint16_field", getPrimitiveValueType("uint16")),
        getField(10, "uint32_field", getPrimitiveValueType("uint32")),
        getField(11, "uint64_field", getPrimitiveValueType("uint64")),
        getField(12, "float32_field", getPrimitiveValueType("float32")),
        getField(13, "float64_field", getPrimitiveValueType("float64")),
        getField(14, "binary_field", getPrimitiveValueType("binary")),
      ], documentation: [
        "Documentation for StructA",
        "Another comment"
      ], annotations: {
        "obsolete": true
      });

      String got = StructGenerator.generateFor(file, input);
      String want = r"""
/// Documentation for StructA
/// Another comment
@$core.Deprecated('StructA is obsolete and should not be used.')
class StructA extends $nex.NexemaType {
  final $nex.StructTypeState<StructA> _state;
  @$core.override
  $nex.NexemaTypeState<StructA> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'StructA',
      modifier: $nex.TypeModifier.struct,
      packageName: 'root',
      annotations: {
        'obsolete': true
      },
      fields: [
        $nex.FieldInfo<StructA>(
            name: 'string_field',
            dartName: 'stringField',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'bool_field',
            dartName: 'boolField',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.bool,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'int_field',
            dartName: 'intField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.int,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'uint_field',
            dartName: 'uintField',
            index: 3,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.uint,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'int8_field',
            dartName: 'int8Field',
            index: 4,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.int8,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'int16_field',
            dartName: 'int16Field',
            index: 5,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.int16,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'int32_field',
            dartName: 'int32Field',
            index: 6,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.int32,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'int64_field',
            dartName: 'int64Field',
            index: 7,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.int64,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'uint8_field',
            dartName: 'uint8Field',
            index: 8,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.uint8,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'uint16_field',
            dartName: 'uint16Field',
            index: 9,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.uint16,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'uint32_field',
            dartName: 'uint32Field',
            index: 10,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.uint32,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'uint64_field',
            dartName: 'uint64Field',
            index: 11,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.uint64,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'float32_field',
            dartName: 'float32Field',
            index: 12,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.float32,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'float64_field',
            dartName: 'float64Field',
            index: 13,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.float64,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'binary_field',
            dartName: 'binaryField',
            index: 14,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.binary,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  StructA._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

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
          null
        ]),
        super(_typeInfo);

  factory StructA(
      {required $core.String stringField,
      required $core.bool boolField,
      required $core.int intField,
      required $core.BigInt uintField,
      required $core.int int8Field,
      required $core.int int16Field,
      required $core.int int32Field,
      required $core.int int64Field,
      required $core.int uint8Field,
      required $core.int uint16Field,
      required $core.int uint32Field,
      required $core.BigInt uint64Field,
      required $core.double float32Field,
      required $core.double float64Field,
      required $td.Uint8List binaryField}) {
    return StructA._internal([
      stringField,
      boolField,
      intField,
      uintField,
      int8Field,
      int16Field,
      int32Field,
      int64Field,
      uint8Field,
      uint16Field,
      uint32Field,
      uint64Field,
      float32Field,
      float64Field,
      binaryField
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

  $core.bool get boolField => _state.get(1) as $core.bool;
  set boolField($core.bool value) {
    _state.set(1, value);
  }

  $core.int get intField => _state.get(2) as $core.int;
  set intField($core.int value) {
    _state.set(2, value);
  }

  $core.BigInt get uintField => _state.get(3) as $core.BigInt;
  set uintField($core.BigInt value) {
    _state.set(3, value);
  }

  $core.int get int8Field => _state.get(4) as $core.int;
  set int8Field($core.int value) {
    _state.set(4, value);
  }

  $core.int get int16Field => _state.get(5) as $core.int;
  set int16Field($core.int value) {
    _state.set(5, value);
  }

  $core.int get int32Field => _state.get(6) as $core.int;
  set int32Field($core.int value) {
    _state.set(6, value);
  }

  $core.int get int64Field => _state.get(7) as $core.int;
  set int64Field($core.int value) {
    _state.set(7, value);
  }

  $core.int get uint8Field => _state.get(8) as $core.int;
  set uint8Field($core.int value) {
    _state.set(8, value);
  }

  $core.int get uint16Field => _state.get(9) as $core.int;
  set uint16Field($core.int value) {
    _state.set(9, value);
  }

  $core.int get uint32Field => _state.get(10) as $core.int;
  set uint32Field($core.int value) {
    _state.set(10, value);
  }

  $core.BigInt get uint64Field => _state.get(11) as $core.BigInt;
  set uint64Field($core.BigInt value) {
    _state.set(11, value);
  }

  $core.double get float32Field => _state.get(12) as $core.double;
  set float32Field($core.double value) {
    _state.set(12, value);
  }

  $core.double get float64Field => _state.get(13) as $core.double;
  set float64Field($core.double value) {
    _state.set(13, value);
  }

  $td.Uint8List get binaryField => _state.get(14) as $td.Uint8List;
  set binaryField($td.Uint8List value) {
    _state.set(14, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    writer.encodeString(stringField);
    writer.encodeBool(boolField);
    writer.encodeVarint(intField);
    writer.encodeUvarint(uintField);
    writer.encodeInt8(int8Field);
    writer.encodeInt16(int16Field);
    writer.encodeInt32(int32Field);
    writer.encodeInt64(int64Field);
    writer.encodeUint8(uint8Field);
    writer.encodeUint16(uint16Field);
    writer.encodeUint32(uint32Field);
    writer.encodeUint64(uint64Field);
    writer.encodeFloat32(float32Field);
    writer.encodeFloat64(float64Field);
    writer.encodeBinary(binaryField);
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      reader.decodeBool(),
      reader.decodeVarint(),
      reader.decodeUvarint(),
      reader.decodeInt8(),
      reader.decodeInt16(),
      reader.decodeInt32(),
      reader.decodeInt64(),
      reader.decodeUint8(),
      reader.decodeUint16(),
      reader.decodeUint32(),
      reader.decodeUint64(),
      reader.decodeFloat32(),
      reader.decodeFloat64(),
      reader.decodeBinary()
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
      'StructA(stringField: $stringField, boolField: $boolField, intField: $intField, uintField: $uintField, int8Field: $int8Field, int16Field: $int16Field, int32Field: $int32Field, int64Field: $int64Field, uint8Field: $uint8Field, uint16Field: $uint16Field, uint32Field: $uint32Field, uint64Field: $uint64Field, float32Field: $float32Field, float64Field: $float64Field, binaryField: $binaryField)';
}
""";

      expect(formatDartCode(got), equals(formatDartCode(want)));
    }, skip: true);
  
    test("Struct with list, maps and nullable", () {
      final file = NexemaFile(
        id: 1,
        fileName: "my_file.nex",
        packageName: "root",
        path: "root/my_file.nex",
        types: []
      );

      final input = getStructType("StructA", [
        getField(0, "string_field", getPrimitiveValueType("string", true)),
        getField(1, "list_field", getListValueType(getPrimitiveValueType("string"))),
        getField(2, "list_value_null_field", getListValueType(getPrimitiveValueType("string", true))),
        getField(3, "list_null_field", getListValueType(getPrimitiveValueType("string"), true)),
        getField(4, "list_both_null_field", getListValueType(getPrimitiveValueType("string", true), true)),
        getField(5, "map_field", getMapValueType(getPrimitiveValueType("string"), getPrimitiveValueType("bool"))),
        getField(6, "map_value_null_field", getMapValueType(getPrimitiveValueType("string"), getPrimitiveValueType("bool", true))),
        getField(7, "map_null_field", getMapValueType(getPrimitiveValueType("string"), getPrimitiveValueType("bool"), true)),
        getField(8, "map_both_null_field", getMapValueType(getPrimitiveValueType("string"), getPrimitiveValueType("bool", true), true)),
      ]);

      String got = StructGenerator.generateFor(file, input);
      String want = r"""
class StructA extends $nex.NexemaType {
  final $nex.StructTypeState<StructA> _state;
  @$core.override
  $nex.NexemaTypeState<StructA> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'StructA',
      modifier: $nex.TypeModifier.struct,
      packageName: 'root',
      annotations: {},
      fields: [
        $nex.FieldInfo<StructA>(
            name: 'string_field',
            dartName: 'stringField',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: true,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'list_field',
            dartName: 'listField',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'list_value_null_field',
            dartName: 'listValueNullField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'list_null_field',
            dartName: 'listNullField',
            index: 3,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: true,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'list_both_null_field',
            dartName: 'listBothNullField',
            index: 4,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: true,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'map_field',
            dartName: 'mapField',
            index: 5,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.map,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: []),
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.bool,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'map_value_null_field',
            dartName: 'mapValueNullField',
            index: 6,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.map,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: []),
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.bool,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'map_null_field',
            dartName: 'mapNullField',
            index: 7,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.map,
                isNullable: true,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: []),
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.bool,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'map_both_null_field',
            dartName: 'mapBothNullField',
            index: 8,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.map,
                isNullable: true,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: []),
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.bool,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {})
      ]);

  StructA._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  StructA._empty()
      : _state = $nex.StructTypeState(
            [null, null, null, null, null, null, null, null, null]),
        super(_typeInfo);

  factory StructA(
      {$core.String? stringField,
      required $core.List<$core.String> listField,
      required $core.List<$core.String?> listValueNullField,
      $core.List<$core.String>? listNullField,
      $core.List<$core.String?>? listBothNullField,
      required $core.Map<$core.String, $core.bool> mapField,
      required $core.Map<$core.String, $core.bool?> mapValueNullField,
      $core.Map<$core.String, $core.bool>? mapNullField,
      $core.Map<$core.String, $core.bool?>? mapBothNullField}) {
    return StructA._internal([
      stringField,
      listField,
      listValueNullField,
      listNullField,
      listBothNullField,
      mapField,
      mapValueNullField,
      mapNullField,
      mapBothNullField
    ]);
  }

  factory StructA.decode($td.Uint8List buffer) {
    var instance = StructA._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.String? get stringField => _state.get(0) as $core.String?;
  set stringField($core.String? value) {
    _state.set(0, value);
  }

  $core.List<$core.String> get listField =>
      _state.get(1) as $core.List<$core.String>;
  set listField($core.List<$core.String> value) {
    _state.set(1, value);
  }

  $core.List<$core.String?> get listValueNullField =>
      _state.get(2) as $core.List<$core.String?>;
  set listValueNullField($core.List<$core.String?> value) {
    _state.set(2, value);
  }

  $core.List<$core.String>? get listNullField =>
      _state.get(3) as $core.List<$core.String>?;
  set listNullField($core.List<$core.String>? value) {
    _state.set(3, value);
  }

  $core.List<$core.String?>? get listBothNullField =>
      _state.get(4) as $core.List<$core.String?>?;
  set listBothNullField($core.List<$core.String?>? value) {
    _state.set(4, value);
  }

  $core.Map<$core.String, $core.bool> get mapField =>
      _state.get(5) as $core.Map<$core.String, $core.bool>;
  set mapField($core.Map<$core.String, $core.bool> value) {
    _state.set(5, value);
  }

  $core.Map<$core.String, $core.bool?> get mapValueNullField =>
      _state.get(6) as $core.Map<$core.String, $core.bool?>;
  set mapValueNullField($core.Map<$core.String, $core.bool?> value) {
    _state.set(6, value);
  }

  $core.Map<$core.String, $core.bool>? get mapNullField =>
      _state.get(7) as $core.Map<$core.String, $core.bool>?;
  set mapNullField($core.Map<$core.String, $core.bool>? value) {
    _state.set(7, value);
  }

  $core.Map<$core.String, $core.bool?>? get mapBothNullField =>
      _state.get(8) as $core.Map<$core.String, $core.bool?>?;
  set mapBothNullField($core.Map<$core.String, $core.bool?>? value) {
    _state.set(8, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    if (stringField == null) {
      writer.encodeNull();
    } else {
      writer.encodeString(stringField!);
    }
    writer.beginArray(listField.length);
    for (var value in listField) {
      writer.encodeString(value);
    }
    writer.beginArray(listValueNullField.length);
    for (var value in listValueNullField) {
      if (value == null) {
        writer.encodeNull();
      } else {
        writer.encodeString(value);
      }
    }
    if (listNullField == null) {
      writer.encodeNull();
    } else {
      writer.beginArray(listNullField!.length);
      for (var value in listNullField!) {
        writer.encodeString(value);
      }
    }
    if (listBothNullField == null) {
      writer.encodeNull();
    } else {
      writer.beginArray(listBothNullField!.length);
      for (var value in listBothNullField!) {
        if (value == null) {
          writer.encodeNull();
        } else {
          writer.encodeString(value);
        }
      }
    }
    writer.beginMap(mapField.length);
    for (var entry in mapField.entries) {
      writer.encodeString(entry.key);
      writer.encodeBool(entry.value);
    }
    writer.beginMap(mapValueNullField.length);
    for (var entry in mapValueNullField.entries) {
      writer.encodeString(entry.key);
      if (entry.value == null) {
        writer.encodeNull();
      } else {
        writer.encodeBool(entry.value!);
      }
    }
    if (mapNullField == null) {
      writer.encodeNull();
    } else {
      writer.beginMap(mapNullField!.length);
      for (var entry in mapNullField!.entries) {
        writer.encodeString(entry.key);
        writer.encodeBool(entry.value);
      }
    }
    if (mapBothNullField == null) {
      writer.encodeNull();
    } else {
      writer.beginMap(mapBothNullField!.length);
      for (var entry in mapBothNullField!.entries) {
        writer.encodeString(entry.key);
        if (entry.value == null) {
          writer.encodeNull();
        } else {
          writer.encodeBool(entry.value!);
        }
      }
    }
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.isNextNull() ? null : (reader.decodeString()),
      $core.List.generate(
          reader.beginDecodeArray(), (_) => reader.decodeString()),
      $core.List.generate(reader.beginDecodeArray(),
          (_) => reader.isNextNull() ? null : (reader.decodeString())),
      reader.isNextNull()
          ? null
          : ($core.List.generate(
              reader.beginDecodeArray(), (_) => reader.decodeString())),
      reader.isNextNull()
          ? null
          : ($core.List.generate(reader.beginDecodeArray(),
              (_) => reader.isNextNull() ? null : (reader.decodeString()))),
      {
        for ($core.int i = 0; i < reader.beginDecodeMap(); i++)
          reader.decodeString(): reader.decodeBool()
      },
      {
        for ($core.int i = 0; i < reader.beginDecodeMap(); i++)
          reader.decodeString():
              reader.isNextNull() ? null : (reader.decodeBool())
      },
      reader.isNextNull()
          ? null
          : ({
              for ($core.int i = 0; i < reader.beginDecodeMap(); i++)
                reader.decodeString(): reader.decodeBool()
            }),
      reader.isNextNull()
          ? null
          : ({
              for ($core.int i = 0; i < reader.beginDecodeMap(); i++)
                reader.decodeString():
                    reader.isNextNull() ? null : (reader.decodeBool())
            })
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
      'StructA(stringField: $stringField, listField: $listField, listValueNullField: $listValueNullField, listNullField: $listNullField, listBothNullField: $listBothNullField, mapField: $mapField, mapValueNullField: $mapValueNullField, mapNullField: $mapNullField, mapBothNullField: $mapBothNullField)';
}
""";

      expect(formatDartCode(got), equals(formatDartCode(want)));
    }, skip: true);
  
    test("Struct with other types", () {
      final input = getStructType("StructA", [
        getField(0, "struct_field", getTypeValueType(5)),
        getField(1, "struct_null_field", getTypeValueType(5, true)),
        getField(2, "enum_field", getTypeValueType(6)),
        getField(3, "enum_null_field", getTypeValueType(6, true)),
      ]);

      final file = NexemaFile(
        id: 1,
        fileName: "my_file.nex",
        packageName: "root",
        path: "root/my_file.nex",
        types: [
          getStructType("StructB", [], id: 5),
          getEnumType("EnumA", [getEnumField(0, "unknown")], id: 6)
        ]
      )..types.add(input);

      Generator(
        snapshot: NexemaSnapshot(version: 0, hashcode: 0, files: [file]),
        settings: GeneratorSettings(outputPath: "")
      );

      String got = StructGenerator.generateFor(file, input);
      String want = r"""
class StructA extends $nex.NexemaType {
  final $nex.StructTypeState<StructA> _state;
  @$core.override
  $nex.NexemaTypeState<StructA> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'StructA',
      modifier: $nex.TypeModifier.struct,
      packageName: 'root',
      annotations: {},
      fields: [
        $nex.FieldInfo<StructA>(
            name: 'struct_field',
            dartName: 'structField',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'struct_null_field',
            dartName: 'structNullField',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: true,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'enum_field',
            dartName: 'enumField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<StructA>(
            name: 'enum_null_field',
            dartName: 'enumNullField',
            index: 3,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: true,
                typeArguments: []),
            annotations: {})
      ]);

  StructA._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  StructA._empty()
      : _state = $nex.StructTypeState([null, null, null, null]),
        super(_typeInfo);

  factory StructA(
      {required StructB structField,
      StructB? structNullField,
      required EnumA enumField,
      EnumA? enumNullField}) {
    return StructA._internal(
        [structField, structNullField, enumField, enumNullField]);
  }

  factory StructA.decode($td.Uint8List buffer) {
    var instance = StructA._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  StructB get structField => _state.get(0) as StructB;
  set structField(StructB value) {
    _state.set(0, value);
  }

  StructB? get structNullField => _state.get(1) as StructB?;
  set structNullField(StructB? value) {
    _state.set(1, value);
  }

  EnumA get enumField => _state.get(2) as EnumA;
  set enumField(EnumA value) {
    _state.set(2, value);
  }

  EnumA? get enumNullField => _state.get(3) as EnumA?;
  set enumNullField(EnumA? value) {
    _state.set(3, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    writer.encodeBinary(structField.encode());
    if (structNullField == null) {
      writer.encodeNull();
    } else {
      writer.encodeBinary(structNullField!.encode());
    }
    writer.encodeUint8(enumField.index);
    if (enumNullField == null) {
      writer.encodeNull();
    } else {
      writer.encodeUint8(enumNullField!.index);
    }
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      StructB.decode(reader.decodeBinary()),
      reader.isNextNull() ? null : (StructB.decode(reader.decodeBinary())),
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
      'StructA(structField: $structField, structNullField: $structNullField, enumField: $enumField, enumNullField: $enumNullField)';
}
""";
      expect(formatDartCode(got), equals(formatDartCode(want)));
    }, skip: true);

    test("Struct with base type", () {
      final input = getStructType("StructA", [
        getField(0, "string_field", getPrimitiveValueType("string")),
      ], baseTypeId: 5);

      final file = NexemaFile(
        fileName: "my_file.nex",
        id: 1,
        packageName: "root",
        path: "root/my_file.nex",
        types: [
          getBaseType("BaseA", [
            getField(0, "varint_field", getPrimitiveValueType("int", true)),
            getField(1, "uvarint_field", getPrimitiveValueType("uint")),
          ], id: 5)
        ]
      )..types.add(input);

      Generator(
        snapshot: NexemaSnapshot(version: 0, hashcode: 0, files: [file]),
        settings: GeneratorSettings(outputPath: "")
      );

      String got = StructGenerator.generateFor(file, input);
      String want = r"""
class StructA extends $my_file.BaseA {
  final $nex.StructTypeState<StructA> _state;
  @$core.override
  $nex.NexemaTypeState<StructA> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'StructA',
      modifier: $nex.TypeModifier.struct,
      packageName: 'root',
      annotations: {},
      fields: [
        $nex.FieldInfo<StructA>(
            name: 'string_field',
            dartName: 'stringField',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  StructA._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  StructA._empty()
      : _state = $nex.StructTypeState([null]),
        super(_typeInfo);

  factory StructA(
      {$core.int? varintField,
      required $core.BigInt uvarintField,
      required $core.String stringField}) {
    return StructA._internal([stringField]);
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

  @$core.override
  $core.int? get varintField => _state.get(0) as $core.int?;

  @$core.override
  set varintField($core.int? value) {
    _state.set(0, value);
  }

  @$core.override
  $core.BigInt get uvarintField => _state.get(1) as $core.BigInt;

  @$core.override
  set uvarintField($core.BigInt value) {
    _state.set(1, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    if (varintField == null) {
      writer.encodeNull();
    } else {
      writer.encodeVarint(varintField!);
    }
    writer.encodeUvarint(uvarintField);
    writer.encodeString(stringField);
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.isNextNull() ? null : (reader.decodeVarint()),
      reader.decodeUvarint(),
      reader.decodeString()
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
  $core.String toString() => 'StructA(stringField: $stringField)';
}
""";
      expect(formatDartCode(got), equals(formatDartCode(want)));
    });
  });
}