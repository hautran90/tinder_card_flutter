import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static saveStringValue(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future<String> getStringValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String value = preferences.getString(key) ?? '';
    return value;
  }
}
