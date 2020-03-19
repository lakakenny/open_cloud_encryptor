import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/network/network_info.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/data_sources/{{featureName}}_local_data_source.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/data_sources/{{featureName}}_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/models/{{featureName}}_model.dart';

@lazySingleton
class {{className}}Repository {
  final {{className}}LocalDataSource _{{featureName}}LocalDataSource;
  final {{className}}RemoteDataSource _{{featureName}}RemoteDataSource;
  final NetworkInfo _networkInfo;

  {{className}}Repository(
    this._{{featureName}}LocalDataSource,
    this._{{featureName}}RemoteDataSource,
    this._networkInfo,
  );

  Future<{{className}}Model> getModelValue() async {
    return _{{featureName}}LocalDataSource.getModelValue();
  }
}
