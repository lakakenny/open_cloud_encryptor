import 'dart:developer' as developer;
import 'package:open_cloud_encryptor/constants/env.dart';

class LogIt {
  LogIt._();

  static void error(String message, [String title, bool allowInProd = false]) {
    if (allowInProd || !IS_RELEASE) {
      developer.log('Error thrown:');
      if (title.isNotEmpty) {
        developer.log(message, name: title);

        return;
      }

      developer.log(message);
    }
  }

  static void info(String message, [String title, bool allowInProd = false]) {
    if (allowInProd || !IS_RELEASE) {
      if (title.isNotEmpty) {
        developer.log(message, name: title);

        return;
      }

      developer.log(message);
    }
  }
}
