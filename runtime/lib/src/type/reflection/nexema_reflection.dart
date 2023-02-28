part of '../nexema_type.dart';

/// Base class for every type that can be used to do some kind of runtime reflection over Nexema types.
abstract class NexemaReflection<TType extends BaseNexemaType> {
  /// Evaluates the current type and returns an object.
  Object? evaluate(TType instance);

  const NexemaReflection();

  /// Returns the [TypeInfo] of [value] if its a [BaseNexemaType]. Otherwise, returns null.
  static TypeInfo? typeOf(Object? value) {
    if(value == null) {
      return null;
    }

    if(value is BaseNexemaType) {
      return value._reflection$;
    }

    return null;
  } 
}