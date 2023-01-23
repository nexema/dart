import 'dart:typed_data';

import 'package:nexema/nexema.dart';

part 'reflection/field_info.dart';
part 'reflection/nexema_reflection.dart';
part 'reflection/state_getter.dart';
part 'reflection/type_info.dart';

/// Base class for every Nexema generated type.
abstract class NexemaType {
  Uint8List encode();
  void mergeFrom(Uint8List buffer);
}

/// Represents the actual state of a [NexemaType]
class NexemaTypeState<T extends NexemaType> {
  List<dynamic> _values;
  int? _hashcode;

  NexemaTypeState(this._values);

  Object? get(int index) => _values[index];
  
  void set(int index, Object value) {
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

    return kDeepCollectionEquality.equals((other as NexemaTypeState<T>)._values, _values);
  }
}