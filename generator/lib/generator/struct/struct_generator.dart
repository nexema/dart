import 'package:nexema_generator/generator/base_type_generator.dart';
import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/utils.dart';
import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';

class StructGenerator extends BaseTypeGenerator {
  StructGenerator({required super.type, required super.file});

  static String generateFor(NexemaFile file, NexemaTypeDefinition def) {
    return StructGenerator(type: def, file: file).generate();
  }

  @override
  String generate() {
    return """
${writeDocumentation(type.documentation)}
${writeObsoleteAnnotation()}
class ${type.dartName} extends $kNexAlias.NexemaType {
final $kNexAlias.StructTypeState<${type.dartName}> _state;

${_constructors()}

${mapNewlineJoin(type.fields, (item) => _getterAndSetter(item))}

${_encodeMethod()}
${_mergeFromMethod()}

${_equalityMethods()}
${_toStringMethod()}
}
""";
  }

  String _constructors() {
    return """
${type.dartName}._internal($kCoreAlias.Iterable<$kCoreAlias.dynamic> values)
  : _state = $kNexAlias.StructTypeState(values.toList(growable: false));

${type.dartName}._empty()
  : _state = $kNexAlias.StructTypeState([
    ${type.fields.map((e) => 'null').join(", ")}
  ]);

factory ${type.dartName}({
  ${type.fields.map((e) => _factoryConstructorParameter(e)).join(", ")}
}) {
  return ${type.dartName}._internal([
    ${type.fields.map((e) => _factoryConstructorCreateArgument(e)).join(",")}
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
    if(!fieldType.nullable && !type.defaults.containsKey(field.name)) {
      buffer.write("required ");
    }

    buffer.write(getValueTypeDeclaration(fieldType));

    bool typeIsBigInt = isBigInt(fieldType);
    // if(fieldType.nullable || typeIsBigInt && type.defaults.containsKey(field.name)) {
    //   buffer.write("?");
    // }

    buffer.write(" ${field.dartName}");

    if(type.defaults.containsKey(field.name) && !typeIsBigInt) {
      buffer.write(" = ${type.defaults[field.name]}");
    }

    return buffer.toString();
  }

  String _factoryConstructorCreateArgument(NexemaTypeFieldDefinition field) {
    String output = field.dartName;
    
    if(isBigInt(field.type!) && type.defaults[field.name] != null) {
      output += " ?? $kCoreBigInt.parse(${type.defaults[field.name]})";
    }

    return output;
  }

  String _getterAndSetter(NexemaTypeFieldDefinition field) {
    final dartType = getValueTypeDeclaration(field.type!);

    return """${writeDocumentation(field.documentation)}
$dartType get ${field.dartName} => _state.get(${field.index}) as $dartType;
set ${field.dartName}($dartType value) {
  _state.set(${field.index}, value);
}
""";
  }

  String _encodeMethod() {
    return """$kOverrideAnnotation
$kTdUint8List encode() {
  final writer = $kNexAlias.getWriter();
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
    ${mapNewlineJoin(type.fields, (field) => _decodeField(field), beforeNewline: ',')}
  ]);
}
""";
  }

  String _encodeField(NexemaTypeFieldDefinition field) {
    final valueType = field.type!;
    return _getFieldEncoder(field.dartName, valueType);
  }

  String _decodeField(NexemaTypeFieldDefinition field) {
    final valueType = field.type!;
    return _getFieldDecoder(valueType);
  }

  String _getFieldDecoder(NexemaValueType valueType) {
    if(valueType.nullable) {
      return "reader.isNextNull() ? null : (${_getRawFieldDecoder(valueType)})";
    } else {
      return _getRawFieldDecoder(valueType);
    }
  }

  String _getRawFieldDecoder(NexemaValueType valueType) {
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == kNexemaListPrimitive) {
        final argumentType = valueType.arguments.first;
        return "List.generate(reader.beginDecodeArray(), (_) => ${_getFieldDecoder(argumentType)})";
      } else if(valueType.primitive == kNexemaMapPrimitive) {
        final keyArgument = valueType.arguments.first;
        final valueArgument = valueType.arguments.last;
        return "{for(int i = 0; i < reader.beginDecodeMap(); i++) ${_getFieldDecoder(keyArgument)}: ${_getFieldDecoder(valueArgument)}}";
      } else {
        final decoder = kDecoderMapper[valueType.primitive];
        return "reader.$decoder()";
      }
    } else {
      final reference = resolveReference((valueType as NexemaTypeValueType).objectId);
      final declaration = getDartDeclarationForReference(reference);
      if(reference.type.isEnum) {
        return "$declaration.byIndex(reader.decodeUint8()) ?? $declaration.${reference.type.fields.first.dartName}";
      } else {
        return "$declaration.decode(reader.decodeBinary())";
      }
    }
  }

  String _getFieldEncoder(String variableName, NexemaValueType valueType) {
    if(valueType.nullable) {
      return """if($variableName == null) {
        writer.encodeNull();
      } else {
        ${_getFieldRawEncoder(variableName, valueType)}
      }""";
    } else {
      return _getFieldRawEncoder(variableName, valueType);
    }
  }

  String _getFieldRawEncoder(String variableName, NexemaValueType valueType) {
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == kNexemaListPrimitive) {
        final argumentType = valueType.arguments.first;
        return """writer.beginArray($variableName${valueType.nullable ? '!' : ''}.length);
for(var value in $variableName) {
  ${_getFieldEncoder('value', argumentType)}
}""";
      } else if(valueType.primitive == kNexemaMapPrimitive) {
        final keyArgument = valueType.arguments.first;
        final valueArgument = valueType.arguments.last;
        
        return """writer.beginMap($variableName${valueType.nullable ? '!' : ''}.length);
for(var entry in $variableName.entries) {
  ${_getFieldEncoder('entry.key', keyArgument)}
  ${_getFieldEncoder('entry.value', valueArgument)}
}""";
      } else {
        final encodeMethod = kEncoderMapper[valueType.primitive];
        return "writer.$encodeMethod($variableName);";
      }
    } else {
      final reference = resolveReference((valueType as NexemaTypeValueType).objectId);
      if(reference.type.isEnum) {
        return "writer.encodeUint8($variableName${valueType.nullable ? '!' : ''}.index);";
      } else {
        return "writer.encodeBinary($variableName${valueType.nullable ? '!' : ''}.encode());";
      }
    }
  }

  String _equalityMethods() {
    return """
$kOverrideAnnotation
$kCoreInt get hashCode => _state.hashCode;


$kOverrideAnnotation
$kCoreBool operator ==($kCoreObject other) {
  if(other is! ${type.dartName}) {
    return false;
  }

  return other._state == _state;
}
""";
  }

  String _toStringMethod() {
    String writeField(NexemaTypeFieldDefinition field) {
      return "${field.dartName}: \$${field.dartName}";
    }

    return """$kOverrideAnnotation
$kCoreString toString() => '${type.dartName}(${type.fields.map((e) => writeField(e)).join(", ")})';""";
  }

  String _toDebugStringMethod() {
    String writeField(NexemaTypeFieldDefinition field) {
      return "${field.dartName}: \$${field.dartName}";
    }

    return """
$kCoreString toDebugString() => \"\"\"${type.dartName}(${type.fields.map((e) => writeField(e)).join(",\n\t")})\"\"\";
""";
  }
}