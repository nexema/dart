part of '../nexema_type.dart';

/// FieldInfo provides information about a single field of any Nexema type.
class FieldInfo<TType extends BaseNexemaType> extends NexemaReflection<TType> {
  /// The name of the field as defined in .nex file.
  final String name;

  /// The name of the field in Dart.
  final String dartName;

  /// The index of the field
  final int index;

  /// The value type of the field.
  final FieldValueType? valueType;

  /// The list of key-value pairs annotation given to the field.
  final Map<String, dynamic> annotations;

  const FieldInfo({
    required this.name, 
    required this.dartName, 
    required this.index, 
    required this.valueType,
    required this.annotations
  });

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
    final state = instance.$state_;
    if(state is StructTypeState) {
      return state._values[index];
    } else if(state is UnionTypeState) {
      if(state._currentField.index == index) {
        return state._currentValue;
      }

      throw UnionNotSetError(dartName);
    }
    return null;
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
  time,
  duration,
  list,
  map,
  type
}