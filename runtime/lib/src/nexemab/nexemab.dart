import 'dart:convert';
import 'dart:typed_data';

import 'package:nexema/nexema.dart';
import 'package:nexema/src/constants/numbers.dart';

part 'reader.dart';
part 'spec.dart';
part 'writer.dart';

// final _encoderPool = Pool(10, timeout: const Duration(minutes: 10));

NexemabWriter getWriter([int bufferSize = 324]) {
  return NexemabWriter(bufferSize);
}

NexemabReader getReader(Uint8List buffer) {
  return NexemabReader(buffer);
}