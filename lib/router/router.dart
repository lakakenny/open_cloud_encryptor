import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:open_cloud_encryptor/features/home/ui/pages/home.dart';
import 'package:open_cloud_encryptor/features/login/ui/pages/login.dart';
import 'package:open_cloud_encryptor/features/splash/ui/pages/splash.dart';

@CustomAutoRouter()
class $Router {
  @CustomRoute(
    initial: true,
    transitionsBuilder: TransitionsBuilders.slideLeft,
    durationInMilliseconds: 200,
  )
  HomeScreen homeScreen;

  @CustomRoute(
    fullscreenDialog: true,
    transitionsBuilder: TransitionsBuilders.slideLeft,
    durationInMilliseconds: 200,
  )
  LoginScreen loginScreen;

  SplashScreen splashScreen;

// todo add 404
// @unkownRoute

// todo add GuardedBy
//@GuardedBy([RouterAuthGuard])
//ProfileScreen profileScreen;
}
