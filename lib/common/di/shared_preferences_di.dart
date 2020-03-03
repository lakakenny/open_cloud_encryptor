import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@registerModule
abstract class SharedPreferencesDi {
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
