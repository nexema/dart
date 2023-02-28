import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;
import '../another/baz.nex.dart' as $baz;
import '../another/nested/ted.nex.dart' as $ted;

class FooStruct extends $nex.NexemaType {
  final $nex.StructTypeState<FooStruct> _state;
  @$core.override
  $nex.NexemaTypeState<FooStruct> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'FooStruct',
      modifier: $nex.TypeModifier.struct,
      packageName: 'common',
      annotations: {},
      fields: [
        $nex.FieldInfo<FooStruct>(
            name: 'string_field',
            dartName: 'stringField',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<FooStruct>(
            name: 'baz_enum_field',
            dartName: 'bazEnumField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<FooStruct>(
            name: 'ted_union_field',
            dartName: 'tedUnionField',
            index: 3,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  FooStruct._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  FooStruct._empty()
      : _state = $nex.StructTypeState([null, null, null]),
        super(_typeInfo);

  factory FooStruct(
      {required $core.String stringField,
      required $baz.BazEnum bazEnumField,
      required $ted.TedStruct tedUnionField}) {
    return FooStruct._internal([stringField, bazEnumField, tedUnionField]);
  }

  factory FooStruct.decode($td.Uint8List buffer) {
    var instance = FooStruct._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.String get stringField => _state.get(1) as $core.String;

  set stringField($core.String value) {
    _state.set(1, value);
  }

  $baz.BazEnum get bazEnumField => _state.get(2) as $baz.BazEnum;

  set bazEnumField($baz.BazEnum value) {
    _state.set(2, value);
  }

  $ted.TedStruct get tedUnionField => _state.get(3) as $ted.TedStruct;

  set tedUnionField($ted.TedStruct value) {
    _state.set(3, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();

    writer.encodeString(stringField);
    writer.encodeUint8(bazEnumField.index);
    writer.encodeBinary(tedUnionField.encode());
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      $baz.BazEnum.byIndex(reader.decodeUint8()) ?? $baz.BazEnum.unknown,
      $ted.TedStruct.decode(reader.decodeBinary())
    ]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! FooStruct) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      'FooStruct(stringField: $stringField, bazEnumField: $bazEnumField, tedUnionField: $tedUnionField)';
}

class FooUnion extends $nex.NexemaType {
  final $nex.UnionTypeState<FooUnion, FooUnionField> _state;

  @$core.override
  $nex.NexemaTypeState<FooUnion> get $state_ => _state;
  static const _typeInfo = $nex.TypeInfo(
      name: 'FooUnion',
      modifier: $nex.TypeModifier.union,
      packageName: 'common',
      annotations: {},
      fields: [
        $nex.FieldInfo<FooUnion>(
            name: 'bool_field',
            dartName: 'boolField',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.bool,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<FooUnion>(
            name: 'baz_enum_list_field',
            dartName: 'bazEnumListField',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.type,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {})
      ]);

  FooUnion._internal($core.dynamic value, FooUnionField field)
      : _state = $nex.UnionTypeState(value, field),
        super(_typeInfo);

  FooUnion._empty()
      : _state = $nex.UnionTypeState(null, FooUnionField.notSet),
        super(_typeInfo);

  factory FooUnion(
      {$core.bool? boolField, $core.List<$ted.TedStruct?>? bazEnumListField}) {
    if (boolField != null) {
      return FooUnion._internal(boolField, FooUnionField.boolField);
    }

    if (bazEnumListField != null) {
      return FooUnion._internal(
          bazEnumListField, FooUnionField.bazEnumListField);
    }

    return FooUnion._internal(null, FooUnionField.notSet);
  }

  factory FooUnion.decode($td.Uint8List buffer) {
    var instance = FooUnion._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  factory FooUnion.boolField($core.bool value) {
    return FooUnion._internal(value, FooUnionField.boolField);
  }

  factory FooUnion.bazEnumListField($core.List<$ted.TedStruct?> value) {
    return FooUnion._internal(value, FooUnionField.bazEnumListField);
  }

  FooUnionField get whichField => _state.currentField;
  $core.bool get hasValue => _state.currentField != FooUnionField.notSet;

  $core.bool get boolField => _state.get<$core.bool>(FooUnionField.boolField);
  set boolField($core.bool value) {
    _state.setCurrentValue(value, FooUnionField.boolField);
  }

  $core.List<$ted.TedStruct?> get bazEnumListField =>
      _state.get<$core.List<$ted.TedStruct?>>(FooUnionField.bazEnumListField);
  set bazEnumListField($core.List<$ted.TedStruct?> value) {
    _state.setCurrentValue(value, FooUnionField.bazEnumListField);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    switch (_state.currentField) {
      case FooUnionField.notSet:
        writer.encodeNull();
        break;

      case FooUnionField.boolField:
        writer.encodeVarint(1);
        writer.encodeBool(boolField);
        break;

      case FooUnionField.bazEnumListField:
        writer.encodeVarint(2);
        writer.beginArray(bazEnumListField.length);
        for (var value in bazEnumListField) {
          if (value == null) {
            writer.encodeNull();
          } else {
            writer.encodeBinary(value.encode());
          }
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
          boolField = reader.decodeBool();
          break;

        case 2:
          bazEnumListField = $core.List.generate(
              reader.beginDecodeArray(),
              (_) => reader.isNextNull()
                  ? null
                  : ($ted.TedStruct.decode(reader.decodeBinary())));
          break;
      }
    }
  }

  void clear() {
    _state.setCurrentValue(null, FooUnionField.notSet);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! FooUnion) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() => 'FooUnion($whichField: ${_state.currentValue})';
}

enum FooUnionField { notSet, boolField, bazEnumListField }
