import 'package:dartz/dartz.dart';
import 'package:open_cloud_encryptor/core/errors/failures.dart';
import 'package:open_cloud_encryptor/core/use_cases/use_cases.dart';
import 'package:open_cloud_encryptor/features/login/domain/entities/login.dart';
import 'package:open_cloud_encryptor/features/login/domain/repositories/login_repository.dart';

class GetLogin implements UseCases<Login, NoParams> {
  final LoginRepository repository;

  GetLogin(this.repository);

  @override
  Future<Either<Failure, Login>> call(NoParams params) async {
    return await repository.getLogin();
  }
}
