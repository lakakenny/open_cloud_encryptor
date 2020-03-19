import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/network/network_info.dart';
import 'package:open_cloud_encryptor/features/login/data/data_sources/login_local_data_source.dart';
import 'package:open_cloud_encryptor/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_response_model.dart';

@lazySingleton
class LoginRepository {
  final LoginLocalDataSource _loginLocalDataSource;
  final LoginRemoteDataSource _loginRemoteDataSource;
  final NetworkInfo _networkInfo;

  LoginRepository(
    this._loginLocalDataSource,
    this._loginRemoteDataSource,
    this._networkInfo,
  );

  Future<LoginResponseModel> postLogin(LoginRequestModel params) async {
    return _loginRemoteDataSource.postLogin(params);
  }
}
