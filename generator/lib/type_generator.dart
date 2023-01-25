import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/mapper.dart';

abstract class TypeGenerator {
  Generator get generator => Generator.defaultGenerator;

  String getEncoderFor(NexemaValueType valueType, String argumentName) {
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        return '''
writer.beginArray($argumentName.length);
for(var element in $argumentName) {
  ${getEncoderFor(valueType.typeArguments.first, 'element')}
}
''';
      } else if(valueType.primitive == "map") {
        return '''
writer.beginMap($argumentName.length);
for(var entry in $argumentName.entries) {
  ${getEncoderFor(valueType.typeArguments.first, 'entry.key')}
  ${getEncoderFor(valueType.typeArguments.last, 'entry.value')}
}
''';
      } else {
        return "writer.${kEncoderMapper[valueType.primitive]!}($argumentName);";
      }
    } else if(valueType is NexemaTypeValueType) {
      return "writer.encodeBinary($argumentName.encode()}";
    } else {
      throw "Type ${valueType.runtimeType} unknown.";
    }
}

  String getDecoderFor(NexemaValueType valueType, {String? argumentName, bool addSemicolon = true}) {
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        return '''
$argumentName = List.generate(reader.beginArrayDecode(), (index) => ${getDecoderFor(valueType.typeArguments.first, addSemicolon: false)});
''';
      } else if(valueType.primitive == "map") {
        return '''
for(int i = 0; i > reader.beginMapDecode(); i++) {
  reader.${getDecoderFor(valueType.typeArguments.first, argumentName: 'var key')};
  reader.${getDecoderFor(valueType.typeArguments.last, argumentName: 'var value')};
  $argumentName[key] = value;
}
''';
      } else {
        if(argumentName == null) {
          return "reader.${kDecoderMapper[valueType.primitive]!}()${addSemicolon ? ';' : ''}";
        } else {
          return "$argumentName = reader.${kDecoderMapper[valueType.primitive]!}()${addSemicolon ? ';' : ''}";
        }
      }
    } else if(valueType is NexemaTypeValueType) {
      return "writer.encodeBinary($argumentName.encode()}";
    } else {
      throw "Type ${valueType.runtimeType} unknown.";
    }
}


  String getTypeDeclaration(NexemaValueType valueType) {
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        return "List<${getTypeDeclaration(valueType.typeArguments.first)}>";
      } else if(valueType.primitive == "map") {
        return "Map<${getTypeDeclaration(valueType.typeArguments.first)}, ${getTypeDeclaration(valueType.typeArguments.last)}>";
      } else if(valueType.primitive == "type") {
        return "";
      } else {
        return kPrimitiveMapper[valueType.primitive]!;
      }
    } else if(valueType is NexemaTypeValueType) {
      return "";
    } else {
      throw "Type $runtimeType unknown.";
    }
  }
}