// coverage:ignore-file
import 'dart:convert';

const kNull = 0xc0;
const kBoolTrue = 0x01;
const kBoolFalse = 0x00;
const kArrayBegin = 0xdc;
const kMapBegin = 0xdf;
const kMaxVarintLen = 10;
final kUvarintMin = BigInt.from(0x80);
const kUvarintMinInt = 0x80;
const kUtfCodec = Utf8Codec();