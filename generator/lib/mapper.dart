const kPrimitiveMapper = <String, String>{
  "string": "\$core.String",
  "uint8": "\$core.int",
  "uint16": "\$core.int",
  "uint32": "\$core.int",
  "uint64": "\$core.BigInt",
  "int8": "\$core.int",
  "int16": "\$core.int",
  "int32": "\$core.int",
  "int64": "\$core.int",
  "binary": "\$td.Uint8List",
  "bool": "\$core.bool",
  "int": "\$core.int",
  "uint": "\$core.BigInt",
  "float32": "\$core.double",
  "float64": "\$core.double"
};

const kEncoderMapper = <String, String>{
  "string": "encodeString",
  "uint8": "encodeUint8",
  "uint16": "encodeUint16",
  "uint32": "encodeUint32",
  "uint64": "encodeUint64",
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
  "uint64": "decodeUint64",
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