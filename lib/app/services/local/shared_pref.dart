import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String tokenKey = 'session_id';
  static const String lastRouteKey = 'route_key';

  SharedPref._privateConstructor();

  static final SharedPref _instance = SharedPref._privateConstructor();

  factory SharedPref() => _instance;

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> putString(String key, String value) async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.setString(key, value);
  }

  Future<void> putBool(String key, bool value) async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.setBool(key, value);
  }

  Future<void> putInt(String key, int value) async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.setInt(key, value);
  }

  Future<void> putDouble(String key, double value) async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.setDouble(key, value);
  }

  // Methods to retrieve values from SharedPreferences

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await _getPrefs();
    return prefs.getBool(key) ?? false;
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _getPrefs();
    return prefs.getString(key) ?? '';
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await _getPrefs();
    return prefs.getInt(key) ?? 0;
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await _getPrefs();
    return prefs.getDouble(key) ?? 0.0;
  }

  // Method to clear all preferences (Optional)
  Future<void> clear() async {
    SharedPreferences prefs = await _getPrefs();
    await prefs.clear();
  }
}
