import 'package:messagepack_schema/src/errors/enum_not_found.dart';
import 'package:messagepack_schema/src/schema/schema_enum.dart';

class ExampleEnumType extends SchemaEnum<ExampleEnumType> {
  
  static const ExampleEnumType unknown = ExampleEnumType._(0, "another");
  static const ExampleEnumType another = ExampleEnumType._(1, "another");
  static const ExampleEnumType second = ExampleEnumType._(2, "second");
  static const ExampleEnumType third = ExampleEnumType._(3, "third");

  const ExampleEnumType._(int index, String name) : super(index, name);

  static const List<ExampleEnumType> values = [unknown,another,second,third];
  static const Map<String, ExampleEnumType> _byName = {
    "unknown": unknown,
    "another": another,
    "second": second,
    "third": third
  };

  static ExampleEnumType valueOf(int index){
    try {
      return values[index];
    } catch(_) {
      throw EnumNotFound.byIndex(index);
    }
  }

  static ExampleEnumType fromName(String name) {
    try {
      return _byName[name]!;
    } catch(_) {
      throw EnumNotFound.byName(name);
    }
  }
}