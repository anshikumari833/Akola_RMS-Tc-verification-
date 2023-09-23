import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../common/api_response.dart';
import '../../water_ApplyConnectionForm/providers/water_apply_connection_provider.dart';
import '../providers/water_site_verification_provider.dart';

class WaterSiteVerificationController extends GetxController {
  var isPageLoading = false.obs;
  final GlobalKey<FormState> SearchFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> SubmitFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> DateTimeFormKey = GlobalKey<FormState>();
  var SearchListData = List<dynamic>.empty(growable: true).obs;
  // SEARCH-INSPECTION-DETAIL-LIST
  var searchBy = "".obs;
  late TextEditingController fromDateController;
  late TextEditingController toDateController;
  late TextEditingController applicationNoController;
  // SEARCH-INSPECTION-DETAIL-LIST
  var wardNo = "".obs;
  var ulbName = "".obs;
  var applicationNo = "".obs;
  var holdingNo = "".obs;
  var applyDate = "".obs;
  var address = "".obs;
  var inspectionStatus = "".obs;
  var scheduleDate = "".obs;


  //MASTAR DATA(---DROPDOWN LIST---)
  List<Map<String, dynamic>> connectionThroughList = [];
  List<Map<String, dynamic>> requestTypeList = [];
  List<Map<String, dynamic>> propertyTypeList = [];
  List<Map<String, dynamic>> ownerTypeList = [];
 List<Map<String, dynamic>> pipelineTypeList = [];
  List<Map<String, dynamic>> feruleSize = [];
  List<Map<String, dynamic>> meterconnectiontype = [];
  List<Map<String, dynamic>> pipeDiameter = [];
  List<Map<String, dynamic>> roadType = [];
  List<Map<String, dynamic>> pipelineSizeType = [];
  List<Map<String, dynamic>> pipeQuality = [];
  List<Map<String, dynamic>> deactivationCriteria = [];
  // Map<String, int> meterConnectionType = {};



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     selectListDetail();
    fromDateController = TextEditingController();
    toDateController = TextEditingController();
    applicationNoController = TextEditingController();
    piplineSizeController  = TextEditingController();
    totalAreaController  = TextEditingController();
  }

  // SEARCH-INSPECTION-DETAIL-LIST
  Future<void> searchInspectionDetail() async {
    final isValid = SearchFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isPageLoading.value = true;
    SearchListData.clear();
    APIResponse response = await WaterSiteVerificationProvider().searchInspectionDetailList( {
      "filterBy": searchBy.value.toString(),
      "parameter": applicationNoController.text.toString(),
      "fromDate": fromDateController.text.toString(),
      "toDate": toDateController.text.toString(),
    });
    // Clear text fields
     applicationNoController.clear();
    fromDateController.clear();
    toDateController.clear();
     searchBy.value = "";
    if (response != null) {
      SearchListData.clear();
      SearchListData.addAll(response.data);
      print(response.error);
      print(response.errorMessage);
    }
    isPageLoading.value = false;
  }


  late TextEditingController inspectionDateController = TextEditingController();
  late TextEditingController inspectionTimeController = TextEditingController();
  var canView = '';
  //SET-DATE-TIME-OF INSPECTION
  Future<void> setInspectionDetail(applicationId) async {
    final isValid = DateTimeFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isPageLoading.value = true;
    APIResponse response = await WaterSiteVerificationProvider().setInspectionDateTime(applicationId, {
      // "applicationId": byId_id.toString(),
      "inspectionDate": inspectionDateController.text.toString(),
      "inspectionTime": inspectionTimeController.text.toString(),

    });
    if (response.data['status'] == true) {
      Get.snackbar(
        'Success',
        response.data['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Check if the 'canView' field exists in the response data
      if (response.data.containsKey('data') && response.data['data'].containsKey('canView')) {
         canView = response.data['data']['canView'].toString();
      }
    } else {
      Get.snackbar(
        'Error',
        response.data['message'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    isPageLoading.value = false;
  }

  //MASTER DATA(---DROPDOWN LIST---)
//*******************************Starts here*******************************
  void selectListDetail() async {
    isPageLoading(true);
    APIResponse result = await WaterApplyConnectionProvider().SelectDetail();
    if (result == null) {
      isPageLoading(false);
      return;
    }
    Map<String, dynamic> data = result.data;
    data.forEach((key, value) {
      switch (key) {
        case 'water_param_pipeline_type':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["pipeline_type"] = item["pipeline_type"];
              pipelineTypeList.add(dataListMap);
            });
          }
          ;
          break;
        case 'water_connection_type_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["connection_type"] = item["connection_type"];
              requestTypeList.add(dataListMap);
            });
          }
          break;
        case 'water_connection_through_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["connection_through"] = item["connection_through"];
              connectionThroughList.add(dataListMap);
            });
          }
          break;
        case 'water_property_type_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["property_type"] = item["property_type"];
              propertyTypeList.add(dataListMap);
            });
          }
          break;
        case 'water_owner_type_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["owner_type"] = item["owner_type"];
              ownerTypeList.add(dataListMap);
            });
          }
          break;
        case 'pipeline_size_type':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["value"] = item;
              pipelineSizeType.add(dataListMap);
            });
          }
          break;
        case 'pipe_diameter':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["value"] = item;
              pipeDiameter.add(dataListMap);
            });
          }
          break;
        case 'pipe_quality':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["value"] = item;
              pipeQuality.add(dataListMap);
            });
          }
          break;
        case 'road_type':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["value"] = item;
              roadType.add(dataListMap);
            });
          }
          break;
        case 'ferule_size':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["value"] = item;
              feruleSize.add(dataListMap);
            });
          }
          break;
        case 'deactivation_criteria':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["value"] = item;
              deactivationCriteria.add(dataListMap);
            });
          }
          break;
        // case 'meter_connection_type':
        //   {
        //     value.forEach((item) {
        //       Map<String, dynamic> dataListMap = Map<String, dynamic>();
        //       meterconnectiontype.add(dataListMap);
        //     });
        //   }
        //   break;
        default:
          {
            break;
          }
      }
    });
    isPageLoading(false);
  }

