import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_cloud_encryptor/stores/auth/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthStore>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                auth.doLogin();
              },
              child: Observer(
                builder: (_) => Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
