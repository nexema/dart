// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'models.dart';

class PluginResultMapper extends MapperBase<PluginResult> {
  static MapperContainer container = MapperContainer(
    mappers: {PluginResultMapper()},
  )..linkAll({GeneratedFileMapper.container});

  @override
  PluginResultMapperElement createElement(MapperContainer container) {
    return PluginResultMapperElement._(this, container);
  }

  @override
  String get id => 'PluginResult';

  static final fromMap = container.fromMap<PluginResult>;
  static final fromJson = container.fromJson<PluginResult>;
}

class PluginResultMapperElement extends MapperElementBase<PluginResult> {
  PluginResultMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  PluginResult decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  PluginResult fromMap(Map<String, dynamic> map) => PluginResult(
      exitCode: container.$get(map, 'exitCode'),
      files: container.$get(map, 'files'));

  @override
  Function get encoder => encode;
  dynamic encode(PluginResult v) => toMap(v);
  Map<String, dynamic> toMap(PluginResult p) => {
        'exitCode': container.$enc(p.exitCode, 'exitCode'),
        'files': container.$enc(p.files, 'files')
      };

  @override
  String stringify(PluginResult self) =>
      'PluginResult(exitCode: ${container.asString(self.exitCode)}, files: ${container.asString(self.files)})';
  @override
  int hash(PluginResult self) =>
      container.hash(self.exitCode) ^ container.hash(self.files);
  @override
  bool equals(PluginResult self, PluginResult other) =>
      container.isEqual(self.exitCode, other.exitCode) &&
      container.isEqual(self.files, other.files);
}

mixin PluginResultMappable {
  String toJson() => PluginResultMapper.container.toJson(this as PluginResult);
  Map<String, dynamic> toMap() =>
      PluginResultMapper.container.toMap(this as PluginResult);
  PluginResultCopyWith<PluginResult, PluginResult, PluginResult> get copyWith =>
      _PluginResultCopyWithImpl(this as PluginResult, $identity, $identity);
  @override
  String toString() => PluginResultMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PluginResultMapper.container.isEqual(this, other));
  @override
  int get hashCode => PluginResultMapper.container.hash(this);
}

extension PluginResultValueCopy<$R, $Out extends PluginResult>
    on ObjectCopyWith<$R, PluginResult, $Out> {
  PluginResultCopyWith<$R, PluginResult, $Out> get asPluginResult =>
      base.as((v, t, t2) => _PluginResultCopyWithImpl(v, t, t2));
}

typedef PluginResultCopyWithBound = PluginResult;

abstract class PluginResultCopyWith<$R, $In extends PluginResult,
    $Out extends PluginResult> implements ObjectCopyWith<$R, $In, $Out> {
  PluginResultCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PluginResult>(
      Then<PluginResult, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, GeneratedFile,
      GeneratedFileCopyWith<$R, GeneratedFile, GeneratedFile>> get files;
  $R call({int? exitCode, List<GeneratedFile>? files});
}

class _PluginResultCopyWithImpl<$R, $Out extends PluginResult>
    extends CopyWithBase<$R, PluginResult, $Out>
    implements PluginResultCopyWith<$R, PluginResult, $Out> {
  _PluginResultCopyWithImpl(super.value, super.then, super.then2);
  @override
  PluginResultCopyWith<$R2, PluginResult, $Out2>
      chain<$R2, $Out2 extends PluginResult>(
              Then<PluginResult, $Out2> t, Then<$Out2, $R2> t2) =>
          _PluginResultCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, GeneratedFile,
          GeneratedFileCopyWith<$R, GeneratedFile, GeneratedFile>>
      get files => ListCopyWith(
          $value.files,
          (v, t) => v.copyWith.chain<$R, GeneratedFile>($identity, t),
          (v) => call(files: v));
  @override
  $R call({int? exitCode, List<GeneratedFile>? files}) => $then(PluginResult(
      exitCode: exitCode ?? $value.exitCode, files: files ?? $value.files));
}

class GeneratedFileMapper extends MapperBase<GeneratedFile> {
  static MapperContainer container = MapperContainer(
    mappers: {GeneratedFileMapper()},
  );

  @override
  GeneratedFileMapperElement createElement(MapperContainer container) {
    return GeneratedFileMapperElement._(this, container);
  }

  @override
  String get id => 'GeneratedFile';

  static final fromMap = container.fromMap<GeneratedFile>;
  static final fromJson = container.fromJson<GeneratedFile>;
}

class GeneratedFileMapperElement extends MapperElementBase<GeneratedFile> {
  GeneratedFileMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  GeneratedFile decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  GeneratedFile fromMap(Map<String, dynamic> map) => GeneratedFile(
      id: container.$get(map, 'id'),
      name: container.$get(map, 'name'),
      contents: container.$get(map, 'contents'));

  @override
  Function get encoder => encode;
  dynamic encode(GeneratedFile v) => toMap(v);
  Map<String, dynamic> toMap(GeneratedFile g) => {
        'id': container.$enc(g.id, 'id'),
        'name': container.$enc(g.name, 'name'),
        'contents': container.$enc(g.contents, 'contents')
      };

  @override
  String stringify(GeneratedFile self) =>
      'GeneratedFile(id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, contents: ${container.asString(self.contents)})';
  @override
  int hash(GeneratedFile self) =>
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.contents);
  @override
  bool equals(GeneratedFile self, GeneratedFile other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.contents, other.contents);
}

