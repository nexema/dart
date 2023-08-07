part of 'nexemab.dart';

/// Binary serialization for Nexema.
class NexemabWriter {
  /// Create a new NexemabWriter with a initial bufferSize.
  NexemabWriter([int bufferSize = 128])
      : assert(bufferSize > 0),
        _bufferSize = bufferSize {
    _createChunk(_bufferSize);
  }

  final _chunksBuilder = BytesBuilder(copy: false);
  late Uint8List _currentChunk;
  late ByteData _currentChunkView;
  int _bufferSize;
  int _offset = 0;

  @pragma('vm:prefer-inline')
  void _createChunk(int size) {
    _currentChunk = Uint8List(size);
    _currentChunkView = ByteData.view(_currentChunk.buffer, _currentChunk.offsetInBytes);
    _offset = 0;
  }

  @pragma('vm:prefer-inline')
  void _nextChunk() {
    _writeCurrentChunk();
    _bufferSize = _bufferSize *= 2;
    _createChunk(_bufferSize);
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
  void _writeRawBytes(List<int> bytes, int length) {
    // need a new buffer
    if (_currentChunk.length - _offset < length) {
      _nextChunk();
    }

    if (_offset == 0) {
      _chunksBuilder.add(bytes);
    } else {
      _currentChunk.setRange(_offset, _offset + length, bytes);
      _offset += length;
    }
  }

  /// Ensure checks if the current buffer has enough space to hold n bytes
  @pragma('vm:prefer-inline')
  void _ensure(int n) {
    if (_currentChunk.length - _offset < n) {
      _nextChunk();
    }
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeNull() {
    _ensure(1);
    _currentChunkView.setUint8(_offset++, _kNull);
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeBool(bool v) {
    _ensure(1);
    _currentChunkView.setUint8(_offset++, v ? _kBoolTrue : _kBoolFalse);
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeUint8(int v) {
    if (v > Numbers.uint8MaxValue) {
      throw FormatError("uint8 value must be less than or equals to ${Numbers.uint8MaxValue}.");
    } else if (v < Numbers.uint8MinValue) {
      throw FormatError("uint8 value must be greater than or equals to 0.");
    }

    _ensure(1);
    _currentChunkView.setUint8(_offset++, v);
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeUint16(int v) {
    if (v > Numbers.uint16MaxValue) {
      throw FormatError("uint16 value must be less than or equals to ${Numbers.uint16MaxValue}.");
    } else if (v < 0) {
      throw FormatError("uint16 value must be greater than or equals to 0.");
    }

    _ensure(2);
    _currentChunkView.setUint16(_offset, v);
    _offset += 2;
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeUint32(int v) {
    if (v > Numbers.uint32MaxValue) {
      throw FormatError("uint32 value must be less than or equals to ${Numbers.uint32MaxValue}.");
    } else if (v < 0) {
      throw FormatError("uint32 value must be greater than or equals to 0.");
    }

    _ensure(4);
    _currentChunkView.setUint32(_offset, v);
    _offset += 4;
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeUvarint(BigInt v) {
    if (v < BigInt.zero) {
      throw FormatError("uvarint value must be greater than or equals to 0.");
    }

    while (v >= _kUvarintMin) {
      _ensure(1);
      _currentChunkView.setUint8(_offset++, (v.toUnsigned(8) | _kUvarintMin).toInt());
      v >>= 7;
    }

    _ensure(1);
    _currentChunkView.setUint8(_offset++, v.toInt());
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeVarint(int v) {
    var ux = BigInt.from(v) << 1;
    if (v < 0) {
      ux = ux ^ ux;
    }

    return encodeUvarint(ux);
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeInt8(int v) {
    if (v < Numbers.int8MinValue) {
      throw FormatError("int8 value must be greater than or equals to ${Numbers.int8MinValue}.");
    } else if (v > Numbers.int8MaxValue) {
      throw FormatError("int8 value must be less than or equals to ${Numbers.int8MaxValue}.");
    }

    _ensure(1);
    _currentChunkView.setInt8(_offset++, v);
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeInt16(int v) {
    if (v < Numbers.int16MinValue) {
      throw FormatError("int16 value must be greater than or equals to ${Numbers.int16MinValue}.");
    } else if (v > Numbers.int16MaxValue) {
      throw FormatError("int16 value must be less than or equals to ${Numbers.int16MaxValue}.");
    }

    _ensure(2);
    _currentChunkView.setInt16(_offset, v);
    _offset += 2;
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeInt32(int v) {
    if (v < Numbers.int32MinValue) {
      throw FormatError("int32 value must be greater than or equals to ${Numbers.int32MinValue}.");
    } else if (v > Numbers.int32MaxValue) {
      throw FormatError("int32 value must be less than or equals to ${Numbers.int32MaxValue}.");
    }

    _ensure(4);
    _currentChunkView.setInt32(_offset, v);
    _offset += 4;
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeUint64(BigInt v) {
    if (v < BigInt.zero) {
      throw FormatError("uint64 value must be greater than or equals to 0.");
    } else if (v > Numbers.uint64MaxValue) {
      throw FormatError("uint64 value must be less than or equals to ${Numbers.uint64MaxValue}.");
    }

    _ensure(8);
    _currentChunkView.setUint8(_offset++, (v >> 56).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 48).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 40).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 32).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 24).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 16).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 8).toInt());
    _currentChunkView.setUint8(_offset++, v.toUnsigned(8).toInt());

    return this;
  }

  NexemabWriter encodeInt64AsBigInt(BigInt v) {
    if (v < Numbers.int64MinValueBigInt) {
      throw FormatError(
          "int64 value must be greater than or equals to ${Numbers.int64MinValueBigInt}.");
    } else if (v > Numbers.int64MaxValueBigInt) {
      throw FormatError(
          "int64 value must be less than or equals to ${Numbers.int64MaxValueBigInt}.");
    }

    _ensure(8);
    _currentChunkView.setUint8(_offset++, (v >> 56).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 48).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 40).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 32).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 24).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 16).toInt());
    _currentChunkView.setUint8(_offset++, (v >> 8).toInt());
    _currentChunkView.setUint8(_offset++, v.toUnsigned(8).toInt());

    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeInt64(int v) {
    _ensure(8);
    _currentChunkView.setInt64(_offset, v);
    _offset += 8;

    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeFloat32(double v) {
    _ensure(4);
    _currentChunkView.setFloat32(_offset, v);
    _offset += 4;
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeFloat64(double v) {
    _ensure(8);
    _currentChunkView.setFloat64(_offset, v);
    _offset += 8;
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeString(String v) {
    var stringBuffer = _kUtfCodec.encode(v);
    var bufferLength = stringBuffer.length;
    encodeVarint(bufferLength);
    _writeRawBytes(stringBuffer, bufferLength);
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeBinary(Uint8List buffer) {
    var length = buffer.length;
    encodeVarint(length);
    _writeRawBytes(buffer, length);
    return this;
  }

  @pragma('vm:prefer-inline')
  NexemabWriter beginArray(int length) {
    _ensure(1);
    _currentChunkView.setUint8(_offset++, _kArrayBegin);
    return encodeVarint(length);
  }

  @pragma('vm:prefer-inline')
  NexemabWriter beginMap(int length) {
    _ensure(1);
    _currentChunkView.setUint8(_offset++, _kMapBegin);
    return encodeVarint(length);
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeTimestamp(DateTime v) {
    return encodeVarint(v.microsecondsSinceEpoch * 1000);
  }

  @pragma('vm:prefer-inline')
  NexemabWriter encodeDuration(Duration v) {
    return encodeVarint(v.inMicroseconds * 1000);
  }

  @pragma('vm:prefer-inline')
  Uint8List takeBytes() {
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
    print("took bytes: $bytes");
    return bytes;
  }
}
