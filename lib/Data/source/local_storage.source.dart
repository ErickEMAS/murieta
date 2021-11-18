import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKeys {
  static final String access_token = "ACCESS_TOKEN";
  static final String me = "ME";
}

class LocalStorageSource {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(key) ?? "";
  }

  static Future<void> setString(String key, dynamic value) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString(key, value);
  }

  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.remove(key);
  }
}

