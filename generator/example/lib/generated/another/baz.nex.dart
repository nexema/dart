import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;

class BazEnum extends $nex.NexemaEnumType {
  final $core.int _index;
  final $core.String _name;

  @$core.override
  $nex.NexemaTypeState<BazEnum> get $state_ =>
      throw $core.UnsupportedError('Enum types does not have state.');
  static const _typeInfo = $nex.TypeInfo(
      name: 'BazEnum',
      modifier: $nex.TypeModifier.enumerator,
      packageName: 'another',
      annotations: {},
      fields: [
        $nex.FieldInfo<BazEnum>(
            name: 'unknown',
            dartName: 'unknown',
            index: 0,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<BazEnum>(
            name: 'red',
            dartName: 'red',
            index: 1,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<BazEnum>(
            name: 'another_color',
            dartName: 'anotherColor',
            index: 2,
            valueType: null,
            annotations: {})
      ]);

  $core.int get index => _index;
  $core.String get name => _name;

  const BazEnum._internal(this._name, this._index) : super(_typeInfo);

  static const BazEnum unknown = BazEnum._internal('unknown', 0);

  static const BazEnum red = BazEnum._internal('red', 1);

  static const BazEnum anotherColor = BazEnum._internal('another_color', 2);

  static BazEnum? byIndex($core.int index) {
    try {
      return values[index];
    } catch (_) {
      return null;
    }
  }

  static BazEnum? byName($core.String name) {
    return _map[name];
  }

  static const values = [unknown, red, anotherColor];
  static const _map = <$core.String, BazEnum>{
    "unknown": unknown,
    "red": red,
    "anotherColor": anotherColor
  };

  @$core.override
  $core.int get hashCode => _index;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! BazEnum) {
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

  $core.String toDebugString() => "BazEnum($_name: $_index)";
}
