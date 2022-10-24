import 'dart:convert';
import 'dart:typed_data';

import 'package:messagepack_schema/messagepack_schema.dart';
import 'package:messagepack_schema/src/message_pack/messagepack_codes.dart';

/// Streaming API for packing (serializing) data to msgpack binary format.
///
/// Packer provide API for manually packing your data item by item in serial / streaming manner.
/// Use methods packXXX, where XXX is type names. Methods can take value and `null`.
/// If `null` provided for packXXX method it will be packed to `null` implicitly.
/// For explicitly packing `null` separate packNull function exist.
///
/// Streaming packing requires buffer to collect your data.
/// Try to figure out the best initial size of this buffer, that minimal enough to fit your most common data packing scenario.
/// Try to find balance. Provide this value in constructor [Packer()]
class MessagePackWriter {
  /// Provide the [_bufSize] size, that minimal enough to fit your most used data packets.
  /// Try to find balance, small buffer is good, and if most of your data will fit to it, performance will be good.
  /// If buffer not enough it will be increased automatically.
  MessagePackWriter([this._bufSize = 64]) {
    _newBuf(_bufSize);
  }

  int _bufSize;

  late Uint8List _buf;
  late ByteData _d;
  int _offset = 0;

  Map<int, int> get bufKeyed => _bufKeyed();

  Map<int, int> _bufKeyed() {
    final k = <int, int>{};
    
    for(int i = 0; i < _buf.length; i++) {
      k[i] = _buf[i];
    }
    
    return k;
  }

  void _newBuf(int size) {
    _buf = Uint8List(size);
    _d = ByteData.view(_buf.buffer, _buf.offsetInBytes);
    _offset = 0;
  }

  final _builder = BytesBuilder(copy: false);
  final _strCodec = const Utf8Codec();

  void _nextBuf() {
    _flushBuf();
    _bufSize = _bufSize *= 2;
    _newBuf(_bufSize);
  }

  /// Flush [_buf] to [_builder] when [_buf] if almost full
  /// or when packer completes his job and transforms to bytes
  void _flushBuf() {
    _builder.add(Uint8List.view(
      _buf.buffer,
      _buf.offsetInBytes,
      _offset,
    ));
  }

  /// Pack binary and string uses this internally.
  void _putBytes(List<int> bytes) {
    final length = bytes.length;
    if (_buf.length - _offset < length) _nextBuf();
    if (_offset == 0) {
      /// buf flushed to builder, next new buf created, so we can write directly to builder
      _builder.add(bytes);
    } else {
      /// buf has space for us
      _buf.setRange(_offset, _offset + length, bytes);
      _offset += length;
    }
  }

  void write(FieldValueType valueType, dynamic value, [List<FieldValueType>? typeArguments]) {
    if(value == null) {
      writeNull();
      return;
    }
 
    switch(valueType) {
      case FieldValueType.string:
        writeString(value);
        break;

      case FieldValueType.boolean:
        writeBool(value);
        break;

      case FieldValueType.uint8:
        writeUint8(value);
        break;

      case FieldValueType.uint16:
        writeUint16(value);
        break;

      case FieldValueType.uint32:
        writeUint32(value);
        break;

      case FieldValueType.uint64:
        writeBigInt(value);
        break;

      case FieldValueType.int8:
        writeInt8(value);
        break;

      case FieldValueType.int16:
        writeInt16(value);
        break;

      case FieldValueType.int32:
        writeInt32(value);
        break;

      case FieldValueType.int64:
        writeInt64(value);
        break;

      case FieldValueType.float32:
        writeFloat(value);
        break;

      case FieldValueType.float64:
        writeDouble(value);
        break;

      case FieldValueType.binary:
        writeBinary(value);
        break;

      case FieldValueType.list:
        writeList(value, typeArguments!.first);
        break;

      case FieldValueType.map:
        writeMap(value, typeArguments![0], typeArguments[1]);
        
        break;

      case FieldValueType.custom:
        if(value is SchemaType) {
          var buf = value.serialize();
          writeBinary(buf);
        } else {
          var e = value as SchemaEnum;
          writeUint8(e.index);
        }
        break;
    }
  }

  MessagePackWriter writeNull() {
    if (_buf.length - _offset < 1) _nextBuf();
    _d.setUint8(_offset++, kNilCode);
    return this;
  }

