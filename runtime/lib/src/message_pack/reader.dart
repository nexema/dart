import 'dart:convert';
import 'dart:typed_data';

import 'package:messagepack_schema/messagepack_schema.dart';
import 'package:messagepack_schema/src/message_pack/messagepack_codes.dart';

/// Streaming API for unpacking (deserializing) data from msgpack binary format.
///
class MessagePackReader {
  /// Manipulates with provided [Uint8List] to sequentially unpack values.
  MessagePackReader(this._list) : _d = ByteData.view(_list.buffer, _list.offsetInBytes);

  final Uint8List _list;
  final ByteData _d;
  int _offset = 0;
  int _header = 0;

  final _strCodec = const Utf8Codec();

  Map<int, int> get bufKeyed => _bufKeyed();

  Map<int, int> _bufKeyed() {
    final k = <int, int>{};
    
    for(int i = 0; i < _list.length; i++) {
      k[i] = _list[i];
    }
    
    return k;
  }

  Object? read(FieldValueType valueType, {List<FieldValueType>? typeArguments, dynamic customType, SchemaEnum Function(int)? enumResolver}) {
    // read header
    _header = _d.getUint8(_offset);
    
    // null value
    if(_header == kNilCode) {
      _offset++;
      return null;
    }

    // _offset++;

    switch(valueType) {
      case FieldValueType.string: return readString();
      case FieldValueType.boolean: return readBool();
      case FieldValueType.uint8: return readUint8();
      case FieldValueType.uint16: return readUint16();
      case FieldValueType.uint32: return readUint32();
      case FieldValueType.uint64: return readBigInt();
      case FieldValueType.int8: return readInt8();
      case FieldValueType.int16: return readInt16();
      case FieldValueType.int32: return readInt32();
      case FieldValueType.int64: return readInt64();
      case FieldValueType.float32: return readFloat();
      case FieldValueType.float64: return readDouble();
      case FieldValueType.binary: return readUint8List();
      case FieldValueType.list: return readList(typeArguments![0]);
      case FieldValueType.map: return readMap(typeArguments![0], typeArguments[1]);
      case FieldValueType.custom:
        if(customType == null && enumResolver == null) {
          throw ValueNullError("When deserializing custom types, customType or enumResolver argument cannot be null.");
        } 

        if(customType is SchemaType) {
          customType.mergeFrom(readUint8List());
          return customType;
        } else if(enumResolver != null) {
          try {
            int index = readUint8();
            return enumResolver(index);
          } catch(_) {
            throw ValueNullError("When deserializing enum types, enumResolver argument cannot be null");
          }
        } else {
          throw UnimplementedError();
        }
    }
  }

  bool readBool() {
    bool v;
    if (_header == kFalseBoolCode) {
      v = false;
      _offset += 1;
    } else if (_header == kTrueBoolCode) {
      v = true;
      _offset += 1;
    } else {
      throw _formatException('bool', _header);
    }
    return v;
  }

  int readUint8() {
    int v;
    if (_header <= 0x7f || _header >= 0xe0) {
      /// Int value in fixnum range [-32..127] encoded in header 1 byte
      v = _d.getInt8(_offset);
      _offset += 1;
    } else if (_header == kUint8Code) {
      v = _d.getUint8(++_offset);
      _offset += 1;
    } else {
      throw _formatException("uint8", _header);
    }

    return v;
  }

  int readUint16() {
    int v;
    if (_header == kUint16Code) {
      v = _d.getUint16(++_offset);
      _offset += 2;
    } else {
      throw _formatException("uint16", _header);
    }

    return v;
  }

  int readUint32() {
    int v;
    if (_header == kUint32Code) {
      v = _d.getUint32(++_offset);
      _offset += 4;
    } else {
      throw _formatException("uint32", _header);
    }

    return v;
  }

  int readUint64() {
    int v;
    if (_header == kUint64Code) {
      v = _d.getUint64(++_offset);
      _offset += 8;
    } else {
      throw _formatException("uint64", _header);
    }

    return v;
  }

  int readInt8() {
    int v;
    if (_header == kInt8Code) {
      v = _d.getInt8(++_offset);
      _offset += 1;
    } else {
      throw _formatException("int8", _header);
    }

    return v;
  }

  int readInt16() {
    int v;
    if (_header == kInt16Code) {
      v = _d.getInt16(++_offset);
      _offset += 2;
    } else {
      throw _formatException("int16", _header);
    }

    return v;
  }

  int readInt32() {
    int v;
    if (_header == kInt32Code) {
      v = _d.getInt32(++_offset);
      _offset += 4;
    } else {
      throw _formatException("int32", _header);
    }

    return v;
  }

  int readInt64() {
    int v;
    if (_header == kInt64Code) {
      v = _d.getInt64(++_offset);
      _offset += 8;
    } else {
      throw _formatException("int64", _header);
    }

    return v;
  }

