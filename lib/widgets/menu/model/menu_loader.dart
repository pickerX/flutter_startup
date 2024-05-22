import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_startup/widgets/menu/model/menu.d.dart';

class MenuLoader {
  static MenuListModel? _model;

  // 新增自定义菜单
  static Future<MenuListModel> newMenu() {
    return Future.value(_model);
  }

  static Future<MenuListModel> load(
    BuildContext context,
    String assetName,
  ) {
    if (_model != null) {
      log('load menu from fast cache');
      return Future.value(_model);
    }
    AssetBundle asset = DefaultAssetBundle.of(context);
    return asset.loadStructuredData(assetName, (value) {
      Map<String, dynamic> config = jsonDecode(value);
      _model = MenuListModel.fromJson(config);
      return Future.value(_model);
    });
  }
}
