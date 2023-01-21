import 'dart:convert';
import 'dart:typed_data';

import 'package:nexema/nexema.dart';
import 'package:nexema/src/constants/numbers.dart';
import 'package:nexema/src/encoder/spec.dart';

/// Binary serialization for Nexema.
class NexemabWriter {
  
  /// Create a new NexemabWriter with a initial bufferSize.
  NexemabWriter([int bufferSize = 128]) : _bufferSize = bufferSize {
    _createBuffer(_bufferSize);
  }

  final _builder = BytesBuilder(copy: false);
  final _utf8Codec = const Utf8Codec();
  late Uint8List _currentBuffer;
  late ByteData _currentBufferView;
  int _bufferSize;
  int _offset = 0;

  void _createBuffer(int size) {
    _currentBuffer = Uint8List(size);
    _currentBufferView = ByteData.view(_currentBuffer.buffer, _currentBuffer.offsetInBytes);
    _offset = 0;
  }

  void _nextBuf() {
    _flushBuf();
    _bufferSize = _bufferSize *= 2;
    _createBuffer(_bufferSize);
  }

  /// Flush [_currentBuffer] to [_builder] when [_currentBuffer] if almost full
  /// or when packer completes his job and transforms to bytes
  void _flushBuf() {
    _builder.add(Uint8List.view(
      _currentBuffer.buffer,
      _currentBuffer.offsetInBytes,
      _offset,
    ));
  }

  /// Pack binary and string uses this internally.
  void _writeRawBytes(List<int> bytes, [int? length]) {
    length ??= bytes.length;
    
    // need a new buffer
    if (_currentBuffer.length - _offset < length) {
      _nextBuf();
    }

    if (_offset == 0) {
      _builder.add(bytes);
    } else {
      _currentBuffer.setRange(_offset, _offset + length, bytes);
      _offset += length;
    }
  }

  /// Ensure checks if the current buffer has enough space to hold n bytes
  void _ensure(int n) {
    if(_currentBuffer.length - _offset < n) {
      _nextBuf();
    }
  }

  NexemabWriter encodeNull() {
    _ensure(1);
    _currentBufferView.setUint8(_offset++, kNull);
    return this;
  }

  NexemabWriter encodeBool(bool v) {
    _ensure(1);
    _currentBufferView.setUint8(_offset++, v ? kBoolTrue : kBoolFalse);
    return this;
  }

  NexemabWriter encodeUint8(int v) {
    if(v > Numbers.uint8MaxValue) {
      throw FormatError("uint8 value must be less than or equals to ${Numbers.uint8MaxValue}.");
    } else if(v < Numbers.uint8MinValue) {
      throw FormatError("uint8 value must be greater than or equals to 0.");
    }
    
    _ensure(1);
    _currentBufferView.setUint8(_offset++, v);
    return this;
  }

  NexemabWriter encodeUint16(int v) {
    if(v > Numbers.uint16MaxValue) {
      throw FormatError("uint16 value must be less than or equals to ${Numbers.uint16MaxValue}.");
    } else if(v < 0) {
      throw FormatError("uint16 value must be greater than or equals to 0.");
    }
    
    _ensure(2);
    _currentBufferView.setUint16(_offset, v);
    _offset += 2;
    return this;
  }

  NexemabWriter encodeUint32(int v) {
    if(v > Numbers.uint32MaxValue) {
      throw FormatError("uint32 value must be less than or equals to ${Numbers.uint32MaxValue}.");
    } else if(v < 0) {
      throw FormatError("uint32 value must be greater than or equals to 0.");
    }
    
    _ensure(4);
    _currentBufferView.setUint32(_offset, v);
    _offset += 4;
    return this;
  }

  NexemabWriter encodeUvarint(BigInt v) {
    if(v < BigInt.zero) {
      throw FormatError("uvarint value must be greater than or equals to 0.");
    }

    while(v >= kUvarintMin){
      _ensure(1);
      _currentBufferView.setUint8(_offset++, (v.toUnsigned(8) | kUvarintMin).toInt());
      v >>= 7;
    }

    _currentBufferView.setUint8(_offset++, v.toInt());
    return this;
  }

  NexemabWriter encodeVarint(int v) {
    var ux =  BigInt.from(v) << 1;
    if(v < 0){
      ux = ux^ux;
    }

    return encodeUvarint(ux);
  }

