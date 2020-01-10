import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_cloud_encryptor/stores/auth/auth.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final AuthStore auth = AuthStore();

  HomeScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: Observer(
                builder: (_) =>
                    Text('${auth.count}', style: TextStyle(fontSize: 18)),
              ),
              padding: const EdgeInsets.all(8),
            ),
            RaisedButton(
              onPressed: () {
                auth.inc();
              },
              child: Text(
                "Get Auth",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
