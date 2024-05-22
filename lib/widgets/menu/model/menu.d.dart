// 菜单相关抽象
class MenuItem {
  final String title;
  final String? icon;
  final String? routeName;

  final List<MenuItem>? children;

  MenuItem(this.title, this.icon, this.routeName, this.children);

  MenuItem.fromChild(Map<String, dynamic> json)
      : icon = json['icon'],
        title = json['title'],
        routeName = json['routeName'],
        children = null;

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    var title = json['title'];
    var route = json['routeName'];
    var icon = json['icon'];

    List<MenuItem>? source;
    if (json.containsKey('children')) {
      List<dynamic> cJson = json['children'];
      source = cJson.map((e) => MenuItem.fromChild(e)).toList();
    }
    return MenuItem(title, icon, route, source);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
        'routeName': routeName,
        'children': children
      };
}

class Header {
  final String title;
  final String icon;

  Header(this.title, this.icon);

  Header.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        icon = json['icon'];
}

class MenuListModel {
  final List<MenuItem> menus;

  MenuListModel(this.menus);

  factory MenuListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> array = json['menu'];
    List<MenuItem> menu = array.map((e) => MenuItem.fromJson(e)).toList();
    return MenuListModel(menu);
  }
}
