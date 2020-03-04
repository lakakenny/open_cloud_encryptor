import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';

class SplashLoading extends StatelessWidget {
  final String title;

  SplashLoading({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Strings.APP_NAME),
    );
  }
}
