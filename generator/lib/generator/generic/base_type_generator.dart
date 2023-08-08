import 'package:meta/meta.dart';
import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/generator/type_reference.dart';
import 'package:nexema_generator/generator/utils.dart';
import 'package:nexema_generator/generator/mapper.dart';
import 'package:nexema_generator/models.dart';

abstract class BaseTypeGenerator {
  final NexemaTypeDefinition type;
  final NexemaFile file;

  BaseTypeGenerator({required this.type, required this.file});

  String generate();

  /// Returns the Dart declaration for [valueType].
  /// Declaration is like "$core.int" or "MyType?"
  @protected
  String getValueTypeDeclaration(NexemaValueType valueType) {
    if (valueType is NexemaPrimitiveValueType) {
      String? primitive = kPrimitiveMapper[valueType.primitive];
      if (primitive == null) {
        throw "This should not happen. Unknown primitive ${valueType.primitive}.";
      }

      if (valueType.arguments != null && valueType.arguments!.isNotEmpty) {
        primitive +=
            "<${valueType.arguments!.map((argument) => getValueTypeDeclaration(argument)).join(",")}>";
      }

      if (valueType.nullable) {
        primitive += "?";
      }

      return primitive;
    } else {
      var reference =
          Generator.defaultGenerator.resolveFor(file, (valueType as NexemaTypeValueType).objectId);
      String declaration = getDartDeclarationForReference(reference);
      if (valueType.nullable) {
        declaration += "?";
      }

      return declaration;
    }
  }

  @protected
  String getDartDeclarationForReference(TypeReference reference) {
    if (reference.path == file.path) {
      return reference.type.dartName;
    }

    return "${reference.importAlias}.${reference.type.dartName}";
  }

  @protected
  bool isBigInt(NexemaValueType valueType) {
    return (valueType is NexemaPrimitiveValueType)
        ? valueType.primitive == NexemaPrimitive.uint ||
            valueType.primitive == NexemaPrimitive.uint64
        : false;
  }

  @protected
  String writeObsoleteAnnotation() {
    if (type.annotations != null && type.annotations!.containsKey(kObsoleteAnnotationKey)) {
      final value = type.annotations![kObsoleteAnnotationKey];
      String message;
      if (value is bool && value) {
        message = '${type.dartName} is obsolete and should not be used.';
      } else if (value is String) {
        message = value;
      } else {
        return "";
      }
      return "$kDeprecatedAnnotation('$message')";
    }

    return "";
  }

  @protected
  String writeDocumentation(List<String>? comments) {
    if (comments == null || comments.isEmpty) {
      return "";
    }

    return mapNewlineJoin(comments, (item) => '/// $item');
  }

  @protected
  String writeStateGetter() {
    return """$kOverrideAnnotation
$kNexAlias.NexemaTypeState<${type.dartName}> get \$state_ => _state;""";
  }

  @protected
  TypeReference resolveReference(String objectId) =>
      Generator.defaultGenerator.resolveFor(file, objectId);

  @protected
  String getFieldDecoder(NexemaValueType valueType) {
    if (valueType.nullable) {
      return "reader.isNextNull() ? null : (${_getRawFieldDecoder(valueType)})";
    } else {
      return _getRawFieldDecoder(valueType);
    }
  }

  String _getRawFieldDecoder(NexemaValueType valueType) {
    if (valueType is NexemaPrimitiveValueType) {
      if (valueType.primitive == NexemaPrimitive.list) {
        final argumentType = valueType.arguments!.first;
        return "$kCoreList.generate(reader.beginDecodeArray(), (_) => ${getFieldDecoder(argumentType)})";
      } else if (valueType.primitive == NexemaPrimitive.map) {
        final keyArgument = valueType.arguments!.first;
        final valueArgument = valueType.arguments!.last;
        return "$kNexAlias.generateMap(reader.beginDecodeMap(), (_) => ${getFieldDecoder(keyArgument)}, (_) => ${getFieldDecoder(valueArgument)})";
      } else {
        final decoder = kDecoderMapper[valueType.primitive];
        return "reader.$decoder()";
      }
    } else {
      final reference = resolveReference((valueType as NexemaTypeValueType).objectId);
      final declaration = getDartDeclarationForReference(reference);
      if (reference.type.isEnum) {
        return "$declaration.byIndex(reader.decodeUint8()) ?? $declaration.${reference.type.fields.first.dartName}";
      } else {
        return "$declaration.decode(reader.decodeBinary())";
      }
    }
  }

