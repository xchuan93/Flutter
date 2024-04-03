import 'package:flutter/material.dart';
import 'package:flutterlearning/commont/model/user.dart';

class XCState {
  ///用户信息
  User? userInfo;

  ///主题数据
  ThemeData? themeData;

  ///语言
  Locale? locale;

  ///当前手机平台默认语言
  Locale? platformLocale;

  ///是否登录
  bool? login;

  ///是否变灰色
  bool? grey;

  XCState(
      {this.userInfo,
      this.themeData,
      this.locale,
      this.platformLocale,
      this.login,
      this.grey = false});
}
