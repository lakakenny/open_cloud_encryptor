import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:open_cloud_encryptor/features/home/presentation/pages/home.dart';
import 'package:open_cloud_encryptor/features/login/presentation/mobx/login_store.dart';
import 'package:open_cloud_encryptor/features/login/presentation/pages/login.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSplash = true;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  Timer startTimer() {
    var _duration = Duration(milliseconds: 1000);

    return Timer(_duration, initApp);
  }

  void initApp() async {
    setState(() {
      showSplash = false;
    });
  }

  Widget buildFirstScreen(BuildContext context, bool isLoggedIn) {
    if (showSplash) {
      return Center(child: Text(Strings.APP_NAME));
    }

    if (isLoggedIn) {
      return HomeScreen();
    }

    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginStore>(context);

    return Material(
      child: Observer(
        builder: (BuildContext _context) {
          var isLoggedIn = login.isLoggedIn;

          return buildFirstScreen(_context, isLoggedIn);
        },
      ),
    );
  }
}
