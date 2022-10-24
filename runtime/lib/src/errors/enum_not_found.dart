class EnumNotFound extends Error {
  final String? enumName;
  final int? enumIndex;

  EnumNotFound.byName(String name) : enumName = name, enumIndex = null;
  EnumNotFound.byIndex(int index) : enumIndex = index, enumName = null;

  @override
  String toString() => enumName == null ? "Enum with value $enumIndex not found." : "Enum with name $enumName not found.";
}