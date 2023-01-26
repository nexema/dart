part of 'nexema_type.dart';

abstract class NexemaTypeState<T extends BaseNexemaType> {
  const NexemaTypeState();
}

class EnumTypeState<T extends NexemaEnumType> extends NexemaTypeState<T> {
  final int currentValueIndex;
  final String name;

  const EnumTypeState(this.name, this.currentValueIndex);

  @override
  int get hashCode => currentValueIndex;
  
  @override
  bool operator ==(Object other) => (other as EnumTypeState<T>).currentValueIndex == currentValueIndex;
}

class StructTypeState<T extends BaseNexemaType> extends NexemaTypeState<T> {
  List<dynamic> _values;
  int? _hashcode;

  StructTypeState(this._values);

  Object? get(int index) => _values[index];
  
  void set(int index, Object? value) {
    _values[index] = value;
    _hashcode = null;
  } 
  
  void setAll(List<dynamic> values) {
    _values = values;
    _hashcode = null;
  }

  @override
  int get hashCode {
    _hashcode ??= kDeepCollectionEquality.hash(_values);
    return _hashcode!;
  }
  
  @override
  bool operator ==(Object other) {
    // skipped because this is already done on specific type.
    // if(other is! NexemaTypeState<T>) {
    //   return false;
    // } 

    return kDeepCollectionEquality.equals((other as StructTypeState<T>)._values, _values);
  }
}

class UnionTypeState<T extends BaseNexemaType, TField extends Enum> extends NexemaTypeState<T> {
  dynamic _currentValue;
  TField _currentField;
  int? _hashcode;

  UnionTypeState(this._currentValue, this._currentField);

  dynamic get currentValue => _currentValue;
  void setCurrentValue(dynamic value, TField field) {
    _currentValue = value;
    _currentField = field;
    _hashcode = null;
  }

  V get<V>(TField field) {
    if(_currentField != field) {
      throw UnionNotSetError(field.name);
    }

    return _currentValue as V;
  }

  TField get currentField => _currentField;

  @override
  int get hashCode {
    _hashcode ??= _currentValue.hashCode;
    return _hashcode!;
  }
  
  @override
  bool operator ==(Object other) {
    // skipped because this is already done on specific type.
    // if(other is! NexemaTypeState<T>) {
    //   return false;
    // } 

    return (other as UnionTypeState<T, TField>).currentValue == other.currentValue;
  }
}