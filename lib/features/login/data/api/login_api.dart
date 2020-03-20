import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_api_error.dart';
import 'package:open_cloud_encryptor/features/login/data/mappers/login_mapper.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_response_model.dart';

@lazySingleton
class LoginApi {
  final ApiClient _apiClient;

  LoginApi(this._apiClient);

  Future<Either<Exception, LoginResponseModel>> postLogin(
      LoginRequestModel params) async {
    try {
      final response = await _apiClient.post(
        'api/v1/users/login',
        params,
        (BadRequestApiError badRequestError) =>
            LoginMapper.badRequestToModelError(badRequestError),
      );

      return Right(
          LoginResponseModel.fromJson(response.data as Map<String, dynamic>));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
