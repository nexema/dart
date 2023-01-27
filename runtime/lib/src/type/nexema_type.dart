import 'dart:typed_data';

import 'package:nexema/nexema.dart';

part 'reflection/field_info.dart';
part 'reflection/nexema_reflection.dart';
part 'reflection/state_getter.dart';
part 'reflection/type_info.dart';
part 'nexema_state.dart';

/// Base class for every Nexema generated type.
abstract class BaseNexemaType {
  const BaseNexemaType();

  Uint8List encode();
}

abstract class NexemaType extends BaseNexemaType {
  void mergeFrom(Uint8List buffer);
}

abstract class NexemaEnumType extends BaseNexemaType {
  const NexemaEnumType();
}
