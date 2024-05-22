import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/pages/crypto/index.dart';
import 'package:flutter_startup/pages/crypto/uuid/uuid.page.dart';
import 'package:flutter_startup/pages/main/main.page.dart';
import 'package:flutter_startup/pages/overview/overview.page.dart';
import 'package:flutter_startup/pages/setting/setting.page.dart';

/// 路由注册表
class AppRouter {
  // static Map<String, WidgetBuilder> table = HashMap<String, WidgetBuilder>();
  static final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    '/': (context) => const MainPage(), // home 入口
    '/overview': (context) => const OverviewScreen(),
    '/setting': (context) => const SettingPage(),
    // 加解密
    '/desAes': (context) => SymmetryPage(),
    '/rsa': (context) => RSAPage(),
    '/sha': (context) => SHAPage(),
    '/base64': (context) =>
        CryptoPage(title: "Base64加密/解密", type: cryptoBase64),
    '/md5': (context) => CryptoPage(title: "MD5加密", type: cryptoMD5),
    '/utf8': (context) => CryptoPage(title: "UTF8加密/解密", type: cryptoUTF8),
    '/url': (context) => CryptoPage(title: "URL加密/解密", type: cryptoURL),
    '/uuid': (context) => UUIDPage(),
  };

  static get() {
    return _routes;
  }

  static register(String key, WidgetBuilder builder) {
    if (_routes.containsKey(key)) {
      log('key $key already registered');
    }
    _routes.putIfAbsent(key, () => (context) => builder(context));
  }
}
