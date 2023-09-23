class SearchSafData {
  int? id;
  String? status;
  String? safNo;
  String? assessmentType;
  String? currentRole;
  int? oldWardNo;
  int? newWardNo;
  String? propAddress;
  String? appliedby;
  String? mobileNo;
  String? ownerName;

  SearchSafData(
      {this.id,
        this.status,
        this.safNo,
        this.assessmentType,
        this.currentRole,
        this.oldWardNo,
        this.newWardNo,
        this.propAddress,
        this.appliedby,
       this.mobileNo,
         this.ownerName});

  SearchSafData.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    status = json['status'];
    safNo = json['saf_no'];
    assessmentType = json['assessment_type'];
    currentRole = json['current_role'];
    currentRole = json['currentRole'];
    oldWardNo = int.tryParse(json['old_ward_no'].toString());
    newWardNo = int.tryParse(json['new_ward_no'].toString());
    propAddress = json['prop_address'];
    appliedby = json['appliedby'];
    mobileNo = json['mobile_no'];
    ownerName = json['owner_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['saf_no'] = this.safNo;
    data['assessment_type'] = this.assessmentType;
    data['current_role'] = this.currentRole;
    data['currentRole'] = this.currentRole;
    data['old_ward_no'] = this.oldWardNo;
    data['new_ward_no'] = this.newWardNo;
    data['prop_address'] = this.propAddress;
    data['appliedby'] = this.appliedby;
    data['mobile_no'] = this.mobileNo;
    data['owner_name'] = this.ownerName;
    return data;
  }
}


class SearchGbSafData {
  int? id;
  String? oldWardNo;
  String? safNo;
  String? officerName;
  String? assessmentType;
  String? mobileNo;
  String? updtedAt;
  String? currentRole;

  SearchGbSafData(
      {this.id,
        this.oldWardNo,
        this.safNo,
        this.officerName,
        this.assessmentType,
        this.mobileNo,
        this.updtedAt,
        this.currentRole,
      });

  SearchGbSafData.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    oldWardNo = json['old_ward_no'];
    safNo = json['saf_no'];
    officerName = json['officer_name'];
    assessmentType = json['assessment_type'];
    mobileNo = json['mobile_no'];
    updtedAt = json['updtedAt'];
    currentRole = json['currentRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['old_ward_no'] = this.oldWardNo;
    data['saf_no'] = this.safNo;
    data['officer_name'] = this.officerName;
    data['ward_name'] = this.assessmentType;
    data['mobile_no'] = this.mobileNo;
    data['updtedAt'] = this.updtedAt;
    data['currentRole'] = this.currentRole;
    return data;
  }
}



class SearchOtherData {
  int? id;
  String? status;
  String? applicationNo;
  int? currentRole;
  String? currentRolee;
  int? wardName;
  String? propAddress;

  SearchOtherData(
      {this.id,
        this.status,
        this.applicationNo,
        this.currentRole,
        this.currentRolee,
        this.wardName,
        this.propAddress});

  SearchOtherData.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    status = json['status'];
    applicationNo = json['application_no'];
    currentRole = int.tryParse(json['current_role'].toString());
    currentRolee = json['currentRole'];
    wardName = int.tryParse(json['ward_name'].toString());
    propAddress = json['prop_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['application_no'] = this.applicationNo;
    data['current_role'] = this.currentRolee;
    data['currentRole'] = this.currentRole;
    data['ward_name'] = this.wardName;
    data['prop_address'] = this.propAddress;
    return data;
  }
}