import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/models.dart';

class EnumGenerator {
  final NexemaTypeDefinition type;

  EnumGenerator(this.type);

  String generate() {
    return DartFormatter().format('''
class ${type.dartName} extends NexemaEnumType {

  final EnumTypeState<${type.dartName}> _state;
  ${type.dartName}._internal(String name, int index) : _state = EnumTypeState(name, index);

  ${type.fields.map((e) => _generateField(e)).join("\n")}

  int get index => _state.currentValueIndex;
  String get name => _state.name;

  static ${type.dartName}? byIndex(int index) {
    try {
      return values[index];
    } catch(_) {
      return null;
    }
  }

  static ${type.dartName}? byName(String name) {
    return _map[name];
  }

  static final List<${type.dartName}> values = [${type.fields.map((e) => e.dartName).join(", ")}];
  static final _map = <String, ${type.dartName}>{
    ${type.fields.map((e) => '"${e.dartName}": ${e.dartName}').join(",\n")}
  };

  @override
  Uint8List encode() {
    var writer = getWriter(1);
    writer.encodeUint8(_state.currentValueIndex);
    return writer.takeBytes();
  }

  @override
  int get hashCode => _state.hashCode;
  
  @override
  bool operator ==(Object other) {
    if(other is! AccountType) {
      return false;
    }

    return other._state == _state;
  }

  @override
  String toString() => "${type.dartName}(\${_state.name}: \${_state.currentValueIndex})";
}
''');
  }

  String _generateField(NexemaTypeFieldDefinition field) {
    return '''static final ${type.dartName} ${field.dartName} = ${type.dartName}._internal(${field.dartName}, ${field.index});''';
  }
}