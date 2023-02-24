import 'package:nexema_generator/generator/enum/enum_generator.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group("Test EnumGenerator", () {
    test("Test generate enum code", () {
      final input = getEnumType("EnumA", [
        getEnumField(0, "unknown"),
        getEnumField(1, "red"),
        getEnumField(2, "green"),
        getEnumField(3, "blue"),
      ]);

      final got = EnumGenerator.generateFor(input);
      final want = r"""
  class EnumA extends $nex.NexemaEnumType {
    final $core.int _index;
    final $core.String _name;

    $core.int get index => _index;
    $core.String get name => _name;

    const EnumA._internal(this._name, this._index);

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
  """;
      expect(formatDartCode(got), equals(formatDartCode(want)));

    });
  });
}