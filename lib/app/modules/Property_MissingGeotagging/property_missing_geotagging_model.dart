class MissingGeoTaggingList {
  int? paymentStatus;
  String? safNo;
  int? id;
  int? wardMstrId;
  int? wardNo;
  int? propTypeMstrId;
  String? appartmentName;
  String? ownerId;
  String? ownerName;
  String? mobileNo;
  String? propertyType;
  String? assessment;
  String? applyDate;
  bool? parked;
  String? propAddress;
  String? applicantName;

  MissingGeoTaggingList(
      {this.paymentStatus,
        this.safNo,
        this.id,
        this.wardMstrId,
        this.wardNo,
        this.propTypeMstrId,
        this.appartmentName,
        this.ownerId,
        this.ownerName,
        this.mobileNo,
        this.propertyType,
        this.assessment,
        this.applyDate,
        this.parked,
        this.propAddress,
        this.applicantName});

  MissingGeoTaggingList.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['payment_status'];
    safNo = json['saf_no'];
    id = json['id'];
    wardMstrId = json['ward_mstr_id'];
    wardNo = json['ward_no'];
    propTypeMstrId = json['prop_type_mstr_id'];
    appartmentName = json['appartment_name'];
    ownerId = json['owner_id'];
    ownerName = json['owner_name'];
    mobileNo = json['mobile_no'];
    propertyType = json['property_type'];
    assessment = json['assessment'];
    applyDate = json['apply_date'];
    parked = json['parked'];
    propAddress = json['prop_address'];
    applicantName = json['applicant_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_status'] = this.paymentStatus;
    data['saf_no'] = this.safNo;
    data['id'] = this.id;
    data['ward_mstr_id'] = this.wardMstrId;
    data['ward_no'] = this.wardNo;
    data['prop_type_mstr_id'] = this.propTypeMstrId;
    data['appartment_name'] = this.appartmentName;
    data['owner_id'] = this.ownerId;
    data['owner_name'] = this.ownerName;
    data['mobile_no'] = this.mobileNo;
    data['property_type'] = this.propertyType;
    data['assessment'] = this.assessment;
    data['apply_date'] = this.applyDate;
    data['parked'] = this.parked;
    data['prop_address'] = this.propAddress;
    data['applicant_name'] = this.applicantName;
    return data;
  }
}