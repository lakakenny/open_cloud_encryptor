import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class DioDi {
  Dio get dio => Dio();

  DioDi();
}
