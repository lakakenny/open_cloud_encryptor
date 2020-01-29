import 'package:dartz/dartz.dart';
import 'package:open_cloud_encryptor/core/errors/failures.dart';
import 'package:open_cloud_encryptor/features/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> getLogin();

  Future<Either<Failure, Login>> postLogin(String username, String password);
}
