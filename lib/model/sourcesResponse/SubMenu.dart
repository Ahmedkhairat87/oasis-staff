class SubMenu {
  SubMenu({
      this.sublinkId, 
      this.sublinkDescriptionFR, 
      this.sublinkDescriptionEN, 
      this.sublinkDescriptionAr, 
      this.navForm, 
      this.storyBoard, 
      this.pageurlFR, 
      this.pageurlEN, 
      this.pageurlAR,});

  SubMenu.fromJson(dynamic json) {
    sublinkId = json['SublinkId'];
    sublinkDescriptionFR = json['sublinkDescriptionFR'];
    sublinkDescriptionEN = json['sublinkDescriptionEN'];
    sublinkDescriptionAr = json['sublinkDescriptionAr'];
    navForm = json['NavForm'];
    storyBoard = json['storyBoard'];
    pageurlFR = json['Pageurl_FR'];
    pageurlEN = json['Pageurl_EN'];
    pageurlAR = json['Pageurl_AR'];
  }
  num? sublinkId;
  String? sublinkDescriptionFR;
  String? sublinkDescriptionEN;
  String? sublinkDescriptionAr;
  String? navForm;
  String? storyBoard;
  String? pageurlFR;
  String? pageurlEN;
  String? pageurlAR;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SublinkId'] = sublinkId;
    map['sublinkDescriptionFR'] = sublinkDescriptionFR;
    map['sublinkDescriptionEN'] = sublinkDescriptionEN;
    map['sublinkDescriptionAr'] = sublinkDescriptionAr;
    map['NavForm'] = navForm;
    map['storyBoard'] = storyBoard;
    map['Pageurl_FR'] = pageurlFR;
    map['Pageurl_EN'] = pageurlEN;
    map['Pageurl_AR'] = pageurlAR;
    return map;
  }

}