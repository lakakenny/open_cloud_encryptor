import 'package:flutter/foundation.dart' as Foundation;

class LogIt {
  LogIt._();

  static void error(dynamic message, [String title, bool allowInProd = false]) {
    if (allowInProd || !Foundation.kReleaseMode) {
      Foundation.debugPrint("Error:");
      if (title.isNotEmpty) {
        Foundation.debugPrint('$title =>');
      }
      Foundation.debugPrint(message);
    }
  }

  static void info(dynamic message, [String title, bool allowInProd = false]) {
    if (allowInProd || !Foundation.kReleaseMode) {
      if (title.isNotEmpty) {
        Foundation.debugPrint('$title =>');
      }
      Foundation.debugPrint(message);
    }
  }
}
