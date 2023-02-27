// ignore_for_file: invalid_annotation_target

import 'package:dart_mappable/dart_mappable.dart';
import 'package:recase/recase.dart';

part 'models.mapper.dart';

class GeneratorSettings {
  final String outputPath;

  GeneratorSettings({required this.outputPath});
}

@MappableClass()
class PluginResult with PluginResultMappable {
  final int exitCode;
  final List<GeneratedFile> files;
  
  const PluginResult({
    required this.exitCode,
    required this.files
  });

  static final fromJson = PluginResultMapper.fromJson;
}

@MappableClass()
class GeneratedFile with GeneratedFileMappable {
  final int id;
  final String name, contents;
  
  const GeneratedFile({
    required this.id,
    required this.name,
    required this.contents
  });

  static final fromJson = GeneratedFileMapper.fromJson;
}

/*
	Id       uint64 `json:"id"`       // The id of the generated file
	Name     string `json:"name"`     // The name of the file
	Contents string `json:"contents"` // The contents of the file
*/

@MappableClass()
class NexemaSnapshot with NexemaSnapshotMappable {
  final int version, hashcode;
  final List<NexemaFile> files;

  const NexemaSnapshot({
    required this.version,
    required this.hashcode,
    required this.files
  });

  static final fromJson = NexemaSnapshotMapper.fromJson;
}

@MappableClass()
class NexemaFile with NexemaFileMappable {
  final String fileName, packageName, path;
  final List<NexemaTypeDefinition> types;
  final int id;

  const NexemaFile({
    required this.id,
    required this.fileName,
    required this.path,
    required this.packageName,
    required this.types
  });
}

@MappableClass()
class NexemaTypeDefinition with NexemaTypeDefinitionMappable {
  final int id;
  final int? baseType;
  final String name, modifier;
  final List<String> documentation;
  final List<NexemaTypeFieldDefinition> fields;
  final Map<String, dynamic> annotations, defaults;

  String get dartName => name.pascalCase;
  bool get isEnum => modifier == "enum";

  const NexemaTypeDefinition({
    required this.id,
    required this.name,
    required this.modifier,
    required this.documentation,
    required this.baseType,
    required this.fields,
    required this.annotations,
    required this.defaults
  });
}

@MappableClass()
class NexemaTypeFieldDefinition with NexemaTypeFieldDefinitionMappable {
  final int index;
  final String name;
  final Map<String, dynamic> annotations;
  final List<String> documentation;
  final NexemaValueType? type;

  String get dartName => name.camelCase;

  const NexemaTypeFieldDefinition({
    required this.index,
    required this.name,
    required this.documentation,
    required this.annotations,
    required this.type
  });
}

@MappableClass(discriminatorKey: 'kind')
abstract class NexemaValueType with NexemaValueTypeMappable {
  final bool nullable;

  const NexemaValueType({required this.nullable});
}

@MappableClass(discriminatorValue: 'primitiveValueType')
class NexemaPrimitiveValueType extends NexemaValueType with NexemaPrimitiveValueTypeMappable {
  final String primitive;
  final List<NexemaValueType> arguments;

  const NexemaPrimitiveValueType({
    required super.nullable,
    required this.primitive,
    required this.arguments
  });
}

@MappableClass(discriminatorValue: 'customType')
class NexemaTypeValueType extends NexemaValueType with NexemaTypeValueTypeMappable {
  final int objectId;

  const NexemaTypeValueType({
    required super.nullable,
    required this.objectId,
  });
}