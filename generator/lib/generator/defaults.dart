/// $core.int
const kCoreInt = r"$core.int";

/// $core.String
const kCoreString = r"$core.String";

/// $core.bool
const kCoreBool = r"$core.bool";

/// $core.BigInt
const kCoreBigInt = r"$core.BigInt";

/// $core.Object
const kCoreObject = r"$core.Object";

/// $nex
const kNexAlias = r"$nex";

/// $core
const kCoreAlias = r"$core";

/// $core.List
const kCoreList = r"$core.List";

/// @$core.override
const kOverrideAnnotation = r"@$core.override";

/// @$core.Deprecated
const kDeprecatedAnnotation = r"@$core.Deprecated";

/// $td
const kTypedDataAlias = r"$td";

/// $td.Uint8List
const kTdUint8List = "$kTypedDataAlias.Uint8List";

/// $nex.getWriter
const kGetWriterMethod = "$kNexAlias.getWriter";

/// writer.encodeUint8
const kWriterEncodeUint8 = "writer.encodeUint8";

/// return writer.takeBytes();
const kReturnTakeBytes = "return writer.takeBytes();";

const kObsoleteAnnotationKey = "obsolete";

const kDefaultImports = [
  r"'package:nexema/nexema.dart' as $nex",
  r"'dart:typed_data' as $td",
  r"'dart:core' as $core"
];
