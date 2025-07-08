class TableCateg {
  TableCateg({
      this.categoryId, 
      this.categoryDescriptionFR, 
      this.categoryDescriptionAR, 
      this.categoryDescriptionEn,});

  TableCateg.fromJson(dynamic json) {
    categoryId = json['CategoryId'];
    categoryDescriptionFR = json['categoryDescriptionFR'];
    categoryDescriptionAR = json['categoryDescriptionAR'];
    categoryDescriptionEn = json['categoryDescriptionEn'];
  }
  num? categoryId;
  String? categoryDescriptionFR;
  String? categoryDescriptionAR;
  String? categoryDescriptionEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CategoryId'] = categoryId;
    map['categoryDescriptionFR'] = categoryDescriptionFR;
    map['categoryDescriptionAR'] = categoryDescriptionAR;
    map['categoryDescriptionEn'] = categoryDescriptionEn;
    return map;
  }

}