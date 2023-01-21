// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:nexema/messagepack_schema.dart' as _i1;

class EnumType extends _i1.SchemaEnum<EnumType> {
  const EnumType._(
    int index,
    String name,
  ) : super(index, name);

  static const EnumType unknown = EnumType._(0, "unknown");

  static const EnumType value = EnumType._(1, "value");

  static const EnumType second = EnumType._(2, "second");

  static const EnumType random1 = EnumType._(3, "random1");

  static const List<EnumType> values = [unknown, value, second, random1];

  static const Map<String, EnumType> _byName = {
    "unknown": unknown,
    "value": value,
    "second": second,
    "random1": random1
  };

  static EnumType valueOf(int index) {
    try {
      return values[index];
    } catch (_) {
      throw _i1.EnumNotFound.byIndex(index);
    }
  }

  static EnumType fromName(String name) {
    try {
      return _byName[name]!;
    } catch (_) {
      throw _i1.EnumNotFound.byName(name);
    }
  }
}
