import 'dart:typed_data';

import 'package:nexema/nexema.dart';

part 'reflection/field_info.dart';
part 'reflection/nexema_reflection.dart';
part 'reflection/state_getter.dart';
part 'reflection/type_info.dart';
part 'nexema_state.dart';

/// Base class for every Nexema generated type.
abstract class BaseNexemaType {
  final TypeInfo _reflection$;

  NexemaTypeState get $state_;

  const BaseNexemaType(this._reflection$);

  Uint8List encode();
}

abstract class NexemaType extends BaseNexemaType {
  const NexemaType(super.reflection$);

  void mergeFrom(Uint8List buffer);
}

abstract class NexemaEnumType extends BaseNexemaType {
  const NexemaEnumType(super._reflection$);
}
