const kFalseBoolCode = 0xc2;
const kTrueBoolCode = 0xc3;
const kUint8Code = 0xcc;
const kUint16Code = 0xcd;
const kUint32Code = 0xce;
const kUint64Code = 0xcf;
const kInt8Code = 0xd0;
const kInt16Code = 0xd1;
const kInt32Code = 0xd2;
const kInt64Code = 0xd3;
const kFloat32Code = 0xca;
const kFloat64Code = 0xcb;
const kBin8Code = 0xc4;
const kBin16Code = 0xc5;
const kBin32Code = 0xc6;
const kNilCode = 0xc0;
const kArray16Code = 0xdc;
const kArray32Code = 0xdd;
const kMap16Code = 0xde;
const kMap32Code = 0xdf;
const kStr8Code = 0xd9;
const kStr16Code = 0xda;
const kStr32Code = 0xdb;

const kMessagePackCodeNames = {
  kFalseBoolCode: "false-bool",
  kTrueBoolCode: "true-bool",
  kUint8Code: "uint8",
  kUint16Code: "uint16",
  kUint32Code: "uint32",
  kUint64Code: "uint64",
  kInt8Code: "int8",
  kInt16Code: "int16",
  kInt32Code: "int32",
  kInt64Code: "int64",
  kFloat32Code: "float32",
  kFloat64Code: "float64",
  kBin8Code: "bin8",
  kBin16Code: "bin16",
  kBin32Code: "bin32",
  kNilCode: "nil",
  kArray16Code: "array16",
  kArray32Code: "array32",
  kMap16Code: "map16",
  kMap32Code: "map32",
  kStr8Code: "str8",
  kStr16Code: "str16",
  kStr32Code: "str32"
};