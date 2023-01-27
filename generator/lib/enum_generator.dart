import 'package:nexema_generator/models.dart';

class EnumGenerator {
  final NexemaTypeDefinition type;

  EnumGenerator(this.type);

  String generate() {
    return '''
class ${type.dartName} extends \$nex.NexemaEnumType {

  final \$nex.EnumTypeState<${type.dartName}> _state;
  ${type.dartName}._internal(\$core.String name, \$core.int index) : _state = \$nex.EnumTypeState(name, index);

  ${type.fields.map((e) => _generateField(e)).join("\n")}

  \$core.int get index => _state.currentValueIndex;
  \$core.String get name => _state.name;

  static ${type.dartName}? byIndex(\$core.int index) {
    try {
      return values[index];
    } catch(_) {
      return null;
    }
  }

  static ${type.dartName}? byName(\$core.String name) {
    return _map[name];
  }

  static final \$core.List<${type.dartName}> values = [${type.fields.map((e) => e.dartName).join(", ")}];
  static final _map = <\$core.String, ${type.dartName}>{
    ${type.fields.map((e) => '"${e.dartName}": ${e.dartName}').join(",\n")}
  };

  @\$core.override
  \$td.Uint8List encode() {
    var writer = \$nex.getWriter(1);
    writer.encodeUint8(_state.currentValueIndex);
    return writer.takeBytes();
  }

  @\$core.override
  \$core.int get hashCode => _state.hashCode;
  
  @\$core.override
  \$core.bool operator ==(\$core.Object other) {
    if(other is! ${type.dartName}) {
      return false;
    }

    return other._state == _state;
  }

  @\$core.override
  \$core.String toString() => "${type.dartName}(\${_state.name}: \${_state.currentValueIndex})";
}
''';
  }

  String _generateField(NexemaTypeFieldDefinition field) {
    return '''static final ${type.dartName} ${field.dartName} = ${type.dartName}._internal('${field.dartName}', ${field.index});''';
  }
}