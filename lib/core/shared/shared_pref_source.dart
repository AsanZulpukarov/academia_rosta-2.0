import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSource {
  static SharedPreferences? _preferences;
  static const String tokenKey = 'token';
  static const String roleKey = 'role';
  static const String imageKey = 'image';
  static const String isOpenKey = 'open';
  static Future<SharedPreferences> getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }
}
