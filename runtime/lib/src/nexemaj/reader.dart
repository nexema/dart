part of 'nexemaj.dart';

/// Nexemaj is the JSON serialization lib for Nexema.
class NexemajReader {
  final Uint8List _buffer;
  int _offset;

  String get currentTokenString => String.fromCharCode(_buffer[_offset]);

  NexemajReader(Uint8List buffer, [int offset = 0])
      : _buffer = buffer,
        _offset = offset;

  /// Returns the current [JsonType].
  JsonType get currentType => _current();

  /// Indicates if the reader has a next token to read.
  bool get hasNextToken => _offset < _buffer.length;

  @pragma('vm:prefer-inline')
  void _skipWhitespace() {
    while (_buffer[_offset] <= _kTokenWhitespace) {
      _offset++;
    }
  }

  @pragma('vm:prefer-inline')
  void advance() {
    switch (_buffer[_offset]) {
      case _kTokenComma || _kTokenRbrace:
        _offset++;
        break;
      default:
        _expectCharErr('} or ,');
    }
  }

  @pragma('vm:prefer-inline')
  bool readBool() {
    _skipWhitespace();
    switch (_buffer[_offset]) {
      case _kTChar:
        _offset += 4;
        return true;
      case _kFChar:
        _offset += 5;
        return false;
      default:
        _expectErr(JsonType.boolean);
    }
  }

  @pragma('vm:prefer-inline')
  String readString() {
    _skipWhitespace();
    if (_buffer[_offset] != _kTokenDoubleQuote) {
      _expectErr(JsonType.string);
    }

    _offset++;
    int start = _offset;
    while (_buffer[_offset] != _kTokenDoubleQuote) {
      _offset++;
    }

    final result = String.fromCharCodes(_buffer, start, _offset);
    _offset++;
    return result;
  }

  @pragma('vm:prefer-inline')
  String readObjectKey() {
    final key = readString();
    if (_buffer[_offset] != _kTokenColon) {
      _expectCharErr(":");
    }
    _offset++;
    return key;
  }

  @pragma('vm:prefer-inline')
  int readInt() {
    return _readNum().toInt();
  }

  @pragma('vm:prefer-inline')
  double readFloat() {
    return _readNum().toDouble();
  }

  BigInt readBigInt() {
    _skipWhitespace();

    _offset++; // skip initial "
    final start = _offset;
    bool isFloatingPoint = false;
    bool isExponential = false;

    LOOP:
    while (_offset < _buffer.length) {
      final charCode = _buffer[_offset];
      switch (charCode) {
        case 46: // dot
          isFloatingPoint = true;
          _offset++;
          break;

        case >= 48 && <= 57: // digit
          _offset++;
          break;

        case 101 || 69: // 'e' or 'E' found, indicates an exponential number
          isExponential = true;
          _offset++;
          // Skip optional '+' or '-' sign in exponent
          if (_offset < _buffer.length) {
            final sign = _buffer[_offset];
            if (sign == 43 || sign == 45) {
              _offset++;
            }
          }

        default:
          break LOOP;
      }
    }

    if (isFloatingPoint || isExponential) {
      // Parse the fractional part and/or exponent
      while (_offset < _buffer.length && _isDigit(_buffer[_offset])) {
        _offset++;
      }
    }

    final numberString = String.fromCharCodes(_buffer, start, _offset);
    _offset++; // skip last "
    return BigInt.parse(numberString, radix: 10);
  }

  @pragma('vm:prefer-inline')
  Uint8List readBase64Binary() {
    final base64 = readString();
    return _kBase64Decoder.convert(base64);
  }

  @pragma('vm:prefer-inline')
  DateTime readTimestamp() {
    final value = readString();
    return DateTime.parse(value);
  }

  Duration readDuration() {
    final input = readString();

    double days = 0, hours = 0, minutes = 0, microseconds = 0, nanoseconds = 0;
    bool hasFractionalPart = false;

    final parts = input.split(_durationRegexp);

    for (var part in parts) {
      if (part.isEmpty) continue;
      final unit = input[input.indexOf(part) + part.length];
      final value = double.parse(part);

      switch (unit) {
        case 'd':
          days = value;
          break;
        case 'h':
          hours = value;
          break;
        case 'm':
          minutes = value;
          break;
        case 's':
          microseconds = value * Duration.microsecondsPerSecond;

          break;
      }
    }

    if (microseconds == 0 && nanoseconds == 0) {
      final secondsAndNanoseconds = input.split('.');
      if (secondsAndNanoseconds.length == 2) {
        final fractionalPart = secondsAndNanoseconds[1];
        if (fractionalPart.isNotEmpty) {
          hasFractionalPart = true;
          final parsedFractional = double.parse('0.$fractionalPart');
          nanoseconds = (parsedFractional * _kNanosecondsPerSecond);
        }
      }
    }

    if (hasFractionalPart) {
      microseconds += nanoseconds ~/ _kNanosecondsPerMicrosecond;
      nanoseconds = nanoseconds % _kNanosecondsPerMicrosecond;
    }

    return Duration(
      days: days.round(),
      hours: hours.round(),
      minutes: minutes.round(),
      microseconds: microseconds.round(),
    );
  }

