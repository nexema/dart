part of '../nexema_type.dart';

/// FieldInfo provides information about a single field of any Nexema type.
class FieldInfo<TType extends BaseNexemaType> extends NexemaReflection<TType> {
  final StateGetter<StructTypeState<TType>, TType> _stateGetter;

  /// The name of the field as defined in .nex file.
  final String name;

  /// The name of the field in Dart.
  final String dartName;

  /// The index of the field
  final int index;

  /// The value type of the field.
  final FieldValueType valueType;

  const FieldInfo(this._stateGetter, {required this.name, required this.dartName, required this.index, required this.valueType});

  @override
  int get hashCode => Object.hash(name, dartName, index, valueType.hashCode);
  
  @override
  bool operator ==(Object other) 
    => other is FieldInfo ? 
      other.name == name 
      && other.dartName == dartName 
      && other.index == index 
      && other.valueType == valueType : false;
      
  @override
  Object? evaluate(TType instance) {
    return _stateGetter(instance)._values[index];
  }
}

/// FieldValueType contains information about the type of a field.
class FieldValueType {
  /// The value type kind.
  final FieldValueKind kind;

  /// A flag that indicates if the value type is nullable.
  final bool isNullable;

  /// The list of type arguments of the value type.
  final List<FieldValueType>? typeArguments;

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