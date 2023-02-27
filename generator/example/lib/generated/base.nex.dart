import 'dart:core' as $core;
import 'package:nexema/nexema.dart' as $nex;

abstract class BaseA extends $nex.NexemaType {
  BaseA._internal(super.reflection$);

  $core.String get stringField;
  set stringField($core.String value);

  $core.bool get boolField;
  set boolField($core.bool value);

  $core.int get intField;
  set intField($core.int value);

  $core.BigInt get uintField;
  set uintField($core.BigInt value);

  $core.int get int8Field;
  set int8Field($core.int value);

  $core.int get int16Field;
  set int16Field($core.int value);

  $core.int get int32Field;
  set int32Field($core.int value);

  $core.int get int64Field;
  set int64Field($core.int value);

  $core.int get uint8Field;
  set uint8Field($core.int value);
}
