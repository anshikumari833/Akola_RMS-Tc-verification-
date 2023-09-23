import 'package:amc_rms/app/common/cluster.dart';

class AssessmentDataById {
  int? id;
  int? ulbId;
  String? clusterId;
  int? safId;
  String? holdingNo;
  String? applicantName;
  String? applicationDate;
  String? balance;
  int? wardMstrId;
  int? ownershipTypeMstrId;
  int? propTypeMstrId;
  String? appartmentName;
  bool? noElectricConnection;
  String? electConsumerNo;
  String? electAccNo;
  String? electBindBookNo;
  String? electConsCategory;
  String? buildingPlanApprovalNo;
  String? buildingPlanApprovalDate;
  String? waterConnNo;
  String? waterConnDate;
  String? khataNo;
  String? plotNo;
  String? villageMaujaName;
  int? roadTypeMstrId;
  String? areaOfPlot;
  String? propAddress;
  String? propCity;
  String? propDist;
  String? propPinCode;
  String? propState;
  String? corrAddress;
  String? corrCity;
  String? corrDist;
  String? corrPinCode;
  String? corrState;
  bool? isMobileTower;
  String? towerArea;
  String? towerInstallationDate;
  bool? isHoardingBoard;
  String? hoardingArea;
  String? hoardingInstallationDate;
  bool? isPetrolPump;
  String? underGroundArea;
  String? petrolPumpCompletionDate;
  bool? isWaterHarvesting;
  String? landOccupationDate;
  int? newWardMstrId;
  String? entryType;
  int? zoneMstrId;
  String? newHoldingNo;
  String? flatRegistryDate;
  String? assessmentType;
  String? holdingType;
  int? isOld;
  int? apartmentDetailsId;
  String? ipAddress;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? userId;
  String? roadWidth;
  int? oldPropId;
  int? citizenId;
  String? safNo;
  String? ptNo;
  String? buildingName;
  String? streetName;
  String? location;
  String? landmark;
  bool? isGbSaf;
  String? gbOfficeName;
  String? gbUsageTypes;
  String? gbPropUsageTypes;
  bool? isTrust;
  String? trustType;
  String? isTrustVerified;
  String? rwhDateFrom;
  int? activeStatus;
  String? assessment;
  int? oldWardNo;
  int? newWardNo;
  String? ownershipType;
  String? propertyType;
  String? roadType;
  String? apartmentName;
  String? apartmentCode;
  List<AssessmentFloorsData >? floors;
  List<AssessmentOwnersData>? owners;

  AssessmentDataById(
      {this.id,
        this.ulbId,
        this.clusterId,
        this.safId,
        this.holdingNo,
        this.applicantName,
        this.applicationDate,
        this.balance,
        this.wardMstrId,
        this.ownershipTypeMstrId,
        this.propTypeMstrId,
        this.appartmentName,
        this.noElectricConnection,
        this.electConsumerNo,
        this.electAccNo,
        this.electBindBookNo,
        this.electConsCategory,
        this.buildingPlanApprovalNo,
        this.buildingPlanApprovalDate,
        this.waterConnNo,
        this.waterConnDate,
        this.khataNo,
        this.plotNo,
        this.villageMaujaName,
        this.roadTypeMstrId,
        this.areaOfPlot,
        this.propAddress,
        this.propCity,
        this.propDist,
        this.propPinCode,
        this.propState,
        this.corrAddress,
        this.corrCity,
        this.corrDist,
        this.corrPinCode,
        this.corrState,
        this.isMobileTower,
        this.towerArea,
        this.towerInstallationDate,
        this.isHoardingBoard,
        this.hoardingArea,
        this.hoardingInstallationDate,
        this.isPetrolPump,
        this.underGroundArea,
        this.petrolPumpCompletionDate,
        this.isWaterHarvesting,
        this.landOccupationDate,
        this.newWardMstrId,
        this.entryType,
        this.zoneMstrId,
        this.newHoldingNo,
        this.flatRegistryDate,
        this.assessmentType,
        this.holdingType,
        this.isOld,
        this.apartmentDetailsId,
        this.ipAddress,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.userId,
        this.roadWidth,
        this.oldPropId,
        this.citizenId,
        this.safNo,
        this.ptNo,
        this.buildingName,
        this.streetName,
        this.location,
        this.landmark,
        this.isGbSaf,
        this.gbOfficeName,
        this.gbUsageTypes,
        this.gbPropUsageTypes,
        this.isTrust,
        this.trustType,
        this.isTrustVerified,
        this.rwhDateFrom,
        this.activeStatus,
        this.assessment,
        this.oldWardNo,
        this.newWardNo,
        this.ownershipType,
        this.propertyType,
        this.roadType,
        this.apartmentName,
        this.apartmentCode,
        this.floors,
        this.owners});

