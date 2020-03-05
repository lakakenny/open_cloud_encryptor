import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:open_cloud_encryptor/features/auth/ui/store/auth_store.dart';
import 'package:open_cloud_encryptor/features/home/ui/routes/home_route.dart';
import 'package:open_cloud_encryptor/features/login/ui/routes/login_route.dart';
import 'package:open_cloud_encryptor/features/splash/ui/widgets/splash_loading.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:open_cloud_encryptor/services/router_service.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends StoreSFWidget<SplashScreen> {
  AuthStore _loginStore;

  List<ReactionDisposer> _disposers;

  RouterService get _routerService => getIt<RouterService>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<AuthStore>(context);

    _disposers ??= [
      reaction(
        (_) => _loginStore.isLoggedIn,
        (bool isLoggedIn) {
          handleIsLoggedIn(isLoggedIn: isLoggedIn);
        },
      ),
    ];
  }

  @override
  Future<void> initApp() async {
    await _loginStore.doLogin();
  }

  void handleIsLoggedIn({bool isLoggedIn}) {
    if (isLoggedIn) {
      _routerService.navigateTo(HomeRoute.buildPath());

      return;
    }

    _routerService.navigateTo(LoginRoute.buildPath());
  }

  Widget buildFirstScreen(BuildContext context) {
    return SplashLoading(
      title: Strings.APP_NAME,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFirstScreen(context),
    );
  }
}
