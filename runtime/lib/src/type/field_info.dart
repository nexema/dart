import 'package:nexema/nexema.dart';

/// FieldInfo provides information about a single field of any Nexema type.
class FieldInfo {
  /// The name of the field as defined in .nex file.
  final String name;

  /// The name of the field in Dart.
  final String dartName;

  /// The index of the field
  final int index;

  /// The value type of the field.
  final FieldValueType valueType;

  const FieldInfo({required this.name, required this.dartName, required this.index, required this.valueType});

  @override
  int get hashCode => Object.hash(name, dartName, index, valueType.hashCode);
  
  @override
  bool operator ==(Object other) 
    => other is FieldInfo ? 
      other.name == name 
      && other.dartName == dartName 
      && other.index == index 
      && other.valueType == valueType : false;
}

/// FieldValueType contains information about the type of a field.
abstract class FieldValueType {
  /// The value type kind.
  final FieldValueKind kind;

  /// A flag that indicates if the value type is nullable.
  final bool isNullable;

  /// The list of type arguments of the value type.
  final List<FieldValueType> typeArguments;

  const FieldValueType({required this.kind, required this.isNullable, required this.typeArguments});

  @override
  int get hashCode => Object.hash(kind, isNullable, typeArguments);
  
  @override
  bool operator ==(Object other) 
    => other is FieldValueType ? 
      other.kind == kind
      && other.isNullable == isNullable
      && kDeepCollectionEquality.equals(other.typeArguments, typeArguments) : false;
}

/// ListField is a [FieldValueType] but contains only one type argument.
class ListField extends FieldValueType {
  FieldValueType get typeArgument => typeArguments[0];

  ListField({required FieldValueType typeArgument, required super.isNullable}) : super(kind: FieldValueKind.list, typeArguments: [typeArgument]);
}

/// MapField is a [FieldValueType] but contains only two type arguments.
class MapField extends FieldValueType {
  FieldValueType get keyTypeArgument => typeArguments[0];
  FieldValueType get valueTypeArgument => typeArguments[1];

  MapField({required FieldValueType keyTypeArgument, required FieldValueType valueTypeArgument, required super.isNullable})
    : super(kind: FieldValueKind.map, typeArguments: [keyTypeArgument, valueTypeArgument]);
}

enum FieldValueKind {
  string,
  bool,
  uint8,
  uint16,
  uint32,
  uint64,
  int8,
  int16,
  int32,
  int64,
  int,
  uint,
  float32,
  float64,
  binary,
  list,
  map,
  type
}