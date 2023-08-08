import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;

abstract class Entity extends $nex.NexemaType {
  Entity(super.reflection$);

  $core.String get id;
  set id($core.String value);

  $core.DateTime get createdAt;
  set createdAt($core.DateTime value);

  $core.DateTime? get deletedAt;
  set deletedAt($core.DateTime? value);

  $core.DateTime? get modifiedAt;
  set modifiedAt($core.DateTime? value);
}