  AssessmentDataById.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    ulbId = json['ulb_id'];
    clusterId = json['cluster_id'];
    safId = int.tryParse(json['saf_id'].toString());
    holdingNo = json['holding_no'];
    applicantName = json['applicant_name'];
    applicationDate = json['application_date'];
    balance = json['balance'];
    wardMstrId = int.tryParse(json['ward_mstr_id'].toString());
    ownershipTypeMstrId = int.tryParse(json['ownership_type_mstr_id'].toString());
    propTypeMstrId = int.tryParse(json['prop_type_mstr_id'].toString());
    appartmentName = json['appartment_name'];
    noElectricConnection = boolValue(json['no_electric_connection']);
    electConsumerNo = json['elect_consumer_no'];
    electAccNo = json['elect_acc_no'];
    electBindBookNo = json['elect_bind_book_no'];
    electConsCategory = json['elect_cons_category'];
    buildingPlanApprovalNo = json['building_plan_approval_no'];
    buildingPlanApprovalDate = json['building_plan_approval_date'];
    waterConnNo = json['water_conn_no'];
    waterConnDate = json['water_conn_date'];
    khataNo = json['khata_no'];
    plotNo = json['plot_no'];
    villageMaujaName = json['village_mauja_name'];
    roadTypeMstrId = int.tryParse(json['road_type_mstr_id'].toString());
    areaOfPlot = json['area_of_plot'];
    propAddress = json['prop_address'];
    propCity = json['prop_city'];
    propDist = json['prop_dist'];
    propPinCode = json['prop_pin_code'];
    propState = json['prop_state'];
    corrAddress = json['corr_address'];
    corrCity = json['corr_city'];
    corrDist = json['corr_dist'];
    corrPinCode = json['corr_pin_code'];
    corrState = json['corr_state'];
    isMobileTower = json['is_mobile_tower'];
    towerArea = json['tower_area'];
    towerInstallationDate = json['tower_installation_date'];
    isHoardingBoard = json['is_hoarding_board'];
    hoardingArea = json['hoarding_area'];
    hoardingInstallationDate = json['hoarding_installation_date'];
    isPetrolPump = boolValue(json['is_petrol_pump']);
    underGroundArea = json['under_ground_area'];
    petrolPumpCompletionDate = json['petrol_pump_completion_date'];
    isWaterHarvesting = boolValue(json['is_water_harvesting']);
    landOccupationDate = json['land_occupation_date'];
    newWardMstrId = int.tryParse(json['new_ward_mstr_id'].toString());
    entryType = json['entry_type'];
    zoneMstrId = int.tryParse(json['zone_mstr_id'].toString());
    newHoldingNo = json['new_holding_no'];
    flatRegistryDate = json['flat_registry_date'];
    assessmentType = json['assessment_type'];
    holdingType = json['holding_type'];
    isOld = int.tryParse(json['is_old'].toString());
    apartmentDetailsId = int.tryParse(json['apartment_details_id'].toString());
    ipAddress = json['ip_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = int.tryParse(json['status'].toString());
    userId = int.tryParse(json['user_id'].toString());
    roadWidth = json['road_width'];
    oldPropId = int.tryParse(json['old_prop_id'].toString());
    citizenId = int.tryParse(json['citizen_id'].toString());
    safNo = json['saf_no'];
    ptNo = json['pt_no'];
    buildingName = json['building_name'];
    streetName = json['street_name'];
    location = json['location'];
    landmark = json['landmark'];
    isGbSaf = boolValue(json['is_gb_saf']);
    gbOfficeName = json['gb_office_name'];
    gbUsageTypes = json['gb_usage_types'];
    gbPropUsageTypes = json['gb_prop_usage_types'];
    isTrust = boolValue(json['is_trust']);
    trustType = json['trust_type'];
    isTrustVerified = json['is_trust_verified'];
    rwhDateFrom = json['rwh_date_from'];
    activeStatus = int.tryParse(json['active_status'].toString());
    assessment = json['assessment'];
    oldWardNo = int.tryParse(json['old_ward_no'].toString());
    newWardNo =int.tryParse(json['new_ward_no'].toString());
    ownershipType = json['ownership_type'];
    propertyType = json['property_type'];
    roadType = json['road_type'];
    apartmentName = json['apartment_name'];
    apartmentCode = json['apartment_code'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ulb_id'] = this.ulbId;
    data['cluster_id'] = this.clusterId;
    data['saf_id'] = this.safId;
    data['holding_no'] = this.holdingNo;
    data['applicant_name'] = this.applicantName;
    data['application_date'] = this.applicationDate;
    data['balance'] = this.balance;
    data['ward_mstr_id'] = this.wardMstrId;
    data['ownership_type_mstr_id'] = this.ownershipTypeMstrId;
    data['prop_type_mstr_id'] = this.propTypeMstrId;
    data['appartment_name'] = this.appartmentName;
    data['no_electric_connection'] = this.noElectricConnection;
    data['elect_consumer_no'] = this.electConsumerNo;
    data['elect_acc_no'] = this.electAccNo;
    data['elect_bind_book_no'] = this.electBindBookNo;
    data['elect_cons_category'] = this.electConsCategory;
    data['building_plan_approval_no'] = this.buildingPlanApprovalNo;
    data['building_plan_approval_date'] = this.buildingPlanApprovalDate;
    data['water_conn_no'] = this.waterConnNo;
    data['water_conn_date'] = this.waterConnDate;
    data['khata_no'] = this.khataNo;
    data['plot_no'] = this.plotNo;
    data['village_mauja_name'] = this.villageMaujaName;
    data['road_type_mstr_id'] = this.roadTypeMstrId;
    data['area_of_plot'] = this.areaOfPlot;
    data['prop_address'] = this.propAddress;
    data['prop_city'] = this.propCity;
    data['prop_dist'] = this.propDist;
    data['prop_pin_code'] = this.propPinCode;
    data['prop_state'] = this.propState;
    data['corr_address'] = this.corrAddress;
    data['corr_city'] = this.corrCity;
    data['corr_dist'] = this.corrDist;
    data['corr_pin_code'] = this.corrPinCode;
    data['corr_state'] = this.corrState;
    data['is_mobile_tower'] = this.isMobileTower;
    data['tower_area'] = this.towerArea;
    data['tower_installation_date'] = this.towerInstallationDate;
    data['is_hoarding_board'] = this.isHoardingBoard;
    data['hoarding_area'] = this.hoardingArea;
    data['hoarding_installation_date'] = this.hoardingInstallationDate;
    data['is_petrol_pump'] = this.isPetrolPump;
    data['under_ground_area'] = this.underGroundArea;
    data['petrol_pump_completion_date'] = this.petrolPumpCompletionDate;
    data['is_water_harvesting'] = this.isWaterHarvesting;
    data['land_occupation_date'] = this.landOccupationDate;
    data['new_ward_mstr_id'] = this.newWardMstrId;
    data['entry_type'] = this.entryType;
    data['zone_mstr_id'] = this.zoneMstrId;
    data['new_holding_no'] = this.newHoldingNo;
    data['flat_registry_date'] = this.flatRegistryDate;
    data['assessment_type'] = this.assessmentType;
    data['holding_type'] = this.holdingType;
    data['is_old'] = this.isOld;
    data['apartment_details_id'] = this.apartmentDetailsId;
    data['ip_address'] = this.ipAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['road_width'] = this.roadWidth;
    data['old_prop_id'] = this.oldPropId;
    data['citizen_id'] = this.citizenId;
    data['saf_no'] = this.safNo;
    data['pt_no'] = this.ptNo;
    data['building_name'] = this.buildingName;
    data['street_name'] = this.streetName;
    data['location'] = this.location;
    data['landmark'] = this.landmark;
    data['is_gb_saf'] = this.isGbSaf;
    data['gb_office_name'] = this.gbOfficeName;
    data['gb_usage_types'] = this.gbUsageTypes;
    data['gb_prop_usage_types'] = this.gbPropUsageTypes;
    data['is_trust'] = this.isTrust;
    data['trust_type'] = this.trustType;
    data['is_trust_verified'] = this.isTrustVerified;
    data['rwh_date_from'] = this.rwhDateFrom;
    data['active_status'] = this.activeStatus;
    data['assessment'] = this.assessment;
    data['old_ward_no'] = this.oldWardNo;
    data['new_ward_no'] = this.newWardNo;
    data['ownership_type'] = this.ownershipType;
    data['property_type'] = this.propertyType;
    data['road_type'] = this.roadType;
    data['apartment_name'] = this.apartmentName;
    data['apartment_code'] = this.apartmentCode;

    return data;
  }
}

class AssessmentFloorsData {
  int? id;
  int? propertyId;
  int? safId;
  int? floorMstrId;
  int? usageTypeMstrId;
  int? constTypeMstrId;
  int? occupancyTypeMstrId;
  String? builtupArea;
  String? dateFrom;
  String? dateUpto;
  int? status;
  String? carpetArea;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? propFloorDetailsId;
  int? oldFloorId;
  String? floorName;
  String? usageType;
  String? occupancyType;
  String? constructionType;

