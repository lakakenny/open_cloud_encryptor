import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:open_cloud_encryptor/features/auth/ui/store/auth_store.dart';
import 'package:open_cloud_encryptor/features/splash/ui/widgets/splash_loading.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends StoreSFWidget<SplashScreen> {
  AuthStore _authStore;

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _authStore ??= Provider.of<AuthStore>(context);

    _disposers ??= [
      reaction(
        (_) => _authStore.isLoggedIn,
        (bool isLoggedIn) {
          handleIsLoggedIn(isLoggedIn: isLoggedIn);
        },
      ),
    ];
  }

  @override
  Future<void> initApp() async {
    await _authStore.doLogin();
  }

  void handleIsLoggedIn({bool isLoggedIn}) {
    if (isLoggedIn) {
      Router.navigator.pushNamed(Router.homeScreen);

      return;
    }

    Router.navigator.pushNamed(Router.loginScreen);
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