mixin GeneratedFileMappable {
  String toJson() =>
      GeneratedFileMapper.container.toJson(this as GeneratedFile);
  Map<String, dynamic> toMap() =>
      GeneratedFileMapper.container.toMap(this as GeneratedFile);
  GeneratedFileCopyWith<GeneratedFile, GeneratedFile, GeneratedFile>
      get copyWith => _GeneratedFileCopyWithImpl(
          this as GeneratedFile, $identity, $identity);
  @override
  String toString() => GeneratedFileMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          GeneratedFileMapper.container.isEqual(this, other));
  @override
  int get hashCode => GeneratedFileMapper.container.hash(this);
}

extension GeneratedFileValueCopy<$R, $Out extends GeneratedFile>
    on ObjectCopyWith<$R, GeneratedFile, $Out> {
  GeneratedFileCopyWith<$R, GeneratedFile, $Out> get asGeneratedFile =>
      base.as((v, t, t2) => _GeneratedFileCopyWithImpl(v, t, t2));
}

typedef GeneratedFileCopyWithBound = GeneratedFile;

abstract class GeneratedFileCopyWith<$R, $In extends GeneratedFile,
    $Out extends GeneratedFile> implements ObjectCopyWith<$R, $In, $Out> {
  GeneratedFileCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends GeneratedFile>(
          Then<GeneratedFile, $Out2> t, Then<$Out2, $R2> t2);
  $R call({int? id, String? name, String? contents});
}

class _GeneratedFileCopyWithImpl<$R, $Out extends GeneratedFile>
    extends CopyWithBase<$R, GeneratedFile, $Out>
    implements GeneratedFileCopyWith<$R, GeneratedFile, $Out> {
  _GeneratedFileCopyWithImpl(super.value, super.then, super.then2);
  @override
  GeneratedFileCopyWith<$R2, GeneratedFile, $Out2>
      chain<$R2, $Out2 extends GeneratedFile>(
              Then<GeneratedFile, $Out2> t, Then<$Out2, $R2> t2) =>
          _GeneratedFileCopyWithImpl($value, t, t2);

  @override
  $R call({int? id, String? name, String? contents}) => $then(GeneratedFile(
      id: id ?? $value.id,
      name: name ?? $value.name,
      contents: contents ?? $value.contents));
}

class NexemaSnapshotMapper extends MapperBase<NexemaSnapshot> {
  static MapperContainer container = MapperContainer(
    mappers: {NexemaSnapshotMapper()},
  )..linkAll({NexemaFileMapper.container});

  @override
  NexemaSnapshotMapperElement createElement(MapperContainer container) {
    return NexemaSnapshotMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaSnapshot';

  static final fromMap = container.fromMap<NexemaSnapshot>;
  static final fromJson = container.fromJson<NexemaSnapshot>;
}

class NexemaSnapshotMapperElement extends MapperElementBase<NexemaSnapshot> {
  NexemaSnapshotMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaSnapshot decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NexemaSnapshot fromMap(Map<String, dynamic> map) => NexemaSnapshot(
      version: container.$get(map, 'version'),
      hashcode: container.$get(map, 'hashcode'),
      files: container.$get(map, 'files'));

  @override
  Function get encoder => encode;
  dynamic encode(NexemaSnapshot v) => toMap(v);
  Map<String, dynamic> toMap(NexemaSnapshot n) => {
        'version': container.$enc(n.version, 'version'),
        'hashcode': container.$enc(n.hashcode, 'hashcode'),
        'files': container.$enc(n.files, 'files')
      };

  @override
  String stringify(NexemaSnapshot self) =>
      'NexemaSnapshot(version: ${container.asString(self.version)}, hashcode: ${container.asString(self.hashcode)}, files: ${container.asString(self.files)})';
  @override
  int hash(NexemaSnapshot self) =>
      container.hash(self.version) ^
      container.hash(self.hashcode) ^
      container.hash(self.files);
  @override
  bool equals(NexemaSnapshot self, NexemaSnapshot other) =>
      container.isEqual(self.version, other.version) &&
      container.isEqual(self.hashcode, other.hashcode) &&
      container.isEqual(self.files, other.files);
}

mixin NexemaSnapshotMappable {
  String toJson() =>
      NexemaSnapshotMapper.container.toJson(this as NexemaSnapshot);
  Map<String, dynamic> toMap() =>
      NexemaSnapshotMapper.container.toMap(this as NexemaSnapshot);
  NexemaSnapshotCopyWith<NexemaSnapshot, NexemaSnapshot, NexemaSnapshot>
      get copyWith => _NexemaSnapshotCopyWithImpl(
          this as NexemaSnapshot, $identity, $identity);
  @override
  String toString() => NexemaSnapshotMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NexemaSnapshotMapper.container.isEqual(this, other));
  @override
  int get hashCode => NexemaSnapshotMapper.container.hash(this);
}

extension NexemaSnapshotValueCopy<$R, $Out extends NexemaSnapshot>
    on ObjectCopyWith<$R, NexemaSnapshot, $Out> {
  NexemaSnapshotCopyWith<$R, NexemaSnapshot, $Out> get asNexemaSnapshot =>
      base.as((v, t, t2) => _NexemaSnapshotCopyWithImpl(v, t, t2));
}

