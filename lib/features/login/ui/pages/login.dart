import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/features/login/ui/store/login_store.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends StoreSFWidget<LoginScreen> {
  LoginStore _loginStore;

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loginStore ??= Provider.of<LoginStore>(context);
  }

  void doLogin(LoginRequestModel param) {
    _loginStore.doLogin(param);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                doLogin(
                  LoginRequestModel(username: 'user', password: 'password'),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