  List readList(FieldValueKind type) {
    _skipWhitespace();
    if (_buffer[_offset] != _kTokenLbrack) {
      _expectErr(JsonType.array);
    }

    final list = [];

    LOOP:
    while (true) {
      switch (_buffer[_offset++]) {
        case _kTokenComma:
        case _kTokenLbrack:
          _skipWhitespace();
          if (_buffer[_offset] == _kTokenRbrack) {
            _offset++;
            break LOOP;
          }
          final value = read(type);
          list.add(value);
          continue;

        case _kTokenRbrack:
          break LOOP;
        default:
          _expectCharErr('] or ,');
      }
    }

    return list;
  }

  Map readMap(FieldValueKind keyType, FieldValueKind valueType) {
    _skipWhitespace();
    if (_buffer[_offset] != _kTokenLbrace) {
      _expectErr(JsonType.object);
    }

    final map = {};

    LOOP:
    while (true) {
      switch (_buffer[_offset++]) {
        case _kTokenComma:
        case _kTokenLbrace:
          _skipWhitespace();
          if (_buffer[_offset] == _kTokenRbrace) {
            _offset++;
            break LOOP;
          }
          final key = read(keyType);
          if (_buffer[_offset++] != _kTokenColon) {
            _expectCharErr(':');
          }

          final value = read(valueType);
          map[key] = value;
          continue;

        case _kTokenRbrace:
          break LOOP;
        default:
          _expectCharErr('} or ,');
      }
    }

    return map;
  }

  /// Attemps to read a value of type [valueKind].
  @pragma('vm:prefer-inline')
  dynamic read(FieldValueKind valueKind, {List<FieldValueKind>? arguments}) {
    dynamic value;
    switch (valueKind) {
      case FieldValueKind.bool:
        value = readBool();
        break;
      case FieldValueKind.string:
        value = readString();
        break;
      case FieldValueKind.float32 || FieldValueKind.float64:
        value = readFloat();
        break;

      case FieldValueKind.int ||
            FieldValueKind.int8 ||
            FieldValueKind.int16 ||
            FieldValueKind.int32 ||
            FieldValueKind.uint ||
            FieldValueKind.uint8 ||
            FieldValueKind.uint16 ||
            FieldValueKind.uint32:
        value = readInt();
        break;

      case FieldValueKind.uint64 || FieldValueKind.int64:
        value = readBigInt();
        break;

      case FieldValueKind.binary:
        value = readBase64Binary();
        break;

      case FieldValueKind.timestamp:
        return readTimestamp();

      case FieldValueKind.duration:
        return readDuration();

      case FieldValueKind.list:
        value = readList(arguments![0]);
        break;

      case FieldValueKind.map:
        value = readMap(arguments![0], arguments[1]);
        break;

      default:
        throw UnimplementedError();
    }

    return value;
  }

  /// Checks if current token is [type] and advances one character.
  @pragma('vm:prefer-inline')
  void require(JsonType type) {
    if (currentType != type) {
      _expectErr(type);
    }

    _offset++;
  }

  @pragma('vm:prefer-inline')
  num _readNum() {
    _skipWhitespace();

    final start = _offset;
    bool isFloatingPoint = false;
    bool isExponential = false;

    LOOP:
    while (_offset < _buffer.length) {
      final charCode = _buffer[_offset];
      switch (charCode) {
        case 46: // dot
          isFloatingPoint = true;
          _offset++;
          break;

        case >= 48 && <= 57: // digit
          _offset++;
          break;

        case 101 || 69: // 'e' or 'E' found, indicates an exponential number
          isExponential = true;
          _offset++;
          // Skip optional '+' or '-' sign in exponent
          if (_offset < _buffer.length) {
            final sign = _buffer[_offset];
            if (sign == 43 || sign == 45) {
              _offset++;
            }
          }

        default:
          break LOOP;
      }
    }

    if (isFloatingPoint || isExponential) {
      // Parse the fractional part and/or exponent
      while (_offset < _buffer.length && _isDigit(_buffer[_offset])) {
        _offset++;
      }
    }

    final numberString = String.fromCharCodes(_buffer, start, _offset);
    return num.parse(numberString);
  }

  @pragma('vm:prefer-inline')
  bool _isDigit(int value) {
    return value >= 48 && value <= 57;
  }

  @pragma('vm:prefer-inline')
  Never _expectErr(JsonType type) {
    throw FormatError(
        "Expected ${type.name} at $_offset, got ${_buffer[_offset]} (${String.fromCharCode(_buffer[_offset])}).");
  }

  @pragma('vm:prefer-inline')
  Never _expectCharErr(String char) {
    throw FormatError("Expected $char at $_offset, got ${String.fromCharCode(_buffer[_offset])}.");
  }

  JsonType _current() {
    _skipWhitespace();
    switch (_buffer[_offset]) {
      case _kTokenDoubleQuote:
        return JsonType.string;
      case _kTChar:
      case _kFChar:
        return JsonType.boolean;
      case _kNChar:
        return JsonType.$null;
      case _kTokenLbrace:
        return JsonType.object;
      case _kTokenLbrack:
        return JsonType.array;
      case _kTokenRbrace:
        return JsonType.endOfObject;
      case _kTokenRbrack:
        return JsonType.endOfArray;
      default:
        return JsonType.number;
    }
  }
}