typedef NexemaSnapshotCopyWithBound = NexemaSnapshot;

abstract class NexemaSnapshotCopyWith<$R, $In extends NexemaSnapshot,
    $Out extends NexemaSnapshot> implements ObjectCopyWith<$R, $In, $Out> {
  NexemaSnapshotCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends NexemaSnapshot>(
          Then<NexemaSnapshot, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, NexemaFile, NexemaFileCopyWith<$R, NexemaFile, NexemaFile>>
      get files;
  $R call({int? version, int? hashcode, List<NexemaFile>? files});
}

class _NexemaSnapshotCopyWithImpl<$R, $Out extends NexemaSnapshot>
    extends CopyWithBase<$R, NexemaSnapshot, $Out>
    implements NexemaSnapshotCopyWith<$R, NexemaSnapshot, $Out> {
  _NexemaSnapshotCopyWithImpl(super.value, super.then, super.then2);
  @override
  NexemaSnapshotCopyWith<$R2, NexemaSnapshot, $Out2>
      chain<$R2, $Out2 extends NexemaSnapshot>(
              Then<NexemaSnapshot, $Out2> t, Then<$Out2, $R2> t2) =>
          _NexemaSnapshotCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, NexemaFile, NexemaFileCopyWith<$R, NexemaFile, NexemaFile>>
      get files => ListCopyWith(
          $value.files,
          (v, t) => v.copyWith.chain<$R, NexemaFile>($identity, t),
          (v) => call(files: v));
  @override
  $R call({int? version, int? hashcode, List<NexemaFile>? files}) =>
      $then(NexemaSnapshot(
          version: version ?? $value.version,
          hashcode: hashcode ?? $value.hashcode,
          files: files ?? $value.files));
}

class NexemaFileMapper extends MapperBase<NexemaFile> {
  static MapperContainer container = MapperContainer(
    mappers: {NexemaFileMapper()},
  )..linkAll({NexemaTypeDefinitionMapper.container});

  @override
  NexemaFileMapperElement createElement(MapperContainer container) {
    return NexemaFileMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaFile';

  static final fromMap = container.fromMap<NexemaFile>;
  static final fromJson = container.fromJson<NexemaFile>;
}

class NexemaFileMapperElement extends MapperElementBase<NexemaFile> {
  NexemaFileMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaFile decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NexemaFile fromMap(Map<String, dynamic> map) => NexemaFile(
      id: container.$get(map, 'id'),
      fileName: container.$get(map, 'fileName'),
      path: container.$get(map, 'path'),
      packageName: container.$get(map, 'packageName'),
      types: container.$get(map, 'types'));

  @override
  Function get encoder => encode;
  dynamic encode(NexemaFile v) => toMap(v);
  Map<String, dynamic> toMap(NexemaFile n) => {
        'id': container.$enc(n.id, 'id'),
        'fileName': container.$enc(n.fileName, 'fileName'),
        'path': container.$enc(n.path, 'path'),
        'packageName': container.$enc(n.packageName, 'packageName'),
        'types': container.$enc(n.types, 'types')
      };

  @override
  String stringify(NexemaFile self) =>
      'NexemaFile(fileName: ${container.asString(self.fileName)}, packageName: ${container.asString(self.packageName)}, path: ${container.asString(self.path)}, types: ${container.asString(self.types)}, id: ${container.asString(self.id)})';
  @override
  int hash(NexemaFile self) =>
      container.hash(self.fileName) ^
      container.hash(self.packageName) ^
      container.hash(self.path) ^
      container.hash(self.types) ^
      container.hash(self.id);
  @override
  bool equals(NexemaFile self, NexemaFile other) =>
      container.isEqual(self.fileName, other.fileName) &&
      container.isEqual(self.packageName, other.packageName) &&
      container.isEqual(self.path, other.path) &&
      container.isEqual(self.types, other.types) &&
      container.isEqual(self.id, other.id);
}

mixin NexemaFileMappable {
  String toJson() => NexemaFileMapper.container.toJson(this as NexemaFile);
  Map<String, dynamic> toMap() =>
      NexemaFileMapper.container.toMap(this as NexemaFile);
  NexemaFileCopyWith<NexemaFile, NexemaFile, NexemaFile> get copyWith =>
      _NexemaFileCopyWithImpl(this as NexemaFile, $identity, $identity);
  @override
  String toString() => NexemaFileMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NexemaFileMapper.container.isEqual(this, other));
  @override
  int get hashCode => NexemaFileMapper.container.hash(this);
}

extension NexemaFileValueCopy<$R, $Out extends NexemaFile>
    on ObjectCopyWith<$R, NexemaFile, $Out> {
  NexemaFileCopyWith<$R, NexemaFile, $Out> get asNexemaFile =>
      base.as((v, t, t2) => _NexemaFileCopyWithImpl(v, t, t2));
}

typedef NexemaFileCopyWithBound = NexemaFile;

abstract class NexemaFileCopyWith<$R, $In extends NexemaFile,
    $Out extends NexemaFile> implements ObjectCopyWith<$R, $In, $Out> {
  NexemaFileCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends NexemaFile>(
      Then<NexemaFile, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<
      $R,
      NexemaTypeDefinition,
      NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition,
          NexemaTypeDefinition>> get types;
  $R call(
      {int? id,
      String? fileName,
      String? path,
      String? packageName,
      List<NexemaTypeDefinition>? types});
}

class _NexemaFileCopyWithImpl<$R, $Out extends NexemaFile>
    extends CopyWithBase<$R, NexemaFile, $Out>
    implements NexemaFileCopyWith<$R, NexemaFile, $Out> {
  _NexemaFileCopyWithImpl(super.value, super.then, super.then2);
  @override
  NexemaFileCopyWith<$R2, NexemaFile, $Out2>
      chain<$R2, $Out2 extends NexemaFile>(
              Then<NexemaFile, $Out2> t, Then<$Out2, $R2> t2) =>
          _NexemaFileCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<
      $R,
      NexemaTypeDefinition,
      NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition,
          NexemaTypeDefinition>> get types => ListCopyWith(
      $value.types,
      (v, t) => v.copyWith.chain<$R, NexemaTypeDefinition>($identity, t),
      (v) => call(types: v));
  @override
  $R call(
          {int? id,
          String? fileName,
          String? path,
          String? packageName,
          List<NexemaTypeDefinition>? types}) =>
      $then(NexemaFile(
          id: id ?? $value.id,
          fileName: fileName ?? $value.fileName,
          path: path ?? $value.path,
          packageName: packageName ?? $value.packageName,
          types: types ?? $value.types));
}

class NexemaTypeDefinitionMapper extends MapperBase<NexemaTypeDefinition> {
  static MapperContainer container = MapperContainer(
    mappers: {NexemaTypeDefinitionMapper()},
  )..linkAll({NexemaTypeFieldDefinitionMapper.container});

  @override
  NexemaTypeDefinitionMapperElement createElement(MapperContainer container) {
    return NexemaTypeDefinitionMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaTypeDefinition';

  static final fromMap = container.fromMap<NexemaTypeDefinition>;
  static final fromJson = container.fromJson<NexemaTypeDefinition>;
}

class NexemaTypeDefinitionMapperElement
    extends MapperElementBase<NexemaTypeDefinition> {
  NexemaTypeDefinitionMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaTypeDefinition decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NexemaTypeDefinition fromMap(Map<String, dynamic> map) =>
      NexemaTypeDefinition(
          id: container.$get(map, 'id'),
          name: container.$get(map, 'name'),
          modifier: container.$get(map, 'modifier'),
          documentation: container.$get(map, 'documentation'),
          baseType: container.$getOpt(map, 'baseType'),
          fields: container.$get(map, 'fields'),
          annotations: container.$get(map, 'annotations'),
          defaults: container.$get(map, 'defaults'));

  @override
  Function get encoder => encode;
  dynamic encode(NexemaTypeDefinition v) => toMap(v);
  Map<String, dynamic> toMap(NexemaTypeDefinition n) => {
        'id': container.$enc(n.id, 'id'),
        'name': container.$enc(n.name, 'name'),
        'modifier': container.$enc(n.modifier, 'modifier'),
        'documentation': container.$enc(n.documentation, 'documentation'),
        'baseType': container.$enc(n.baseType, 'baseType'),
        'fields': container.$enc(n.fields, 'fields'),
        'annotations': container.$enc(n.annotations, 'annotations'),
        'defaults': container.$enc(n.defaults, 'defaults')
      };

  @override
  String stringify(NexemaTypeDefinition self) =>
      'NexemaTypeDefinition(id: ${container.asString(self.id)}, baseType: ${container.asString(self.baseType)}, name: ${container.asString(self.name)}, modifier: ${container.asString(self.modifier)}, documentation: ${container.asString(self.documentation)}, fields: ${container.asString(self.fields)}, annotations: ${container.asString(self.annotations)}, defaults: ${container.asString(self.defaults)})';
  @override
  int hash(NexemaTypeDefinition self) =>
      container.hash(self.id) ^
      container.hash(self.baseType) ^
      container.hash(self.name) ^
      container.hash(self.modifier) ^
      container.hash(self.documentation) ^
      container.hash(self.fields) ^
      container.hash(self.annotations) ^
      container.hash(self.defaults);
  @override
  bool equals(NexemaTypeDefinition self, NexemaTypeDefinition other) =>
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.baseType, other.baseType) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.modifier, other.modifier) &&
      container.isEqual(self.documentation, other.documentation) &&
      container.isEqual(self.fields, other.fields) &&
      container.isEqual(self.annotations, other.annotations) &&
      container.isEqual(self.defaults, other.defaults);
}

mixin NexemaTypeDefinitionMappable {
  String toJson() =>
      NexemaTypeDefinitionMapper.container.toJson(this as NexemaTypeDefinition);
  Map<String, dynamic> toMap() =>
      NexemaTypeDefinitionMapper.container.toMap(this as NexemaTypeDefinition);
  NexemaTypeDefinitionCopyWith<NexemaTypeDefinition, NexemaTypeDefinition,
          NexemaTypeDefinition>
      get copyWith => _NexemaTypeDefinitionCopyWithImpl(
          this as NexemaTypeDefinition, $identity, $identity);
  @override
  String toString() => NexemaTypeDefinitionMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NexemaTypeDefinitionMapper.container.isEqual(this, other));
  @override
  int get hashCode => NexemaTypeDefinitionMapper.container.hash(this);
}