  @protected
  String getFieldEncoder(String variableName, NexemaValueType valueType,
      {bool appendExclamationMark = true}) {
    if (valueType.nullable) {
      return """if($variableName == null) {
        writer.encodeNull();
      } else {
        ${_getFieldRawEncoder(variableName, valueType, appendExclamationMark: appendExclamationMark)}
      }""";
    } else {
      return _getFieldRawEncoder(variableName, valueType, appendExclamationMark: false);
    }
  }

  String _getFieldRawEncoder(String variableName, NexemaValueType valueType,
      {bool appendExclamationMark = true}) {
    if (appendExclamationMark && valueType.nullable) {
      variableName = "$variableName!";
    }
    if (valueType is NexemaPrimitiveValueType) {
      if (valueType.primitive == NexemaPrimitive.list) {
        final argumentType = valueType.arguments!.first;
        return """writer.beginArray($variableName.length);
for(var value in $variableName) {
  ${getFieldEncoder('value', argumentType, appendExclamationMark: false)}
}""";
      } else if (valueType.primitive == NexemaPrimitive.map) {
        final keyArgument = valueType.arguments!.first;
        final valueArgument = valueType.arguments!.last;

        return """writer.beginMap($variableName.length);
for(var entry in $variableName.entries) {
  ${getFieldEncoder('entry.key', keyArgument)}
  ${getFieldEncoder('entry.value', valueArgument)}
}""";
      } else {
        final encodeMethod = kEncoderMapper[valueType.primitive];
        return "writer.$encodeMethod($variableName);";
      }
    } else {
      final reference = resolveReference((valueType as NexemaTypeValueType).objectId);
      if (reference.type.isEnum) {
        return "writer.encodeUint8($variableName.index);";
      } else {
        return "writer.encodeBinary($variableName.encode());";
      }
    }
  }

  @protected
  String equalityMethods() {
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

  @protected
  String writeTypeInfo() {
    return """
static const _typeInfo = $kNexAlias.TypeInfo(
  name: '${type.name}', 
  modifier: ${_getTypeModifier()}, 
  packageName: '${file.packageName}', 
  annotations: ${_writeMap(type.annotations)},
  fields: [${type.fields.map((e) => _fieldInfo(e)).join(",")}]
);
""";
  }

  String _getTypeModifier() {
    switch (type.modifier) {
      case NexemaTypeModifier.struct:
        return "$kNexAlias.TypeModifier.struct";
      case NexemaTypeModifier.enumerator:
        return "$kNexAlias.TypeModifier.enumerator";
      case NexemaTypeModifier.base:
        return "$kNexAlias.TypeModifier.base";
      case NexemaTypeModifier.union:
        return "$kNexAlias.TypeModifier.union";
    }
  }

  String _writeMap(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) {
      return "const {}";
    }
    return """const {
  ${map.entries.map((e) => "'${e.key}': ${writeValueToString(e.value)}").join(",")}
}""";
  }

  String writeValueToString(dynamic value) {
    if (value is String) {
      return '"$value"';
    } else if (value is List) {
      return "const [${value.map((e) => writeValueToString(e)).join(",")}]";
    } else if (value is Map) {
      return "const {${value.entries.map((e) => "'${e.key}': ${writeValueToString(e.value)}").join(",")}}";
    }

    return value.toString();
  }

  String _fieldInfo(NexemaTypeFieldDefinition field) {
    return """
$kNexAlias.FieldInfo<${type.name}>(
  name: '${field.name}', 
  dartName: '${field.dartName}', 
  index: ${field.index}, 
  valueType: ${_fieldValueType(field.type)},
  annotations: ${_writeMap(field.annotations)})
""";
  }

  String _fieldValueType(NexemaValueType? type) {
    if (type == null) {
      return "null";
    }

    return """
$kNexAlias.FieldValueType(
  kind: ${_getValueKind(type)}, 
  isNullable: ${type.nullable}, 
  typeArguments: ${_getTypeArguments(type)}
)""";
  }

  String _getValueKind(NexemaValueType type) {
    if (type is NexemaPrimitiveValueType) {
      return "$kNexAlias.FieldValueKind.${type.primitive.name}";
    } else {
      return "$kNexAlias.FieldValueKind.type";
    }
  }

  String _getTypeArguments(NexemaValueType type) {
    if (type is NexemaPrimitiveValueType && type.arguments != null) {
      return "[${type.arguments!.map((e) => _fieldValueType(e)).join(",")}]";
    }

    return "[]";
  }
}