  NexemabWriter encodeInt8(int v) {
    if(v < Numbers.int8MinValue) {
      throw FormatError("int8 value must be greater than or equals to ${Numbers.int8MinValue}.");
    } else if(v > Numbers.int8MaxValue) {
      throw FormatError("int8 value must be less than or equals to ${Numbers.int8MaxValue}.");
    }
    
    _ensure(1);
    _currentBufferView.setInt8(_offset++, v);
    return this;
  }

  NexemabWriter encodeInt16(int v) {
    if(v < Numbers.int16MinValue) {
      throw FormatError("int16 value must be greater than or equals to ${Numbers.int16MinValue}.");
    } else if(v > Numbers.int16MaxValue) {
      throw FormatError("int16 value must be less than or equals to ${Numbers.int16MaxValue}.");
    }
    
    _ensure(2);
    _currentBufferView.setInt16(_offset, v);
    _offset += 2;
    return this;
  }

  NexemabWriter encodeInt32(int v) {
    if(v < Numbers.int32MinValue) {
      throw FormatError("int32 value must be greater than or equals to ${Numbers.int32MinValue}.");
    } else if(v > Numbers.int32MaxValue) {
      throw FormatError("int32 value must be less than or equals to ${Numbers.int32MaxValue}.");
    }
    
    _ensure(4);
    _currentBufferView.setInt32(_offset, v);
    _offset += 4;
    return this;
  }

  NexemabWriter encodeUint64(BigInt v) {
    if(v < BigInt.zero) {
      throw FormatError("uint64 value must be greater than or equals to 0.");
    } else if(v > Numbers.uint64MaxValue) {
      throw FormatError("uint64 value must be less than or equals to ${Numbers.uint64MaxValue}.");
    }

    _ensure(8);
    _currentBufferView.setUint8(_offset++, (v >> 56).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 48).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 40).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 32).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 24).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 16).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 8).toInt());
    _currentBufferView.setUint8(_offset++, v.toUnsigned(8).toInt());

    return this;
  }

  NexemabWriter encodeInt64AsBigInt(BigInt v) {
    if(v < Numbers.int64MinValueBigInt) {
      throw FormatError("int64 value must be greater than or equals to ${Numbers.int64MinValueBigInt}.");
    } else if(v > Numbers.int64MaxValueBigInt) {
      throw FormatError("int64 value must be less than or equals to ${Numbers.int64MaxValueBigInt}.");
    }

    _ensure(8);
    _currentBufferView.setUint8(_offset++, (v >> 56).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 48).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 40).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 32).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 24).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 16).toInt());
    _currentBufferView.setUint8(_offset++, (v >> 8).toInt());
    _currentBufferView.setUint8(_offset++, v.toUnsigned(8).toInt());

    return this;
  }

  NexemabWriter encodeInt64(int v) {
    if(v < Numbers.int64MinValue || v > Numbers.int64MaxValue) {
      throw FormatError("Value ${v.toString()} cannot be represented in int64.");
    }

    _ensure(8);
    _currentBufferView.setInt64(_offset, v);
    _offset += 8;

    return this;
  }

  NexemabWriter encodeFloat32(double v) {
    _ensure(4);
    _currentBufferView.setFloat32(_offset, v);
    _offset += 4;
    return this;
  }

  NexemabWriter encodeFloat64(double v) {
    _ensure(8);
    _currentBufferView.setFloat64(_offset, v);
    _offset += 8;
    return this;
  }

  NexemabWriter encodeString(String v) {
    var stringBuffer = _utf8Codec.encode(v);
    var bufferLength = stringBuffer.length;
    encodeVarint(bufferLength);
    _writeRawBytes(stringBuffer, bufferLength);
    return this;
  }

  NexemabWriter encodeBinary(Uint8List buffer) {
    var length = buffer.length;
    encodeVarint(length);
    _writeRawBytes(buffer, length);
    return this;
  }

  NexemabWriter beginArray(int length) {
    _ensure(1);
    _currentBufferView.setUint8(_offset++, kArrayBegin);
    return encodeVarint(length);
  }

  NexemabWriter beginMap(int length) {
    _ensure(1);
    _currentBufferView.setUint8(_offset++, kMapBegin);
    return encodeVarint(length);
  }

  Uint8List takeBytes() {
    Uint8List bytes;
    if (_builder.isEmpty) {
      bytes = Uint8List.view(
        _currentBuffer.buffer,
        _currentBuffer.offsetInBytes,
        _offset,
      );
    } else {
      _flushBuf();
      bytes = _builder.takeBytes();
    }
    return bytes;
  }
}