extension NexemaTypeDefinitionValueCopy<$R, $Out extends NexemaTypeDefinition>
    on ObjectCopyWith<$R, NexemaTypeDefinition, $Out> {
  NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition, $Out>
      get asNexemaTypeDefinition =>
          base.as((v, t, t2) => _NexemaTypeDefinitionCopyWithImpl(v, t, t2));
}

typedef NexemaTypeDefinitionCopyWithBound = NexemaTypeDefinition;

abstract class NexemaTypeDefinitionCopyWith<$R,
        $In extends NexemaTypeDefinition, $Out extends NexemaTypeDefinition>
    implements ObjectCopyWith<$R, $In, $Out> {
  NexemaTypeDefinitionCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends NexemaTypeDefinition>(
          Then<NexemaTypeDefinition, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get documentation;
  ListCopyWith<
      $R,
      NexemaTypeFieldDefinition,
      NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition,
          NexemaTypeFieldDefinition>> get fields;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get annotations;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get defaults;
  $R call(
      {int? id,
      String? name,
      String? modifier,
      List<String>? documentation,
      int? baseType,
      List<NexemaTypeFieldDefinition>? fields,
      Map<String, dynamic>? annotations,
      Map<String, dynamic>? defaults});
}

class _NexemaTypeDefinitionCopyWithImpl<$R, $Out extends NexemaTypeDefinition>
    extends CopyWithBase<$R, NexemaTypeDefinition, $Out>
    implements NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition, $Out> {
  _NexemaTypeDefinitionCopyWithImpl(super.value, super.then, super.then2);
  @override
  NexemaTypeDefinitionCopyWith<$R2, NexemaTypeDefinition, $Out2>
      chain<$R2, $Out2 extends NexemaTypeDefinition>(
              Then<NexemaTypeDefinition, $Out2> t, Then<$Out2, $R2> t2) =>
          _NexemaTypeDefinitionCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get documentation => ListCopyWith(
          $value.documentation,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(documentation: v));
  @override
  ListCopyWith<
      $R,
      NexemaTypeFieldDefinition,
      NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition,
          NexemaTypeFieldDefinition>> get fields => ListCopyWith(
      $value.fields,
      (v, t) => v.copyWith.chain<$R, NexemaTypeFieldDefinition>($identity, t),
      (v) => call(fields: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get annotations => MapCopyWith(
          $value.annotations,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(annotations: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get defaults => MapCopyWith($value.defaults,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(defaults: v));
  @override
  $R call(
          {int? id,
          String? name,
          String? modifier,
          List<String>? documentation,
          Object? baseType = $none,
          List<NexemaTypeFieldDefinition>? fields,
          Map<String, dynamic>? annotations,
          Map<String, dynamic>? defaults}) =>
      $then(NexemaTypeDefinition(
          id: id ?? $value.id,
          name: name ?? $value.name,
          modifier: modifier ?? $value.modifier,
          documentation: documentation ?? $value.documentation,
          baseType: or(baseType, $value.baseType),
          fields: fields ?? $value.fields,
          annotations: annotations ?? $value.annotations,
          defaults: defaults ?? $value.defaults));
}

class NexemaTypeFieldDefinitionMapper
    extends MapperBase<NexemaTypeFieldDefinition> {
  static MapperContainer container = MapperContainer(
    mappers: {NexemaTypeFieldDefinitionMapper()},
  )..linkAll({NexemaValueTypeMapper.container});

  @override
  NexemaTypeFieldDefinitionMapperElement createElement(
      MapperContainer container) {
    return NexemaTypeFieldDefinitionMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaTypeFieldDefinition';

  static final fromMap = container.fromMap<NexemaTypeFieldDefinition>;
  static final fromJson = container.fromJson<NexemaTypeFieldDefinition>;
}

class NexemaTypeFieldDefinitionMapperElement
    extends MapperElementBase<NexemaTypeFieldDefinition> {
  NexemaTypeFieldDefinitionMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaTypeFieldDefinition decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NexemaTypeFieldDefinition fromMap(Map<String, dynamic> map) =>
      NexemaTypeFieldDefinition(
          index: container.$get(map, 'index'),
          name: container.$get(map, 'name'),
          documentation: container.$get(map, 'documentation'),
          annotations: container.$get(map, 'annotations'),
          type: container.$getOpt(map, 'type'));

  @override
  Function get encoder => encode;
  dynamic encode(NexemaTypeFieldDefinition v) => toMap(v);
  Map<String, dynamic> toMap(NexemaTypeFieldDefinition n) => {
        'index': container.$enc(n.index, 'index'),
        'name': container.$enc(n.name, 'name'),
        'documentation': container.$enc(n.documentation, 'documentation'),
        'annotations': container.$enc(n.annotations, 'annotations'),
        'type': container.$enc(n.type, 'type')
      };

  @override
  String stringify(NexemaTypeFieldDefinition self) =>
      'NexemaTypeFieldDefinition(index: ${container.asString(self.index)}, name: ${container.asString(self.name)}, annotations: ${container.asString(self.annotations)}, documentation: ${container.asString(self.documentation)}, type: ${container.asString(self.type)})';
  @override
  int hash(NexemaTypeFieldDefinition self) =>
      container.hash(self.index) ^
      container.hash(self.name) ^
      container.hash(self.annotations) ^
      container.hash(self.documentation) ^
      container.hash(self.type);
  @override
  bool equals(
          NexemaTypeFieldDefinition self, NexemaTypeFieldDefinition other) =>
      container.isEqual(self.index, other.index) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.annotations, other.annotations) &&
      container.isEqual(self.documentation, other.documentation) &&
      container.isEqual(self.type, other.type);
}

mixin NexemaTypeFieldDefinitionMappable {
  String toJson() => NexemaTypeFieldDefinitionMapper.container
      .toJson(this as NexemaTypeFieldDefinition);
  Map<String, dynamic> toMap() => NexemaTypeFieldDefinitionMapper.container
      .toMap(this as NexemaTypeFieldDefinition);
  NexemaTypeFieldDefinitionCopyWith<NexemaTypeFieldDefinition,
          NexemaTypeFieldDefinition, NexemaTypeFieldDefinition>
      get copyWith => _NexemaTypeFieldDefinitionCopyWithImpl(
          this as NexemaTypeFieldDefinition, $identity, $identity);
  @override
  String toString() => NexemaTypeFieldDefinitionMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NexemaTypeFieldDefinitionMapper.container.isEqual(this, other));
  @override
  int get hashCode => NexemaTypeFieldDefinitionMapper.container.hash(this);
}

extension NexemaTypeFieldDefinitionValueCopy<$R,
        $Out extends NexemaTypeFieldDefinition>
    on ObjectCopyWith<$R, NexemaTypeFieldDefinition, $Out> {
  NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition, $Out>
      get asNexemaTypeFieldDefinition => base
          .as((v, t, t2) => _NexemaTypeFieldDefinitionCopyWithImpl(v, t, t2));
}

typedef NexemaTypeFieldDefinitionCopyWithBound = NexemaTypeFieldDefinition;

abstract class NexemaTypeFieldDefinitionCopyWith<
        $R,
        $In extends NexemaTypeFieldDefinition,
        $Out extends NexemaTypeFieldDefinition>
    implements ObjectCopyWith<$R, $In, $Out> {
  NexemaTypeFieldDefinitionCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends NexemaTypeFieldDefinition>(
          Then<NexemaTypeFieldDefinition, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get documentation;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get annotations;
  NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>? get type;
  $R call(
      {int? index,
      String? name,
      List<String>? documentation,
      Map<String, dynamic>? annotations,
      NexemaValueType? type});
}

class _NexemaTypeFieldDefinitionCopyWithImpl<$R,
        $Out extends NexemaTypeFieldDefinition>
    extends CopyWithBase<$R, NexemaTypeFieldDefinition, $Out>
    implements
        NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition, $Out> {
  _NexemaTypeFieldDefinitionCopyWithImpl(super.value, super.then, super.then2);
  @override
  NexemaTypeFieldDefinitionCopyWith<$R2, NexemaTypeFieldDefinition, $Out2>
      chain<$R2, $Out2 extends NexemaTypeFieldDefinition>(
              Then<NexemaTypeFieldDefinition, $Out2> t, Then<$Out2, $R2> t2) =>
          _NexemaTypeFieldDefinitionCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get documentation => ListCopyWith(
          $value.documentation,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(documentation: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get annotations => MapCopyWith(
          $value.annotations,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(annotations: v));
  @override
  NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>? get type =>
      $value.type?.copyWith.chain($identity, (v) => call(type: v));
  @override
  $R call(
          {int? index,
          String? name,
          List<String>? documentation,
          Map<String, dynamic>? annotations,
          Object? type = $none}) =>
      $then(NexemaTypeFieldDefinition(
          index: index ?? $value.index,
          name: name ?? $value.name,
          documentation: documentation ?? $value.documentation,
          annotations: annotations ?? $value.annotations,
          type: or(type, $value.type)));
}

class NexemaValueTypeMapper extends MapperBase<NexemaValueType> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {NexemaValueTypeMapper()},
      ))
        ..linkAll({
          NexemaPrimitiveValueTypeMapper.container,
          NexemaTypeValueTypeMapper.container
        }));

  @override
  NexemaValueTypeMapperElement createElement(MapperContainer container) {
    return NexemaValueTypeMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaValueType';

  static final fromMap = container.fromMap<NexemaValueType>;
  static final fromJson = container.fromJson<NexemaValueType>;
}

class NexemaValueTypeMapperElement extends MapperElementBase<NexemaValueType> {
  NexemaValueTypeMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaValueType decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) {
        switch (map['kind']) {
          case 'customType':
            return NexemaTypeValueTypeMapper()
                .createElement(container)
                .decode(map);
          case 'primitiveValueType':
            return NexemaPrimitiveValueTypeMapper()
                .createElement(container)
                .decode(map);
          default:
            return fromMap(map);
        }
      });
  NexemaValueType fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingSubclass(
          'NexemaValueType', 'kind', '${map['kind']}');

  @override
  Function get encoder => encode;
  dynamic encode(NexemaValueType v) => toMap(v);
  Map<String, dynamic> toMap(NexemaValueType n) =>
      {'nullable': container.$enc(n.nullable, 'nullable')};

  @override
  String stringify(NexemaValueType self) =>
      'NexemaValueType(nullable: ${container.asString(self.nullable)})';
  @override
  int hash(NexemaValueType self) => container.hash(self.nullable);
  @override
  bool equals(NexemaValueType self, NexemaValueType other) =>
      container.isEqual(self.nullable, other.nullable);
}

mixin NexemaValueTypeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  NexemaValueTypeCopyWith<NexemaValueType, NexemaValueType, NexemaValueType>
      get copyWith;
}

typedef NexemaValueTypeCopyWithBound = NexemaValueType;

abstract class NexemaValueTypeCopyWith<$R, $In extends NexemaValueType,
    $Out extends NexemaValueType> implements ObjectCopyWith<$R, $In, $Out> {
  NexemaValueTypeCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends NexemaValueType>(
          Then<NexemaValueType, $Out2> t, Then<$Out2, $R2> t2);
  $R call({bool? nullable});
}

class NexemaPrimitiveValueTypeMapper
    extends MapperBase<NexemaPrimitiveValueType> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {NexemaPrimitiveValueTypeMapper()},
      ))
        ..linkAll({NexemaValueTypeMapper.container}));

  @override
  NexemaPrimitiveValueTypeMapperElement createElement(
      MapperContainer container) {
    return NexemaPrimitiveValueTypeMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaPrimitiveValueType';

  static final fromMap = container.fromMap<NexemaPrimitiveValueType>;
  static final fromJson = container.fromJson<NexemaPrimitiveValueType>;
}

