part of 'writer.dart';

const _kOneByteChar = 0x7f;
const _kTwoBytesLimit = 0x7ff;
const _kSurrogateMask = 0xFC00;
const _kSurrogateValueMask = 0x3FF;
const _kLeadSurrogateMin = 0xD800;
const _kMaxByte = 0x80;
const _kTokenLbrace = 0x7B;
const _kTokenRbrace = 0x7D;
const _kTokenLbrack = 0x5B;
const _kTokenRbrack = 0x5D;
const _kTokenDoubleQuote = 0x22;
const _kTokenComma = 0x2C;
const _kTokenColon = 0x3A;
const _kTokenBackslash = 0x5C;
const _kTrueString = "true";
const _kFalseString = "false";