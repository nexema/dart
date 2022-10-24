// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerateInput _$GenerateInputFromJson(Map<String, dynamic> json) {
  return _GenerateInput.fromJson(json);
}

/// @nodoc
mixin _$GenerateInput {
  @JsonKey(name: 'root')
  String get rootFolder => throw _privateConstructorUsedError;
  String get outputPath => throw _privateConstructorUsedError;
  Map<String, Object?> get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'packages')
  DeclarationNode get rootPackage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateInputCopyWith<GenerateInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateInputCopyWith<$Res> {
  factory $GenerateInputCopyWith(
          GenerateInput value, $Res Function(GenerateInput) then) =
      _$GenerateInputCopyWithImpl<$Res, GenerateInput>;
  @useResult
  $Res call(
      {@JsonKey(name: 'root') String rootFolder,
      String outputPath,
      Map<String, Object?> options,
      @JsonKey(name: 'packages') DeclarationNode rootPackage});

  $DeclarationNodeCopyWith<$Res> get rootPackage;
}

/// @nodoc
class _$GenerateInputCopyWithImpl<$Res, $Val extends GenerateInput>
    implements $GenerateInputCopyWith<$Res> {
  _$GenerateInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootFolder = null,
    Object? outputPath = null,
    Object? options = null,
    Object? rootPackage = null,
  }) {
    return _then(_value.copyWith(
      rootFolder: null == rootFolder
          ? _value.rootFolder
          : rootFolder // ignore: cast_nullable_to_non_nullable
              as String,
      outputPath: null == outputPath
          ? _value.outputPath
          : outputPath // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      rootPackage: null == rootPackage
          ? _value.rootPackage
          : rootPackage // ignore: cast_nullable_to_non_nullable
              as DeclarationNode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeclarationNodeCopyWith<$Res> get rootPackage {
    return $DeclarationNodeCopyWith<$Res>(_value.rootPackage, (value) {
      return _then(_value.copyWith(rootPackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GenerateInputCopyWith<$Res>
    implements $GenerateInputCopyWith<$Res> {
  factory _$$_GenerateInputCopyWith(
          _$_GenerateInput value, $Res Function(_$_GenerateInput) then) =
      __$$_GenerateInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'root') String rootFolder,
      String outputPath,
      Map<String, Object?> options,
      @JsonKey(name: 'packages') DeclarationNode rootPackage});

  @override
  $DeclarationNodeCopyWith<$Res> get rootPackage;
}

/// @nodoc
class __$$_GenerateInputCopyWithImpl<$Res>
    extends _$GenerateInputCopyWithImpl<$Res, _$_GenerateInput>
    implements _$$_GenerateInputCopyWith<$Res> {
  __$$_GenerateInputCopyWithImpl(
      _$_GenerateInput _value, $Res Function(_$_GenerateInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rootFolder = null,
    Object? outputPath = null,
    Object? options = null,
    Object? rootPackage = null,
  }) {
    return _then(_$_GenerateInput(
      rootFolder: null == rootFolder
          ? _value.rootFolder
          : rootFolder // ignore: cast_nullable_to_non_nullable
              as String,
      outputPath: null == outputPath
          ? _value.outputPath
          : outputPath // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      rootPackage: null == rootPackage
          ? _value.rootPackage
          : rootPackage // ignore: cast_nullable_to_non_nullable
              as DeclarationNode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenerateInput implements _GenerateInput {
  const _$_GenerateInput(
      {@JsonKey(name: 'root') required this.rootFolder,
      required this.outputPath,
      required final Map<String, Object?> options,
      @JsonKey(name: 'packages') required this.rootPackage})
      : _options = options;

  factory _$_GenerateInput.fromJson(Map<String, dynamic> json) =>
      _$$_GenerateInputFromJson(json);

  @override
  @JsonKey(name: 'root')
  final String rootFolder;
  @override
  final String outputPath;
  final Map<String, Object?> _options;
  @override
  Map<String, Object?> get options {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_options);
  }

  @override
  @JsonKey(name: 'packages')
  final DeclarationNode rootPackage;

  @override
  String toString() {
    return 'GenerateInput(rootFolder: $rootFolder, outputPath: $outputPath, options: $options, rootPackage: $rootPackage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenerateInput &&
            (identical(other.rootFolder, rootFolder) ||
                other.rootFolder == rootFolder) &&
            (identical(other.outputPath, outputPath) ||
                other.outputPath == outputPath) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.rootPackage, rootPackage) ||
                other.rootPackage == rootPackage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rootFolder, outputPath,
      const DeepCollectionEquality().hash(_options), rootPackage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenerateInputCopyWith<_$_GenerateInput> get copyWith =>
      __$$_GenerateInputCopyWithImpl<_$_GenerateInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenerateInputToJson(
      this,
    );
  }
}

abstract class _GenerateInput implements GenerateInput {
  const factory _GenerateInput(
      {@JsonKey(name: 'root')
          required final String rootFolder,
      required final String outputPath,
      required final Map<String, Object?> options,
      @JsonKey(name: 'packages')
          required final DeclarationNode rootPackage}) = _$_GenerateInput;

  factory _GenerateInput.fromJson(Map<String, dynamic> json) =
      _$_GenerateInput.fromJson;

  @override
  @JsonKey(name: 'root')
  String get rootFolder;
  @override
  String get outputPath;
  @override
  Map<String, Object?> get options;
  @override
  @JsonKey(name: 'packages')
  DeclarationNode get rootPackage;
  @override
  @JsonKey(ignore: true)
  _$$_GenerateInputCopyWith<_$_GenerateInput> get copyWith =>
      throw _privateConstructorUsedError;
}

DeclarationNode _$DeclarationNodeFromJson(Map<String, dynamic> json) {
  return _DeclarationNode.fromJson(json);
}

/// @nodoc
mixin _$DeclarationNode {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
  EntityDeclaration get value => throw _privateConstructorUsedError;
  List<DeclarationNode> get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeclarationNodeCopyWith<DeclarationNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclarationNodeCopyWith<$Res> {
  factory $DeclarationNodeCopyWith(
          DeclarationNode value, $Res Function(DeclarationNode) then) =
      _$DeclarationNodeCopyWithImpl<$Res, DeclarationNode>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
          EntityDeclaration value,
      List<DeclarationNode> children});
}

/// @nodoc
class _$DeclarationNodeCopyWithImpl<$Res, $Val extends DeclarationNode>
    implements $DeclarationNodeCopyWith<$Res> {
  _$DeclarationNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as EntityDeclaration,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<DeclarationNode>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeclarationNodeCopyWith<$Res>
    implements $DeclarationNodeCopyWith<$Res> {
  factory _$$_DeclarationNodeCopyWith(
          _$_DeclarationNode value, $Res Function(_$_DeclarationNode) then) =
      __$$_DeclarationNodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
          EntityDeclaration value,
      List<DeclarationNode> children});
}

/// @nodoc
class __$$_DeclarationNodeCopyWithImpl<$Res>
    extends _$DeclarationNodeCopyWithImpl<$Res, _$_DeclarationNode>
    implements _$$_DeclarationNodeCopyWith<$Res> {
  __$$_DeclarationNodeCopyWithImpl(
      _$_DeclarationNode _value, $Res Function(_$_DeclarationNode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? children = null,
  }) {
    return _then(_$_DeclarationNode(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as EntityDeclaration,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<DeclarationNode>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeclarationNode implements _DeclarationNode {
  const _$_DeclarationNode(
      {required this.name,
      @JsonKey(fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
          required this.value,
      required final List<DeclarationNode> children})
      : _children = children;

  factory _$_DeclarationNode.fromJson(Map<String, dynamic> json) =>
      _$$_DeclarationNodeFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(
      fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
  final EntityDeclaration value;
  final List<DeclarationNode> _children;
  @override
  List<DeclarationNode> get children {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'DeclarationNode(name: $name, value: $value, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeclarationNode &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, value, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeclarationNodeCopyWith<_$_DeclarationNode> get copyWith =>
      __$$_DeclarationNodeCopyWithImpl<_$_DeclarationNode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeclarationNodeToJson(
      this,
    );
  }
}

abstract class _DeclarationNode implements DeclarationNode {
  const factory _DeclarationNode(
      {required final String name,
      @JsonKey(fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
          required final EntityDeclaration value,
      required final List<DeclarationNode> children}) = _$_DeclarationNode;

  factory _DeclarationNode.fromJson(Map<String, dynamic> json) =
      _$_DeclarationNode.fromJson;

  @override
  String get name;
  @override
  @JsonKey(
      fromJson: _entityDeclarationFromJson, toJson: _entityDeclarationToJson)
  EntityDeclaration get value;
  @override
  List<DeclarationNode> get children;
  @override
  @JsonKey(ignore: true)
  _$$_DeclarationNodeCopyWith<_$_DeclarationNode> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageDeclaration _$PackageDeclarationFromJson(Map<String, dynamic> json) {
  return _PackageDeclaration.fromJson(json);
}

/// @nodoc
mixin _$PackageDeclaration {
  @JsonKey(name: "packageName")
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageDeclarationCopyWith<PackageDeclaration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageDeclarationCopyWith<$Res> {
  factory $PackageDeclarationCopyWith(
          PackageDeclaration value, $Res Function(PackageDeclaration) then) =
      _$PackageDeclarationCopyWithImpl<$Res, PackageDeclaration>;
  @useResult
  $Res call({@JsonKey(name: "packageName") String name, String path});
}

/// @nodoc
class _$PackageDeclarationCopyWithImpl<$Res, $Val extends PackageDeclaration>
    implements $PackageDeclarationCopyWith<$Res> {
  _$PackageDeclarationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageDeclarationCopyWith<$Res>
    implements $PackageDeclarationCopyWith<$Res> {
  factory _$$_PackageDeclarationCopyWith(_$_PackageDeclaration value,
          $Res Function(_$_PackageDeclaration) then) =
      __$$_PackageDeclarationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "packageName") String name, String path});
}

/// @nodoc
class __$$_PackageDeclarationCopyWithImpl<$Res>
    extends _$PackageDeclarationCopyWithImpl<$Res, _$_PackageDeclaration>
    implements _$$_PackageDeclarationCopyWith<$Res> {
  __$$_PackageDeclarationCopyWithImpl(
      _$_PackageDeclaration _value, $Res Function(_$_PackageDeclaration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
  }) {
    return _then(_$_PackageDeclaration(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageDeclaration implements _PackageDeclaration {
  const _$_PackageDeclaration(
      {@JsonKey(name: "packageName") required this.name, required this.path});

  factory _$_PackageDeclaration.fromJson(Map<String, dynamic> json) =>
      _$$_PackageDeclarationFromJson(json);

  @override
  @JsonKey(name: "packageName")
  final String name;
  @override
  final String path;

  @override
  String toString() {
    return 'PackageDeclaration(name: $name, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageDeclaration &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageDeclarationCopyWith<_$_PackageDeclaration> get copyWith =>
      __$$_PackageDeclarationCopyWithImpl<_$_PackageDeclaration>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageDeclarationToJson(
      this,
    );
  }
}

abstract class _PackageDeclaration
    implements PackageDeclaration, EntityDeclaration {
  const factory _PackageDeclaration(
      {@JsonKey(name: "packageName") required final String name,
      required final String path}) = _$_PackageDeclaration;

  factory _PackageDeclaration.fromJson(Map<String, dynamic> json) =
      _$_PackageDeclaration.fromJson;

  @override
  @JsonKey(name: "packageName")
  String get name;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_PackageDeclarationCopyWith<_$_PackageDeclaration> get copyWith =>
      throw _privateConstructorUsedError;
}

FileDeclaration _$FileDeclarationFromJson(Map<String, dynamic> json) {
  return _FileDeclaration.fromJson(json);
}

/// @nodoc
mixin _$FileDeclaration {
  @JsonKey(name: "fileName")
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <SchemaTypeDefinition>[])
  List<SchemaTypeDefinition> get types => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get imports => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileDeclarationCopyWith<FileDeclaration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDeclarationCopyWith<$Res> {
  factory $FileDeclarationCopyWith(
          FileDeclaration value, $Res Function(FileDeclaration) then) =
      _$FileDeclarationCopyWithImpl<$Res, FileDeclaration>;
  @useResult
  $Res call(
      {@JsonKey(name: "fileName")
          String name,
      String path,
      String id,
      @JsonKey(defaultValue: <SchemaTypeDefinition>[])
          List<SchemaTypeDefinition> types,
      @JsonKey(defaultValue: <String>[])
          List<String> imports});
}

/// @nodoc
class _$FileDeclarationCopyWithImpl<$Res, $Val extends FileDeclaration>
    implements $FileDeclarationCopyWith<$Res> {
  _$FileDeclarationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? id = null,
    Object? types = null,
    Object? imports = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<SchemaTypeDefinition>,
      imports: null == imports
          ? _value.imports
          : imports // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileDeclarationCopyWith<$Res>
    implements $FileDeclarationCopyWith<$Res> {
  factory _$$_FileDeclarationCopyWith(
          _$_FileDeclaration value, $Res Function(_$_FileDeclaration) then) =
      __$$_FileDeclarationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fileName")
          String name,
      String path,
      String id,
      @JsonKey(defaultValue: <SchemaTypeDefinition>[])
          List<SchemaTypeDefinition> types,
      @JsonKey(defaultValue: <String>[])
          List<String> imports});
}

/// @nodoc
class __$$_FileDeclarationCopyWithImpl<$Res>
    extends _$FileDeclarationCopyWithImpl<$Res, _$_FileDeclaration>
    implements _$$_FileDeclarationCopyWith<$Res> {
  __$$_FileDeclarationCopyWithImpl(
      _$_FileDeclaration _value, $Res Function(_$_FileDeclaration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? id = null,
    Object? types = null,
    Object? imports = null,
  }) {
    return _then(_$_FileDeclaration(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<SchemaTypeDefinition>,
      imports: null == imports
          ? _value._imports
          : imports // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileDeclaration implements _FileDeclaration {
  const _$_FileDeclaration(
      {@JsonKey(name: "fileName")
          required this.name,
      required this.path,
      required this.id,
      @JsonKey(defaultValue: <SchemaTypeDefinition>[])
          required final List<SchemaTypeDefinition> types,
      @JsonKey(defaultValue: <String>[])
          required final List<String> imports})
      : _types = types,
        _imports = imports;

  factory _$_FileDeclaration.fromJson(Map<String, dynamic> json) =>
      _$$_FileDeclarationFromJson(json);

  @override
  @JsonKey(name: "fileName")
  final String name;
  @override
  final String path;
  @override
  final String id;
  final List<SchemaTypeDefinition> _types;
  @override
  @JsonKey(defaultValue: <SchemaTypeDefinition>[])
  List<SchemaTypeDefinition> get types {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<String> _imports;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get imports {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imports);
  }

  @override
  String toString() {
    return 'FileDeclaration(name: $name, path: $path, id: $id, types: $types, imports: $imports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileDeclaration &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._imports, _imports));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      path,
      id,
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_imports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileDeclarationCopyWith<_$_FileDeclaration> get copyWith =>
      __$$_FileDeclarationCopyWithImpl<_$_FileDeclaration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileDeclarationToJson(
      this,
    );
  }
}

abstract class _FileDeclaration implements FileDeclaration, EntityDeclaration {
  const factory _FileDeclaration(
      {@JsonKey(name: "fileName")
          required final String name,
      required final String path,
      required final String id,
      @JsonKey(defaultValue: <SchemaTypeDefinition>[])
          required final List<SchemaTypeDefinition> types,
      @JsonKey(defaultValue: <String>[])
          required final List<String> imports}) = _$_FileDeclaration;

  factory _FileDeclaration.fromJson(Map<String, dynamic> json) =
      _$_FileDeclaration.fromJson;

  @override
  @JsonKey(name: "fileName")
  String get name;
  @override
  String get path;
  @override
  String get id;
  @override
  @JsonKey(defaultValue: <SchemaTypeDefinition>[])
  List<SchemaTypeDefinition> get types;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get imports;
  @override
  @JsonKey(ignore: true)
  _$$_FileDeclarationCopyWith<_$_FileDeclaration> get copyWith =>
      throw _privateConstructorUsedError;
}

SchemaTypeDefinition _$SchemaTypeDefinitionFromJson(Map<String, dynamic> json) {
  return _TypeDefinition.fromJson(json);
}

/// @nodoc
mixin _$SchemaTypeDefinition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SchemaTypeModifier get modifier => throw _privateConstructorUsedError;
  List<TypeFieldDefinition> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchemaTypeDefinitionCopyWith<SchemaTypeDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemaTypeDefinitionCopyWith<$Res> {
  factory $SchemaTypeDefinitionCopyWith(SchemaTypeDefinition value,
          $Res Function(SchemaTypeDefinition) then) =
      _$SchemaTypeDefinitionCopyWithImpl<$Res, SchemaTypeDefinition>;
  @useResult
  $Res call(
      {String id,
      String name,
      SchemaTypeModifier modifier,
      List<TypeFieldDefinition> fields});
}

/// @nodoc
class _$SchemaTypeDefinitionCopyWithImpl<$Res,
        $Val extends SchemaTypeDefinition>
    implements $SchemaTypeDefinitionCopyWith<$Res> {
  _$SchemaTypeDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? modifier = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modifier: null == modifier
          ? _value.modifier
          : modifier // ignore: cast_nullable_to_non_nullable
              as SchemaTypeModifier,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<TypeFieldDefinition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TypeDefinitionCopyWith<$Res>
    implements $SchemaTypeDefinitionCopyWith<$Res> {
  factory _$$_TypeDefinitionCopyWith(
          _$_TypeDefinition value, $Res Function(_$_TypeDefinition) then) =
      __$$_TypeDefinitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      SchemaTypeModifier modifier,
      List<TypeFieldDefinition> fields});
}

/// @nodoc
class __$$_TypeDefinitionCopyWithImpl<$Res>
    extends _$SchemaTypeDefinitionCopyWithImpl<$Res, _$_TypeDefinition>
    implements _$$_TypeDefinitionCopyWith<$Res> {
  __$$_TypeDefinitionCopyWithImpl(
      _$_TypeDefinition _value, $Res Function(_$_TypeDefinition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? modifier = null,
    Object? fields = null,
  }) {
    return _then(_$_TypeDefinition(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modifier: null == modifier
          ? _value.modifier
          : modifier // ignore: cast_nullable_to_non_nullable
              as SchemaTypeModifier,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<TypeFieldDefinition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypeDefinition implements _TypeDefinition {
  const _$_TypeDefinition(
      {required this.id,
      required this.name,
      required this.modifier,
      required final List<TypeFieldDefinition> fields})
      : _fields = fields;

  factory _$_TypeDefinition.fromJson(Map<String, dynamic> json) =>
      _$$_TypeDefinitionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final SchemaTypeModifier modifier;
  final List<TypeFieldDefinition> _fields;
  @override
  List<TypeFieldDefinition> get fields {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'SchemaTypeDefinition(id: $id, name: $name, modifier: $modifier, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeDefinition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.modifier, modifier) ||
                other.modifier == modifier) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, modifier,
      const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeDefinitionCopyWith<_$_TypeDefinition> get copyWith =>
      __$$_TypeDefinitionCopyWithImpl<_$_TypeDefinition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypeDefinitionToJson(
      this,
    );
  }
}

abstract class _TypeDefinition implements SchemaTypeDefinition {
  const factory _TypeDefinition(
      {required final String id,
      required final String name,
      required final SchemaTypeModifier modifier,
      required final List<TypeFieldDefinition> fields}) = _$_TypeDefinition;

  factory _TypeDefinition.fromJson(Map<String, dynamic> json) =
      _$_TypeDefinition.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  SchemaTypeModifier get modifier;
  @override
  List<TypeFieldDefinition> get fields;
  @override
  @JsonKey(ignore: true)
  _$$_TypeDefinitionCopyWith<_$_TypeDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeFieldDefinition _$TypeFieldDefinitionFromJson(Map<String, dynamic> json) {
  return _TypeFieldDefinition.fromJson(json);
}

/// @nodoc
mixin _$TypeFieldDefinition {
  String get name => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  Object? get defaultValue => throw _privateConstructorUsedError;
  Map<String, Object?>? get metadata => throw _privateConstructorUsedError;
  SchemaFieldType? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeFieldDefinitionCopyWith<TypeFieldDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeFieldDefinitionCopyWith<$Res> {
  factory $TypeFieldDefinitionCopyWith(
          TypeFieldDefinition value, $Res Function(TypeFieldDefinition) then) =
      _$TypeFieldDefinitionCopyWithImpl<$Res, TypeFieldDefinition>;
  @useResult
  $Res call(
      {String name,
      int index,
      Object? defaultValue,
      Map<String, Object?>? metadata,
      SchemaFieldType? type});

  $SchemaFieldTypeCopyWith<$Res>? get type;
}

/// @nodoc
class _$TypeFieldDefinitionCopyWithImpl<$Res, $Val extends TypeFieldDefinition>
    implements $TypeFieldDefinitionCopyWith<$Res> {
  _$TypeFieldDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? index = null,
    Object? defaultValue = freezed,
    Object? metadata = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue:
          freezed == defaultValue ? _value.defaultValue : defaultValue,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SchemaFieldType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchemaFieldTypeCopyWith<$Res>? get type {
    if (_value.type == null) {
      return null;
    }

    return $SchemaFieldTypeCopyWith<$Res>(_value.type!, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TypeFieldDefinitionCopyWith<$Res>
    implements $TypeFieldDefinitionCopyWith<$Res> {
  factory _$$_TypeFieldDefinitionCopyWith(_$_TypeFieldDefinition value,
          $Res Function(_$_TypeFieldDefinition) then) =
      __$$_TypeFieldDefinitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int index,
      Object? defaultValue,
      Map<String, Object?>? metadata,
      SchemaFieldType? type});

  @override
  $SchemaFieldTypeCopyWith<$Res>? get type;
}

/// @nodoc
class __$$_TypeFieldDefinitionCopyWithImpl<$Res>
    extends _$TypeFieldDefinitionCopyWithImpl<$Res, _$_TypeFieldDefinition>
    implements _$$_TypeFieldDefinitionCopyWith<$Res> {
  __$$_TypeFieldDefinitionCopyWithImpl(_$_TypeFieldDefinition _value,
      $Res Function(_$_TypeFieldDefinition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? index = null,
    Object? defaultValue = freezed,
    Object? metadata = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_TypeFieldDefinition(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue:
          freezed == defaultValue ? _value.defaultValue : defaultValue,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SchemaFieldType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypeFieldDefinition implements _TypeFieldDefinition {
  _$_TypeFieldDefinition(
      {required this.name,
      required this.index,
      required this.defaultValue,
      required final Map<String, Object?>? metadata,
      required this.type})
      : _metadata = metadata;

  factory _$_TypeFieldDefinition.fromJson(Map<String, dynamic> json) =>
      _$$_TypeFieldDefinitionFromJson(json);

  @override
  final String name;
  @override
  final int index;
  @override
  final Object? defaultValue;
  final Map<String, Object?>? _metadata;
  @override
  Map<String, Object?>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final SchemaFieldType? type;

  @override
  String toString() {
    return 'TypeFieldDefinition(name: $name, index: $index, defaultValue: $defaultValue, metadata: $metadata, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeFieldDefinition &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      index,
      const DeepCollectionEquality().hash(defaultValue),
      const DeepCollectionEquality().hash(_metadata),
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeFieldDefinitionCopyWith<_$_TypeFieldDefinition> get copyWith =>
      __$$_TypeFieldDefinitionCopyWithImpl<_$_TypeFieldDefinition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypeFieldDefinitionToJson(
      this,
    );
  }
}

abstract class _TypeFieldDefinition implements TypeFieldDefinition {
  factory _TypeFieldDefinition(
      {required final String name,
      required final int index,
      required final Object? defaultValue,
      required final Map<String, Object?>? metadata,
      required final SchemaFieldType? type}) = _$_TypeFieldDefinition;

  factory _TypeFieldDefinition.fromJson(Map<String, dynamic> json) =
      _$_TypeFieldDefinition.fromJson;

  @override
  String get name;
  @override
  int get index;
  @override
  Object? get defaultValue;
  @override
  Map<String, Object?>? get metadata;
  @override
  SchemaFieldType? get type;
  @override
  @JsonKey(ignore: true)
  _$$_TypeFieldDefinitionCopyWith<_$_TypeFieldDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

SchemaFieldType _$SchemaFieldTypeFromJson(Map<String, dynamic> json) {
  return _FieldType.fromJson(json);
}

/// @nodoc
mixin _$SchemaFieldType {
  FieldPrimitive get primitive => throw _privateConstructorUsedError;
  String? get typeName => throw _privateConstructorUsedError;
  bool get nullable => throw _privateConstructorUsedError;
  String get importId => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <SchemaFieldType>[])
  List<SchemaFieldType> get typeArguments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchemaFieldTypeCopyWith<SchemaFieldType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchemaFieldTypeCopyWith<$Res> {
  factory $SchemaFieldTypeCopyWith(
          SchemaFieldType value, $Res Function(SchemaFieldType) then) =
      _$SchemaFieldTypeCopyWithImpl<$Res, SchemaFieldType>;
  @useResult
  $Res call(
      {FieldPrimitive primitive,
      String? typeName,
      bool nullable,
      String importId,
      @JsonKey(defaultValue: <SchemaFieldType>[])
          List<SchemaFieldType> typeArguments});
}

/// @nodoc
class _$SchemaFieldTypeCopyWithImpl<$Res, $Val extends SchemaFieldType>
    implements $SchemaFieldTypeCopyWith<$Res> {
  _$SchemaFieldTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primitive = null,
    Object? typeName = freezed,
    Object? nullable = null,
    Object? importId = null,
    Object? typeArguments = null,
  }) {
    return _then(_value.copyWith(
      primitive: null == primitive
          ? _value.primitive
          : primitive // ignore: cast_nullable_to_non_nullable
              as FieldPrimitive,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      importId: null == importId
          ? _value.importId
          : importId // ignore: cast_nullable_to_non_nullable
              as String,
      typeArguments: null == typeArguments
          ? _value.typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<SchemaFieldType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldTypeCopyWith<$Res>
    implements $SchemaFieldTypeCopyWith<$Res> {
  factory _$$_FieldTypeCopyWith(
          _$_FieldType value, $Res Function(_$_FieldType) then) =
      __$$_FieldTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FieldPrimitive primitive,
      String? typeName,
      bool nullable,
      String importId,
      @JsonKey(defaultValue: <SchemaFieldType>[])
          List<SchemaFieldType> typeArguments});
}

/// @nodoc
class __$$_FieldTypeCopyWithImpl<$Res>
    extends _$SchemaFieldTypeCopyWithImpl<$Res, _$_FieldType>
    implements _$$_FieldTypeCopyWith<$Res> {
  __$$_FieldTypeCopyWithImpl(
      _$_FieldType _value, $Res Function(_$_FieldType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primitive = null,
    Object? typeName = freezed,
    Object? nullable = null,
    Object? importId = null,
    Object? typeArguments = null,
  }) {
    return _then(_$_FieldType(
      primitive: null == primitive
          ? _value.primitive
          : primitive // ignore: cast_nullable_to_non_nullable
              as FieldPrimitive,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      nullable: null == nullable
          ? _value.nullable
          : nullable // ignore: cast_nullable_to_non_nullable
              as bool,
      importId: null == importId
          ? _value.importId
          : importId // ignore: cast_nullable_to_non_nullable
              as String,
      typeArguments: null == typeArguments
          ? _value._typeArguments
          : typeArguments // ignore: cast_nullable_to_non_nullable
              as List<SchemaFieldType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FieldType implements _FieldType {
  const _$_FieldType(
      {required this.primitive,
      required this.typeName,
      required this.nullable,
      required this.importId,
      @JsonKey(defaultValue: <SchemaFieldType>[])
          required final List<SchemaFieldType> typeArguments})
      : _typeArguments = typeArguments;

  factory _$_FieldType.fromJson(Map<String, dynamic> json) =>
      _$$_FieldTypeFromJson(json);

  @override
  final FieldPrimitive primitive;
  @override
  final String? typeName;
  @override
  final bool nullable;
  @override
  final String importId;
  final List<SchemaFieldType> _typeArguments;
  @override
  @JsonKey(defaultValue: <SchemaFieldType>[])
  List<SchemaFieldType> get typeArguments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeArguments);
  }

  @override
  String toString() {
    return 'SchemaFieldType(primitive: $primitive, typeName: $typeName, nullable: $nullable, importId: $importId, typeArguments: $typeArguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldType &&
            (identical(other.primitive, primitive) ||
                other.primitive == primitive) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.nullable, nullable) ||
                other.nullable == nullable) &&
            (identical(other.importId, importId) ||
                other.importId == importId) &&
            const DeepCollectionEquality()
                .equals(other._typeArguments, _typeArguments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, primitive, typeName, nullable,
      importId, const DeepCollectionEquality().hash(_typeArguments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldTypeCopyWith<_$_FieldType> get copyWith =>
      __$$_FieldTypeCopyWithImpl<_$_FieldType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldTypeToJson(
      this,
    );
  }
}

abstract class _FieldType implements SchemaFieldType {
  const factory _FieldType(
      {required final FieldPrimitive primitive,
      required final String? typeName,
      required final bool nullable,
      required final String importId,
      @JsonKey(defaultValue: <SchemaFieldType>[])
          required final List<SchemaFieldType> typeArguments}) = _$_FieldType;

  factory _FieldType.fromJson(Map<String, dynamic> json) =
      _$_FieldType.fromJson;

  @override
  FieldPrimitive get primitive;
  @override
  String? get typeName;
  @override
  bool get nullable;
  @override
  String get importId;
  @override
  @JsonKey(defaultValue: <SchemaFieldType>[])
  List<SchemaFieldType> get typeArguments;
  @override
  @JsonKey(ignore: true)
  _$$_FieldTypeCopyWith<_$_FieldType> get copyWith =>
      throw _privateConstructorUsedError;
}
