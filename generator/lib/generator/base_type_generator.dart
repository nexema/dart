import 'package:meta/meta.dart';
import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/generator/type_reference.dart';
import 'package:nexema_generator/generator/utils.dart';
import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';

abstract class BaseTypeGenerator {
  final NexemaTypeDefinition type;
  final NexemaFile file;

  BaseTypeGenerator({required this.type, required this.file});

  String generate();

  /// Returns the Dart declaration for [valueType]. 
  /// Declaration is like $core.int or MyType?
  @protected
  String getValueTypeDeclaration(NexemaValueType valueType) {
    if(valueType is NexemaPrimitiveValueType) {
      String? primitive = kPrimitiveMapper[valueType.primitive];
      if(primitive == null) {
        throw "This should not happen. Unknown primitive ${valueType.primitive}.";
      }

      if(valueType.arguments.isNotEmpty) {
        primitive += "<${valueType.arguments.map((argument) => getValueTypeDeclaration(argument)).join(",")}>";
      }

      if(valueType.nullable) {
        primitive += "?";
      }

      return primitive;
    } else {
      var reference = Generator.defaultGenerator.resolveFor(file, (valueType as NexemaTypeValueType).objectId);
      String declaration = getDartDeclarationForReference(reference);
      if(valueType.nullable) {
        declaration += "?";
      }

      return declaration;
    }
  }

  @protected
  String getDartDeclarationForReference(TypeReference reference) {
    if(reference.path == file.fileName) {
      return reference.type.dartName;
    }

    return "${reference.importAlias}.${reference.type.dartName}";
  }

  @protected
  bool isBigInt(NexemaValueType valueType) {
    return (valueType is NexemaPrimitiveValueType) ? valueType.primitive == "uint" || valueType.primitive == "uint64" : false; 
  }

  @protected
  String writeObsoleteAnnotation() {
    if(type.annotations.containsKey(kObsoleteAnnotationKey)) {
      final value = type.annotations[kObsoleteAnnotationKey];
      String message;
      if(value is bool && value) {
        message = '${type.dartName} is obsolete and should not be used.';
      } else if(value is String) {
        message = value;
      } else {
        return "";
      }
      return "$kDeprecatedAnnotation('$message')";
    }
    
    return "";
  }

  @protected
  String writeDocumentation(List<String> comments) {
    return mapNewlineJoin(comments, (item) => '/// $item');
  }

  @protected
  TypeReference resolveReference(int objectId)
    => Generator.defaultGenerator.resolveFor(file, objectId);
}