// ignore_for_file: file_names

class MenuListModel {
  final List<MenuItem> menus;

  MenuListModel(this.menus);

  factory MenuListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> array = json['menu'];
    List<MenuItem> menu = array.map((e) => MenuItem.fromJson(e)).toList();
    return MenuListModel(menu);
  }
}

class MenuItem {
  final String title;
  final String? icon;
  final String? route;

  final List<MenuItem>? children;

  MenuItem(this.title, this.icon, this.route, this.children);

  MenuItem.fromChild(Map<String, dynamic> json)
      : icon = json['icon'],
        title = json['title'],
        route = json['route'],
        children = null;

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    var title = json['title'];
    var route = json['route'];
    var icon = json['icon'];

    List<MenuItem>? source;
    if (json.containsKey('children')) {
      List<dynamic> cJson = json['children'];
      source = cJson.map((e) => MenuItem.fromChild(e)).toList();
    }
    return MenuItem(title, icon, route, source);
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'icon': icon, 'route': route, 'children': children};
}

class Header {
  final String title;
  final String icon;

  Header(this.title, this.icon);

  Header.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        icon = json['icon'];
}
