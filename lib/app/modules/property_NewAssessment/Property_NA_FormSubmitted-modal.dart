class Appartment {
  int? id;
  String? aptCode;
  String? apartmentName;

  Appartment({this.id, this.aptCode, this.apartmentName});

  Appartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aptCode = json['apt_code'];
    apartmentName = json['apartment_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['apt_code'] = this.aptCode;
    data['apartment_name'] = this.apartmentName;
    return data;
  }
}