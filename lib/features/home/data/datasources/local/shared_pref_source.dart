import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSource {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }
}
