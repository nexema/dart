// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'models.dart';

class NexemaTypeModifierMapper extends EnumMapper<NexemaTypeModifier> {
  NexemaTypeModifierMapper._();

  static NexemaTypeModifierMapper? _instance;
  static NexemaTypeModifierMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaTypeModifierMapper._());
    }
    return _instance!;
  }

  static NexemaTypeModifier fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  NexemaTypeModifier decode(dynamic value) {
    switch (value) {
      case "enum":
        return NexemaTypeModifier.enumerator;
      case 'base':
        return NexemaTypeModifier.base;
      case 'struct':
        return NexemaTypeModifier.struct;
      case 'union':
        return NexemaTypeModifier.union;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(NexemaTypeModifier self) {
    switch (self) {
      case NexemaTypeModifier.enumerator:
        return "enum";
      case NexemaTypeModifier.base:
        return 'base';
      case NexemaTypeModifier.struct:
        return 'struct';
      case NexemaTypeModifier.union:
        return 'union';
    }
  }
}

extension NexemaTypeModifierMapperExtension on NexemaTypeModifier {
  dynamic toValue() {
    NexemaTypeModifierMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this);
  }
}

class NexemaPrimitiveMapper extends EnumMapper<NexemaPrimitive> {
  NexemaPrimitiveMapper._();

