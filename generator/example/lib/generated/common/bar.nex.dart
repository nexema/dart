import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;

class BarEnum extends $nex.NexemaEnumType {
  final $core.int _index;
  final $core.String _name;

  @$core.override
  $nex.NexemaTypeState<BarEnum> get $state_ =>
      throw $core.UnsupportedError('Enum types does not have state.');
  static const _typeInfo = $nex.TypeInfo(
      name: 'BarEnum',
      modifier: $nex.TypeModifier.enumerator,
      packageName: 'common',
      annotations: {},
      fields: [
        $nex.FieldInfo<BarEnum>(
            name: 'unknown',
            dartName: 'unknown',
            index: 0,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<BarEnum>(
            name: 'first',
            dartName: 'first',
            index: 1,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<BarEnum>(
            name: 'second',
            dartName: 'second',
            index: 2,
            valueType: null,
            annotations: {})
      ]);

  $core.int get index => _index;
  $core.String get name => _name;

  const BarEnum._internal(this._name, this._index) : super(_typeInfo);

  static const BarEnum unknown = BarEnum._internal('unknown', 0);

  static const BarEnum first = BarEnum._internal('first', 1);

  static const BarEnum second = BarEnum._internal('second', 2);

  static BarEnum? byIndex($core.int index) {
    try {
      return values[index];
    } catch (_) {
      return null;
    }
  }

  static BarEnum? byName($core.String name) {
    return _map[name];
  }

  static const values = [unknown, first, second];
  static const _map = <$core.String, BarEnum>{
    "unknown": unknown,
    "first": first,
    "second": second
  };

  @$core.override
  $core.int get hashCode => _index;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! BarEnum) {
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

  $core.String toDebugString() => "BarEnum($_name: $_index)";
}

abstract class BarBase extends $nex.NexemaType {
  BarBase(super.reflection$);

  $td.Uint8List get binaryField;
  set binaryField($td.Uint8List value);

  $core.int get uint32Field;
  set uint32Field($core.int value);
}
