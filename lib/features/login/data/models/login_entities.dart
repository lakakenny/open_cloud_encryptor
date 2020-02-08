import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Login extends Equatable {
  final String fname;
  final String lname;
  final String email;

  Login({
    @required this.fname,
    @required this.lname,
    @required this.email,
  });

  @override
  List<Object> get props => [fname, lname, email];
}
