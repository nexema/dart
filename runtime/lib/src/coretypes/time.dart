/// NTimestamp represents a nanosecond-resolution [DateTime] alternative.
/// 
/// Dates will be always in UTC.
class NTimestamp {
  final int _seconds, _nanoseconds;

  int get seconds => _seconds;
  int get nanoseconds => _nanoseconds;

  const NTimestamp._internal(this._seconds, this._nanoseconds);

  /// Creates a [NTimestamp] from [seconds] and [nanoseconds].
  factory NTimestamp.from({required int seconds, required int nanoseconds}) 
    => NTimestamp._internal(seconds, nanoseconds);

  /// Creates a [NTimestamp] using a [DateTime].
  /// 
  /// Keep in mind this method will use microsecond-resolution.
  factory NTimestamp.fromDateTime(DateTime dateTime) {
    int microsecondsSinceEpoch = dateTime.microsecondsSinceEpoch;
    int seconds = (microsecondsSinceEpoch / Duration.microsecondsPerSecond).floor();
    int nanos = (microsecondsSinceEpoch % Duration.microsecondsPerSecond) * 1000;
    return NTimestamp._internal(seconds, nanos);
  }

  /// Creates a [NTimestamp] with the current time, using [DateTime.now()]
  factory NTimestamp.now() => NTimestamp.fromDateTime(DateTime.now());

  /// Converts the current [NTimestamp] in UTC to local zone.
  NTimestamp toLocal() => NTimestamp.fromDateTime(toDateTime().toLocal());

  /// Converts the current [NTimestamp] to a [DateTime].
  /// 
  /// This method will loose precision, since Dart's [DateTime] uses microsecond resolution.
  DateTime toDateTime() => DateTime.fromMicrosecondsSinceEpoch(_seconds * Duration.microsecondsPerSecond + (_nanoseconds ~/ 1000), isUtc: true);

  @override
  String toString() => toDateTime().toIso8601String();
}