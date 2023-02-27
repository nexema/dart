import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/generic/base_type_generator.dart';
import 'package:nexema_generator/generator/utils.dart';
import 'package:nexema_generator/models.dart';

class UnionGenerator extends BaseTypeGenerator {
  final String _fieldsEnumName;

  UnionGenerator({required super.type, required super.file})
    : _fieldsEnumName = "${type.name}Field";

  static String generateFor(NexemaFile file, NexemaTypeDefinition def) {
    return UnionGenerator(type: def, file: file).generate();
  }

  @override
  String generate() {
    return """
${writeDocumentation(type.documentation)}
${writeObsoleteAnnotation()}
class ${type.dartName} extends $kNexAlias.NexemaType {
final $kNexAlias.UnionTypeState<${type.dartName}, $_fieldsEnumName> _state;

${writeStateGetter()}
${writeTypeInfo()}
${_constructors()}
${_factories()}
${_whichFieldAndHasValue()}

${mapNewlineJoin(type.fields, (item) => _getterAndSetter(item))}

${_encodeMethod()}
${_mergeFromMethod()}
${_clearMethod()}

${equalityMethods()}
${_toStringMethod()}
}

${_unionFieldsEnum()}
""";
  }

  String _constructors() {
    return """
${type.dartName}._internal($kCoreAlias.dynamic value, $_fieldsEnumName field)
  : _state = $kNexAlias.UnionTypeState(value, field),
    super(_typeInfo);

${type.dartName}._empty() 
  : _state = $kNexAlias.UnionTypeState(null, $_fieldsEnumName.notSet),
    super(_typeInfo);

factory ${type.dartName}({
  ${type.fields.map((e) => _factoryConstructorParameter(e)).join(", ")}
}) {
  ${type.fields.map((e) => _factoryConstructorFieldBody(e)).join("\n")}
  return ${type.dartName}._internal(null, $_fieldsEnumName.notSet);
}

factory ${type.dartName}.decode($kTdUint8List buffer) {
  var instance = ${type.dartName}._empty();
  instance.mergeFrom(buffer);
  return instance;
}
""";
  }

  String _factories() {
    final sb = StringBuffer();
    for(var field in type.fields) {
      sb.writeln("""factory ${type.dartName}.${field.dartName}(${getValueTypeDeclaration(field.type!)} value) {
  return ${type.dartName}._internal(value, $_fieldsEnumName.${field.dartName});
}
""");
    }

    return sb.toString();
  }

  String _clearMethod() {
    return """void clear() {
      _state.setCurrentValue(null, $_fieldsEnumName.notSet);
}
""";
  }

  String _whichFieldAndHasValue() {
    return """
$_fieldsEnumName get whichField => _state.currentField;
$kCoreBool get hasValue => _state.currentField != $_fieldsEnumName.notSet;
""";
  }

  String _factoryConstructorParameter(NexemaTypeFieldDefinition field) {
    final fieldType = field.type!;
    return "${getValueTypeDeclaration(fieldType)}? ${field.dartName}";
  }

  String _factoryConstructorFieldBody(NexemaTypeFieldDefinition field) {
    return """if(${field.dartName} != null) {
  return ${type.dartName}._internal(${field.dartName}, $_fieldsEnumName.${field.dartName});
}
""";
  }

  String _getterAndSetter(NexemaTypeFieldDefinition field) {
    final dartType = getValueTypeDeclaration(field.type!);

    return """${writeDocumentation(field.documentation)}
$dartType get ${field.dartName} => _state.get<$dartType>($_fieldsEnumName.${field.dartName});
set ${field.dartName}($dartType value) {
  _state.setCurrentValue(value, $_fieldsEnumName.${field.dartName});
}
""";
  }

  String _encodeMethod() {
    return """$kOverrideAnnotation
$kTdUint8List encode() {
  final writer = $kNexAlias.getWriter();
  switch(_state.currentField) {
    case $_fieldsEnumName.notSet:
      writer.encodeNull();
      break;

    ${type.fields.map((e) => _encodeField(e)).join("\n")}
  }
  return writer.takeBytes();
}
""";
  }

  String _encodeField(NexemaTypeFieldDefinition field) {
    return """
case $_fieldsEnumName.${field.dartName}:
  writer.encodeVarint(${field.index});
  ${getFieldEncoder(field.dartName, field.type!)}
  break;
""";
  }

  String _decodeField(NexemaTypeFieldDefinition field) {
    final valueType = field.type!;
    return """case ${field.index}:
    ${field.dartName} = ${getFieldDecoder(valueType)};
    break;
""";
  }

  String _mergeFromMethod() {
    return """$kOverrideAnnotation
void mergeFrom($kTdUint8List buffer) {
  final reader = $kNexAlias.getReader(buffer);
  if(reader.isNextNull()) {
    clear();
  } else {
    $kCoreInt field = reader.decodeVarint();
    switch(field) {
      ${type.fields.map((e) => _decodeField(e)).join("\n")}
    }
  }
}
""";
  }

  String _toStringMethod() {
    return """$kOverrideAnnotation
$kCoreString toString() => '${type.dartName}(\$whichField: \${_state.currentValue})';""";
  }

  String _unionFieldsEnum() {
    return """
enum $_fieldsEnumName {
  notSet, ${type.fields.map((e) => e.dartName).join(",")}
}
""";
  }
}