  static NexemaPrimitiveMapper? _instance;
  static NexemaPrimitiveMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaPrimitiveMapper._());
    }
    return _instance!;
  }

  static NexemaPrimitive fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  NexemaPrimitive decode(dynamic value) {
    switch (value) {
      case 'string':
        return NexemaPrimitive.string;
      case 'bool':
        return NexemaPrimitive.bool;
      case 'uint':
        return NexemaPrimitive.uint;
      case 'int':
        return NexemaPrimitive.int;
      case 'int8':
        return NexemaPrimitive.int8;
      case 'int16':
        return NexemaPrimitive.int16;
      case 'int32':
        return NexemaPrimitive.int32;
      case 'int64':
        return NexemaPrimitive.int64;
      case 'uint8':
        return NexemaPrimitive.uint8;
      case 'uint16':
        return NexemaPrimitive.uint16;
      case 'uint32':
        return NexemaPrimitive.uint32;
      case 'uint64':
        return NexemaPrimitive.uint64;
      case 'float32':
        return NexemaPrimitive.float32;
      case 'float64':
        return NexemaPrimitive.float64;
      case 'binary':
        return NexemaPrimitive.binary;
      case 'list':
        return NexemaPrimitive.list;
      case 'map':
        return NexemaPrimitive.map;
      case 'type':
        return NexemaPrimitive.type;
      case 'timestamp':
        return NexemaPrimitive.timestamp;
      case 'duration':
        return NexemaPrimitive.duration;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(NexemaPrimitive self) {
    switch (self) {
      case NexemaPrimitive.string:
        return 'string';
      case NexemaPrimitive.bool:
        return 'bool';
      case NexemaPrimitive.uint:
        return 'uint';
      case NexemaPrimitive.int:
        return 'int';
      case NexemaPrimitive.int8:
        return 'int8';
      case NexemaPrimitive.int16:
        return 'int16';
      case NexemaPrimitive.int32:
        return 'int32';
      case NexemaPrimitive.int64:
        return 'int64';
      case NexemaPrimitive.uint8:
        return 'uint8';
      case NexemaPrimitive.uint16:
        return 'uint16';
      case NexemaPrimitive.uint32:
        return 'uint32';
      case NexemaPrimitive.uint64:
        return 'uint64';
      case NexemaPrimitive.float32:
        return 'float32';
      case NexemaPrimitive.float64:
        return 'float64';
      case NexemaPrimitive.binary:
        return 'binary';
      case NexemaPrimitive.list:
        return 'list';
      case NexemaPrimitive.map:
        return 'map';
      case NexemaPrimitive.type:
        return 'type';
      case NexemaPrimitive.timestamp:
        return 'timestamp';
      case NexemaPrimitive.duration:
        return 'duration';
    }
  }
}

extension NexemaPrimitiveMapperExtension on NexemaPrimitive {
  String toValue() {
    NexemaPrimitiveMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class PluginResultMapper extends ClassMapperBase<PluginResult> {
  PluginResultMapper._();

  static PluginResultMapper? _instance;
  static PluginResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PluginResultMapper._());
      GeneratedFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PluginResult';

  static int _$exitCode(PluginResult v) => v.exitCode;
  static const Field<PluginResult, int> _f$exitCode =
      Field('exitCode', _$exitCode);
  static List<GeneratedFile> _$files(PluginResult v) => v.files;
  static const Field<PluginResult, List<GeneratedFile>> _f$files =
      Field('files', _$files);
  static String? _$error(PluginResult v) => v.error;
  static const Field<PluginResult, String> _f$error =
      Field('error', _$error, opt: true);

  @override
  final Map<Symbol, Field<PluginResult, dynamic>> fields = const {
    #exitCode: _f$exitCode,
    #files: _f$files,
    #error: _f$error,
  };

  static PluginResult _instantiate(DecodingData data) {
    return PluginResult(
        exitCode: data.dec(_f$exitCode),
        files: data.dec(_f$files),
        error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static PluginResult fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PluginResult>(map));
  }

  static PluginResult fromJson(String json) {
    return _guard((c) => c.fromJson<PluginResult>(json));
  }
}

mixin PluginResultMappable {
  String toJson() {
    return PluginResultMapper._guard((c) => c.toJson(this as PluginResult));
  }

  Map<String, dynamic> toMap() {
    return PluginResultMapper._guard((c) => c.toMap(this as PluginResult));
  }

  PluginResultCopyWith<PluginResult, PluginResult, PluginResult> get copyWith =>
      _PluginResultCopyWithImpl(this as PluginResult, $identity, $identity);
  @override
  String toString() {
    return PluginResultMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PluginResultMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PluginResultMapper._guard((c) => c.hash(this));
  }
}

extension PluginResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PluginResult, $Out> {
  PluginResultCopyWith<$R, PluginResult, $Out> get $asPluginResult =>
      $base.as((v, t, t2) => _PluginResultCopyWithImpl(v, t, t2));
}

abstract class PluginResultCopyWith<$R, $In extends PluginResult, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, GeneratedFile,
      GeneratedFileCopyWith<$R, GeneratedFile, GeneratedFile>> get files;
  $R call({int? exitCode, List<GeneratedFile>? files, String? error});
  PluginResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PluginResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PluginResult, $Out>
    implements PluginResultCopyWith<$R, PluginResult, $Out> {
  _PluginResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PluginResult> $mapper =
      PluginResultMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GeneratedFile,
          GeneratedFileCopyWith<$R, GeneratedFile, GeneratedFile>>
      get files => ListCopyWith(
          $value.files, (v, t) => v.copyWith.$chain(t), (v) => call(files: v));
  @override
  $R call({int? exitCode, List<GeneratedFile>? files, Object? error = $none}) =>
      $apply(FieldCopyWithData({
        if (exitCode != null) #exitCode: exitCode,
        if (files != null) #files: files,
        if (error != $none) #error: error
      }));
  @override
  PluginResult $make(CopyWithData data) => PluginResult(
      exitCode: data.get(#exitCode, or: $value.exitCode),
      files: data.get(#files, or: $value.files),
      error: data.get(#error, or: $value.error));

  @override
  PluginResultCopyWith<$R2, PluginResult, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PluginResultCopyWithImpl($value, $cast, t);
}

class GeneratedFileMapper extends ClassMapperBase<GeneratedFile> {
  GeneratedFileMapper._();

  static GeneratedFileMapper? _instance;
  static GeneratedFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GeneratedFileMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'GeneratedFile';

  static String _$id(GeneratedFile v) => v.id;
  static const Field<GeneratedFile, String> _f$id = Field('id', _$id);
  static String _$name(GeneratedFile v) => v.name;
  static const Field<GeneratedFile, String> _f$name = Field('name', _$name);
  static String _$contents(GeneratedFile v) => v.contents;
  static const Field<GeneratedFile, String> _f$contents =
      Field('contents', _$contents);
  static String _$filePath(GeneratedFile v) => v.filePath;
  static const Field<GeneratedFile, String> _f$filePath =
      Field('filePath', _$filePath);

  @override
  final Map<Symbol, Field<GeneratedFile, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #contents: _f$contents,
    #filePath: _f$filePath,
  };

  static GeneratedFile _instantiate(DecodingData data) {
    return GeneratedFile(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        contents: data.dec(_f$contents),
        filePath: data.dec(_f$filePath));
  }

  @override
  final Function instantiate = _instantiate;

  static GeneratedFile fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<GeneratedFile>(map));
  }

  static GeneratedFile fromJson(String json) {
    return _guard((c) => c.fromJson<GeneratedFile>(json));
  }
}

mixin GeneratedFileMappable {
  String toJson() {
    return GeneratedFileMapper._guard((c) => c.toJson(this as GeneratedFile));
  }

  Map<String, dynamic> toMap() {
    return GeneratedFileMapper._guard((c) => c.toMap(this as GeneratedFile));
  }

  GeneratedFileCopyWith<GeneratedFile, GeneratedFile, GeneratedFile>
      get copyWith => _GeneratedFileCopyWithImpl(
          this as GeneratedFile, $identity, $identity);
  @override
  String toString() {
    return GeneratedFileMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GeneratedFileMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return GeneratedFileMapper._guard((c) => c.hash(this));
  }
}

extension GeneratedFileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GeneratedFile, $Out> {
  GeneratedFileCopyWith<$R, GeneratedFile, $Out> get $asGeneratedFile =>
      $base.as((v, t, t2) => _GeneratedFileCopyWithImpl(v, t, t2));
}

abstract class GeneratedFileCopyWith<$R, $In extends GeneratedFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? contents, String? filePath});
  GeneratedFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GeneratedFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GeneratedFile, $Out>
    implements GeneratedFileCopyWith<$R, GeneratedFile, $Out> {
  _GeneratedFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GeneratedFile> $mapper =
      GeneratedFileMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? contents, String? filePath}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (contents != null) #contents: contents,
        if (filePath != null) #filePath: filePath
      }));
  @override
  GeneratedFile $make(CopyWithData data) => GeneratedFile(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      contents: data.get(#contents, or: $value.contents),
      filePath: data.get(#filePath, or: $value.filePath));

  @override
  GeneratedFileCopyWith<$R2, GeneratedFile, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GeneratedFileCopyWithImpl($value, $cast, t);
}

class NexemaSnapshotMapper extends ClassMapperBase<NexemaSnapshot> {
  NexemaSnapshotMapper._();

  static NexemaSnapshotMapper? _instance;
  static NexemaSnapshotMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaSnapshotMapper._());
      NexemaFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaSnapshot';

  static int _$version(NexemaSnapshot v) => v.version;
  static const Field<NexemaSnapshot, int> _f$version =
      Field('version', _$version);
  static String _$hashcode(NexemaSnapshot v) => v.hashcode;
  static const Field<NexemaSnapshot, String> _f$hashcode =
      Field('hashcode', _$hashcode);
  static List<NexemaFile> _$files(NexemaSnapshot v) => v.files;
  static const Field<NexemaSnapshot, List<NexemaFile>> _f$files =
      Field('files', _$files);

  @override
  final Map<Symbol, Field<NexemaSnapshot, dynamic>> fields = const {
    #version: _f$version,
    #hashcode: _f$hashcode,
    #files: _f$files,
  };

  static NexemaSnapshot _instantiate(DecodingData data) {
    return NexemaSnapshot(
        version: data.dec(_f$version),
        hashcode: data.dec(_f$hashcode),
        files: data.dec(_f$files));
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaSnapshot fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaSnapshot>(map));
  }

  static NexemaSnapshot fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaSnapshot>(json));
  }
}

