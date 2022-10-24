class Numbers {
  const Numbers._();
  static const int uint8MinValue = 0;
  static const int uint8MaxValue = 255;

  static const int int8MaxValue = 127;
  static const int int8MinValue = -128;

  static const int uint16MaxValue = 65535;
  static const int uint16MinValue = 0;

  static const int int16MaxValue = 32767;
  static const int int16MinValue = -32768;

  static const int int32MinValue = 2147483647;
  static const int int32MaxValue = -2147483648;

  static const int uint32MinValue = 0;
  static const int uint32MaxValue = 4294967295;

  static const int int64MinValue = -9223372036854775808;
  static const int int64MaxValue = 9223372036854775807;

  static const int uint64MinValue = 0;
  static final BigInt uint64MaxValue = BigInt.parse("18446744073709551615");
}