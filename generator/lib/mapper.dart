import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/models.dart';

const kPrimitiveMapper = <String, String>{
  "string": "String",
  "uint8": "int",
  "uint16": "int",
  "uint32": "int",
  "uint64": "BigInt",
  "int8": "int",
  "int16": "int",
  "int32": "int",
  "int64": "int",
  "binary": "Uint8List",
  "bool": "bool",
  "int": "int",
  "uint": "BigInt",
  "float32": "double",
  "float64": "double"
};

const kEncoderMapper = <String, String>{
  "string": "encodeString",
  "uint8": "encodeUint8",
  "uint16": "encodeUint16",
  "uint32": "encodeUint32",
  "uint64": "encodeUint64AsBigInt",
  "int8": "encodeInt8",
  "int16": "encodeInt16",
  "int32": "encodeInt32",
  "int64": "encodeInt64",
  "binary": "encodeBinary",
  "bool": "encodeBool",
  "int": "encodeVarint",
  "uint": "encodeUvarint",
  "float32": "encodeFloat32",
  "float64": "encodeFloat64"
};

const kDecoderMapper = <String, String>{
  "string": "decodeString",
  "uint8": "decodeUint8",
  "uint16": "decodeUint16",
  "uint32": "decodeUint32",
  "uint64": "decodeUint64AsBigInt",
  "int8": "decodeInt8",
  "int16": "decodeInt16",
  "int32": "decodeInt32",
  "int64": "decodeInt64",
  "binary": "decodeBinary",
  "bool": "decodeBool",
  "int": "decodeVarint",
  "uint": "decodeUvarint",
  "float32": "decodeFloat32",
  "float64": "decodeFloat64"
};