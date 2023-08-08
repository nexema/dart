import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/generic/base_type_generator.dart';
import 'package:nexema_generator/generator/utils.dart';
import 'package:nexema_generator/models.dart';

class StructGenerator extends BaseTypeGenerator {
  NexemaTypeDefinition? _baseType;

  StructGenerator({required super.type, required super.file});

  static String generateFor(NexemaFile file, NexemaTypeDefinition def) {
    return StructGenerator(type: def, file: file).generate();
  }

  @override
  String generate() {
    return """
${writeDocumentation(type.documentation)}
${writeObsoleteAnnotation()}
class ${type.dartName} extends ${_extends()} {
final $kNexAlias.StructTypeState<${type.dartName}> _state;
${writeStateGetter()}

${writeTypeInfo()}
${_constructors()}

${mapNewlineJoin(type.fields, (item) => _getterAndSetter(item))}
${_baseImplementations()}

${_encodeMethod()}
${_mergeFromMethod()}

${equalityMethods()}
${_toStringMethod()}
}
""";
  }

  String _extends() {
    if (type.baseType == null) {
      return "$kNexAlias.NexemaType";
    } else {
      final reference = resolveReference(type.baseType!);
      _baseType = reference.type;
      return getDartDeclarationForReference(reference);
    }
  }

  String _constructors() {
    return """
${type.dartName}._internal($kCoreAlias.Iterable<$kCoreAlias.dynamic> values)
  : _state = $kNexAlias.StructTypeState(values.toList(growable: false)), super(_typeInfo);

${type.dartName}._empty()
  : _state = $kNexAlias.StructTypeState([
    ${type.fields.map((e) => 'null').join(", ")}
  ]), super(_typeInfo);

factory ${type.dartName}({
  ${_baseType == null ? '' : "${_baseType!.fields.map((e) => _factoryConstructorParameter(e)).join(",")},"}
  ${type.fields.map((e) => _factoryConstructorParameter(e)).join(", ")}
}) {
  return ${type.dartName}._internal([
    ${[
      if (_baseType != null) ..._baseType!.fields,
      ...type.fields
    ].map((e) => _factoryConstructorCreateArgument(e)).join(",")}
  ]);
}

factory ${type.dartName}.decode($kTdUint8List buffer) {
  var instance = ${type.dartName}._empty();
  instance.mergeFrom(buffer);
  return instance;
}
""";
  }

  String _factoryConstructorParameter(NexemaTypeFieldDefinition field) {
    final fieldType = field.type!;
    final buffer = StringBuffer();
    if (!fieldType.nullable && (type.defaults == null || !type.defaults!.containsKey(field.name))) {
      buffer.write("required ");
    }

    buffer.write(getValueTypeDeclaration(fieldType));

    bool typeIsBigInt = isBigInt(fieldType);
    // if(fieldType.nullable || typeIsBigInt && type.defaults.containsKey(field.name)) {
    //   buffer.write("?");
    // }

    buffer.write(" ${field.dartName}");

    if (type.defaults != null && type.defaults!.containsKey(field.name) && !typeIsBigInt) {
      buffer.write(" = ${writeValueToString(type.defaults![field.name])}");
    }

    return buffer.toString();
  }

  String _factoryConstructorCreateArgument(NexemaTypeFieldDefinition field) {
    String output = field.dartName;

    if (isBigInt(field.type!) && type.defaults != null && type.defaults![field.name] != null) {
      output += " ?? $kCoreBigInt.parse(${type.defaults![field.name]})";
    }

    return output;
  }

  String _getterAndSetter(NexemaTypeFieldDefinition field, [bool override = false]) {
    final dartType = getValueTypeDeclaration(field.type!);

    return """${writeDocumentation(field.documentation)}
${override ? kOverrideAnnotation : ''}
$dartType get ${field.dartName} => _state.get(${field.index}) as $dartType;

${override ? kOverrideAnnotation : ''}
set ${field.dartName}($dartType value) {
  _state.set(${field.index}, value);
}
""";
  }

  String _baseImplementations() {
    if (_baseType == null) {
      return "";
    }

    return _baseType!.fields.map((e) => _getterAndSetter(e, true)).join("\n");
  }

  String _encodeMethod() {
    return """$kOverrideAnnotation
$kTdUint8List encode() {
  final writer = $kNexAlias.getWriter();
  ${_baseType == null ? '' : _baseType!.fields.map((field) => _encodeField(field)).join("\n")}
  ${type.fields.map((field) => _encodeField(field)).join("\n")}
  return writer.takeBytes();
}
""";
  }

  String _mergeFromMethod() {
    return """$kOverrideAnnotation
void mergeFrom($kTdUint8List buffer) {
  final reader = $kNexAlias.getReader(buffer);
  _state.setAll([
    ${_baseType == null ? '' : "${mapNewlineJoin(_baseType!.fields, ((field) => _decodeField(field)), beforeNewline: ',')},"}
    ${mapNewlineJoin(type.fields, (field) => _decodeField(field), beforeNewline: ',')}
  ]);
}
""";
  }

  String _encodeField(NexemaTypeFieldDefinition field) {
    final valueType = field.type!;
    return getFieldEncoder(field.dartName, valueType);
  }

  String _decodeField(NexemaTypeFieldDefinition field) {
    final valueType = field.type!;
    return getFieldDecoder(valueType);
  }

  String _toStringMethod() {
    String writeField(NexemaTypeFieldDefinition field) {
      return "${field.dartName}: \$${field.dartName}";
    }

    return """$kOverrideAnnotation
$kCoreString toString() => '${type.dartName}(${type.fields.map((e) => writeField(e)).join(", ")})';""";
  }
}