//*******************************Ends here*********************************
  var byId_inspectionDate = "";
  var byId_inspectionTime = "";
  var byId_canInspect = "";
   var canOpen = "".obs;

//GET-INSPECTION-DETAIL
  Future<bool> getInspectionDetail(applicationId) async {
    APIResponse response = await WaterSiteVerificationProvider().SiteInspecionDetail(applicationId);
    if (response.data['data'] == "" && response.data['status'] == false) {
      canOpen.value = response.data['status'].toString();
    }else {
      canOpen.value = response.data['status'].toString();
      byId_inspectionDate =  response.data["data"]['inspectionDate'].toString();
      byId_inspectionTime = response.data["data"]['inspectionTime'].toString();
      byId_canInspect = response.data["data"]['canInspect'].toString();
    }
    return true;
  }

  //GET-INSPECTION-DETAIL-BY-ID
  var byId_id = '';
  var byId_ulbName = '';
  var byId_wardNo = '';
  var byId_applicationNo = '';
  var byId_ownershipType = '';
  var byId_propertyType = '';
  var byId_pipelineType = '';
  var byId_connectionThrough = '';
  var byId_holdingNo = '';
  var byId_connectionType = '';
  var byId_area = '';
  var byId_category = '';
  var byId_propertyAddress = '';
  var byId_roadType = '';

//GET-INSPECTION-DETAIL-BY-ID
  InspectionDetailById(applicationId) async {
    await getDetailById(applicationId);
  }

//GET-INSPECTION-DETAIL-BY-ID
  Future<bool> getDetailById(applicationId) async {
    APIResponse response = await WaterSiteVerificationProvider().StaticInspecionData(applicationId);
    if (response != null && !response.error) {
      byId_id = response.data['applicationDetails']['id'].toString();
      byId_ulbName = response.data['applicationDetails']['ulb_name'].toString();
      byId_wardNo = response.data['applicationDetails']['ward_name'].toString();
      byId_applicationNo = response.data['applicationDetails']['application_no'].toString();
      byId_ownershipType = response.data['applicationDetails']['owner_char_type'].toString();
      byId_propertyType = response.data['applicationDetails']['property_type'].toString();
      byId_pipelineType = response.data['applicationDetails']['pipeline_type'].toString();
      byId_connectionThrough = response.data['applicationDetails']['connection_through'].toString();
      byId_holdingNo = response.data['applicationDetails']['holding_no'].toString();
      byId_connectionType = response.data['applicationDetails']['connection_type'].toString();
      byId_area = response.data['applicationDetails']['area_sqft'].toString();
      byId_category = response.data['applicationDetails']['category'].toString();
      byId_propertyAddress = response.data['applicationDetails']['address'].toString();
      byId_roadType = response.data['applicationDetails']['road_type'].toString();
    }
    return true;
  }

