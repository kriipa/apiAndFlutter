import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future setBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, true);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

// static Future setListString(
// 	{required String id, required String token}) async {
// 	final prefs = await SharedPreferences.getInstance();
// 	prefs.setStringList(listSharedPreference, [id, token]);
// }

// static Future<List<String>> getListString() async {
// 	final prefs = await SharedPreferences.getInstance();
// 	return prefs.getStringList(listSharedPreference) ?? [];
// }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future setString(String value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future setInt(int val, String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, val);
  }

  static Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future setDouble(double val, String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, val);
  }

  static Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future setMap(String key, Map value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value));
  }

  static Future<Map> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key) ?? "") ?? {};
  }

  static Future clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}