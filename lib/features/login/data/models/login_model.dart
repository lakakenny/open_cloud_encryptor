import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_entities.dart';

class LoginModel extends Login {
  LoginModel({
    @required String fname,
    @required String lname,
    @required String email,
  }) : super(fname: fname, lname: lname, email: email);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'email': email,
    };
  }
}
