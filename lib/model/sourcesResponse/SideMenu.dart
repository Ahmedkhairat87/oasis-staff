import 'Menu.dart';

class SideMenu {
  SideMenu({
      this.menu,});

  SideMenu.fromJson(dynamic json) {
    menu = json['Menu'] != null ? Menu.fromJson(json['Menu']) : null;
  }
  Menu? menu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (menu != null) {
      map['Menu'] = menu?.toJson();
    }
    return map;
  }

}