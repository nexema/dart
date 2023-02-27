import 'dart:core' as $core;
import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;

/// First documentation
@$core.Deprecated('EnumA is obsolete and should not be used.')
class EnumA extends $nex.NexemaEnumType {
  final $core.int _index;
  final $core.String _name;

  @$core.override
  $nex.NexemaTypeState<EnumA> get $state_ =>
      throw $core.UnsupportedError('Enum types does not have state.');
  static const _typeInfo = $nex.TypeInfo(
      name: 'EnumA',
      modifier: $nex.TypeModifier.enumerator,
      packageName: 'root',
      annotations: {
        'obsolete': true
      },
      fields: [
        $nex.FieldInfo<EnumA>(
            name: 'unknown',
            dartName: 'unknown',
            index: 0,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<EnumA>(
            name: 'red',
            dartName: 'red',
            index: 1,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<EnumA>(
            name: 'green',
            dartName: 'green',
            index: 2,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<EnumA>(
            name: 'blue',
            dartName: 'blue',
            index: 3,
            valueType: null,
            annotations: {})
      ]);

  $core.int get index => _index;
  $core.String get name => _name;

  const EnumA._internal(this._name, this._index) : super(_typeInfo);

  static const EnumA unknown = EnumA._internal('unknown', 0);

  static const EnumA red = EnumA._internal('red', 1);

  static const EnumA green = EnumA._internal('green', 2);

  static const EnumA blue = EnumA._internal('blue', 3);

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

  static const values = [unknown, red, green, blue];
  static const _map = <$core.String, EnumA>{
    "unknown": unknown,
    "red": red,
    "green": green,
    "blue": blue
  };

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
  $td.Uint8List encode() {
    var writer = $nex.getWriter(1);
    writer.encodeUint8(_index);
    return writer.takeBytes();
  }

  @$core.override
  $core.String toString() => _name;

  $core.String toDebugString() => "EnumA($_name: $_index)";
}
