import 'package:shared_preferences/shared_preferences.dart';

import '../app_consts.dart';

class CacheHelper {
  CacheHelper._();

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveThemeMode({required int value}) async {
    return await _prefs.setInt(AppCosts.appThemKey, value);
  }

  static int? getThemeMode() {
    return _prefs.getInt(AppCosts.appThemKey);
  }
}
