import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/generic/base_type_generator.dart';
import 'package:nexema_generator/models.dart';

class BaseGenerator extends BaseTypeGenerator {
  BaseGenerator({required super.type, required super.file});

  static String generateFor(NexemaFile file, NexemaTypeDefinition def) {
    return BaseGenerator(type: def, file: file).generate();
  }

  @override
  String generate() {
    return """
${writeDocumentation(type.documentation)}
${writeObsoleteAnnotation()}
abstract class ${type.dartName} extends $kNexAlias.NexemaType {

  ${_constructor()}

  ${type.fields.map((e) => _getterAndSetter(e)).join("\n")}
}
""";
  }

  String _constructor() {
    return "${type.dartName}(super.reflection\$);";
  }

  String _getterAndSetter(NexemaTypeFieldDefinition field) {
    final dartType = getValueTypeDeclaration(field.type!);

    return """${writeDocumentation(field.documentation)}
$dartType get ${field.dartName};
set ${field.dartName}($dartType value);
""";
  }
}