  BigInt readBigInt() {
    _offset++;

    BigInt v;
    if(_header == kUint64Code) {
      var buffer = Uint8List.view(_list.buffer, _list.offsetInBytes + _offset, 8);
      v = _readBigInt(buffer);
      _offset += 8;
    } else {
      throw _formatException("uint64", _header);
    }

    return v;
  }

  double readFloat() {
    double? v;
    if (_header == kFloat32Code) {
      v = _d.getFloat32(++_offset);
      _offset += 4;
    } else {
      throw _formatException('float', _header);
    }
    return v;
  }

  double readDouble() {
    double? v;
    if (_header == kFloat64Code) {
      v = _d.getFloat64(++_offset);
      _offset += 8;
    } else {
      throw _formatException('double', _header);
    }
    return v;
  }

  String readString() {
    int len;
    final b = _header;

    /// fixstr 101XXXXX stores a byte array whose len is upto 31 bytes:
    if (b & 0xE0 == 0xA0) {
      len = b & 0x1F;
      _offset += 1;
    } else if (b == kStr8Code) {
      len = _d.getUint8(++_offset);
      _offset += 1;
    } else if (b == kStr16Code) {
      len = _d.getUint16(++_offset);
      _offset += 2;
    } else if (b == kStr32Code) {
      len = _d.getUint32(++_offset);
      _offset += 4;
    } else {
      throw _formatException('String', b);
    }
    final data = Uint8List.view(_list.buffer, _list.offsetInBytes + _offset, len);
    _offset += len;
    return _strCodec.decode(data);
  }

  Object readList(FieldValueType valueType) {
    int length = readListLength();
    switch(valueType) {
      case FieldValueType.string: return List<String>.generate(length, (index) => readHeader().readString());
      case FieldValueType.boolean: return List<bool>.generate(length, (index) => readHeader().readBool());
      case FieldValueType.uint8: return List<int>.generate(length, (index) => readHeader().readUint8());
      case FieldValueType.uint16: return List<int>.generate(length, (index) => readHeader().readUint16());
      case FieldValueType.uint32: return List<int>.generate(length, (index) => readHeader().readUint32());
      case FieldValueType.uint64: return List<BigInt>.generate(length, (index) => readHeader().readBigInt());
      case FieldValueType.int8: return List<int>.generate(length, (index) => readHeader().readInt8());
      case FieldValueType.int16: return List<int>.generate(length, (index) => readHeader().readInt16());
      case FieldValueType.int32: return List<int>.generate(length, (index) => readHeader().readInt32());
      case FieldValueType.int64: return List<int>.generate(length, (index) => readHeader().readInt64());
      case FieldValueType.float32: return List<double>.generate(length, (index) => readHeader().readFloat());
      case FieldValueType.float64: return List<double>.generate(length, (index) => readHeader().readDouble());
      default: throw "List does not support argument of type $valueType";
    }
  }

