import 'package:nexema_generator/generator/union/union_generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:test/test.dart';

import 'test_utils.dart';

void main() {
  group("Test UnionGenerator", () {
    test("Union generation", () {
      final file = NexemaFile(
        fileName: "my_file.nex",
        packageName: "root",
        path: "root/my_file.nex",
        types: []
      );

      final input = getUnionType("UnionB", [
        getField(0, "string_field", getPrimitiveValueType("string")),
        getField(1, "bool_field", getPrimitiveValueType("bool")),
      ]);

      String got = UnionGenerator.generateFor(file, input);
      String want = r"""
class UnionB extends $nex.NexemaType {
  final $nex.UnionTypeState<UnionB, UnionBField> _state;

  @$core.override
  $nex.NexemaTypeState<UnionB> get $state_ => _state;
  static const _typeInfo = $nex.TypeInfo(
      name: 'UnionB',
      modifier: $nex.TypeModifier.union,
      packageName: 'root',
      annotations: {},
      fields: [
        $nex.FieldInfo<UnionB>(
            name: 'string_field',
            dartName: 'stringField',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<UnionB>(
            name: 'bool_field',
            dartName: 'boolField',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.bool,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  UnionB._internal($core.dynamic value, UnionBField field)
      : _state = $nex.UnionTypeState(value, field),
        super(_typeInfo);

  UnionB._empty()
      : _state = $nex.UnionTypeState(null, UnionBField.notSet),
        super(_typeInfo);

  factory UnionB({$core.String? stringField, $core.bool? boolField}) {
    if (stringField != null) {
      return UnionB._internal(stringField, UnionBField.stringField);
    }

    if (boolField != null) {
      return UnionB._internal(boolField, UnionBField.boolField);
    }

    return UnionB._internal(null, UnionBField.notSet);
  }

  factory UnionB.decode($td.Uint8List buffer) {
    var instance = UnionB._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  factory UnionB.stringField($core.String value) {
    return UnionB._internal(value, UnionBField.stringField);
  }

  factory UnionB.boolField($core.bool value) {
    return UnionB._internal(value, UnionBField.boolField);
  }

  UnionBField get whichField => _state.currentField;
  $core.bool get hasValue => _state.currentField != UnionBField.notSet;

  $core.String get stringField =>
      _state.get<$core.String>(UnionBField.stringField);
  set stringField($core.String value) {
    _state.setCurrentValue(value, UnionBField.stringField);
  }

  $core.bool get boolField => _state.get<$core.bool>(UnionBField.boolField);
  set boolField($core.bool value) {
    _state.setCurrentValue(value, UnionBField.boolField);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    switch (_state.currentField) {
      case UnionBField.notSet:
        writer.encodeNull();
        break;

      case UnionBField.stringField:
        writer.encodeVarint(0);
        writer.encodeString(stringField);
        break;

      case UnionBField.boolField:
        writer.encodeVarint(1);
        writer.encodeBool(boolField);
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
        case 0:
          stringField = reader.decodeString();
          break;

        case 1:
          boolField = reader.decodeBool();
          break;
      }
    }
  }

  void clear() {
    _state.setCurrentValue(null, UnionBField.notSet);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! UnionB) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() => 'UnionB($whichField: ${_state.currentValue})';
}

enum UnionBField { notSet, stringField, boolField }
""";

      expect(formatDartCode(got), equals(formatDartCode(want)));
    });
  });
}