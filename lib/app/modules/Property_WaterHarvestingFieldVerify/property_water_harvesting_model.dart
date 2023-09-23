class WaterHarvestingData {
  int? id;
  String? applicationNo;
  String? applicantName;
  int? wardNo;
  String? holdingNo;
  String? propertyType;
  String? date;

  WaterHarvestingData(
      {this.id,
      this.applicationNo,
      this.applicantName,
      this.wardNo,
      this.holdingNo,
      this.propertyType,
      this.date});

  WaterHarvestingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applicationNo = json['application_no'];
    applicantName = json['applicant_name'];
    wardNo = json['ward_no'];
    holdingNo = json['holding_no'];
    propertyType = json['property_type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['application_no'] = this.applicationNo;
    data['applicant_name'] = this.applicantName;
    data['ward_no'] = this.wardNo;
    data['holding_no'] = this.holdingNo;
    data['property_type'] = this.propertyType;
    data['date'] = this.date;
    return data;
  }
}