//GET-JE-INSPECTED-DETAIL-BY-ID
  var je_tsMap = '';
  var je_propertyType = '';
  var je_Totalarea = '';
  var je_PipelineReport = '';
  var je_PipelineSize  = '';
  var je_PipelineSizeType = '';
  var je_UnderRegularization= '';
  var je_PipeDiameter = '';
  var je_PipeQuality = '';
  var je_FerruleSize = '';
  var je_RoadType = '';
  var je_category = '';
  var je_Longitude= '';
  var je_Latitude = '';
  var je_InspectedDate = '';
  var je_InspectionTime = '';

  //GET-JE-INSPECTED-DETAIL-BY-ID
  Future<bool> getJeDetailById(applicationId) async {
    // Clearing the data before hitting the API
    je_tsMap = "";
    je_propertyType = "";
    je_Totalarea = "";
    je_PipelineReport = "";
    je_PipelineSize = "";
    je_PipelineSizeType = "";
    je_UnderRegularization = "";
    je_PipeDiameter = "";
    je_PipeQuality = "";
    je_FerruleSize = "";
    je_RoadType = "";
    je_category = "";
    je_Longitude = "";
    je_Latitude = "";
    je_InspectedDate = "";
    je_InspectionTime = "";
    APIResponse response = await WaterSiteVerificationProvider().JeInspectedData(applicationId);
    if (response != null && !response.error) {
   je_tsMap = response.data['ts_map'];
   je_propertyType = response.data['ulb_name'].toString();
   je_Totalarea = response.data['site_inspection_area_sqft'].toString();
   je_PipelineReport = response.data['application_no'].toString();
   je_PipelineSize = response.data['pipeline_size'].toString();
   je_PipelineSizeType = response.data['pipeline_size_type'].toString();
   je_UnderRegularization = response.data['pipeline_type'].toString();
   je_PipeDiameter  = response.data['connection_through'].toString();
   je_PipeQuality = response.data['holding_no'].toString();
   je_FerruleSize = response.data['ferrule_type'].toString();
   je_RoadType = response.data['road_type'].toString();
   je_category = response.data['category'].toString();
   je_Longitude = response.data['longitude'].toString();
   je_Latitude = response.data['latitude'].toString();
   je_InspectedDate = response.data['inspection_date'].toString();
   je_InspectionTime = response.data['inspection_time'].toString();
    }
    return true;
  }


//CANCEL INSPECTION SCHEDULING
//   Future<void> CancelInspectionScheduling(applicationId) async {
//     APIResponse response = await WaterSiteVerificationProvider().CancelInspectedSchedule(applicationId);
//     if (response.data['status'] == true) {
//       Get.snackbar(
//         'Success',
//         response.data['message'],
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//       Get.back();
//     } else {
//       Get.snackbar(
//         'Error',
//         response.data['message'],
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

  Future<void> CancelInspectionScheduling(applicationId) async {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    try {
      APIResponse response = await WaterSiteVerificationProvider().CancelInspectedSchedule(applicationId);
      Get.back();

      if (response.data['status'] == true) {
        Get.snackbar(
          'Success',
          response.data['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back();
        Get.snackbar(
          'Error',
          response.data['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.back(); // Close the loader dialog
      Get.snackbar(
        'Error',
        'An error occurred while canceling inspection.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }





  // SUBMIT APPLICATION
  var propertyType = ''.obs;
  var pipelineReport = ''.obs;
  var piplineSizeType = ''.obs;
  var underRegularization = ''.obs;
  var PermissiblePipeDiameter = ''.obs;
  var PermissiblePipeQuality = ''.obs;
  var PermissibleFerruleSize = ''.obs;
  var roadTypeData = ''.obs;
  var tsMap = ''.obs;
  var applicantCategory = ''.obs;
  late TextEditingController totalAreaController;
  late TextEditingController piplineSizeController;
  late TextEditingController longitudeController = TextEditingController();
  late TextEditingController latitudeController = TextEditingController();

  // SUBMIT APPLICATION
      Future<void> InspectionForm() async {
        final isValid = SubmitFormKey.currentState!.validate();
        if (!isValid) {
          return;
        }
    // SubmitFormKey.currentState!.save();
    var result = await WaterSiteVerificationProvider().SubmitInspectionApplication({
         'propertyType':propertyType.value,
         'pipelineReport':pipelineReport.value,
         'piplineSizeType':piplineSizeType.value,
         'underRegularization':underRegularization.value,
         'PermissiblePipeDiameter':PermissiblePipeDiameter.value,
         'PermissiblePipeQuality':PermissiblePipeQuality.value,
         'PermissibleFerruleSize':PermissibleFerruleSize.value,
         'roadTypeData':roadTypeData.value,
         'applicantCategory':applicantCategory.value,
         'totalArea':totalAreaController.text.toString(),
         'piplineSize':piplineSizeController.text.toString(),
         'tsMap':tsMap.value,
         'applicationId':byId_id.toString(),
         'longitude': longitudeController.value.text,
         'latitude': latitudeController.value.text,
     });
    if (result.data['status'] == true) {
      Get.snackbar(
        'Success',
        result.data['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Clear form data
      propertyType.value = '';
      pipelineReport.value = '';
      piplineSizeType.value = '';
      underRegularization.value = '';
      PermissiblePipeDiameter.value = '';
      PermissiblePipeQuality.value = '';
      PermissibleFerruleSize.value = '';
      roadTypeData.value = '';
      applicantCategory.value = '';
      tsMap.value = '';
      totalAreaController.clear();
      piplineSizeController.clear();
      longitudeController.clear();
      latitudeController.clear();
      Get.back();
    } else {
      Get.snackbar(
        'Error',
        result.data['message'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
      }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
