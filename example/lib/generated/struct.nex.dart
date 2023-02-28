/// Documentation for StructA
/// Another comment
@$core.Deprecated('StructA is obsolete and should not be used.')
class StructA extends $nex.NexemaType {
  final $nex.StructTypeState<StructA> _state;

  StructA._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false));

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
        ]);

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
