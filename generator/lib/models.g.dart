// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenerateInput _$$_GenerateInputFromJson(Map<String, dynamic> json) =>
    _$_GenerateInput(
      rootFolder: json['root'] as String,
      outputPath: json['outputPath'] as String,
      options: json['options'] as Map<String, dynamic>,
      rootPackage:
          DeclarationNode.fromJson(json['packages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GenerateInputToJson(_$_GenerateInput instance) =>
    <String, dynamic>{
      'root': instance.rootFolder,
      'outputPath': instance.outputPath,
      'options': instance.options,
      'packages': instance.rootPackage,
    };

_$_DeclarationNode _$$_DeclarationNodeFromJson(Map<String, dynamic> json) =>
    _$_DeclarationNode(
      name: json['name'] as String,
      value: _entityDeclarationFromJson(json['value'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>)
          .map((e) => DeclarationNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DeclarationNodeToJson(_$_DeclarationNode instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': _entityDeclarationToJson(instance.value),
      'children': instance.children,
    };

_$_PackageDeclaration _$$_PackageDeclarationFromJson(
        Map<String, dynamic> json) =>
    _$_PackageDeclaration(
      name: json['packageName'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$$_PackageDeclarationToJson(
        _$_PackageDeclaration instance) =>
    <String, dynamic>{
      'packageName': instance.name,
      'path': instance.path,
    };

_$_FileDeclaration _$$_FileDeclarationFromJson(Map<String, dynamic> json) =>
    _$_FileDeclaration(
      name: json['fileName'] as String,
      path: json['path'] as String,
      id: json['id'] as String,
      types: (json['types'] as List<dynamic>?)
              ?.map((e) =>
                  SchemaTypeDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      imports: (json['imports'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_FileDeclarationToJson(_$_FileDeclaration instance) =>
    <String, dynamic>{
      'fileName': instance.name,
      'path': instance.path,
      'id': instance.id,
      'types': instance.types,
      'imports': instance.imports,
    };

_$_TypeDefinition _$$_TypeDefinitionFromJson(Map<String, dynamic> json) =>
    _$_TypeDefinition(
      id: json['id'] as String,
      name: json['name'] as String,
      modifier: $enumDecode(_$SchemaTypeModifierEnumMap, json['modifier']),
      fields: (json['fields'] as List<dynamic>)
          .map((e) => TypeFieldDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TypeDefinitionToJson(_$_TypeDefinition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'modifier': _$SchemaTypeModifierEnumMap[instance.modifier]!,
      'fields': instance.fields,
    };

const _$SchemaTypeModifierEnumMap = {
  SchemaTypeModifier.struct: 'struct',
  SchemaTypeModifier.$enum: 'enum',
  SchemaTypeModifier.union: 'union',
};

_$_TypeFieldDefinition _$$_TypeFieldDefinitionFromJson(
        Map<String, dynamic> json) =>
    _$_TypeFieldDefinition(
      name: json['name'] as String,
      index: json['index'] as int,
      defaultValue: json['defaultValue'],
      metadata: json['metadata'] as Map<String, dynamic>?,
      type: json['type'] == null
          ? null
          : SchemaFieldType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TypeFieldDefinitionToJson(
        _$_TypeFieldDefinition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'index': instance.index,
      'defaultValue': instance.defaultValue,
      'metadata': instance.metadata,
      'type': instance.type,
    };

_$_FieldType _$$_FieldTypeFromJson(Map<String, dynamic> json) => _$_FieldType(
      primitive: $enumDecode(_$FieldPrimitiveEnumMap, json['primitive']),
      typeName: json['typeName'] as String?,
      nullable: json['nullable'] as bool,
      importId: json['importId'] as String,
      typeArguments: (json['typeArguments'] as List<dynamic>?)
              ?.map((e) => SchemaFieldType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_FieldTypeToJson(_$_FieldType instance) =>
    <String, dynamic>{
      'primitive': _$FieldPrimitiveEnumMap[instance.primitive]!,
      'typeName': instance.typeName,
      'nullable': instance.nullable,
      'importId': instance.importId,
      'typeArguments': instance.typeArguments,
    };

const _$FieldPrimitiveEnumMap = {
  FieldPrimitive.boolean: 'boolean',
  FieldPrimitive.string: 'string',
  FieldPrimitive.uint8: 'uint8',
  FieldPrimitive.uint16: 'uint16',
  FieldPrimitive.uint32: 'uint32',
  FieldPrimitive.uint64: 'uint64',
  FieldPrimitive.int8: 'int8',
  FieldPrimitive.int16: 'int16',
  FieldPrimitive.int32: 'int32',
  FieldPrimitive.int64: 'int64',
  FieldPrimitive.float32: 'float32',
  FieldPrimitive.float64: 'float64',
  FieldPrimitive.binary: 'binary',
  FieldPrimitive.list: 'list',
  FieldPrimitive.map: 'map',
  FieldPrimitive.custom: 'custom',
};
