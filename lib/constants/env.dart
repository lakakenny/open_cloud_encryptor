import 'package:flutter/foundation.dart' as foundation;
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/constants/urls.dart';

class Env {
  static EnvData _env;

  static EnvData get data => _env;

  static final bool IS_RELEASE = foundation.kReleaseMode;

  static final bool IS_DEBUG = !foundation.kReleaseMode;

  static void init() {
    _env = IS_RELEASE ? Env.prod : Env.dev;
  }

  static final EnvData dev = EnvData(
    debug: true,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: true,
    apiBaseUrl: UrlConstants.DEV_API_BASE_URL,
  );

  static final EnvData prod = EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
    apiBaseUrl: UrlConstants.PROD_API_URL,
  );
}

class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;

  EnvData({
    @required this.debug,
    @required this.debugShowCheckedModeBanner,
    @required this.debugShowMaterialGrid,
    @required this.debugApiClient,
    @required this.apiBaseUrl,
  });
}
