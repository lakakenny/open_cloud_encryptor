import 'dart:async';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:open_cloud_encryptor/features/home/presentation/pages/home.dart';
import 'package:open_cloud_encryptor/features/login/presentation/mobx/login_store.dart';
import 'package:open_cloud_encryptor/features/login/presentation/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;

  bool _showSplash = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);

    _disposers ??= [
      reaction(
        (_) => _loginStore.errorMessage,
        (String message) {
          showSimpleFlushbar(context, message: message);
        },
      ),
    ];

/*    _disposers.add(
      autorun(
        (_) {
          if (_loginStore.errorMessage.isNotEmpty) {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text(_loginStore.errorMessage),
                backgroundColor: Colors.redAccent,
                duration: Duration(seconds: 4),
              ),
            );
          }
        },
      ),
    );

    _disposers.add(
      reaction(
        (_) => _loginStore.isLoggedIn,
        (_) => Navigator.of(context).pop(),
      ),
    ); */
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());

    super.dispose();
  }

  Timer startTimer() {
    var _duration = Duration(milliseconds: 1000);

    return Timer(_duration, initApp);
  }

  void initApp() async {
    setState(() {
      _showSplash = false;
    });
  }

  void showSimpleFlushbar(BuildContext context, {@required message}) {
    Flushbar(
      message: message,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  Widget buildFirstScreen(BuildContext context, bool _isLoggedIn) {
    if (_showSplash) {
      return Center(child: Text(Strings.APP_NAME));
    }

    if (_isLoggedIn) {
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
          var _isLoggedIn = login.isLoggedIn;

          return buildFirstScreen(_context, _isLoggedIn);
        },
      ),
    );
  }
}
