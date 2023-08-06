part of 'nexemaj.dart';

/// Nexemaj is the JSON serialization lib for Nexema.
class NexemajWriter {
  final _chunksBuilder = BytesBuilder(copy: false);

  Uint8List _currentChunk;

  int _bufferSize;
  int _offset;

  NexemajWriter([int initialSize = 1024])
      : assert(initialSize > 0),
        _bufferSize = initialSize,
        _offset = 0,
        _currentChunk = Uint8List(initialSize);

  @pragma('vm:prefer-inline')
  void _nextChunk() {
    _writeCurrentChunk();
    _bufferSize = _bufferSize *= 2;
    _createChunk(_bufferSize);
  }

  @pragma('vm:prefer-inline')
  void _createChunk(int size) {
    _currentChunk = Uint8List(size);
    _offset = 0;
  }

  @pragma('vm:prefer-inline')
  void _writeCurrentChunk() {
    _chunksBuilder.add(Uint8List.view(
      _currentChunk.buffer,
      _currentChunk.offsetInBytes,
      _offset,
    ));
  }

  @pragma('vm:prefer-inline')
  void _ensure(int n) {
    if (_currentChunk.length - _offset < n) {
      _nextChunk();
    }
  }

  /// Only method used to write bytes. This is faster than using ByteData
  @pragma('vm:prefer-inline')
  void _writeByte(int byte) {
    _ensure(1);
    _currentChunk[_offset++] = byte;
  }

  @pragma('vm:prefer-inline')
  void writeLbrace() {
    _writeByte(_kTokenLbrace);
  }

  @pragma('vm:prefer-inline')
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

  @pragma('vm:prefer-inline')
  void writeComma() {
    _writeByte(_kTokenComma);
  }

  void _writeString(String value) {
    _ensure(value.length * 3 + 3);
    var offset = _offset;
    final chars = value.codeUnits;

    _currentChunk[offset++] = _kTokenDoubleQuote;
    for (int i = 0; i < value.length; i++) {
      final char = chars[i];
      switch (char) {
        case _kTokenDoubleQuote:
        case _kTokenBackslash:
        case _kTokenBackspace:
        case _kTokenNewline:
        case _kTokenCarriageReturn:
        case _kTokenTab:
          _currentChunk[offset++] = _kTokenBackslash;
          _currentChunk[offset++] = char;
          break;

        case < _kOneByteChar:
          _currentChunk[offset++] = char;
          break;

        case < _kTwoBytesLimit:
          _currentChunk[offset++] = 0xC0 | (char >> 6);
          _currentChunk[offset++] = _kMaxByte | (char & 0x3f);
          break;

        default:
          final surrogateMask = char & _kSurrogateMask;
          if (surrogateMask == _kLeadSurrogateMin) {
            final nextChar = chars[++i];
            final rune =
                0x10000 + ((char & _kSurrogateValueMask) << 10) | (nextChar & _kSurrogateValueMask);
            _currentChunk[offset++] = 0xF0 | (rune >> 18);
            _currentChunk[offset++] = _kMaxByte | ((rune >> 12) & 0x3f);
            _currentChunk[offset++] = _kMaxByte | ((rune >> 6) & 0x3f);
            _currentChunk[offset++] = _kMaxByte | (rune & 0x3f);
          } else {
            _currentChunk[offset++] = 0xE0 | (char >> 12);
            _currentChunk[offset++] = _kMaxByte | ((char >> 6) & 0x3f);
            _currentChunk[offset++] = _kMaxByte | (char & 0x3f);
          }
          break;
      }
    }
    _currentChunk[offset++] = _kTokenDoubleQuote;
    _offset = offset;
  }

  @pragma('vm:prefer-inline')
  void _writeSimpleString(String value) {
    final length = value.length;
    _ensure(length);
    for (int i = 0; i < length; i++) {
      final char = value.codeUnitAt(i);
      _currentChunk[_offset++] = char;
    }
  }

  @pragma('vm:prefer-inline')
  void writeString(String value) {
    _writeString(value);
    _writeByte(_kTokenComma);
  }

  @pragma('vm:prefer-inline')
  void writeBool(bool value) {
    _writeSimpleString(value ? _kTrueString : _kFalseString);
    _writeByte(_kTokenComma);
  }

  @pragma('vm:prefer-inline')
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

  @pragma('vm:prefer-inline')
  void writeKey(String key) {
    _ensure(key.length + 3);
    _currentChunk[_offset++] = _kTokenDoubleQuote;
    for (int i = 0; i < key.length; i++) {
      _currentChunk[_offset++] = key.codeUnitAt(i);
    }
    _currentChunk[_offset++] = _kTokenDoubleQuote;
    _currentChunk[_offset++] = _kTokenColon;
  }

  @pragma('vm:prefer-inline')
  void writeLbrack() {
    _writeByte(_kTokenLbrack);
  }

  @pragma('vm:prefer-inline')
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

    Uint8List bytes;
    if (_chunksBuilder.isEmpty) {
      bytes = Uint8List.view(
        _currentChunk.buffer,
        _currentChunk.offsetInBytes,
        _offset,
      );
    } else {
      _writeCurrentChunk();
      bytes = _chunksBuilder.takeBytes();
    }

    return bytes;
  }
}