  AssessmentFloorsData (
      {this.id,
        this.propertyId,
        this.safId,
        this.floorMstrId,
        this.usageTypeMstrId,
        this.constTypeMstrId,
        this.occupancyTypeMstrId,
        this.builtupArea,
        this.dateFrom,
        this.dateUpto,
        this.status,
        this.carpetArea,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.propFloorDetailsId,
        this.oldFloorId,
        this.floorName,
        this.usageType,
        this.occupancyType,
        this.constructionType});

  AssessmentFloorsData .fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    propertyId = int.tryParse(json['property_id'].toString());
    safId = int.tryParse(json['saf_id'].toString());
    floorMstrId = int.tryParse(json['floor_mstr_id'].toString());
    usageTypeMstrId =int.tryParse(json['usage_type_mstr_id'].toString());
    constTypeMstrId = int.tryParse(json['const_type_mstr_id'].toString());
    occupancyTypeMstrId = int.tryParse(json['occupancy_type_mstr_id'].toString());
    builtupArea = json['builtup_area'];
    dateFrom = json['date_from'];
    dateUpto = json['date_upto'];
    status = int.tryParse(json['status'].toString());
    carpetArea = json['carpet_area'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = int.tryParse(json['user_id'].toString());
    propFloorDetailsId = json['prop_floor_details_id'];
    oldFloorId = int.tryParse(json['old_floor_id'].toString());
    floorName = json['floor_name'];
    usageType = json['usage_type'];
    occupancyType = json['occupancy_type'];
    constructionType = json['construction_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['saf_id'] = this.safId;
    data['floor_mstr_id'] = this.floorMstrId;
    data['usage_type_mstr_id'] = this.usageTypeMstrId;
    data['const_type_mstr_id'] = this.constTypeMstrId;
    data['occupancy_type_mstr_id'] = this.occupancyTypeMstrId;
    data['builtup_area'] = this.builtupArea;
    data['date_from'] = this.dateFrom;
    data['date_upto'] = this.dateUpto;
    data['status'] = this.status;
    data['carpet_area'] = this.carpetArea;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['prop_floor_details_id'] = this.propFloorDetailsId;
    data['old_floor_id'] = this.oldFloorId;
    data['floor_name'] = this.floorName;
    data['usage_type'] = this.usageType;
    data['occupancy_type'] = this.occupancyType;
    data['construction_type'] = this.constructionType;
    return data;
  }
}

class AssessmentOwnersData {
  int? id;
  int? propertyId;
  int? safId;
  String? ownerName;
  String? guardianName;
  String? relationType;
  int? mobileNo;
  String? email;
  String? panNo;
  int? aadharNo;
  String? gender;
  String? dob;
  bool? isArmedForce;
  bool? isSpeciallyAbled;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? userId;
  int? oldOwnerId;