class NexemaPrimitiveValueTypeMapperElement
    extends MapperElementBase<NexemaPrimitiveValueType> {
  NexemaPrimitiveValueTypeMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaPrimitiveValueType decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NexemaPrimitiveValueType fromMap(Map<String, dynamic> map) =>
      NexemaPrimitiveValueType(
          nullable: container.$get(map, 'nullable'),
          primitive: container.$get(map, 'primitive'),
          arguments: container.$get(map, 'arguments'));

  @override
  Function get encoder => encode;
  dynamic encode(NexemaPrimitiveValueType v) => toMap(v);
  Map<String, dynamic> toMap(NexemaPrimitiveValueType n) => {
        'nullable': container.$enc(n.nullable, 'nullable'),
        'primitive': container.$enc(n.primitive, 'primitive'),
        'arguments': container.$enc(n.arguments, 'arguments'),
        'kind': 'primitiveValueType'
      };

  @override
  String stringify(NexemaPrimitiveValueType self) =>
      'NexemaPrimitiveValueType(nullable: ${container.asString(self.nullable)}, primitive: ${container.asString(self.primitive)}, arguments: ${container.asString(self.arguments)})';
  @override
  int hash(NexemaPrimitiveValueType self) =>
      container.hash(self.nullable) ^
      container.hash(self.primitive) ^
      container.hash(self.arguments);
  @override
  bool equals(NexemaPrimitiveValueType self, NexemaPrimitiveValueType other) =>
      container.isEqual(self.nullable, other.nullable) &&
      container.isEqual(self.primitive, other.primitive) &&
      container.isEqual(self.arguments, other.arguments);
}

