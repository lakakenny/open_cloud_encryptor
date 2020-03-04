import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
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

class _SplashScreenState extends State<SplashScreen> {
  AuthStore _loginStore;

  List<ReactionDisposer> _disposers;

  // todo RouterService get _routerService => getIt<RouterService>();

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  Timer startTimer() {
    var _duration = Duration(milliseconds: 1000);

    return Timer(_duration, initApp);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<AuthStore>(context);

    _disposers ??= [
      reaction(
        (_) => _loginStore.isLoggedIn,
        (bool isLoggedIn) {
          handleIsLoggedIn(isLoggedIn);
        },
      ),
    ];
  }

  void initApp() async {
    _loginStore ??= Provider.of<AuthStore>(context);

    await _loginStore.doLogin();
  }

  void handleIsLoggedIn(bool isLoggedIn) {
    if (isLoggedIn) {
      print(isLoggedIn);

      RouterService.instance.navigateTo(HomeRoute.buildPath());

      return;
    }

    RouterService.instance.navigateTo(LoginRoute.buildPath());
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
