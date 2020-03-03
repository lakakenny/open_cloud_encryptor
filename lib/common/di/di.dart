import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/di/di.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
void setupDi() => $initGetIt(getIt);
