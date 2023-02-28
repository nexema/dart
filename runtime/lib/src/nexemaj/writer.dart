import 'dart:typed_data';

part 'spec.dart';

/// Nexemaj is the JSON serialization lib for Nexema.
class NexemajWriter {
  final _chunks = <_Chunk>[];

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
      _chunks.add(_Chunk(chunkView, _offset));
      _chunkSize *= 2;
      _currentChunk = Uint8List(_chunkSize);
    }
  }

  /// Only method used to write bytes. This is faster than using ByteData
  void _writeByte(int byte) {
    _ensure(1);
    _currentChunk[_offset++] = byte;
  }  

  void _writeBytes(List<int> bytes, int length) {
    _ensure(length);
    _currentChunk.setAll(_offset, bytes);
    _offset += length;
  }

  void writeLbrace() {
    _writeByte(_kTokenLbrace);
  }

  void writeRbrace() {
     if (_currentChunk[_offset - 1] == _kTokenComma) {
      _currentChunk[_offset - 1] = _kTokenRbrace;
      _writeByte(_kTokenComma);
    } else {
      _ensure(2);
      _currentChunk[_offset++] = _kTokenRbrace;
      _currentChunk[_offset++] = _kTokenComma;
    }
  }

  void writeComma() {
    _writeByte(_kTokenComma);
  }
  
  void _writeString(String value) {
    _ensure(value.length * 3 + 3);
    var offset = _offset;
    var chars = value.codeUnits;

    _currentChunk[offset++] = _kTokenDoubleQuote;
    for (int i = 0; i < value.length; i++) {
      var char = chars[i];
      if (char < _kOneByteChar && char != _kTokenDoubleQuote && char != _kTokenBackslash) {
        _currentChunk[offset++] = char;
      } else if (char == _kTokenDoubleQuote || char == _kTokenBackslash) {
        _currentChunk[offset++] = _kTokenBackslash;
        _currentChunk[offset++] = char;
      } else if ((char & _kSurrogateMask) == _kLeadSurrogateMin) {
        final nextChar = chars[++i];
        final rune = 0x10000 + ((char & _kSurrogateValueMask) << 10) | (nextChar & _kSurrogateValueMask);
        _currentChunk[offset++] = 0xF0 | (rune >> 18);
        _currentChunk[offset++] = _kMaxByte | ((rune >> 12) & 0x3f);
        _currentChunk[offset++] = _kMaxByte | ((rune >> 6) & 0x3f);
        _currentChunk[offset++] = _kMaxByte | (rune & 0x3f);
      } else if (char <= _kTwoBytesLimit) {
        _currentChunk[offset++] = 0xC0 | (char >> 6);
        _currentChunk[offset++] = _kMaxByte | (char & 0x3f);
      } else {
        _currentChunk[offset++] = 0xE0 | (char >> 12);
        _currentChunk[offset++] = _kMaxByte | ((char >> 6) & 0x3f);
        _currentChunk[offset++] = _kMaxByte | (char & 0x3f);
      }
    }

    _currentChunk[offset++] = _kTokenDoubleQuote;

    _offset = offset;
  }

  void _writeSimpleString(String value) {
    var codeUnits = value.codeUnits;
    _writeBytes(codeUnits, codeUnits.length);
  }

  void writeString(String value) {
    _writeString(value);
    _writeByte(_kTokenComma);
  }

  void writeBool(bool value) {
    _writeSimpleString(value ? _kTrueString : _kFalseString);
    _writeByte(_kTokenComma);
  }

  void writeNumber(num value) {
    String strvalue = value.toString();
    _writeSimpleString(strvalue);
    _writeByte(_kTokenComma);
  }

  void writeBigIntAsString(BigInt value) {
    _writeByte(_kTokenDoubleQuote);
    _writeSimpleString(value.toString());
    _writeByte(_kTokenDoubleQuote);
    _writeByte(_kTokenComma);
  }

  void writeBigInt(BigInt value) {
    _writeSimpleString(value.toString());
    _writeByte(_kTokenComma);
  }

  void writeKey(String key) {
    _writeString(key);
    _writeByte(_kTokenColon);
  }

  void writeLbrack() {
    _writeByte(_kTokenLbrack);
  }

  void writeRbrack() {
    if (_currentChunk[_offset - 1] == _kTokenComma) {
      _currentChunk[_offset - 1] = _kTokenRbrack;
      _writeByte(_kTokenComma);
    } else {
      _ensure(2);
      _currentChunk[_offset++] = _kTokenRbrack;
      _currentChunk[_offset++] = _kTokenComma;
    }
  }

  Uint8List takeBytes() {
    if (_currentChunk[_offset - 1] == _kTokenComma) {
      _offset--;
    }

    var size = _chunks.fold<int>(0, (a, b) => a+b.length) + _offset;
    var result = Uint8List(size);
    var offset = 0;
    for (var chunk in _chunks) {
      result.setRange(offset, offset + chunk.length, chunk.buffer);
      offset += chunk.length;
    }

    result.setRange(offset, offset + _offset, _currentChunk);
    return result;
  }
}

class _Chunk {
  final Uint8List buffer;
  final int length;

  _Chunk(this.buffer, this.length);
}