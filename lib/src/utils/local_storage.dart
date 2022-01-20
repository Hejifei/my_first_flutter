import 'dart:convert';
import 'dart:html';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static late GetStorage _prefs = GetStorage();

  // static Future<void> init() async {
  //   print('init');
  //   _prefs = GetStorage();
  // }

  // ReadyState() {
  //   print('readyState');
  //   _prefs = GetStorage();
  // }

  Future setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.write(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = _prefs.read(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future setBool(String key, bool val) {
    return _prefs.write(key, val);
  }

  bool getBool(String key) {
    bool? val = _prefs.read(key);
    return val == null ? false : val;
  }

  Future remove(String key) {
    return _prefs.remove(key);
  }
}
