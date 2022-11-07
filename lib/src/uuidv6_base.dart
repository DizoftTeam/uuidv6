import 'dart:math' as math;

import 'package:uuid/uuid.dart';

///
/// Generate random hex string
///
String randomHexString(int length) {
  final math.Random random = math.Random.secure();
  final StringBuffer sb = StringBuffer();

  for (var i = 0; i < length; i++) {
    sb.write(random.nextInt(16).toRadixString(16));
  }

  return sb.toString();
}

///
/// Generate UUID v6
/// Based on UUID v1
///
/// @see https://github.com/origamih/uuid-with-v6-js/blob/master/index.js
///
String uuidv6({bool disableRandom = true}) {
  final String raw = Uuid().v1();

  final String prefix = '${raw.substring(15, 18)}${raw.substring(9, 13)}'
      '${raw.substring(0, 5)}6${raw.substring(5, 8)}';

  final String prefixFormatted =
      '${prefix.substring(0, 8)}-${prefix.substring(8, 12)}-${prefix.substring(12)}';

  if (disableRandom) {
    return '$prefixFormatted${raw.substring(18)}';
  }

  final String random = randomHexString(16);

  return '$prefixFormatted-${random.substring(0, 4)}-${random.substring(4)}';
}
