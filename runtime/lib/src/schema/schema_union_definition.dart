import 'package:messagepack_schema/messagepack_schema.dart';

/// <summary>
/// Contains the default of an schema type an used to lookup values
/// </summary>
class SchemaUnionDefinition<T extends SchemaUnion<T, TField>, TField extends Enum> extends SchemaDefinition<T> {
  final List<DefaultValueGetter> _defaults;
  
  dynamic _value; // the variable that holds the current union value
  int? _currentFieldIndex; // The index of the field that is set

  /// A flag that indicates if the union has a value.
  bool get isSet => _currentFieldIndex != null;

  SchemaUnionDefinition(
    List<FieldInfo> fields,
    int fieldCount,
    this._defaults
  ) : super(fields);

  /// Gets the current value of the union, if set
  dynamic getCurrentValue() => _value;

  /// Sets the current value of the union
  void setCurrentValue(int? fieldIndex, dynamic value) {
    _value = value;
    _currentFieldIndex = fieldIndex;
  }

  int? getCurrentSetField() => _currentFieldIndex;

  Object getDefaultValue(int fieldIndex, [List? arguments]) {
    var def = _defaults[fieldIndex](arguments);
    return def;
  }
}