mixin NexemaPrimitiveValueTypeMappable {
  String toJson() => NexemaPrimitiveValueTypeMapper.container
      .toJson(this as NexemaPrimitiveValueType);
  Map<String, dynamic> toMap() => NexemaPrimitiveValueTypeMapper.container
      .toMap(this as NexemaPrimitiveValueType);
  NexemaPrimitiveValueTypeCopyWith<NexemaPrimitiveValueType,
          NexemaPrimitiveValueType, NexemaPrimitiveValueType>
      get copyWith => _NexemaPrimitiveValueTypeCopyWithImpl(
          this as NexemaPrimitiveValueType, $identity, $identity);
  @override
  String toString() => NexemaPrimitiveValueTypeMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NexemaPrimitiveValueTypeMapper.container.isEqual(this, other));
  @override
  int get hashCode => NexemaPrimitiveValueTypeMapper.container.hash(this);
}

extension NexemaPrimitiveValueTypeValueCopy<$R, $Out extends NexemaValueType>
    on ObjectCopyWith<$R, NexemaPrimitiveValueType, $Out> {
  NexemaPrimitiveValueTypeCopyWith<$R, NexemaPrimitiveValueType, $Out>
      get asNexemaPrimitiveValueType => base
          .as((v, t, t2) => _NexemaPrimitiveValueTypeCopyWithImpl(v, t, t2));
}

