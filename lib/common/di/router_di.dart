import 'package:fluro/fluro.dart';
import 'package:injectable/injectable.dart';

@registerModule
abstract class RouterDi {
  @lazySingleton
  Router get router => Router();
}
