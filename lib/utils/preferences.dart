import 'package:deom_form/model/form_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key, String defValue) =>
      _prefs.getString(key) ?? defValue;

  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static int getInt(String key, int defValue) => _prefs.getInt(key) ?? defValue;

  static Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  static double getDouble(String key, double defValue) =>
      _prefs.getDouble(key) ?? defValue;

  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static bool getBool(String key, bool defValue) =>
      _prefs.getBool(key) ?? defValue;

  static void save(FormModel model) {
    _prefs.setString("email", model.email);
    _prefs.setString("name", model.displayName);
  }

  static void clear() {
    _prefs.clear();
  }
}
