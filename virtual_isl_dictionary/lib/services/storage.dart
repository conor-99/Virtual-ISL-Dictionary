import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static String keyUsername = 'username';
  static String keyPassword = 'password';

  static Future<void> setValue(String key, String value) async {
    (await _getPreferences()).setString(key, value);
  }

  static Future<String> getValue(String key) async {
    return (await _getPreferences()).getString(key) ?? '';
  }

  static Future<void> removeValue(String key) async {
    (await _getPreferences()).remove(key);
  }

  static Future<bool> valueExists(String key) async {
    return await getValue(key) != '';
  }

  static Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
