part of 'nexemaj.dart';

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
const _kTokenBackspace = 0x08;
const _kTokenNewline = 0x0A;
const _kTokenCarriageReturn = 0x0D;
const _kTokenTab = 0x09;
const _kTokenWhitespace = 0x20;
const _kTrueString = "true";
const _kFalseString = "false";
const _kTChar = 0x74;
const _kFChar = 0x66;
const _kNChar = 0x6E;
const _kNanosecondsPerSecond = 1000000000;
const _kNanosecondsPerMicrosecond = 1000;

enum JsonType { string, boolean, number, array, object, $null, endOfObject, endOfArray }

const _kBase64Decoder = Base64Decoder();
final _durationRegexp = RegExp(r'[a-z]');
