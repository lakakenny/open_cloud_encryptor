import 'package:flutter/foundation.dart' as Foundation;
import 'package:open_cloud_encryptor/constants/env.dart';

class LogIt {
  LogIt._();

  static void error(dynamic message, [String title, bool allowInProd = false]) {
    if (allowInProd || !IS_PROD) {
      Foundation.debugPrint('Error thrown:');
      if (title.isNotEmpty) {
        Foundation.debugPrint('"$title"');
      }
      Foundation.debugPrint(message);
    }
  }

  static void info(dynamic message, [String title, bool allowInProd = false]) {
    if (allowInProd || !IS_PROD) {
      if (title.isNotEmpty) {
        Foundation.debugPrint('$title =>');
      }
      Foundation.debugPrint(message);
    }
  }
}
