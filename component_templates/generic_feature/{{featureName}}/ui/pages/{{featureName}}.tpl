import 'package:flutter/material.dart';

class {{className}}Screen extends StatelessWidget {
  const {{className}}Screen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                //
              },
              child: const Text('Do some action'),
            ),
          ],
        ),
      ),
    );
  }
}
