import 'SubMenu.dart';

class Menu {
  Menu({
      this.linkID, 
      this.linkDescriptionFR, 
      this.linkDescriptionEN, 
      this.linkDescriptionAR, 
      this.subMenu,});

  Menu.fromJson(dynamic json) {
    linkID = json['linkID'];
    linkDescriptionFR = json['linkDescriptionFR'];
    linkDescriptionEN = json['linkDescriptionEN'];
    linkDescriptionAR = json['linkDescriptionAR'];
    if (json['SubMenu'] != null) {
      subMenu = [];
      json['SubMenu'].forEach((v) {
        subMenu?.add(SubMenu.fromJson(v));
      });
    }
  }
  num? linkID;
  String? linkDescriptionFR;
  String? linkDescriptionEN;
  String? linkDescriptionAR;
  List<SubMenu>? subMenu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['linkID'] = linkID;
    map['linkDescriptionFR'] = linkDescriptionFR;
    map['linkDescriptionEN'] = linkDescriptionEN;
    map['linkDescriptionAR'] = linkDescriptionAR;
    if (subMenu != null) {
      map['SubMenu'] = subMenu?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}