mixin NexemaSnapshotMappable {
  String toJson() {
    return NexemaSnapshotMapper._guard((c) => c.toJson(this as NexemaSnapshot));
  }

  Map<String, dynamic> toMap() {
    return NexemaSnapshotMapper._guard((c) => c.toMap(this as NexemaSnapshot));
  }

  NexemaSnapshotCopyWith<NexemaSnapshot, NexemaSnapshot, NexemaSnapshot>
      get copyWith => _NexemaSnapshotCopyWithImpl(
          this as NexemaSnapshot, $identity, $identity);
  @override
  String toString() {
    return NexemaSnapshotMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NexemaSnapshotMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NexemaSnapshotMapper._guard((c) => c.hash(this));
  }
}

extension NexemaSnapshotValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NexemaSnapshot, $Out> {
  NexemaSnapshotCopyWith<$R, NexemaSnapshot, $Out> get $asNexemaSnapshot =>
      $base.as((v, t, t2) => _NexemaSnapshotCopyWithImpl(v, t, t2));
}

abstract class NexemaSnapshotCopyWith<$R, $In extends NexemaSnapshot, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NexemaFile, NexemaFileCopyWith<$R, NexemaFile, NexemaFile>>
      get files;
  $R call({int? version, String? hashcode, List<NexemaFile>? files});
  NexemaSnapshotCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NexemaSnapshotCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NexemaSnapshot, $Out>
    implements NexemaSnapshotCopyWith<$R, NexemaSnapshot, $Out> {
  _NexemaSnapshotCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NexemaSnapshot> $mapper =
      NexemaSnapshotMapper.ensureInitialized();
  @override
  ListCopyWith<$R, NexemaFile, NexemaFileCopyWith<$R, NexemaFile, NexemaFile>>
      get files => ListCopyWith(
          $value.files, (v, t) => v.copyWith.$chain(t), (v) => call(files: v));
  @override
  $R call({int? version, String? hashcode, List<NexemaFile>? files}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (hashcode != null) #hashcode: hashcode,
        if (files != null) #files: files
      }));
  @override
  NexemaSnapshot $make(CopyWithData data) => NexemaSnapshot(
      version: data.get(#version, or: $value.version),
      hashcode: data.get(#hashcode, or: $value.hashcode),
      files: data.get(#files, or: $value.files));

  @override
  NexemaSnapshotCopyWith<$R2, NexemaSnapshot, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NexemaSnapshotCopyWithImpl($value, $cast, t);
}

class NexemaFileMapper extends ClassMapperBase<NexemaFile> {
  NexemaFileMapper._();

  static NexemaFileMapper? _instance;
  static NexemaFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaFileMapper._());
      NexemaTypeDefinitionMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaFile';

  static String _$id(NexemaFile v) => v.id;
  static const Field<NexemaFile, String> _f$id = Field('id', _$id);
  static String _$path(NexemaFile v) => v.path;
  static const Field<NexemaFile, String> _f$path = Field('path', _$path);
  static String _$packageName(NexemaFile v) => v.packageName;
  static const Field<NexemaFile, String> _f$packageName =
      Field('packageName', _$packageName);
  static List<NexemaTypeDefinition> _$types(NexemaFile v) => v.types;
  static const Field<NexemaFile, List<NexemaTypeDefinition>> _f$types =
      Field('types', _$types);

  @override
  final Map<Symbol, Field<NexemaFile, dynamic>> fields = const {
    #id: _f$id,
    #path: _f$path,
    #packageName: _f$packageName,
    #types: _f$types,
  };

  static NexemaFile _instantiate(DecodingData data) {
    return NexemaFile(
        id: data.dec(_f$id),
        path: data.dec(_f$path),
        packageName: data.dec(_f$packageName),
        types: data.dec(_f$types));
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaFile fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaFile>(map));
  }

  static NexemaFile fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaFile>(json));
  }
}