  AssessmentOwnersData(
      {this.id,
        this.propertyId,
        this.safId,
        this.ownerName,
        this.guardianName,
        this.relationType,
        this.mobileNo,
        this.email,
        this.panNo,
        this.aadharNo,
        this.gender,
        this.dob,
        this.isArmedForce,
        this.isSpeciallyAbled,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.oldOwnerId});

  AssessmentOwnersData.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'].toString());
    propertyId = json['property_id'];
    safId = int.tryParse(json['saf_id'].toString().toString());
    ownerName = json['owner_name'];
    guardianName = json['guardian_name'];
    relationType = json['relation_type'];
    mobileNo = int.tryParse(json['mobile_no'].toString());
    email = json['email'];
    panNo = json['pan_no'];
    aadharNo = int.tryParse(json['aadhar_no'].toString());
    gender = json['gender'];
    dob = json['dob'];
    isArmedForce = boolValue(json['is_armed_force']);
    isSpeciallyAbled = boolValue(json['is_specially_abled']);
    status = int.tryParse(json['status'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = int.tryParse(json['user_id'].toString());
    oldOwnerId = int.tryParse(json['old_owner_id'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['saf_id'] = this.safId;
    data['owner_name'] = this.ownerName;
    data['guardian_name'] = this.guardianName;
    data['relation_type'] = this.relationType;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['pan_no'] = this.panNo;
    data['aadhar_no'] = this.aadharNo;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['is_armed_force'] = this.isArmedForce;
    data['is_specially_abled'] = this.isSpeciallyAbled;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['old_owner_id'] = this.oldOwnerId;
    return data;
  }
}