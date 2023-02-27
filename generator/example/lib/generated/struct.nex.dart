import 'dart:core' as $core;
import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;

abstract class BaseA extends $nex.NexemaType {
  BaseA(super.reflection$);

  $core.int? get varintField;
  set varintField($core.int? value);

  $core.BigInt get uvarintField;
  set uvarintField($core.BigInt value);
}


class StructA extends BaseA {
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

