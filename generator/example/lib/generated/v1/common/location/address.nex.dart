import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;
import 'coordinates.nex.dart' as $coordinates;

class Address extends $nex.NexemaType {
  final $nex.StructTypeState<Address> _state;
  @$core.override
  $nex.NexemaTypeState<Address> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'Address',
      modifier: $nex.TypeModifier.struct,
      packageName: 'location',
      annotations: {},
      fields: [
        $nex.FieldInfo<Address>(
            name: 'id',
            dartName: 'id',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<Address>(
            name: 'city',
            dartName: 'city',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<Address>(
            name: 'region',
            dartName: 'region',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<Address>(
            name: 'country',
            dartName: 'country',
            index: 3,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<Address>(
            name: 'coordinates',
            dartName: 'coordinates',
            index: 4,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  Address._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  Address._empty()
      : _state = $nex.StructTypeState([null, null, null, null, null]),
        super(_typeInfo);

  factory Address(
      {required $core.String id,
      required $core.String city,
      required $core.String region,
      required $core.String country,
      required $coordinates.Coordinates coordinates}) {
    return Address._internal([id, city, region, country, coordinates]);
  }

  factory Address.decode($td.Uint8List buffer) {
    var instance = Address._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.String get id => _state.get(0) as $core.String;

  set id($core.String value) {
    _state.set(0, value);
  }

  $core.String get city => _state.get(1) as $core.String;

  set city($core.String value) {
    _state.set(1, value);
  }

  $core.String get region => _state.get(2) as $core.String;

  set region($core.String value) {
    _state.set(2, value);
  }

  $core.String get country => _state.get(3) as $core.String;

  set country($core.String value) {
    _state.set(3, value);
  }

  $coordinates.Coordinates get coordinates =>
      _state.get(4) as $coordinates.Coordinates;

  set coordinates($coordinates.Coordinates value) {
    _state.set(4, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();

    writer.encodeString(id);
    writer.encodeString(city);
    writer.encodeString(region);
    writer.encodeString(country);
    writer.encodeBinary(coordinates.encode());
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      reader.decodeString(),
      reader.decodeString(),
      reader.decodeString(),
      $coordinates.Coordinates.decode(reader.decodeBinary())
    ]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! Address) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      'Address(id: $id, city: $city, region: $region, country: $country, coordinates: $coordinates)';
}
