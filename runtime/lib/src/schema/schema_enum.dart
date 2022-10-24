

/// Represents an enum type
class SchemaEnum<T extends SchemaEnum<T>> {
  final int index;
  final String name;

  const SchemaEnum(this.index, this.name);

  @override
  int get hashCode => index;
  
  @override
  bool operator ==(Object other);

  @override
  String toString() => "$name: $index";
}