  Object readMap(FieldValueType keyType, FieldValueType valueType) {
    int length = readMapLength();
    switch(keyType) {
      case FieldValueType.string:
        switch(valueType) {
          case FieldValueType.string: return _getMap<String, String>(length, () => readHeader().readString(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<String, bool>(length, () => readHeader().readString(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<String, BigInt>(length, () => readHeader().readString(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<String, int>(length, () => readHeader().readString(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<String, double>(length, () => readHeader().readString(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<String, double>(length, () => readHeader().readString(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.boolean:
        switch(valueType) {
          case FieldValueType.string: return _getMap<bool, String>(length, () => readHeader().readBool(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<bool, bool>(length, () => readHeader().readBool(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<bool, BigInt>(length, () => readHeader().readBool(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<bool, int>(length, () => readHeader().readBool(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<bool, double>(length, () => readHeader().readBool(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<bool, double>(length, () => readHeader().readBool(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.uint8:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readUint8(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readUint8(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readUint8(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readUint8(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readUint8(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readUint8(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.uint16:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readUint16(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readUint16(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readUint16(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readUint16(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readUint16(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readUint16(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.uint32:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readUint32(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readUint32(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readUint32(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readUint32(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readUint32(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readUint32(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.uint64:
        switch(valueType) {
          case FieldValueType.string: return _getMap<BigInt, String>(length, () => readHeader().readBigInt(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<BigInt, bool>(length, () => readHeader().readBigInt(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<BigInt, BigInt>(length, () => readHeader().readBigInt(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<BigInt, int>(length, () => readHeader().readBigInt(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<BigInt, double>(length, () => readHeader().readBigInt(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<BigInt, double>(length, () => readHeader().readBigInt(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.int8:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readInt8(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readInt8(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readInt8(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readInt8(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readInt8(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readInt8(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.int16:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readInt16(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readInt16(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readInt16(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readInt16(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readInt16(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readInt16(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.int32:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readInt32(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readInt32(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readInt32(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readInt32(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readInt32(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readInt32(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.int64:
        switch(valueType) {
          case FieldValueType.string: return _getMap<int, String>(length, () => readHeader().readInt64(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<int, bool>(length, () => readHeader().readInt64(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<int, BigInt>(length, () => readHeader().readInt64(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<int, int>(length, () => readHeader().readInt64(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<int, double>(length, () => readHeader().readInt64(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<int, double>(length, () => readHeader().readInt64(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.float32:
        switch(valueType) {
          case FieldValueType.string: return _getMap<double, String>(length, () => readHeader().readFloat(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<double, bool>(length, () => readHeader().readFloat(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<double, BigInt>(length, () => readHeader().readFloat(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<double, int>(length, () => readHeader().readFloat(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<double, double>(length, () => readHeader().readFloat(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<double, double>(length, () => readHeader().readFloat(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      case FieldValueType.float64:
        switch(valueType) {
          case FieldValueType.string: return _getMap<double, String>(length, () => readHeader().readDouble(), () => readHeader().readString());
          case FieldValueType.boolean: return _getMap<double, bool>(length, () => readHeader().readDouble(), () => readHeader().readBool());
          case FieldValueType.uint8: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readUint8());
          case FieldValueType.uint16: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readUint16());
          case FieldValueType.uint32: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readUint32());
          case FieldValueType.uint64: return _getMap<double, BigInt>(length, () => readHeader().readDouble(), () => readHeader().readBigInt());
          case FieldValueType.int8: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readInt8());
          case FieldValueType.int16: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readInt16());
          case FieldValueType.int32: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readInt32());
          case FieldValueType.int64: return _getMap<double, int>(length, () => readHeader().readDouble(), () => readHeader().readInt64());
          case FieldValueType.float32: return _getMap<double, double>(length, () => readHeader().readDouble(), () => readHeader().readFloat());
          case FieldValueType.float64: return _getMap<double, double>(length, () => readHeader().readDouble(), () => readHeader().readFloat());
          default: throw UnimplementedError("");
        }

      default:
        throw UnimplementedError("Map key cannot be of type $keyType.");
    }
  }

  int readListLength() {
    final b = _d.getUint8(_offset);
    int len;
    if (b & 0xF0 == 0x90) {
      len = b & 0xF;
      _offset += 1;
    } else if (b == kArray16Code) {
      len = _d.getUint16(++_offset);
      _offset += 2;
    } else if (b == kArray32Code) {
      len = _d.getUint32(++_offset);
      _offset += 4;
    } else {
      throw _formatException('List length', b);
    }
    return len;
  }

  int readMapLength() {
    final b = _d.getUint8(_offset);
    int len;
    if (b & 0xF0 == 0x80) {
      len = b & 0xF;
      _offset += 1;
    } else if (b == kMap16Code) {
      len = _d.getUint16(++_offset);
      _offset += 2;
    } else if (b == kMap32Code) {
      len = _d.getUint32(++_offset);
      _offset += 4;
    } else {
      throw _formatException('Map length', b);
    }
    return len;
  }

  Uint8List readUint8List() {
    int len;
    if (_header == kBin8Code) {
      len = _d.getUint8(++_offset);
      _offset += 1;
    } else if (_header == kBin16Code) {
      len = _d.getUint16(++_offset);
      _offset += 2;
    } else if (_header == kBin32Code) {
      len = _d.getUint32(++_offset);
      _offset += 4;
    } else {
      throw _formatException('Binary', _header);
    }
    final data = Uint8List.view(_list.buffer, _list.offsetInBytes + _offset, len);
    _offset += len;
    return data;
  }

  MessagePackReader readHeader() {
    // read header
    _header = _d.getUint8(_offset);
    return this;
  }

  bool tryReadNull() {
    _header = _d.getUint8(_offset);
    
    // null value
    if(_header == kNilCode) {
      return true;
    }

    return false;
  }

  Exception _formatException(String type, int b) => FormatException('Try to unpack $type value, but it\'s not an $type, byte = 0x${b.toRadixString(16)} (${kMessagePackCodeNames[b] ?? 'unknown'})');

  Map<K, V> _getMap<K, V>(int length, K Function() keyGet, V Function() valueGet) {
    var map = <K, V>{};
    for(int i = 0; i < length; i++) {
      var key = keyGet();
      var value = valueGet();
      map[key] = value;
      // _offset--;
    }

    return map;
  }

  static BigInt _readBigInt(Uint8List bytes) {
    BigInt result = BigInt.zero;

    for (final byte in bytes) {
      // reading in big-endian, so we essentially concat the new byte to the end
      result = (result << 8) | BigInt.from(byte & 0xff);
    }
    return result;
  }
}