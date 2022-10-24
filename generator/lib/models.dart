// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class GenerateInput with _$GenerateInput{
  const factory GenerateInput({
    @JsonKey(name: 'root') required String rootFolder,
    required String outputPath,
    required Map<String, Object?> options,
    @JsonKey(name: 'packages') required DeclarationNode rootPackage
  }) = _GenerateInput;

  factory GenerateInput.fromJson(Map<String, dynamic> json) => _$GenerateInputFromJson(json);
}

@freezed
class DeclarationNode with _$DeclarationNode{
  const factory DeclarationNode({
    required String name,
    @JsonKey(fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson) required EntityDeclaration value,
    required List<DeclarationNode> children
  }) = _DeclarationNode;

  factory DeclarationNode.fromJson(Map<String, dynamic> json) => _$DeclarationNodeFromJson(json);
}

abstract class EntityDeclaration {
  String get name;
  String get path;

  dynamic toJson();
}

dynamic _entityDeclarationToJson(EntityDeclaration declaration) => declaration.toJson();
EntityDeclaration _entityDeclarationFromJson(Map<String, dynamic> json) {
  if(json.containsKey("fileName")) {
    return FileDeclaration.fromJson(json) as EntityDeclaration;
  } else {
    return PackageDeclaration.fromJson(json) as EntityDeclaration;
  }
}

@freezed
class PackageDeclaration with _$PackageDeclaration{

  @Implements<EntityDeclaration>()
  const factory PackageDeclaration({
    @JsonKey(name: "packageName") required String name,
    required String path
  }) = _PackageDeclaration;

  factory PackageDeclaration.fromJson(Map<String, dynamic> json) => _$PackageDeclarationFromJson(json);
}

@freezed
class FileDeclaration with _$FileDeclaration{
  @Implements<EntityDeclaration>()
  const factory FileDeclaration({
    @JsonKey(name: "fileName") required String name,
    required String path,
    required String id,
    @JsonKey(defaultValue: <SchemaTypeDefinition>[]) required List<SchemaTypeDefinition> types,
    @JsonKey(defaultValue: <String>[]) required List<String> imports
  }) = _FileDeclaration;

  factory FileDeclaration.fromJson(Map<String, dynamic> json) => _$FileDeclarationFromJson(json);
}

@freezed
class SchemaTypeDefinition with _$SchemaTypeDefinition{
  const factory SchemaTypeDefinition({
    required String id,
    required String name,
    required SchemaTypeModifier modifier,
    required List<TypeFieldDefinition> fields
  }) = _TypeDefinition;

  factory SchemaTypeDefinition.fromJson(Map<String, dynamic> json) => _$SchemaTypeDefinitionFromJson(json);
}

@freezed
class TypeFieldDefinition with _$TypeFieldDefinition{
  factory TypeFieldDefinition({
    required String name,
    required int index,
    required Object? defaultValue,
    required Map<String, Object?>? metadata,
    required SchemaFieldType? type
  }) = _TypeFieldDefinition;

  factory TypeFieldDefinition.fromJson(Map<String, dynamic> json) => _$TypeFieldDefinitionFromJson(json);
}

@freezed
class SchemaFieldType with _$SchemaFieldType{
  const factory SchemaFieldType({
    required FieldPrimitive primitive,
    required String? typeName,
    required bool nullable,
    required String importId,
    @JsonKey(defaultValue: <SchemaFieldType>[]) required List<SchemaFieldType> typeArguments
  }) = _FieldType;

  factory SchemaFieldType.fromJson(Map<String, dynamic> json) => _$SchemaFieldTypeFromJson(json);
}

@JsonEnum()
enum SchemaTypeModifier {
  @JsonValue("struct") struct, 
  @JsonValue("enum") $enum, 
  @JsonValue("union") union
}

@JsonEnum()
enum FieldPrimitive {
  boolean,
  string,
  uint8,
  uint16,
  uint32,
  uint64,
  int8,
  int16,
  int32,
  int64,
  float32,
  float64,
  binary,
  list,
  map,
  custom
}