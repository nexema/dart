import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;
import '../../common/bar.nex.dart' as $bar;

class TedUnion extends $nex.NexemaType {
  final $nex.UnionTypeState<TedUnion, TedUnionField> _state;

  @$core.override
  $nex.NexemaTypeState<TedUnion> get $state_ => _state;
  static const _typeInfo = $nex.TypeInfo(
      name: 'TedUnion',
      modifier: $nex.TypeModifier.union,
      packageName: 'nested',
      annotations: {},
      fields: [
        $nex.FieldInfo<TedUnion>(
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
        $nex.FieldInfo<TedUnion>(
            name: 'map_field',
            dartName: 'mapField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.map,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.int32,
                      isNullable: false,
                      typeArguments: []),
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.int,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {})
      ]);

  TedUnion._internal($core.dynamic value, TedUnionField field)
      : _state = $nex.UnionTypeState(value, field),
        super(_typeInfo);

  TedUnion._empty()
      : _state = $nex.UnionTypeState(null, TedUnionField.notSet),
        super(_typeInfo);

  factory TedUnion(
      {$core.List<$core.String>? listField,
      $core.Map<$core.int, $core.int>? mapField}) {
    if (listField != null) {
      return TedUnion._internal(listField, TedUnionField.listField);
    }

    if (mapField != null) {
      return TedUnion._internal(mapField, TedUnionField.mapField);
    }

    return TedUnion._internal(null, TedUnionField.notSet);
  }

  factory TedUnion.decode($td.Uint8List buffer) {
    var instance = TedUnion._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  factory TedUnion.listField($core.List<$core.String> value) {
    return TedUnion._internal(value, TedUnionField.listField);
  }

  factory TedUnion.mapField($core.Map<$core.int, $core.int> value) {
    return TedUnion._internal(value, TedUnionField.mapField);
  }

  TedUnionField get whichField => _state.currentField;
  $core.bool get hasValue => _state.currentField != TedUnionField.notSet;

  $core.List<$core.String> get listField =>
      _state.get<$core.List<$core.String>>(TedUnionField.listField);
  set listField($core.List<$core.String> value) {
    _state.setCurrentValue(value, TedUnionField.listField);
  }

  $core.Map<$core.int, $core.int> get mapField =>
      _state.get<$core.Map<$core.int, $core.int>>(TedUnionField.mapField);
  set mapField($core.Map<$core.int, $core.int> value) {
    _state.setCurrentValue(value, TedUnionField.mapField);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    switch (_state.currentField) {
      case TedUnionField.notSet:
        writer.encodeNull();
        break;

      case TedUnionField.listField:
        writer.encodeVarint(1);
        writer.beginArray(listField.length);
        for (var value in listField) {
          writer.encodeString(value);
        }
        break;

      case TedUnionField.mapField:
        writer.encodeVarint(2);
        writer.beginMap(mapField.length);
        for (var entry in mapField.entries) {
          writer.encodeInt32(entry.key);
          writer.encodeVarint(entry.value);
        }
        break;
    }
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    if (reader.isNextNull()) {
      clear();
    } else {
      $core.int field = reader.decodeVarint();
      switch (field) {
        case 1:
          listField = $core.List.generate(
              reader.beginDecodeArray(), (_) => reader.decodeString());
          break;

        case 2:
          mapField = {
            for ($core.int i = 0; i < reader.beginDecodeMap(); i++)
              reader.decodeInt32(): reader.decodeVarint()
          };
          break;
      }
    }
  }

  void clear() {
    _state.setCurrentValue(null, TedUnionField.notSet);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! TedUnion) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() => 'TedUnion($whichField: ${_state.currentValue})';
}

enum TedUnionField { notSet, listField, mapField }

class TedStruct extends $bar.BarBase {
  final $nex.StructTypeState<TedStruct> _state;
  @$core.override
  $nex.NexemaTypeState<TedStruct> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'TedStruct',
      modifier: $nex.TypeModifier.struct,
      packageName: 'nested',
      annotations: {},
      fields: [
        $nex.FieldInfo<TedStruct>(
            name: 'int64_field',
            dartName: 'int64Field',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.int64,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<TedStruct>(
            name: 'list_bool_field',
            dartName: 'listBoolField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.bool,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {})
      ]);

  TedStruct._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  TedStruct._empty()
      : _state = $nex.StructTypeState([null, null]),
        super(_typeInfo);

  factory TedStruct(
      {required $td.Uint8List binaryField,
      required $core.int uint32Field,
      required $core.int int64Field,
      required $core.List<$core.bool> listBoolField}) {
    return TedStruct._internal([int64Field, listBoolField]);
  }

  factory TedStruct.decode($td.Uint8List buffer) {
    var instance = TedStruct._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.int get int64Field => _state.get(1) as $core.int;

  set int64Field($core.int value) {
    _state.set(1, value);
  }

  $core.List<$core.bool> get listBoolField =>
      _state.get(2) as $core.List<$core.bool>;

  set listBoolField($core.List<$core.bool> value) {
    _state.set(2, value);
  }

  @$core.override
  $td.Uint8List get binaryField => _state.get(1) as $td.Uint8List;

  @$core.override
  set binaryField($td.Uint8List value) {
    _state.set(1, value);
  }

  @$core.override
  $core.int get uint32Field => _state.get(2) as $core.int;

  @$core.override
  set uint32Field($core.int value) {
    _state.set(2, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    writer.encodeBinary(binaryField);
    writer.encodeUint32(uint32Field);
    writer.encodeInt64(int64Field);
    writer.beginArray(listBoolField.length);
    for (var value in listBoolField) {
      writer.encodeBool(value);
    }
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.decodeBinary(),
      reader.decodeUint32(),
      reader.decodeInt64(),
      $core.List.generate(reader.beginDecodeArray(), (_) => reader.decodeBool())
    ]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! TedStruct) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      'TedStruct(int64Field: $int64Field, listBoolField: $listBoolField)';
}
