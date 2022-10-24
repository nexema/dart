/// <summary>
/// Contains information about a type's field
/// </summary>
class FieldInfo {
  final String name;
  final int index;
  final bool nullable;
  final FieldValueType valueType;
  final List<FieldValueType>? typeArguments;
  final bool isEnum;

  const FieldInfo({
    required this.name,
    required this.index,
    required this.nullable,
    required this.valueType,
    required this.typeArguments,
    this.isEnum = false
  });

  @override
  String toString() => "$name (${nullable ? '?' : ''}) ($index)";
}

enum FieldValueType {
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