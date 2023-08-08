// ignore_for_file: invalid_annotation_target

import 'package:dart_mappable/dart_mappable.dart';
import 'package:recase/recase.dart';

part 'models.mapper.dart';

class GeneratorSettings {
  final String outputPath, projectName;

  GeneratorSettings({required this.outputPath, required this.projectName});
}

@MappableClass()
class PluginResult with PluginResultMappable {
  final int exitCode;
  final List<GeneratedFile> files;
  final String? error;

  const PluginResult({required this.exitCode, required this.files, this.error});

  static final fromJson = PluginResultMapper.fromJson;
}

@MappableClass()
class GeneratedFile with GeneratedFileMappable {
  final String id;
  final String name, contents, filePath;

  const GeneratedFile(
      {required this.id, required this.name, required this.contents, required this.filePath});

  static final fromJson = GeneratedFileMapper.fromJson;
}

@MappableClass()
class NexemaSnapshot with NexemaSnapshotMappable {
  final int version;
  final String hashcode;
  final List<NexemaFile> files;

  const NexemaSnapshot({required this.version, required this.hashcode, required this.files});

  static final fromJson = NexemaSnapshotMapper.fromJson;
}

@MappableClass()
class NexemaFile with NexemaFileMappable {
  final String id, packageName, path;
  final List<NexemaTypeDefinition> types;

  const NexemaFile(
      {required this.id, required this.path, required this.packageName, required this.types});
}

@MappableClass()
class NexemaTypeDefinition with NexemaTypeDefinitionMappable {
  final String id, name;
  final NexemaTypeModifier modifier;
  final String? baseType;
  final List<String>? documentation;
  final List<NexemaTypeFieldDefinition> fields;
  final Map<String, dynamic>? annotations, defaults;

  String get dartName => name.pascalCase;
  bool get isEnum => modifier == NexemaTypeModifier.enumerator;

  const NexemaTypeDefinition(
      {required this.id,
      required this.name,
      required this.modifier,
      this.documentation,
      this.baseType,
      required this.fields,
      this.annotations,
      this.defaults});
}

@MappableEnum(caseStyle: CaseStyle.lowerCase, mode: ValuesMode.named)
enum NexemaTypeModifier {
  @MappableValue("enum")
  enumerator,
  base,
  struct,
  union
}

@MappableClass()
class NexemaTypeFieldDefinition with NexemaTypeFieldDefinitionMappable {
  final int index;
  final String name;
  final Map<String, dynamic>? annotations;
  final List<String>? documentation;
  final NexemaValueType? type;

  String get dartName => name.camelCase;

  const NexemaTypeFieldDefinition(
      {required this.index, required this.name, this.documentation, this.annotations, this.type});
}

@MappableClass(discriminatorKey: 'kind')
abstract class NexemaValueType with NexemaValueTypeMappable {
  final bool nullable;

  const NexemaValueType({required this.nullable});
}

@MappableClass(discriminatorValue: 'primitiveValueType')
class NexemaPrimitiveValueType extends NexemaValueType with NexemaPrimitiveValueTypeMappable {
  final NexemaPrimitive primitive;
  final List<NexemaValueType>? arguments;

  const NexemaPrimitiveValueType(
      {required super.nullable, required this.primitive, this.arguments});
}

@MappableEnum(caseStyle: CaseStyle.lowerCase, mode: ValuesMode.named)
enum NexemaPrimitive {
  string,
  bool,
  uint,
  int,
  int8,
  int16,
  int32,
  int64,
  uint8,
  uint16,
  uint32,
  uint64,
  float32,
  float64,
  binary,
  list,
  map,
  type,
  timestamp,
  duration
}

@MappableClass(discriminatorValue: 'customType')
class NexemaTypeValueType extends NexemaValueType with NexemaTypeValueTypeMappable {
  final String objectId;

  const NexemaTypeValueType({
    required super.nullable,
    required this.objectId,
  });
}
