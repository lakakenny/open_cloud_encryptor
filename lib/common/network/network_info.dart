import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
