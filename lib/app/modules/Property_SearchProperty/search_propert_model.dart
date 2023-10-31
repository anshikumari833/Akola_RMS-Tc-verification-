import '../../common/cluster.dart';

class SearchedData {
  int? id;
  int? ulbId;
  String? clusterId;
  dynamic safId; // This can be a String or another suitable type
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
  dynamic roadTypeMstrId; // This can be a String or another suitable type
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
  dynamic isHoardingBoard; // This can be a String or another suitable type
  String? hoardingArea;
  String? hoardingInstallationDate;
  bool? isPetrolPump;
  String? underGroundArea;
  String? petrolPumpCompletionDate;
  bool? isWaterHarvesting;
  String? landOccupationDate;
  String? newWardMstrId;
  dynamic entryType; // This can be a String or another suitable type
  int? zoneMstrId;
  dynamic newHoldingNo; // This can be a String or another suitable type
  String? flatRegistryDate;
  dynamic assessmentType; // This can be a String or another suitable type
  dynamic holdingType; // This can be a String or another suitable type
  dynamic isOld; // This can be an int or another suitable type
  dynamic apartmentDetailsId; // This can be a String or another suitable type
  String? ipAddress;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? userId;
  dynamic roadWidth; // This can be a String or another suitable type
  dynamic oldPropId; // This can be a String or another suitable type
  dynamic citizenId; // This can be a String or another suitable type
  dynamic safNo; // This can be a String or another suitable type
  dynamic ptNo; // This can be a String or another suitable type
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
  dynamic rwhDateFrom; // This can be a String or another suitable type
  bool? isWaivedOff;
  int? categoryId;
  String? applicantMarathi;
  String? propertyNo;
  int? activeStatus;
  String? assessment;
  String? wardNo;
  String? ownershipType;
  String? propertyType;
  dynamic roadType; // This can be a String or another suitable type
  String? apartmentCode;
  String? zoneName;
  List<SearchedFloorsData >? floors;
  List<SerchedOwnersData>? owners;

  SearchedData({
    this.id,
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
    this.isWaivedOff,
    this.categoryId,
    this.applicantMarathi,
    this.propertyNo,
    this.activeStatus,
    this.assessment,
    this.wardNo,
    this.ownershipType,
    this.propertyType,
    this.roadType,
    this.apartmentCode,
    this.zoneName,
  });

  SearchedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ulbId = json['ulb_id'];
    clusterId = json['cluster_id'];
    safId = json['saf_id'];
    holdingNo = json['holding_no'];
    applicantName = json['applicant_name'];
    applicationDate = json['application_date'];
    balance = json['balance'];
    wardMstrId = json['ward_mstr_id'];
    ownershipTypeMstrId = json['ownership_type_mstr_id'];
    propTypeMstrId = json['prop_type_mstr_id'];
    appartmentName = json['appartment_name'];
    noElectricConnection = json['no_electric_connection'];
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
    roadTypeMstrId = json['road_type_mstr_id'];
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
    isPetrolPump = json['is_petrol_pump'];
    underGroundArea = json['under_ground_area'];
    petrolPumpCompletionDate = json['petrol_pump_completion_date'];
    isWaterHarvesting = json['is_water_harvesting'];
    landOccupationDate = json['land_occupation_date'];
    newWardMstrId = json['new_ward_mstr_id'];
    entryType = json['entry_type'];
    zoneMstrId = json['zone_mstr_id'];
    newHoldingNo = json['new_holding_no'];
    flatRegistryDate = json['flat_registry_date'];
    assessmentType = json['assessment_type'];
    holdingType = json['holding_type'];
    isOld = json['is_old'];
    apartmentDetailsId = json['apartment_details_id'];
    ipAddress = json['ip_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    userId = json['user_id'];
    roadWidth = json['road_width'];
    oldPropId = json['old_prop_id'];
    citizenId = json['citizen_id'];
    safNo = json['saf_no'];
    ptNo = json['pt_no'];
    buildingName = json['building_name'];
    streetName = json['street_name'];
    location = json['location'];
    landmark = json['landmark'];
    isGbSaf = json['is_gb_saf'];
    gbOfficeName = json['gb_office_name'];
    gbUsageTypes = json['gb_usage_types'];
    gbPropUsageTypes = json['gb_prop_usage_types'];
    isTrust = json['is_trust'];
    trustType = json['trust_type'];
    isTrustVerified = json['is_trust_verified'];
    rwhDateFrom = json['rwh_date_from'];
    isWaivedOff = json['is_waived_off'];
    categoryId = json['category_id'];
    applicantMarathi = json['applicant_marathi'];
    propertyNo = json['property_no'];
    activeStatus = json['active_status'];
    assessment = json['assessment'];
    wardNo = json['ward_no'];
    ownershipType = json['ownership_type'];
    propertyType = json['property_type'];
    roadType = json['road_type'];
    apartmentCode = json['apartment_code'];
    zoneName = json['zone_name'];
  }
}


class SearchedFloorsData {
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

  SearchedFloorsData (
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

  SearchedFloorsData .fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    safId = int.tryParse(json['saf_id'].toString());
    floorMstrId = json['floor_mstr_id'];
    usageTypeMstrId = json['usage_type_mstr_id'];
    constTypeMstrId = json['const_type_mstr_id'];
    occupancyTypeMstrId = json['occupancy_type_mstr_id'];
    builtupArea = json['builtup_area'];
    dateFrom = json['date_from'];
    dateUpto = json['date_upto'];
    status = json['status'];
    carpetArea = json['carpet_area'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId =int.tryParse(json['user_id'].toString());
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



class SerchedOwnersData {
  int? id;
  int? propertyId;
  int? safId;
  String? ownerName;
  String? ownerMarathiName;
  String? guardianName;
  String? guardianMarathiName;
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
  String? oldOwnerId;

  SerchedOwnersData(
      {this.id,
        this.propertyId,
        this.safId,
        this.ownerName,
        this.ownerMarathiName,
        this.guardianName,
        this.guardianMarathiName,
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

  SerchedOwnersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    safId = int.tryParse(json['saf_id'].toString());
    ownerName = json['owner_name'];
    ownerMarathiName = json['owner_name_marathi'];
    guardianName = json['guardian_name'];
    guardianMarathiName = json['guardian_name_marathi'];
    relationType = json['relation_type'];
    mobileNo = int.tryParse(json['mobile_no'].toString());
    email = json['email'];
    panNo = json['pan_no'];
    aadharNo = int.tryParse(json['aadhar_no'].toString());
    gender = json['gender'];
    dob = json['dob'];
    isArmedForce = json['is_armed_force'];
    isSpeciallyAbled = json['is_specially_abled'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = int.tryParse(json['user_id'].toString());
    oldOwnerId = json['old_owner_id'];
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