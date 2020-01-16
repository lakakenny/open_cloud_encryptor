import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:open_cloud_encryptor/stores/auth/auth.dart';
import 'package:open_cloud_encryptor/ui/home/home.dart';
import 'package:open_cloud_encryptor/ui/login/login.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final AuthStore auth = AuthStore();
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
      return Center(child: Text(APP_NAME));
    }

    if (isLoggedIn) {
      return HomeScreen();
    }

    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthStore>(context);

    return Material(
      child: Observer(
        builder: (BuildContext _context) {
          var isLoggedIn = auth.isLoggedIn;

          return buildFirstScreen(_context, isLoggedIn);
        },
      ),
    );
  }
}
