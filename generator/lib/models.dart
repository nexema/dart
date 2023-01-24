// ignore_for_file: invalid_annotation_target

import 'package:dart_mappable/dart_mappable.dart';
import 'package:recase/recase.dart';

part 'models.mapper.dart';

@MappableClass()
class NexemaDefinition with NexemaDefinitionMappable {
  final int version, hashcode;
  final List<NexemaFile> files;

  const NexemaDefinition({
    required this.version,
    required this.hashcode,
    required this.files
  });

  static final fromJson = NexemaDefinitionMapper.fromJson;
}

@MappableClass()
class NexemaFile with NexemaFileMappable {
  final String name;
  final List<NexemaTypeDefinition> types;

  const NexemaFile({
    required this.name,
    required this.types
  });
}

@MappableClass()
class NexemaTypeDefinition with NexemaTypeDefinitionMappable {
  final String id, name, modifier;
  final List<String> documentation;
  final List<NexemaTypeFieldDefinition> fields;

  String get dartName => name.pascalCase;

  const NexemaTypeDefinition({
    required this.id,
    required this.name,
    required this.modifier,
    required this.documentation,
    required this.fields
  });

}

@MappableClass()
class NexemaTypeFieldDefinition with NexemaTypeFieldDefinitionMappable {
  final int index;
  final String name;
  final Map<String, Object?> metadata;
  final Object? defaultValue;
  final NexemaValueType? type;

  String get dartName => name.camelCase;

  const NexemaTypeFieldDefinition({
    required this.index,
    required this.name,
    required this.metadata,
    required this.defaultValue,
    required this.type
  });
}

@MappableClass(discriminatorKey: r'$type')
abstract class NexemaValueType with NexemaValueTypeMappable {
  final bool nullable;

  const NexemaValueType({required this.nullable});
}

@MappableClass(discriminatorValue: 'NexemaPrimitiveValueType')
class NexemaPrimitiveValueType extends NexemaValueType with NexemaPrimitiveValueTypeMappable {
  final String primitive;
  final List<NexemaValueType> typeArguments;

  const NexemaPrimitiveValueType({
    required super.nullable,
    required this.primitive,
    required this.typeArguments
  });
}

@MappableClass(discriminatorValue: 'NexemaTypeValueType')
class NexemaTypeValueType extends NexemaValueType with NexemaTypeValueTypeMappable {
  final String typeId;
  final String? importAlias;

  const NexemaTypeValueType({
    required super.nullable,
    required this.typeId,
    required this.importAlias
  });
}