import 'package:nexema_generator/models.dart';

const kPrimitiveMapper = <NexemaPrimitive, String>{
  NexemaPrimitive.string: "\$core.String",
  NexemaPrimitive.uint8: "\$core.int",
  NexemaPrimitive.uint16: "\$core.int",
  NexemaPrimitive.uint32: "\$core.int",
  NexemaPrimitive.uint64: "\$core.BigInt",
  NexemaPrimitive.int8: "\$core.int",
  NexemaPrimitive.int16: "\$core.int",
  NexemaPrimitive.int32: "\$core.int",
  NexemaPrimitive.int64: "\$core.int",
  NexemaPrimitive.binary: "\$td.Uint8List",
  NexemaPrimitive.bool: "\$core.bool",
  NexemaPrimitive.int: "\$core.int",
  NexemaPrimitive.uint: "\$core.BigInt",
  NexemaPrimitive.float32: "\$core.double",
  NexemaPrimitive.float64: "\$core.double",
  NexemaPrimitive.list: "\$core.List",
  NexemaPrimitive.map: "\$core.Map",
  NexemaPrimitive.timestamp: "\$core.DateTime",
  NexemaPrimitive.duration: "\$core.Duration",
};

const kEncoderMapper = <NexemaPrimitive, String>{
  NexemaPrimitive.string: "encodeString",
  NexemaPrimitive.uint8: "encodeUint8",
  NexemaPrimitive.uint16: "encodeUint16",
  NexemaPrimitive.uint32: "encodeUint32",
  NexemaPrimitive.uint64: "encodeUint64",
  NexemaPrimitive.int8: "encodeInt8",
  NexemaPrimitive.int16: "encodeInt16",
  NexemaPrimitive.int32: "encodeInt32",
  NexemaPrimitive.int64: "encodeInt64",
  NexemaPrimitive.binary: "encodeBinary",
  NexemaPrimitive.bool: "encodeBool",
  NexemaPrimitive.int: "encodeVarint",
  NexemaPrimitive.uint: "encodeUvarint",
  NexemaPrimitive.float32: "encodeFloat32",
  NexemaPrimitive.float64: "encodeFloat64",
  NexemaPrimitive.timestamp: "encodeTimestamp",
  NexemaPrimitive.duration: "encodeDuration"
};

const kDecoderMapper = <NexemaPrimitive, String>{
  NexemaPrimitive.string: "decodeString",
  NexemaPrimitive.uint8: "decodeUint8",
  NexemaPrimitive.uint16: "decodeUint16",
  NexemaPrimitive.uint32: "decodeUint32",
  NexemaPrimitive.uint64: "decodeUint64",
  NexemaPrimitive.int8: "decodeInt8",
  NexemaPrimitive.int16: "decodeInt16",
  NexemaPrimitive.int32: "decodeInt32",
  NexemaPrimitive.int64: "decodeInt64",
  NexemaPrimitive.binary: "decodeBinary",
  NexemaPrimitive.bool: "decodeBool",
  NexemaPrimitive.int: "decodeVarint",
  NexemaPrimitive.uint: "decodeUvarint",
  NexemaPrimitive.float32: "decodeFloat32",
  NexemaPrimitive.float64: "decodeFloat64",
  NexemaPrimitive.timestamp: "decodeTimestamp",
  NexemaPrimitive.duration: "decodeDuration"
};
