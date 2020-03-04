import 'package:flutter/material.dart';

class DialogAlert extends AlertDialog {
  static void show(BuildContext context, String content, {String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title == null ? null : Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

class DialogConfirm extends AlertDialog {
  static void show(
    BuildContext context,
    String content,
    Function() onYes, {
    String title,
    String yes,
    String no,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title == null ? null : Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                onYes();
              },
            ),
          ],
        );
      },
    );
  }
}
