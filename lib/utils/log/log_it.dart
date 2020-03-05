import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:open_cloud_encryptor/constants/env.dart';

@lazySingleton
class LogIt {
  final Logger logger;

  LogIt(this.logger);

  /// Log a message at level [Level.verbose].
  void verbose(dynamic message,
      [dynamic error, StackTrace stackTrace, bool showInProd = false]) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(dynamic message,
      [dynamic error, StackTrace stackTrace, bool showInProd = false]) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(dynamic message,
      [dynamic error, StackTrace stackTrace, bool showInProd = false]) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn(dynamic message,
      [dynamic error, StackTrace stackTrace, bool showInProd = false]) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(dynamic message,
      [dynamic error, StackTrace stackTrace, bool showInProd = false]) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(dynamic message,
      [dynamic error, StackTrace stackTrace, bool showInProd = false]) {
    if (Env.IS_RELEASE && !showInProd) {
      return;
    }

    logger.wtf(message, error, stackTrace);
  }
}
