part of '../nexema_type.dart';

typedef StateGetter<TState extends NexemaTypeState<T>, T extends BaseNexemaType> = TState Function(T);