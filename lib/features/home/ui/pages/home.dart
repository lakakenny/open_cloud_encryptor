import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Home page', style: TextStyle(fontSize: 18)),
            ),
            RaisedButton(
              onPressed: () {
                // auth.inc();
              },
              child: const Text(
                'Do something!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
