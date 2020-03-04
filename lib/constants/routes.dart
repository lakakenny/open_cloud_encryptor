import 'package:open_cloud_encryptor/common/route/route.dart';
import 'package:open_cloud_encryptor/features/home/ui/routes/home_route.dart';
import 'package:open_cloud_encryptor/features/login/ui/routes/login_route.dart';
import 'package:open_cloud_encryptor/features/splash/ui/routes/splash_route.dart';

class RoutesPath {
  RoutesPath._();

  static final String SPLASH = 'splash';

  static final String HOME = '';

  static final String LOGIN = 'login';
}

final List<ARoute> routesList = [
  SplashRoute(),
  HomeRoute(),
  LoginRoute(),
];
