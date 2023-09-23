class Demand{
  String? totalTax;
  String? totalOnePercPenalty;
  int? totalQuarters;
  String? fromQuarterYear;
  String? fromQuarter;
  String? toQuarterYear;
  String? toQuarter;
  bool? isResidential;
  bool? lateAssessmentStatus;
  int? lateAssessmentPenalty;
  int? adjustAmount;
  String? totalDemand;
  int? payableAmount;

  Demand(
      {this.totalTax,
        this.totalOnePercPenalty,
        this.totalQuarters,
        this.fromQuarterYear,
        this.fromQuarter,
        this.toQuarterYear,
        this.toQuarter,
        this.isResidential,
        this.lateAssessmentStatus,
        this.lateAssessmentPenalty,
        this.adjustAmount,
        this.totalDemand,
        this.payableAmount});

  Demand.fromJson(Map<String, dynamic> json) {
    totalTax = json['totalTax'];
    totalOnePercPenalty = json['totalOnePercPenalty'];
    totalQuarters = json['totalQuarters'];
    fromQuarterYear = json['fromQuarterYear'];
    fromQuarter = json['fromQuarter'];
    toQuarterYear = json['toQuarterYear'];
    toQuarter = json['toQuarter'];
    isResidential = json['isResidential'];
    lateAssessmentStatus = json['lateAssessmentStatus'];
    lateAssessmentPenalty = json['lateAssessmentPenalty'];
    adjustAmount = json['adjustAmount'];
    totalDemand = json['totalDemand'];
    payableAmount = json['payableAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalTax'] = this.totalTax;
    data['totalOnePercPenalty'] = this.totalOnePercPenalty;
    data['totalQuarters'] = this.totalQuarters;
    data['fromQuarterYear'] = this.fromQuarterYear;
    data['fromQuarter'] = this.fromQuarter;
    data['toQuarterYear'] = this.toQuarterYear;
    data['toQuarter'] = this.toQuarter;
    data['isResidential'] = this.isResidential;
    data['lateAssessmentStatus'] = this.lateAssessmentStatus;
    data['lateAssessmentPenalty'] = this.lateAssessmentPenalty;
    data['adjustAmount'] = this.adjustAmount;
    data['totalDemand'] = this.totalDemand;
    data['payableAmount'] = this.payableAmount;
    return data;
  }
}


class Floors {
  String? buildupArea;
  String? dateFrom;
  String? mFloorNo;
  String? mUsageType;
  String? quarterYear;
  String? ruleSet;
  String? qtr;
  String? arv;
  int? calculationPercFactor;
  String? rentalValue;
  String? holdingTax;
  String? latrineTax;
  String? waterTax;
  String? healthTax;
  String? educationTax;
  String? rwhPenalty;
  String? totalTax;

  Floors(
      {this.buildupArea,
        this.dateFrom,
        this.mFloorNo,
        this.mUsageType,
        this.quarterYear,
        this.ruleSet,
        this.qtr,
        this.arv,
        this.calculationPercFactor,
        this.rentalValue,
        this.holdingTax,
        this.latrineTax,
        this.waterTax,
        this.healthTax,
        this.educationTax,
        this.rwhPenalty,
        this.totalTax});

  Floors.fromJson(Map<String, dynamic> json) {
    buildupArea = json['buildupArea'];
    dateFrom = json['dateFrom'];
    mFloorNo = json['mFloorNo'];
    mUsageType = json['mUsageType'];
    quarterYear = json['quarterYear'];
    ruleSet = json['ruleSet'];
    qtr = json['qtr'];
    arv = json['arv'];
    calculationPercFactor = json['calculationPercFactor'];
    rentalValue = json['rentalValue'];
    holdingTax = json['holdingTax'];
    latrineTax = json['latrineTax'];
    waterTax = json['waterTax'];
    healthTax = json['healthTax'];
    educationTax = json['educationTax'];
    rwhPenalty = json['rwhPenalty'];
    totalTax = json['totalTax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buildupArea'] = this.buildupArea;
    data['dateFrom'] = this.dateFrom;
    data['mFloorNo'] = this.mFloorNo;
    data['mUsageType'] = this.mUsageType;
    data['quarterYear'] = this.quarterYear;
    data['ruleSet'] = this.ruleSet;
    data['qtr'] = this.qtr;
    data['arv'] = this.arv;
    data['calculationPercFactor'] = this.calculationPercFactor;
    data['rentalValue'] = this.rentalValue;
    data['holdingTax'] = this.holdingTax;
    data['latrineTax'] = this.latrineTax;
    data['waterTax'] = this.waterTax;
    data['healthTax'] = this.healthTax;
    data['educationTax'] = this.educationTax;
    data['rwhPenalty'] = this.rwhPenalty;
    data['totalTax'] = this.totalTax;
    return data;
  }
}

class TotalQtrTaxes {
  int? key;
  String? effectingFrom;
  String? qtr;
  String? arv;
  String? holdingTax;
  String? waterTax;
  String? latrineTax;
  String? educationTax;
  String? healthTax;
  String? rwhPenalty;
  String? quaterlyTax;

  TotalQtrTaxes(
      {this.key,
        this.effectingFrom,
        this.qtr,
        this.arv,
        this.holdingTax,
        this.waterTax,
        this.latrineTax,
        this.educationTax,
        this.healthTax,
        this.rwhPenalty,
        this.quaterlyTax});

  TotalQtrTaxes.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    effectingFrom = json['effectingFrom'];
    qtr = json['qtr'];
    arv = json['arv'];
    holdingTax = json['holdingTax'];
    waterTax = json['waterTax'];
    latrineTax = json['latrineTax'];
    educationTax = json['educationTax'];
    healthTax = json['healthTax'];
    rwhPenalty = json['rwhPenalty'];
    quaterlyTax = json['quaterlyTax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['effectingFrom'] = this.effectingFrom;
    data['qtr'] = this.qtr;
    data['arv'] = this.arv;
    data['holdingTax'] = this.holdingTax;
    data['waterTax'] = this.waterTax;
    data['latrineTax'] = this.latrineTax;
    data['educationTax'] = this.educationTax;
    data['healthTax'] = this.healthTax;
    data['rwhPenalty'] = this.rwhPenalty;
    data['quaterlyTax'] = this.quaterlyTax;
    return data;
  }
}
