import 'package:shared_preferences/shared_preferences.dart';

class XCCache {
  SharedPreferences? prefs;

  XCCache._() {
    init();
  }

  static XCCache? _instance;

  XCCache._pre(SharedPreferences this.prefs);

  ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<XCCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = XCCache._pre(prefs);
    }
    return _instance!;
  }

  static XCCache getInstance() {
    _instance ??= XCCache._();
    return _instance!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  //保存数据
  Future<void> setData(String key, dynamic value) async {
    if (value is int) {
      prefs?.setInt(key, value);
    } else if (value is double) {
      prefs?.setDouble(key, value);
    } else if (value is String) {
      prefs?.setString(key, value);
    } else if (value is bool) {
      prefs?.setBool(key, value);
    } else if (value is List<String>) {
      prefs?.setStringList(key, value);
    }
  }

// 从 Shared Preferences 中获取数据
  dynamic getData(String key) {
    return prefs?.get(key);
  }

// 清除指定键的数据
  Future<void> clearData(String key) async {
    await prefs?.remove(key);
  }

// 清除所有数据
  Future<void> clearAllData() async {
    await prefs?.clear();
  }
}