mixin NexemaFileMappable {
  String toJson() {
    return NexemaFileMapper._guard((c) => c.toJson(this as NexemaFile));
  }

  Map<String, dynamic> toMap() {
    return NexemaFileMapper._guard((c) => c.toMap(this as NexemaFile));
  }

  NexemaFileCopyWith<NexemaFile, NexemaFile, NexemaFile> get copyWith =>
      _NexemaFileCopyWithImpl(this as NexemaFile, $identity, $identity);
  @override
  String toString() {
    return NexemaFileMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NexemaFileMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NexemaFileMapper._guard((c) => c.hash(this));
  }
}

extension NexemaFileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NexemaFile, $Out> {
  NexemaFileCopyWith<$R, NexemaFile, $Out> get $asNexemaFile =>
      $base.as((v, t, t2) => _NexemaFileCopyWithImpl(v, t, t2));
}

abstract class NexemaFileCopyWith<$R, $In extends NexemaFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      NexemaTypeDefinition,
      NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition,
          NexemaTypeDefinition>> get types;
  $R call(
      {String? id,
      String? path,
      String? packageName,
      List<NexemaTypeDefinition>? types});
  NexemaFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NexemaFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NexemaFile, $Out>
    implements NexemaFileCopyWith<$R, NexemaFile, $Out> {
  _NexemaFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NexemaFile> $mapper =
      NexemaFileMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      NexemaTypeDefinition,
      NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition,
          NexemaTypeDefinition>> get types => ListCopyWith(
      $value.types, (v, t) => v.copyWith.$chain(t), (v) => call(types: v));
  @override
  $R call(
          {String? id,
          String? path,
          String? packageName,
          List<NexemaTypeDefinition>? types}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (path != null) #path: path,
        if (packageName != null) #packageName: packageName,
        if (types != null) #types: types
      }));
  @override
  NexemaFile $make(CopyWithData data) => NexemaFile(
      id: data.get(#id, or: $value.id),
      path: data.get(#path, or: $value.path),
      packageName: data.get(#packageName, or: $value.packageName),
      types: data.get(#types, or: $value.types));

  @override
  NexemaFileCopyWith<$R2, NexemaFile, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NexemaFileCopyWithImpl($value, $cast, t);
}

class NexemaTypeDefinitionMapper extends ClassMapperBase<NexemaTypeDefinition> {
  NexemaTypeDefinitionMapper._();

  static NexemaTypeDefinitionMapper? _instance;
  static NexemaTypeDefinitionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaTypeDefinitionMapper._());
      NexemaTypeModifierMapper.ensureInitialized();
      NexemaTypeFieldDefinitionMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaTypeDefinition';

  static String _$id(NexemaTypeDefinition v) => v.id;
  static const Field<NexemaTypeDefinition, String> _f$id = Field('id', _$id);
  static String _$name(NexemaTypeDefinition v) => v.name;
  static const Field<NexemaTypeDefinition, String> _f$name =
      Field('name', _$name);
  static NexemaTypeModifier _$modifier(NexemaTypeDefinition v) => v.modifier;
  static const Field<NexemaTypeDefinition, NexemaTypeModifier> _f$modifier =
      Field('modifier', _$modifier);
  static List<String>? _$documentation(NexemaTypeDefinition v) =>
      v.documentation;
  static const Field<NexemaTypeDefinition, List<String>> _f$documentation =
      Field('documentation', _$documentation, opt: true);
  static String? _$baseType(NexemaTypeDefinition v) => v.baseType;
  static const Field<NexemaTypeDefinition, String> _f$baseType =
      Field('baseType', _$baseType, opt: true);
  static List<NexemaTypeFieldDefinition> _$fields(NexemaTypeDefinition v) =>
      v.fields;
  static const Field<NexemaTypeDefinition, List<NexemaTypeFieldDefinition>>
      _f$fields = Field('fields', _$fields);
  static Map<String, dynamic>? _$annotations(NexemaTypeDefinition v) =>
      v.annotations;
  static const Field<NexemaTypeDefinition, Map<String, dynamic>>
      _f$annotations = Field('annotations', _$annotations, opt: true);
  static Map<String, dynamic>? _$defaults(NexemaTypeDefinition v) => v.defaults;
  static const Field<NexemaTypeDefinition, Map<String, dynamic>> _f$defaults =
      Field('defaults', _$defaults, opt: true);

  @override
  final Map<Symbol, Field<NexemaTypeDefinition, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #modifier: _f$modifier,
    #documentation: _f$documentation,
    #baseType: _f$baseType,
    #fields: _f$fields,
    #annotations: _f$annotations,
    #defaults: _f$defaults,
  };

  static NexemaTypeDefinition _instantiate(DecodingData data) {
    return NexemaTypeDefinition(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        modifier: data.dec(_f$modifier),
        documentation: data.dec(_f$documentation),
        baseType: data.dec(_f$baseType),
        fields: data.dec(_f$fields),
        annotations: data.dec(_f$annotations),
        defaults: data.dec(_f$defaults));
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaTypeDefinition fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaTypeDefinition>(map));
  }

  static NexemaTypeDefinition fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaTypeDefinition>(json));
  }
}

