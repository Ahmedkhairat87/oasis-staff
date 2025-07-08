class Data {
  Data({
      this.empNo, 
      this.empName, 
      this.empCateg, 
      this.passFlag, 
      this.schoolemail, 
      this.mangFlag,});

  Data.fromJson(dynamic json) {
    empNo = json['emp_no'];
    empName = json['emp_name'];
    empCateg = json['emp_categ'];
    passFlag = json['passFlag'];
    schoolemail = json['schoolemail'];
    mangFlag = json['MangFlag'];
  }
  num? empNo;
  String? empName;
  num? empCateg;
  num? passFlag;
  String? schoolemail;
  String? mangFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emp_no'] = empNo;
    map['emp_name'] = empName;
    map['emp_categ'] = empCateg;
    map['passFlag'] = passFlag;
    map['schoolemail'] = schoolemail;
    map['MangFlag'] = mangFlag;
    return map;
  }

}