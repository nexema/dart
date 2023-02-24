import 'package:nexema_generator/generator/base_type_generator.dart';
import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/utils.dart';
import 'package:nexema_generator/models.dart';

class EnumGenerator extends BaseTypeGenerator {
  EnumGenerator({required super.type});

  static String generateFor(NexemaTypeDefinition def) {
    return EnumGenerator(type: def).generate();
  }

  @override
  String generate() {
    return """
class ${type.name} extends $kNexAlias.NexemaEnumType {
  final $kCoreInt _index;
  final $kCoreString _name;

  $kCoreInt get index => _index;
  $kCoreString get name => _name;

  const ${type.name}._internal(this._name, this._index);

  ${mapNewlineJoin(type.fields, _staticDeclaration)}

  ${_byIndexMethod()}
  ${_byNameMethod()}

  ${_staticConstValues()}
  ${_staticConstMap()}

  ${_equalityMethods()}
  ${_encodeMethod()}

  ${_toStringMethod()}
  ${_toDebugStringMethod()}
}
""";
  }

  String _staticDeclaration(NexemaTypeFieldDefinition field)
    => "static const ${type.name} ${field.dartName} = ${type.name}._internal('${field.name}', ${field.index});";

  String _byIndexMethod() {
    return """
static ${type.name}? byIndex($kCoreInt index) {
    try {
      return values[index];
    } catch (_) {
      return null;
    }
}""";
  }

  String _byNameMethod() {
    return """
static ${type.name}? byName($kCoreString name) {
  return _map[name];
}""";
  }

  String _staticConstValues() {
    return "static const values = [${type.fields.map((e) => e.dartName).join(", ")}];";
  }

  String _staticConstMap() {
    return """
static const _map = <$kCoreString, ${type.name}>{
  ${type.fields.map((e) => '"${e.dartName}": ${e.dartName}').join(", ")}
};
""";
  }

  String _equalityMethods() {
    return """
$kOverrideAnnotation
$kCoreInt get hashCode => _index;

$kOverrideAnnotation
$kCoreBool operator ==($kCoreObject other) {
  if(other is! ${type.name}) {
    return false;
  }

  return other._index == _index;
}
""";
  }

  String _encodeMethod() {
    return """
$kOverrideAnnotation
$kTdUint8List encode() {
  var writer = $kGetWriterMethod(1);
  $kWriterEncodeUint8(_index);
  $kReturnTakeBytes
}
""";
  }

  String _toStringMethod() {
    return """
$kOverrideAnnotation
$kCoreString toString() => _name;
""";
  }

  String _toDebugStringMethod() {
    return """
$kCoreString toDebugString() => "${type.name}(\$_name: \$_index)";
""";
  }
}