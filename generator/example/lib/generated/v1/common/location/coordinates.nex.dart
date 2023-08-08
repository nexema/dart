import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;

class Coordinates extends $nex.NexemaType {
  final $nex.StructTypeState<Coordinates> _state;
  @$core.override
  $nex.NexemaTypeState<Coordinates> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'Coordinates',
      modifier: $nex.TypeModifier.struct,
      packageName: 'location',
      annotations: {},
      fields: [
        $nex.FieldInfo<Coordinates>(
            name: 'latitude',
            dartName: 'latitude',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.float64,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<Coordinates>(
            name: 'longitude',
            dartName: 'longitude',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.float64,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  Coordinates._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  Coordinates._empty()
      : _state = $nex.StructTypeState([null, null]),
        super(_typeInfo);

  factory Coordinates(
      {required $core.double latitude, required $core.double longitude}) {
    return Coordinates._internal([latitude, longitude]);
  }

  factory Coordinates.decode($td.Uint8List buffer) {
    var instance = Coordinates._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.double get latitude => _state.get(0) as $core.double;

  set latitude($core.double value) {
    _state.set(0, value);
  }

  $core.double get longitude => _state.get(1) as $core.double;

  set longitude($core.double value) {
    _state.set(1, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();

    writer.encodeFloat64(latitude);
    writer.encodeFloat64(longitude);
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([reader.decodeFloat64(), reader.decodeFloat64()]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! Coordinates) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      'Coordinates(latitude: $latitude, longitude: $longitude)';
}
