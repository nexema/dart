// coverage:ignore-file
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

  static const int int32MaxValue = 2147483647;
  static const int int32MinValue = -2147483648;

  static const int uint32MinValue = 0;
  static const int uint32MaxValue = 4294967295;

  static const int int64MinValue = -9223372036854775808;
  static const int int64MaxValue = 9223372036854775807;

  static final BigInt int64MinValueBigInt = BigInt.from(int64MinValue);
  static final BigInt int64MaxValueBigInt = BigInt.from(int64MaxValue);

  static const double float32MaxValue = 3.40282346638528859811704183484516925440e+38;
  static const double float32MinValue = 1.401298464324817070923729583289916131280e-45;

  static const double float64MaxValue = 1.79769313486231570814527423731704356798070e+308;
  static const double float64MinValue = 4.9406564584124654417656879286822137236505980e-324;

  static final BigInt uint64MaxValue = BigInt.parse("18446744073709551615");
  
}