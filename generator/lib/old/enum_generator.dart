import 'package:nexema_generator/models.dart';

class EnumGenerator {
  final NexemaTypeDefinition type;

  EnumGenerator(this.type);

  String generate() {
    return '''
class ${type.dartName} extends \$nex.NexemaEnumType {

  final \$core.int _index;
  final \$core.String _name;

  const ${type.dartName}._internal(this._name, this._index);

  ${type.fields.map((e) => _generateField(e)).join("\n")}

  \$core.int get index => _index;
  \$core.String get name => _name;

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

  static const \$core.List<${type.dartName}> values = [${type.fields.map((e) => e.dartName).join(", ")}];
  static const _map = <\$core.String, ${type.dartName}>{
    ${type.fields.map((e) => '"${e.dartName}": ${e.dartName}').join(",\n")}
  };

  @\$core.override
  \$td.Uint8List encode() {
    var writer = \$nex.getWriter(1);
    writer.encodeUint8(_index);
    return writer.takeBytes();
  }

  @\$core.override
  \$core.int get hashCode => _index;
  
  @\$core.override
  \$core.bool operator ==(\$core.Object other) {
    if(other is! ${type.dartName}) {
      return false;
    }

    return other._index == _index;
  }

  @\$core.override
  \$core.String toString() => "${type.dartName}(\$_name: \$_index)";
}
''';
  }

  String _generateField(NexemaTypeFieldDefinition field) {
    return '''static const ${type.dartName} ${field.dartName} = ${type.dartName}._internal('${field.dartName}', ${field.index});''';
  }
}