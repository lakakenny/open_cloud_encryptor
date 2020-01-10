import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: Text('Home page', style: TextStyle(fontSize: 18)),
              padding: const EdgeInsets.all(8),
            ),
            RaisedButton(
              onPressed: () {
                // auth.inc();
              },
              child: Text(
                "Do something!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