  MessagePackWriter writeBool(bool v) {
    if (_buf.length - _offset < 1) _nextBuf();
    _d.setUint8(_offset++, v ? kTrueBoolCode : kFalseBoolCode);
    return this;
  }

  MessagePackWriter writeUint8(int v) {
    if(v > 0xFF) {
      throw FormatError("uint8 value must be less than ${0xFF}");
    } else if(v < 0) {
      throw FormatError("uint8 value must be greater than -1");
    }
    
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kUint8Code);
    _d.setUint8(_offset++, v);
    return this;
  }

  MessagePackWriter writeUint16(int v) {
    if(v > 0xFFFF) {
      throw FormatError("uint16 value must be less than ${0xFFFF}");
    } else if(v < 0) {
      throw FormatError("uint16 value must be greater than -1");
    }
    
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kUint16Code);
    _d.setUint16(_offset, v);
    _offset += 2;
    return this;
  }

  MessagePackWriter writeUint32(int v) {
    if(v > 0xFFFFFFFF) {
      throw FormatError("uint32 value must be less than ${0xFFFFFFFF}");
    } else if(v < 0) {
      throw FormatError("uint32 value must be greater than -1");
    }
    
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kUint32Code);
    _d.setUint32(_offset, v);
    _offset += 4;
    return this;
  }

  MessagePackWriter writeUint64(int v) {
    if(v < 0) {
      throw FormatError("uint64 value must be greater than -1");
    }

    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kUint64Code);
    _d.setUint64(_offset, v);
    _offset += 8;
    return this;
  }

  MessagePackWriter writeBigInt(BigInt v) {
    if(_buf.length - _offset < 9) _nextBuf();

    _d.setUint8(_offset, kUint64Code);
    var buf = _encodeBigInt(v).reversed.toList();

    int getByte(int index) {
      try {
        return buf[index];
      } catch(_) {
        return 0;
      }
    }

    _d.setUint8(++_offset, getByte(7));
    _d.setUint8(++_offset, getByte(6));
    _d.setUint8(++_offset, getByte(5));
    _d.setUint8(++_offset, getByte(4));
    _d.setUint8(++_offset, getByte(3));
    _d.setUint8(++_offset, getByte(2));
    _d.setUint8(++_offset, getByte(1));
    _d.setUint8(++_offset, getByte(0));
    _offset++;
    return this;
  }
  
  MessagePackWriter writeInt8(int v) {
    if(v < -128) {
      throw FormatError("int8 value must be greater than -128");
    } else if(v > 127) {
      throw FormatError("int8 value must be less than 127");
    }
    
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kInt8Code);
    _d.setInt8(_offset++, v);
    return this;
  }

  MessagePackWriter writeInt16(int v) {
    if(v < -32768) {
      throw FormatError("int16 value must be greater than -32769");
    } else if(v > 32767) {
      throw FormatError("int16 value must be less than 32767");
    }
    
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kInt16Code);
    _d.setInt16(_offset, v);
    _offset += 2;
    return this;
  }

  MessagePackWriter writeInt32(int v) {
    if(v < -2147483648) {
      throw FormatError("int32 value must be greater than -2147483648, given: $v");
    } else if(v > 2147483647) {
      throw FormatError("int32 value must be less than 2147483647, given: $v");
    }
    
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kInt32Code);
    _d.setInt32(_offset, v);
    _offset += 4;
    return this;
  }

  MessagePackWriter writeInt64(int v) {
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kInt64Code);
    _d.setInt64(_offset, v);
    _offset += 8;
    return this;
  }

  MessagePackWriter writeDouble(double v) {
    // 8 byte double + 1 control byte
    if (_buf.length - _offset < 9) _nextBuf();
    _d.setUint8(_offset++, kFloat64Code);
    _d.setFloat64(_offset, v);
    _offset += 8;
    return this;
  }

  MessagePackWriter writeFloat(double v) {
    // 4 byte double + 1 control byte
    if (_buf.length - _offset < 5) _nextBuf();
    _d.setUint8(_offset++, kFloat32Code);
    _d.setFloat32(_offset, v);
    _offset += 4;
    return this;
  }

  MessagePackWriter writeString(String v) {
    // max 4 byte str header + 1 control byte
    if (_buf.length - _offset < 5) _nextBuf();
    final encoded = _strCodec.encode(v);
    final length = encoded.length;
    if (length <= 31) {
      _d.setUint8(_offset++, 0xA0 | length);
    } else if (length <= 0xFF) {
      _d.setUint8(_offset++, kStr8Code);
      _d.setUint8(_offset++, length);
    } else if (length <= 0xFFFF) {
      _d.setUint8(_offset++, kStr16Code);
      _d.setUint16(_offset, length);
      _offset += 2;
    } else if (length <= 0xFFFFFFFF) {
      _d.setUint8(_offset++, kStr32Code);
      _d.setUint32(_offset, length);
      _offset += 4;
    } else {
      throw ArgumentError('Max String length is 0xFFFFFFFF');
    }
    _putBytes(encoded);
    return this;
  }

  MessagePackWriter writeBinary(Uint8List buffer) {
    // max 4 byte binary header + 1 control byte
    if (_buf.length - _offset < 5) _nextBuf();
    final length = buffer.length;
    if (length <= 0xFF) {
      _d.setUint8(_offset++, kBin8Code);
      _d.setUint8(_offset++, length);
    } else if (length <= 0xFFFF) {
      _d.setUint8(_offset++, kBin16Code);
      _d.setUint16(_offset, length);
      _offset += 2;
    } else if (length <= 0xFFFFFFFF) {
      _d.setUint8(_offset++, kBin32Code);
      _d.setUint32(_offset, length);
      _offset += 4;
    } else {
      throw ArgumentError('Max binary length is 0xFFFFFFFF');
    }
    _putBytes(buffer);
    return this;
  }

  MessagePackWriter writeList(List v, FieldValueType typeArgument) {
    writeListLength(v.length);
    for(var item in v) {
      write(typeArgument, item);
    }
    return this;
  }

  MessagePackWriter writeMap(Map v, FieldValueType keyTypeArgument, FieldValueType valueTypeArgument) {
    writeMapLength(v.length);
    for(var entry in v.entries) {
      write(keyTypeArgument, entry.key);
      write(valueTypeArgument, entry.value);
    }
    return this;
  }

  MessagePackWriter writeListLength(int length) {
    // max 4 length header + 1 control byte
    if (_buf.length - _offset < 5) _nextBuf();
    if (length <= 0xF) {
      _d.setUint8(_offset++, 0x90 | length);
    } else if (length <= 0xFFFF) {
      _d.setUint8(_offset++, kArray16Code);
      _d.setUint16(_offset, length);
      _offset += 2;
    } else if (length <= 0xFFFFFFFF) {
      _d.setUint8(_offset++, kArray32Code);
      _d.setUint32(_offset, length);
      _offset += 4;
    } else {
      throw ArgumentError('Max list length is 0xFFFFFFFF');
    }
    return this;
  }

  MessagePackWriter writeMapLength(int length) {
    // max 4 byte header + 1 control byte
    if (_buf.length - _offset < 5) _nextBuf();
    if (length <= 0xF) {
      _d.setUint8(_offset++, 0x80 | length);
    } else if (length <= 0xFFFF) {
      _d.setUint8(_offset++, kMap16Code);
      _d.setUint16(_offset, length);
      _offset += 2;
    } else if (length <= 0xFFFFFFFF) {
      _d.setUint8(_offset++, kMap32Code);
      _d.setUint32(_offset, length);
      _offset += 4;
    } else {
      throw ArgumentError('Max map length is 0xFFFFFFFF');
    }
    return this;
  }

  Uint8List takeBytes() {
    Uint8List bytes;
    if (_builder.isEmpty) {
      bytes = Uint8List.view(
        _buf.buffer,
        _buf.offsetInBytes,
        _offset,
      );
    } else {
      _flushBuf();
      bytes = _builder.takeBytes();
    }
    return bytes;
  }

  static Uint8List _encodeBigInt(BigInt number) {
    int bytes = (number.bitLength + 7) >> 3;
    var b256 = BigInt.from(256);
    var result = Uint8List(bytes);
    for (int i = 0; i < bytes; i++) {
      result[bytes - 1 - i] = number.remainder(b256).toInt();
      number = number >> 8;
    }
    return result;
  }
}