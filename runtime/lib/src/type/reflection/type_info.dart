part of '../nexema_type.dart';

/// TypeInfo contains information about a Nexema type.
class TypeInfo {
  /// The type's name
  final String name;

  /// The type's modifier.
  final TypeModifier modifier;

  /// The list of fields.
  final List<FieldInfo> fields;

  /// The name of the package where the type is defined.
  final String packageName;

  /// The list of key-value pairs annotation given to the type.
  final Map<String, dynamic> annotations;

  const TypeInfo({
    required this.name, 
    required this.modifier, 
    required this.fields, 
    required this.packageName,
    required this.annotations
  });
}

enum TypeModifier {
  struct,
  union,
  base,
  enumerator
}