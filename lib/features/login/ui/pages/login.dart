import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_cloud_encryptor/features/login/data/mobx/login_store.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginStore>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                login.doLogin();
              },
              child: Observer(
                builder: (_) {
                  // @todo no Observables
                  return Text('Login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
