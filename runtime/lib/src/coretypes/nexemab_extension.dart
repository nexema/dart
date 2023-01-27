import 'package:nexema/nexema.dart';

extension CoretypesNexemabReaderExtension on NexemabReader {
  DateTime decodeTimestamp() {
    int seconds = decodeVarint();
    int nanos = decodeVarint();
    return DateTime.fromMicrosecondsSinceEpoch(seconds * Duration.microsecondsPerSecond + (nanos ~/ 1000));
  }

  Duration decodeDuration() {
    int nanoseconds = decodeVarint();
    return Duration(microseconds: nanoseconds ~/ 1000);
  }
}

extension CoretypesNexemabWriterExtension on NexemabWriter {
  NexemabWriter encodeDateTime(DateTime timestamp) {
    int microsecondsSinceEpoch = timestamp.microsecondsSinceEpoch;
    int seconds = (microsecondsSinceEpoch / Duration.microsecondsPerSecond).floor();
    int nanos = (microsecondsSinceEpoch % Duration.microsecondsPerSecond) * 1000;
    return encodeVarint(seconds).encodeVarint(nanos);
  }
}