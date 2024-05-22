import 'package:flutter/material.dart';
import 'package:flutter_startup/widgets/menu/model/menu.d.dart';

class MenuProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  MenuListModel? _model;

  int _selectedIndex = 0;
  // 二级菜单索引
  int _selectedSubIndex = -1;

  void updateSelection(int index) {
    _selectedIndex = index;
    _selectedSubIndex = -1; // reset sub menu selection
    notifyListeners();
  }

  void updateSubSelection(int index) {
    _selectedSubIndex = index;
    notifyListeners();
  }

  String? getRootMenuRoute(int index) {
    var menu = _model?.menus[index];
    return menu?.routeName ?? '';
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  /// cache menu data for sub menu
  void cacheMenuModel(MenuListModel model) {
    _model = model;
  }

  MenuListModel? get menuModel => _model;
  int get currentIndex => _selectedIndex;
  int get currentSubIndex => _selectedSubIndex;
}
