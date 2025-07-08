import 'Data.dart';
import 'TableCateg.dart';
import 'SideMenu.dart';

class LoginResponse {
  LoginResponse({
      this.token, 
      this.data, 
      this.unReadedCount, 
      this.tableCateg, 
      this.sideMenu,});

  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    unReadedCount = json['UnReadedCount'];
    if (json['TableCateg'] != null) {
      tableCateg = [];
      json['TableCateg'].forEach((v) {
        tableCateg?.add(TableCateg.fromJson(v));
      });
    }
    if (json['sideMenu'] != null) {
      sideMenu = [];
      json['sideMenu'].forEach((v) {
        sideMenu?.add(SideMenu.fromJson(v));
      });
    }
  }
  String? token;
  List<Data>? data;
  num? unReadedCount;
  List<TableCateg>? tableCateg;
  List<SideMenu>? sideMenu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['UnReadedCount'] = unReadedCount;
    if (tableCateg != null) {
      map['TableCateg'] = tableCateg?.map((v) => v.toJson()).toList();
    }
    if (sideMenu != null) {
      map['sideMenu'] = sideMenu?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}