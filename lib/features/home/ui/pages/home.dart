import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:open_cloud_encryptor/widgets/common_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends StoreSFWidget {
  bool test = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: CommonWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Home page', style: TextStyle(fontSize: 18)),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    test = !test;
                  });
                },
                child: Text(
                  !test ? 'Do something!' : 'Done',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
