// coverage:ignore-file
import 'dart:convert';
import 'dart:typed_data';

import 'package:nexema/nexema.dart';
import 'package:nexema/src/constants/numbers.dart';

part 'writer.dart';
part 'reader.dart';

const _kNull = 0xc0;
const _kBoolTrue = 0x01;
const _kBoolFalse = 0x00;
const _kArrayBegin = 0xdc;
const _kMapBegin = 0xdf;
const _kMaxVarintLen = 10;
final _kUvarintMin = BigInt.from(0x80);
const _kUvarintMinInt = 0x80;
const _kUtfCodec = Utf8Codec();