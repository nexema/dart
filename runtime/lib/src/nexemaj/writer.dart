import 'dart:typed_data';

/// Nexemaj is the JSON serialization lib for Nexema.
class NexemajWriter {
  final _chunks = <Uint8List>[];

  int _chunkSize;
  int _offset;
  Uint8List _currentChunk;

  NexemajWriter([int initialSize = 1024])
    : assert(initialSize > 0),
      _chunkSize = initialSize,
      _offset = 0,
      _currentChunk = Uint8List(initialSize);

  void _ensure(int bytes) {
    if(_currentChunk.length - _offset < bytes) {
      var chunkView = Uint8List.view(_currentChunk.buffer, 0, _offset);
      _chunks.add(chunkView);
      _chunkSize *= 2;
      _currentChunk = Uint8List(_chunkSize);
    }
  }

  /// Only method used to write bytes. This is faster than using ByteData
  void _writeByte(int byte) {
    _ensure(1);
    _currentChunk[_offset++] = byte;
  }  
}