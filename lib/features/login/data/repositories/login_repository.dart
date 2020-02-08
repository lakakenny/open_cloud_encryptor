import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/core/errors/exception.dart';
import 'package:open_cloud_encryptor/core/errors/failures.dart';
import 'package:open_cloud_encryptor/core/utils/network/network_info.dart';
import 'package:open_cloud_encryptor/features/login/data/data_sources/login_local_data_source.dart';
import 'package:open_cloud_encryptor/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_entities.dart';

abstract class LoginRepositoryBase {
  Future<Either<Failure, Login>> getLogin();

  Future<Either<Failure, Login>> postLogin(String username, String password);
}

class LoginRepository implements LoginRepositoryBase {
  final LoginRemoteDataSourceBase remoteDataSource;
  final LoginLocalDataSourceBase localDataSource;
  final NetworkInfoBase networkInfo;

  LoginRepository({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Login>> getLogin() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await remoteDataSource.getLogin();
        await localDataSource.doCacheLogin(remoteLogin);

        return Right(remoteLogin);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localLogin = await localDataSource.getLogin();

        return Right(localLogin);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Login>> postLogin(String username, String password) {
    // TODO: implement postLogin
    return null;
  }
}
