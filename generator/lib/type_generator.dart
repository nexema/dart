import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/mapper.dart';

abstract class TypeGenerator {
  Generator get generator => Generator.defaultGenerator;

  String getEncoderFor(NexemaValueType valueType, String argumentName) {
    var sb = StringBuffer();
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        sb.write('''
writer.beginArray($argumentName.length);
for(var element in $argumentName) {
  ${getEncoderFor(valueType.typeArguments.first, 'element')}
}
''');
      } else if(valueType.primitive == "map") {
        sb.write('''
writer.beginMap($argumentName.length);
for(var entry in $argumentName.entries) {
  ${getEncoderFor(valueType.typeArguments.first, 'entry.key')}
  ${getEncoderFor(valueType.typeArguments.last, 'entry.value')}
}
''');
      } else {
        sb.write("writer.${kEncoderMapper[valueType.primitive]!}($argumentName);");
      }
    } else if(valueType is NexemaTypeValueType) {
      if(Generator.defaultGenerator.resolve(valueType.typeId).type.modifier == "enum") {
        sb.write("writer.encodeUint8($argumentName.index);");
      } else {
        sb.write("writer.encodeBinary($argumentName.encode();");
      }
    } else {
      throw "Type ${valueType.runtimeType} unknown.";
    }

    if(valueType.nullable) {
      return '''
if($argumentName == null) {
  writer.encodeNull();
} else {
  ${sb.toString().replaceAll("$argumentName.", "$argumentName!.")}
}
''';  
    }

    return sb.toString();
}

  String getTypeDeclaration(NexemaValueType valueType) {
    String declaration;
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        declaration = "List<${getTypeDeclaration(valueType.typeArguments.first)}>";
      } else if(valueType.primitive == "map") {
        declaration = "Map<${getTypeDeclaration(valueType.typeArguments.first)}, ${getTypeDeclaration(valueType.typeArguments.last)}>";
      } else {
        declaration = kPrimitiveMapper[valueType.primitive]!;
      }
    } else if(valueType is NexemaTypeValueType) {
      var type = Generator.defaultGenerator.resolve(valueType.typeId);
      declaration = type.getDeclaration();
    } else {
      throw "Type $runtimeType unknown.";
    }

    if(valueType.nullable) {
      return "$declaration?";
    }

    return declaration;
  }

  String getKind(NexemaValueType valueType) {
    if(valueType is NexemaPrimitiveValueType) {
      return valueType.primitive;
    }

    return "type";
  }

  /// Returns the default value declaration of an enum, for example: AccountType.unknown.
  /// It uses the field with the index 0.
  String getEnumDefaultValueDeclaration(NexemaTypeDefinition definition) {
    return "${definition.dartName}.${definition.fields.firstWhere((element) => element.index == 0).dartName}";
  }
}