import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/function.dart';
import '../providers/gb_saf_apply_provider.dart';
import '../views/property_submit_response_data_view.dart';

class PropertyGbSafApplyController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isDataProcessing = false.obs;
  //ADD FLOOR
  var floorList = List<dynamic>.empty(growable: true).obs;
  // List<Map<String, dynamic>> floorDataList = [];
   var floorDataList = List<dynamic>.empty(growable: true).obs;
  var data;
  var safNo;
  var safId;
  var applyDate;
  var demandAmount;
  var demandAmountRebate;
  var ruleSet1;
  var ruleSet2;
  var ruleSet3;


//Floor Detail
  var floorType ="".obs;
  var floorUseType = "".obs;
  var floorOccupancyType = "".obs;
  var floorConstructionType = "".obs;
  final floorBuiltUpController = [].obs;
  final floorDateFromController = [].obs;
  final floordateUptoController = [].obs;

  //add floor
  final remarkControllers = <TextEditingController>[].obs;

  void removeFloor(int index) {
    remarkControllers.removeAt(index);
  }

//add floor
  void addFloor() {
    remarkControllers.add(TextEditingController());
    floorBuiltUpController.add(TextEditingController());
    floorDateFromController.add(TextEditingController());
    floordateUptoController.add(TextEditingController());
    // clear the values of the previous text fields
    floorBuiltUpController.last.clear();
    floorDateFromController.last.clear();
    floordateUptoController.last.clear();
  }

  void editFloorData(int index, Map<String, dynamic> updatedFloorData) {
    floorDataList[index] = updatedFloorData;
  }

  void deleteFloorData(int index) {
    floorDataList.removeAt(index);
  }

  //DROPDOWN LIST
  List<Map<String, dynamic>> wardList = [];
  List<Map<String, dynamic>> ownershipList = [];
  List<Map<String, dynamic>> propertyList = [];
  List<Map<String, dynamic>> usageList = [];
  List<Map<String, dynamic>> occuppancyList = [];
  List<Map<String, dynamic>> constructionList = [];
  List<Map<String, dynamic>> transferList = [];
  List<Map<String, dynamic>> roadList = [];
  List<Map<String, dynamic>> gbBuildingList = [];
  List<Map<String, dynamic>> gbPropList = [];
  List<Map<String, dynamic>> zoneList = [];


  //
  var wardNo = ''.obs;
  var newWardNo = ''.obs;
  var buildingUsage = ''.obs;
  var propertyType = ''.obs;
  var Zone = ''.obs;
  var isHoarding = ''.obs;
  var isPetrolPump = ''.obs;
  var isMobileTower = ''.obs;
  var isFloor = ''.obs;
  var isUseType = ''.obs;
  var isOccupancyType = ''.obs;
  var isConstructionType = ''.obs;
  var isWaterHarvesting =''.obs;
  late TextEditingController buildingNameController;
  late TextEditingController officeBuildingNameController;
  late TextEditingController holdingNoController;
  late TextEditingController roadWidthController;
  late TextEditingController areaOfPlotController;
  late TextEditingController streetNameController;
  late TextEditingController locationController;
  late TextEditingController landmarkController;
  late TextEditingController buildingAddressController;
  late TextEditingController officerDesignationController;
  late TextEditingController officerAddressController;
  late TextEditingController officernameController;
  late TextEditingController officerEmailController;
  late TextEditingController officermobileController;
  late TextEditingController towerAreaController;
  late TextEditingController towerInstallationController;
  late TextEditingController hoardingAreaController;
  late TextEditingController hoardingInstallationController;
  late TextEditingController pumpAreaController;
  late TextEditingController pumpInstallationController;
  late TextEditingController harvestingCompletionDateController;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    buildingNameController = TextEditingController();
    officeBuildingNameController = TextEditingController();
    holdingNoController = TextEditingController();
    roadWidthController = TextEditingController();
    areaOfPlotController = TextEditingController();
    streetNameController = TextEditingController();
    locationController = TextEditingController();
    landmarkController = TextEditingController();
    buildingAddressController = TextEditingController();
    officerDesignationController = TextEditingController();
    officerAddressController = TextEditingController();
    officernameController = TextEditingController();
    officerEmailController = TextEditingController();
    officermobileController = TextEditingController();
    towerAreaController = TextEditingController();
    towerInstallationController = TextEditingController();
    hoardingAreaController = TextEditingController();
    hoardingInstallationController = TextEditingController();
    pumpAreaController = TextEditingController();
    pumpInstallationController = TextEditingController();
    harvestingCompletionDateController = TextEditingController();
    getWardDetail();
  }
  //DROPDOWN LIST
  void getWardDetail() {
    isDataProcessing(true);
    GbSafApplyProvider().getWardData().then((resp) {
      for (int j = 0; j < resp.length; j++) {
        for (int i = 0; i < resp[j].length; i++) {
          switch (j) {
            case 0:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["ward_name"] = resp[j][i]["ward_name"].toString();
                wardList.add(wardMap);
              }
              break;
            case 1:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["ownership_type"] =
                    resp[j][i]["ownership_type"].toString();
                ownershipList.add(wardMap);
              }
              break;
            case 2:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["property_type"] =
                    resp[j][i]["property_type"].toString();
                propertyList.add(wardMap);
              }
              break;
            case 3:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["floor_name"] = resp[j][i]["floor_name"].toString();
                floorList.add(wardMap);
              }
              break;
            case 4:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["usage_type"] = resp[j][i]["usage_type"].toString();
                usageList.add(wardMap);
              }
              break;
            case 5:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["occupancy_type"] =
                    resp[j][i]["occupancy_type"].toString();
                occuppancyList.add(wardMap);
              }
              break;
            case 6:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["construction_type"] =
                    resp[j][i]["construction_type"].toString();
                constructionList.add(wardMap);
              }
              break;
            case 7:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["transfer_mode"] =
                    resp[j][i]["transfer_mode"].toString();
                transferList.add(wardMap);
              }
              break;
            case 8:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["road_type"] = resp[j][i]["road_type"].toString();
                roadList.add(wardMap);
              }
              break;
            case 9:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["building_type"] = resp[j][i]["building_type"].toString();
                gbBuildingList.add(wardMap);
              }
              break;
            case 10:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["prop_usage_type"] = resp[j][i]["prop_usage_type"].toString();
                gbPropList.add(wardMap);
              }
              break;
            case 11:
              {
                Map<String, dynamic> wardMap = Map<String, dynamic>();
                wardMap["id"] = resp[j][i]["id"].toString();
                wardMap["zone"] = resp[j][i]["zone"].toString();
                zoneList.add(wardMap);
              }
              break;
            default:
              {
                break;
              }
          }
        }
      }
      isDataProcessing(false);
    }, onError: (err) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
    });
  }


  Future<void> GbSafFormSubmit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    List<Map<String, dynamic>> floorDataList = [];

    for (int i = 0; i < remarkControllers.length; i++) {
      Map<String, dynamic> floorData = {
        'floorNo': floorType.value.toString(),
        'useType': floorUseType.value.toString(),
        'occupancyType': floorOccupancyType.value.toString(),
        'constructionType': floorConstructionType.value.toString(),
        'buildupArea': floorBuiltUpController[i].text,
        'dateFrom': floorDateFromController[i].text,
        'dateUpto': floordateUptoController[i].text,
      };
      floorDataList.add(floorData);
    }
    var result = await GbSafApplyProvider().saveGbSafForm({
      'buildingName': buildingNameController.value.text,
      'nameOfOffice': officeBuildingNameController.value.text,
      'oldWardNo': wardNo.value,
      'newWardNo': newWardNo.value,
      'holdingNo': holdingNoController.value.text,
      'gbUsageTypes': buildingUsage.value,
      'gbPropUsageTypes': propertyType.value,
      'zone': Zone.value,
      'roadWidth': roadWidthController.value.text,
      'areaOfPlot': areaOfPlotController.value.text,
      'streetName': streetNameController.value.text,
      'location': locationController.value.text,
      'landmark': landmarkController.value.text,
      'buildingAddress': buildingAddressController.value.text,
      'officerDesignation': officerDesignationController.value.text,
      'officerAddress': officerAddressController.value.text,
      'officerName': officernameController.value.text,
      'officerEmail': officerEmailController.value.text,
      'officerMobile': officermobileController.value.text,
      'isHoardingBoard': isHoarding.value,
      'hoardingArea': hoardingAreaController.value.text,
      'hoardingInstallation': hoardingInstallationController.value.text,
      'isPetrolPump': isPetrolPump.value,
      'pumpArea': pumpAreaController.value.text,
      'pumpInstallation': pumpInstallationController.value.text,
      'isMobileTower': isMobileTower.value,
      'towerArea': towerAreaController.value.text,
      'towerInstallation': towerInstallationController.value.text,
      'isWaterHarvesting': isWaterHarvesting.value,
      'completionDate': harvestingCompletionDateController.value.text,
      'newfloors': floorDataList,
    });
    if (result.error == true) {
      CommonUtils.showSnackBar(
          'Could not Save', result.errorMessage, Colors.red);
    } else {
      CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
      var data = result.data;
      safNo = data['safNo'].toString();
      applyDate = data['applyDate'].toString();
      safId = data['safId'].toString();
      demandAmount = data['demand']['amounts'];
      demandAmountRebate = data['demand']['amounts']['rebates'];
      if (data['demand']['details'] != null) {
        if (data['demand']['details']['RuleSet1'] != null) {
          ruleSet1 = data['demand']['details']['RuleSet1'];
        }
        if (data['demand']['details']['RuleSet2'] != null) {
          ruleSet2 = data['demand']['details']['RuleSet2'];
        }
        if (data['demand']['details']['RuleSet3'] != null) {
          ruleSet3 = data['demand']['details']['RuleSet3'];
        }
      }
      Get.to(PropertySubmitResponseView());
    }
  }



  @override
  void onClose() {
    for (var controller in remarkControllers) {
      controller.dispose();
    }
    super.onClose();
  }
  @override
  void onReady() {
    super.onReady();
  }



  void increment() => count.value++;
}