typedef NexemaPrimitiveValueTypeCopyWithBound = NexemaValueType;

abstract class NexemaPrimitiveValueTypeCopyWith<$R,
        $In extends NexemaPrimitiveValueType, $Out extends NexemaValueType>
    implements NexemaValueTypeCopyWith<$R, $In, $Out> {
  NexemaPrimitiveValueTypeCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends NexemaValueType>(
          Then<NexemaPrimitiveValueType, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, NexemaValueType,
          NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>>
      get arguments;
  @override
  $R call(
      {bool? nullable, String? primitive, List<NexemaValueType>? arguments});
}

class _NexemaPrimitiveValueTypeCopyWithImpl<$R, $Out extends NexemaValueType>
    extends CopyWithBase<$R, NexemaPrimitiveValueType, $Out>
    implements
        NexemaPrimitiveValueTypeCopyWith<$R, NexemaPrimitiveValueType, $Out> {
  _NexemaPrimitiveValueTypeCopyWithImpl(super.value, super.then, super.then2);
  @override
  NexemaPrimitiveValueTypeCopyWith<$R2, NexemaPrimitiveValueType, $Out2>
      chain<$R2, $Out2 extends NexemaValueType>(
              Then<NexemaPrimitiveValueType, $Out2> t, Then<$Out2, $R2> t2) =>
          _NexemaPrimitiveValueTypeCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, NexemaValueType,
          NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>>
      get arguments => ListCopyWith(
          $value.arguments,
          (v, t) => v.copyWith.chain<$R, NexemaValueType>($identity, t),
          (v) => call(arguments: v));
  @override
  $R call(
          {bool? nullable,
          String? primitive,
          List<NexemaValueType>? arguments}) =>
      $then(NexemaPrimitiveValueType(
          nullable: nullable ?? $value.nullable,
          primitive: primitive ?? $value.primitive,
          arguments: arguments ?? $value.arguments));
}

class NexemaTypeValueTypeMapper extends MapperBase<NexemaTypeValueType> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {NexemaTypeValueTypeMapper()},
      ))
        ..linkAll({NexemaValueTypeMapper.container}));

  @override
  NexemaTypeValueTypeMapperElement createElement(MapperContainer container) {
    return NexemaTypeValueTypeMapperElement._(this, container);
  }

  @override
  String get id => 'NexemaTypeValueType';

  static final fromMap = container.fromMap<NexemaTypeValueType>;
  static final fromJson = container.fromJson<NexemaTypeValueType>;
}

