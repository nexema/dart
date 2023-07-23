part of 'nexemab.dart';

/// Binary deserialization for Nexema.
class NexemabReader {
  final Uint8List _buffer;
  final ByteData _bufferView;
  int _offset = 0;

  NexemabReader(Uint8List buffer)
      : _buffer = buffer,
        _bufferView = ByteData.view(buffer.buffer, buffer.offsetInBytes);

  bool isNextNull() {
    var byte = _bufferView.getUint8(_offset); // do not advance
    if (byte == _kNull) {
      _offset++;
      return true;
    }

    return false;
  }

  bool decodeBool() {
    return _bufferView.getUint8(_offset++) == _kBoolTrue;
  }

  BigInt decodeUvarint() {
    var x = BigInt.zero;
    var s = 0;

    var b = 0;
    var i = 0;
    while (true) {
      b = _bufferView.getUint8(_offset++);

      if (i == _kMaxVarintLen) {
        throw FormatError("uvarint overflow");
      }

      if (b < _kUvarintMinInt) {
        if (i == _kMaxVarintLen - 1 && b > 1) {
          throw FormatError("uvarint overflow");
        }

        return x | BigInt.from(b) << s;
      }

      x |= BigInt.from(b & 0x7f) << s;
      s += 7;
      i++;
    }
  }

  int decodeVarint() {
    var ux = decodeUvarint();
    var x = ux >> 1;
    if (ux & BigInt.zero != BigInt.zero) {
      x = x ^ x;
    }

    return x.toInt();
  }

  int decodeUint8() {
    return _bufferView.getUint8(_offset++);
  }

  int decodeUint16() {
    int number = _bufferView.getUint16(_offset);
    _offset += 2;
    return number;
  }

  int decodeUint32() {
    int number = _bufferView.getUint32(_offset);
    _offset += 4;
    return number;
  }

  BigInt decodeUint64() {
    return (BigInt.from(_buffer[_offset++]) << 56) |
        (BigInt.from(_buffer[_offset++]) << 48) |
        (BigInt.from(_buffer[_offset++]) << 40) |
        (BigInt.from(_buffer[_offset++]) << 32) |
        (BigInt.from(_buffer[_offset++]) << 24) |
        (BigInt.from(_buffer[_offset++]) << 16) |
        (BigInt.from(_buffer[_offset++]) << 8) |
        BigInt.from(_buffer[_offset++]);
  }

  int decodeInt8() {
    return _bufferView.getInt8(_offset++);
  }

  int decodeInt16() {
    int number = _bufferView.getInt16(_offset);
    _offset += 2;
    return number;
  }

  int decodeInt32() {
    int number = _bufferView.getInt32(_offset);
    _offset += 4;
    return number;
  }

  int decodeInt64() {
    int number = _bufferView.getInt64(_offset);
    _offset += 8;
    return number;
  }

  BigInt decodeInt64AsBigInt() {
    return decodeUint64().toSigned(64);
  }

  double decodeFloat32() {
    double number = _bufferView.getFloat32(_offset);
    _offset += 4;
    return number;
  }

  double decodeFloat64() {
    double number = _bufferView.getFloat64(_offset);
    _offset += 8;
    return number;
  }

  String decodeString() {
    var strlen = decodeVarint();
    var buffer = Uint8List.view(_buffer.buffer, _offset, strlen);
    _offset += strlen;
    return _kUtfCodec.decode(buffer);
  }

  DateTime decodeTimestamp() {
    return DateTime.fromMicrosecondsSinceEpoch(decodeVarint() ~/ 1000);
  }

  Duration decodeDuration() {
    return Duration(microseconds: decodeVarint() ~/ 1000);
  }

  int beginDecodeArray() {
    // read array identifier
    int code = _bufferView.getUint8(_offset++);
    if (code != _kArrayBegin) {
      throw FormatError("not an array.");
    }
    return decodeVarint();
  }

  int beginDecodeMap() {
    // read array identifier
    int code = _bufferView.getUint8(_offset++);
    if (code != _kMapBegin) {
      throw FormatError("not a map.");
    }
    return decodeVarint();
  }

  Uint8List decodeBinary() {
    var buflen = decodeVarint();
    final buffer = Uint8List.view(_buffer.buffer, _offset, buflen); // avoid copies
    _offset += buflen;
    return buffer;
  }
}
