import 'package:messagepack_schema/messagepack_schema.dart';

/// <summary>
/// Contains the default of an schema type an used to lookup values
/// </summary>
class SchemaStructDefinition<T extends SchemaStruct<T>> extends SchemaDefinition<T> {
  final List<DefaultValueGetter> _defaults;
  final List<Object?> _values;
  final List<bool> _setFields;
  final String _id = DateTime.now().microsecondsSinceEpoch.toString();
  
  String get id => _id;

  /// The current hash of the type. This will be null when any of the fields change their values.
  int? hash;

  SchemaStructDefinition(
    List<FieldInfo> fields,
    int fieldCount,
    List<DefaultValueGetter> defaults
  ) : 
    _defaults = defaults,
    _values = List<Object?>.filled(fieldCount, null),
    _setFields = List<bool>.filled(fieldCount, false),
    super(fields);

  Object? getFieldValue(int fieldIndex) => _values[fieldIndex];

  void setFieldValue(int fieldIndex, Object? value) {
    _values[fieldIndex] = value;
    _setFields[fieldIndex] = true;
    hash = null;
  }

  void setFields(List<Object?> values) {
    int index = 0;
    for(Object? value in values){
      _values[index] = value;
      _setFields[index] = true;
      index++;
    }

    hash = null;
  }

  List<Object?> getValues() {
    return List.from(_values);
  }

  bool isFieldSet(int fieldIndex) => _setFields[fieldIndex];

  Object getDefaultValue(int fieldIndex, [List? arguments]) {
    var def = _defaults[fieldIndex](arguments);
    return def;
  }

  @override
  String toString() => "SchemaStructDefinition($_id)";
}