mixin NexemaTypeDefinitionMappable {
  String toJson() {
    return NexemaTypeDefinitionMapper._guard(
        (c) => c.toJson(this as NexemaTypeDefinition));
  }

  Map<String, dynamic> toMap() {
    return NexemaTypeDefinitionMapper._guard(
        (c) => c.toMap(this as NexemaTypeDefinition));
  }

  NexemaTypeDefinitionCopyWith<NexemaTypeDefinition, NexemaTypeDefinition,
          NexemaTypeDefinition>
      get copyWith => _NexemaTypeDefinitionCopyWithImpl(
          this as NexemaTypeDefinition, $identity, $identity);
  @override
  String toString() {
    return NexemaTypeDefinitionMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NexemaTypeDefinitionMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NexemaTypeDefinitionMapper._guard((c) => c.hash(this));
  }
}

extension NexemaTypeDefinitionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NexemaTypeDefinition, $Out> {
  NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition, $Out>
      get $asNexemaTypeDefinition =>
          $base.as((v, t, t2) => _NexemaTypeDefinitionCopyWithImpl(v, t, t2));
}

abstract class NexemaTypeDefinitionCopyWith<
    $R,
    $In extends NexemaTypeDefinition,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get documentation;
  ListCopyWith<
      $R,
      NexemaTypeFieldDefinition,
      NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition,
          NexemaTypeFieldDefinition>> get fields;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get annotations;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get defaults;
  $R call(
      {String? id,
      String? name,
      NexemaTypeModifier? modifier,
      List<String>? documentation,
      String? baseType,
      List<NexemaTypeFieldDefinition>? fields,
      Map<String, dynamic>? annotations,
      Map<String, dynamic>? defaults});
  NexemaTypeDefinitionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NexemaTypeDefinitionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NexemaTypeDefinition, $Out>
    implements NexemaTypeDefinitionCopyWith<$R, NexemaTypeDefinition, $Out> {
  _NexemaTypeDefinitionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NexemaTypeDefinition> $mapper =
      NexemaTypeDefinitionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get documentation => $value.documentation != null
          ? ListCopyWith(
              $value.documentation!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(documentation: v))
          : null;
  @override
  ListCopyWith<
      $R,
      NexemaTypeFieldDefinition,
      NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition,
          NexemaTypeFieldDefinition>> get fields => ListCopyWith(
      $value.fields, (v, t) => v.copyWith.$chain(t), (v) => call(fields: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get annotations => $value.annotations != null
          ? MapCopyWith(
              $value.annotations!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(annotations: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get defaults => $value.defaults != null
          ? MapCopyWith(
              $value.defaults!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(defaults: v))
          : null;
  @override
  $R call(
          {String? id,
          String? name,
          NexemaTypeModifier? modifier,
          Object? documentation = $none,
          Object? baseType = $none,
          List<NexemaTypeFieldDefinition>? fields,
          Object? annotations = $none,
          Object? defaults = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (modifier != null) #modifier: modifier,
        if (documentation != $none) #documentation: documentation,
        if (baseType != $none) #baseType: baseType,
        if (fields != null) #fields: fields,
        if (annotations != $none) #annotations: annotations,
        if (defaults != $none) #defaults: defaults
      }));
  @override
  NexemaTypeDefinition $make(CopyWithData data) => NexemaTypeDefinition(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      modifier: data.get(#modifier, or: $value.modifier),
      documentation: data.get(#documentation, or: $value.documentation),
      baseType: data.get(#baseType, or: $value.baseType),
      fields: data.get(#fields, or: $value.fields),
      annotations: data.get(#annotations, or: $value.annotations),
      defaults: data.get(#defaults, or: $value.defaults));

  @override
  NexemaTypeDefinitionCopyWith<$R2, NexemaTypeDefinition, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NexemaTypeDefinitionCopyWithImpl($value, $cast, t);
}

class NexemaTypeFieldDefinitionMapper
    extends ClassMapperBase<NexemaTypeFieldDefinition> {
  NexemaTypeFieldDefinitionMapper._();

  static NexemaTypeFieldDefinitionMapper? _instance;
  static NexemaTypeFieldDefinitionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = NexemaTypeFieldDefinitionMapper._());
      NexemaValueTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaTypeFieldDefinition';

  static int _$index(NexemaTypeFieldDefinition v) => v.index;
  static const Field<NexemaTypeFieldDefinition, int> _f$index =
      Field('index', _$index);
  static String _$name(NexemaTypeFieldDefinition v) => v.name;
  static const Field<NexemaTypeFieldDefinition, String> _f$name =
      Field('name', _$name);
  static List<String>? _$documentation(NexemaTypeFieldDefinition v) =>
      v.documentation;
  static const Field<NexemaTypeFieldDefinition, List<String>> _f$documentation =
      Field('documentation', _$documentation, opt: true);
  static Map<String, dynamic>? _$annotations(NexemaTypeFieldDefinition v) =>
      v.annotations;
  static const Field<NexemaTypeFieldDefinition, Map<String, dynamic>>
      _f$annotations = Field('annotations', _$annotations, opt: true);
  static NexemaValueType? _$type(NexemaTypeFieldDefinition v) => v.type;
  static const Field<NexemaTypeFieldDefinition, NexemaValueType> _f$type =
      Field('type', _$type, opt: true);

  @override
  final Map<Symbol, Field<NexemaTypeFieldDefinition, dynamic>> fields = const {
    #index: _f$index,
    #name: _f$name,
    #documentation: _f$documentation,
    #annotations: _f$annotations,
    #type: _f$type,
  };

  static NexemaTypeFieldDefinition _instantiate(DecodingData data) {
    return NexemaTypeFieldDefinition(
        index: data.dec(_f$index),
        name: data.dec(_f$name),
        documentation: data.dec(_f$documentation),
        annotations: data.dec(_f$annotations),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaTypeFieldDefinition fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaTypeFieldDefinition>(map));
  }

  static NexemaTypeFieldDefinition fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaTypeFieldDefinition>(json));
  }
}

mixin NexemaTypeFieldDefinitionMappable {
  String toJson() {
    return NexemaTypeFieldDefinitionMapper._guard(
        (c) => c.toJson(this as NexemaTypeFieldDefinition));
  }

  Map<String, dynamic> toMap() {
    return NexemaTypeFieldDefinitionMapper._guard(
        (c) => c.toMap(this as NexemaTypeFieldDefinition));
  }

  NexemaTypeFieldDefinitionCopyWith<NexemaTypeFieldDefinition,
          NexemaTypeFieldDefinition, NexemaTypeFieldDefinition>
      get copyWith => _NexemaTypeFieldDefinitionCopyWithImpl(
          this as NexemaTypeFieldDefinition, $identity, $identity);
  @override
  String toString() {
    return NexemaTypeFieldDefinitionMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NexemaTypeFieldDefinitionMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NexemaTypeFieldDefinitionMapper._guard((c) => c.hash(this));
  }
}

extension NexemaTypeFieldDefinitionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NexemaTypeFieldDefinition, $Out> {
  NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition, $Out>
      get $asNexemaTypeFieldDefinition => $base
          .as((v, t, t2) => _NexemaTypeFieldDefinitionCopyWithImpl(v, t, t2));
}

abstract class NexemaTypeFieldDefinitionCopyWith<
    $R,
    $In extends NexemaTypeFieldDefinition,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get documentation;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get annotations;
  NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>? get type;
  $R call(
      {int? index,
      String? name,
      List<String>? documentation,
      Map<String, dynamic>? annotations,
      NexemaValueType? type});
  NexemaTypeFieldDefinitionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NexemaTypeFieldDefinitionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NexemaTypeFieldDefinition, $Out>
    implements
        NexemaTypeFieldDefinitionCopyWith<$R, NexemaTypeFieldDefinition, $Out> {
  _NexemaTypeFieldDefinitionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NexemaTypeFieldDefinition> $mapper =
      NexemaTypeFieldDefinitionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get documentation => $value.documentation != null
          ? ListCopyWith(
              $value.documentation!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(documentation: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get annotations => $value.annotations != null
          ? MapCopyWith(
              $value.annotations!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(annotations: v))
          : null;
  @override
  NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>? get type =>
      $value.type?.copyWith.$chain((v) => call(type: v));
  @override
  $R call(
          {int? index,
          String? name,
          Object? documentation = $none,
          Object? annotations = $none,
          Object? type = $none}) =>
      $apply(FieldCopyWithData({
        if (index != null) #index: index,
        if (name != null) #name: name,
        if (documentation != $none) #documentation: documentation,
        if (annotations != $none) #annotations: annotations,
        if (type != $none) #type: type
      }));
  @override
  NexemaTypeFieldDefinition $make(CopyWithData data) =>
      NexemaTypeFieldDefinition(
          index: data.get(#index, or: $value.index),
          name: data.get(#name, or: $value.name),
          documentation: data.get(#documentation, or: $value.documentation),
          annotations: data.get(#annotations, or: $value.annotations),
          type: data.get(#type, or: $value.type));

  @override
  NexemaTypeFieldDefinitionCopyWith<$R2, NexemaTypeFieldDefinition, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NexemaTypeFieldDefinitionCopyWithImpl($value, $cast, t);
}

class NexemaValueTypeMapper extends ClassMapperBase<NexemaValueType> {
  NexemaValueTypeMapper._();

  static NexemaValueTypeMapper? _instance;
  static NexemaValueTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaValueTypeMapper._());
      NexemaPrimitiveValueTypeMapper.ensureInitialized();
      NexemaTypeValueTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaValueType';

  static bool _$nullable(NexemaValueType v) => v.nullable;
  static const Field<NexemaValueType, bool> _f$nullable =
      Field('nullable', _$nullable);

  @override
  final Map<Symbol, Field<NexemaValueType, dynamic>> fields = const {
    #nullable: _f$nullable,
  };

  static NexemaValueType _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'NexemaValueType', 'kind', '${data.value['kind']}');
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaValueType fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaValueType>(map));
  }

  static NexemaValueType fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaValueType>(json));
  }
}

mixin NexemaValueTypeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  NexemaValueTypeCopyWith<NexemaValueType, NexemaValueType, NexemaValueType>
      get copyWith;
}

abstract class NexemaValueTypeCopyWith<$R, $In extends NexemaValueType, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? nullable});
  NexemaValueTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class NexemaPrimitiveValueTypeMapper
    extends SubClassMapperBase<NexemaPrimitiveValueType> {
  NexemaPrimitiveValueTypeMapper._();

  static NexemaPrimitiveValueTypeMapper? _instance;
  static NexemaPrimitiveValueTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = NexemaPrimitiveValueTypeMapper._());
      NexemaValueTypeMapper.ensureInitialized().addSubMapper(_instance!);
      NexemaPrimitiveMapper.ensureInitialized();
      NexemaValueTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaPrimitiveValueType';

  static bool _$nullable(NexemaPrimitiveValueType v) => v.nullable;
  static const Field<NexemaPrimitiveValueType, bool> _f$nullable =
      Field('nullable', _$nullable);
  static NexemaPrimitive _$primitive(NexemaPrimitiveValueType v) => v.primitive;
  static const Field<NexemaPrimitiveValueType, NexemaPrimitive> _f$primitive =
      Field('primitive', _$primitive);
  static List<NexemaValueType>? _$arguments(NexemaPrimitiveValueType v) =>
      v.arguments;
  static const Field<NexemaPrimitiveValueType, List<NexemaValueType>>
      _f$arguments = Field('arguments', _$arguments, opt: true);

  @override
  final Map<Symbol, Field<NexemaPrimitiveValueType, dynamic>> fields = const {
    #nullable: _f$nullable,
    #primitive: _f$primitive,
    #arguments: _f$arguments,
  };

  @override
  final String discriminatorKey = 'kind';
  @override
  final dynamic discriminatorValue = 'primitiveValueType';
  @override
  late final ClassMapperBase superMapper =
      NexemaValueTypeMapper.ensureInitialized();

  static NexemaPrimitiveValueType _instantiate(DecodingData data) {
    return NexemaPrimitiveValueType(
        nullable: data.dec(_f$nullable),
        primitive: data.dec(_f$primitive),
        arguments: data.dec(_f$arguments));
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaPrimitiveValueType fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaPrimitiveValueType>(map));
  }

  static NexemaPrimitiveValueType fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaPrimitiveValueType>(json));
  }
}

mixin NexemaPrimitiveValueTypeMappable {
  String toJson() {
    return NexemaPrimitiveValueTypeMapper._guard(
        (c) => c.toJson(this as NexemaPrimitiveValueType));
  }

  Map<String, dynamic> toMap() {
    return NexemaPrimitiveValueTypeMapper._guard(
        (c) => c.toMap(this as NexemaPrimitiveValueType));
  }

  NexemaPrimitiveValueTypeCopyWith<NexemaPrimitiveValueType,
          NexemaPrimitiveValueType, NexemaPrimitiveValueType>
      get copyWith => _NexemaPrimitiveValueTypeCopyWithImpl(
          this as NexemaPrimitiveValueType, $identity, $identity);
  @override
  String toString() {
    return NexemaPrimitiveValueTypeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NexemaPrimitiveValueTypeMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NexemaPrimitiveValueTypeMapper._guard((c) => c.hash(this));
  }
}

extension NexemaPrimitiveValueTypeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NexemaPrimitiveValueType, $Out> {
  NexemaPrimitiveValueTypeCopyWith<$R, NexemaPrimitiveValueType, $Out>
      get $asNexemaPrimitiveValueType => $base
          .as((v, t, t2) => _NexemaPrimitiveValueTypeCopyWithImpl(v, t, t2));
}

abstract class NexemaPrimitiveValueTypeCopyWith<
    $R,
    $In extends NexemaPrimitiveValueType,
    $Out> implements NexemaValueTypeCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NexemaValueType,
          NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>>?
      get arguments;
  @override
  $R call(
      {bool? nullable,
      NexemaPrimitive? primitive,
      List<NexemaValueType>? arguments});
  NexemaPrimitiveValueTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NexemaPrimitiveValueTypeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NexemaPrimitiveValueType, $Out>
    implements
        NexemaPrimitiveValueTypeCopyWith<$R, NexemaPrimitiveValueType, $Out> {
  _NexemaPrimitiveValueTypeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NexemaPrimitiveValueType> $mapper =
      NexemaPrimitiveValueTypeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, NexemaValueType,
          NexemaValueTypeCopyWith<$R, NexemaValueType, NexemaValueType>>?
      get arguments => $value.arguments != null
          ? ListCopyWith($value.arguments!, (v, t) => v.copyWith.$chain(t),
              (v) => call(arguments: v))
          : null;
  @override
  $R call(
          {bool? nullable,
          NexemaPrimitive? primitive,
          Object? arguments = $none}) =>
      $apply(FieldCopyWithData({
        if (nullable != null) #nullable: nullable,
        if (primitive != null) #primitive: primitive,
        if (arguments != $none) #arguments: arguments
      }));
  @override
  NexemaPrimitiveValueType $make(CopyWithData data) => NexemaPrimitiveValueType(
      nullable: data.get(#nullable, or: $value.nullable),
      primitive: data.get(#primitive, or: $value.primitive),
      arguments: data.get(#arguments, or: $value.arguments));

  @override
  NexemaPrimitiveValueTypeCopyWith<$R2, NexemaPrimitiveValueType, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NexemaPrimitiveValueTypeCopyWithImpl($value, $cast, t);
}

class NexemaTypeValueTypeMapper
    extends SubClassMapperBase<NexemaTypeValueType> {
  NexemaTypeValueTypeMapper._();

  static NexemaTypeValueTypeMapper? _instance;
  static NexemaTypeValueTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NexemaTypeValueTypeMapper._());
      NexemaValueTypeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NexemaTypeValueType';

  static bool _$nullable(NexemaTypeValueType v) => v.nullable;
  static const Field<NexemaTypeValueType, bool> _f$nullable =
      Field('nullable', _$nullable);
  static String _$objectId(NexemaTypeValueType v) => v.objectId;
  static const Field<NexemaTypeValueType, String> _f$objectId =
      Field('objectId', _$objectId);

  @override
  final Map<Symbol, Field<NexemaTypeValueType, dynamic>> fields = const {
    #nullable: _f$nullable,
    #objectId: _f$objectId,
  };

  @override
  final String discriminatorKey = 'kind';
  @override
  final dynamic discriminatorValue = 'customType';
  @override
  late final ClassMapperBase superMapper =
      NexemaValueTypeMapper.ensureInitialized();

  static NexemaTypeValueType _instantiate(DecodingData data) {
    return NexemaTypeValueType(
        nullable: data.dec(_f$nullable), objectId: data.dec(_f$objectId));
  }

  @override
  final Function instantiate = _instantiate;

  static NexemaTypeValueType fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NexemaTypeValueType>(map));
  }

  static NexemaTypeValueType fromJson(String json) {
    return _guard((c) => c.fromJson<NexemaTypeValueType>(json));
  }
}

mixin NexemaTypeValueTypeMappable {
  String toJson() {
    return NexemaTypeValueTypeMapper._guard(
        (c) => c.toJson(this as NexemaTypeValueType));
  }

  Map<String, dynamic> toMap() {
    return NexemaTypeValueTypeMapper._guard(
        (c) => c.toMap(this as NexemaTypeValueType));
  }

  NexemaTypeValueTypeCopyWith<NexemaTypeValueType, NexemaTypeValueType,
          NexemaTypeValueType>
      get copyWith => _NexemaTypeValueTypeCopyWithImpl(
          this as NexemaTypeValueType, $identity, $identity);
  @override
  String toString() {
    return NexemaTypeValueTypeMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NexemaTypeValueTypeMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NexemaTypeValueTypeMapper._guard((c) => c.hash(this));
  }
}

extension NexemaTypeValueTypeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NexemaTypeValueType, $Out> {
  NexemaTypeValueTypeCopyWith<$R, NexemaTypeValueType, $Out>
      get $asNexemaTypeValueType =>
          $base.as((v, t, t2) => _NexemaTypeValueTypeCopyWithImpl(v, t, t2));
}

abstract class NexemaTypeValueTypeCopyWith<$R, $In extends NexemaTypeValueType,
    $Out> implements NexemaValueTypeCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? nullable, String? objectId});
  NexemaTypeValueTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NexemaTypeValueTypeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NexemaTypeValueType, $Out>
    implements NexemaTypeValueTypeCopyWith<$R, NexemaTypeValueType, $Out> {
  _NexemaTypeValueTypeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NexemaTypeValueType> $mapper =
      NexemaTypeValueTypeMapper.ensureInitialized();
  @override
  $R call({bool? nullable, String? objectId}) => $apply(FieldCopyWithData({
        if (nullable != null) #nullable: nullable,
        if (objectId != null) #objectId: objectId
      }));
  @override
  NexemaTypeValueType $make(CopyWithData data) => NexemaTypeValueType(
      nullable: data.get(#nullable, or: $value.nullable),
      objectId: data.get(#objectId, or: $value.objectId));

  @override
  NexemaTypeValueTypeCopyWith<$R2, NexemaTypeValueType, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _NexemaTypeValueTypeCopyWithImpl($value, $cast, t);
}