class NexemaTypeValueTypeMapperElement
    extends MapperElementBase<NexemaTypeValueType> {
  NexemaTypeValueTypeMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NexemaTypeValueType decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NexemaTypeValueType fromMap(Map<String, dynamic> map) => NexemaTypeValueType(
      nullable: container.$get(map, 'nullable'),
      objectId: container.$get(map, 'objectId'));

  @override
  Function get encoder => encode;
  dynamic encode(NexemaTypeValueType v) => toMap(v);
  Map<String, dynamic> toMap(NexemaTypeValueType n) => {
        'nullable': container.$enc(n.nullable, 'nullable'),
        'objectId': container.$enc(n.objectId, 'objectId'),
        'kind': 'customType'
      };

  @override
  String stringify(NexemaTypeValueType self) =>
      'NexemaTypeValueType(nullable: ${container.asString(self.nullable)}, objectId: ${container.asString(self.objectId)})';
  @override
  int hash(NexemaTypeValueType self) =>
      container.hash(self.nullable) ^ container.hash(self.objectId);
  @override
  bool equals(NexemaTypeValueType self, NexemaTypeValueType other) =>
      container.isEqual(self.nullable, other.nullable) &&
      container.isEqual(self.objectId, other.objectId);
}

mixin NexemaTypeValueTypeMappable {
  String toJson() =>
      NexemaTypeValueTypeMapper.container.toJson(this as NexemaTypeValueType);
  Map<String, dynamic> toMap() =>
      NexemaTypeValueTypeMapper.container.toMap(this as NexemaTypeValueType);
  NexemaTypeValueTypeCopyWith<NexemaTypeValueType, NexemaTypeValueType,
          NexemaTypeValueType>
      get copyWith => _NexemaTypeValueTypeCopyWithImpl(
          this as NexemaTypeValueType, $identity, $identity);
  @override
  String toString() => NexemaTypeValueTypeMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NexemaTypeValueTypeMapper.container.isEqual(this, other));
  @override
  int get hashCode => NexemaTypeValueTypeMapper.container.hash(this);
}

extension NexemaTypeValueTypeValueCopy<$R, $Out extends NexemaValueType>
    on ObjectCopyWith<$R, NexemaTypeValueType, $Out> {
  NexemaTypeValueTypeCopyWith<$R, NexemaTypeValueType, $Out>
      get asNexemaTypeValueType =>
          base.as((v, t, t2) => _NexemaTypeValueTypeCopyWithImpl(v, t, t2));
}

typedef NexemaTypeValueTypeCopyWithBound = NexemaValueType;

abstract class NexemaTypeValueTypeCopyWith<$R, $In extends NexemaTypeValueType,
        $Out extends NexemaValueType>
    implements NexemaValueTypeCopyWith<$R, $In, $Out> {
  NexemaTypeValueTypeCopyWith<$R2, $In, $Out2>
      chain<$R2, $Out2 extends NexemaValueType>(
          Then<NexemaTypeValueType, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({bool? nullable, int? objectId});
}

class _NexemaTypeValueTypeCopyWithImpl<$R, $Out extends NexemaValueType>
    extends CopyWithBase<$R, NexemaTypeValueType, $Out>
    implements NexemaTypeValueTypeCopyWith<$R, NexemaTypeValueType, $Out> {
  _NexemaTypeValueTypeCopyWithImpl(super.value, super.then, super.then2);
  @override
  NexemaTypeValueTypeCopyWith<$R2, NexemaTypeValueType, $Out2>
      chain<$R2, $Out2 extends NexemaValueType>(
              Then<NexemaTypeValueType, $Out2> t, Then<$Out2, $R2> t2) =>
          _NexemaTypeValueTypeCopyWithImpl($value, t, t2);

  @override
  $R call({bool? nullable, int? objectId}) => $then(NexemaTypeValueType(
      nullable: nullable ?? $value.nullable,
      objectId: objectId ?? $value.objectId));
}
