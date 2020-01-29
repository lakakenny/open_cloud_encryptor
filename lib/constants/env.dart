import 'package:flutter/foundation.dart' as foundation;

class Env {
  Env._();

  static final bool IS_RELEASE = foundation.kReleaseMode;

  static final bool IS_DEBUG = !foundation.kReleaseMode;
}
