import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../Property_SearchProperty/controllers/SearchHolding_controller.dart';
import '../../fieldVerification_pending_list/providers/field_verification_pending_list_provider.dart';
import '../providers/property_new_assessment_provider.dart';
import '../views/Property_NA_FormSubmitPreview.dart';
import '../views/property_NA_TaxCalculationForm.dart';

class PropertyNewAssessmentController extends GetxController {
  final GlobalKey<FormState> basicDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> propertyDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> electricityDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> ownerDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> floorDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> extraDetailsFormKey = GlobalKey<FormState>();
  //FOR PREFILL DATA FROM PAY PROPERTY TAX
  final PropertyPayPropertyTaxController payPropertyTaxController = Get.find();
  // Access the searched data by ID from payPropertyTaxController
  List<dynamic> get searchedDataById => payPropertyTaxController.searchedDataById;
  final GlobalKey<FormState> newAssessmentFormKey = GlobalKey<FormState>();
  var safReceipts = List<dynamic>.empty(growable: true);
  // var searchedDataById = List<dynamic>.empty(growable: true).obs;
  final RxBool isCorrespondingAddressChecked = false.obs;
  var isCheckboxChecked = false.obs;
  final storage = GetStorage();
  var ruleSet1Data;
  var ruleSet2Data;
  var ruleSet3Data;

  var data;
  var safNo;
  var userID = '';
  var applyDate;
  var demandAmount;
  var demandAmountRebates;
  var ruleSet1;
  var ruleSet2;
  var ruleSet3;


  var isHoardingTypeProcessing = false.obs;
  Map<String, dynamic> taxResult = {};

  List<Widget> containers = [];

  RxList<Map<String, dynamic>> wardList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> WardListByZone = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ownershipList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> propertyList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> floorList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> usageList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> occuppancyList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> constructionList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> zoneList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> categoryList = <Map<String, dynamic>>[].obs;

  // List<Map<String, dynamic>> wardList = [];
  // List<Map<String, dynamic>> WardListByZone = [];
  // List<Map<String, dynamic>> ownershipList = [];
  // List<Map<String, dynamic>> propertyList = [];
  // List<Map<String, dynamic>> floorList = [];
  // List<Map<String, dynamic>> usageList = [];
  // List<Map<String, dynamic>> occuppancyList = [];
  // List<Map<String, dynamic>> constructionList = [];
  // List<Map<String, dynamic>> zoneList = [];
  // List<Map<String, dynamic>> categoryList = [];
  final apartmentData = <Map<String, dynamic>>[].obs;
  var newWardData = <Map<String, dynamic>>[].obs;

  var assessmentType = ''.obs;
  var oldWardNo = ''.obs;
  var newWardNo = ''.obs;
  var ownershipType = ''.obs;
  var propertyType = ''.obs;
  var zoneType = ''.obs;
  var categoryType = ''.obs;
  var mobileTower = ''.obs;
  var hoardingBoard = "".obs;
  var petrolPump = ''.obs;
  var electricityConsumer = ''.obs;
  var rainwaterHarvesting = ''.obs;
  var appartment = ''.obs;
  var TrustType = ''.obs;
  late TextEditingController latePurchaseDateController;
  late TextEditingController khataNoController;
  late TextEditingController plotNoController;
  late TextEditingController villageNameController;
  late TextEditingController areaOfPlotController;
  late TextEditingController roadWidthController;
  late TextEditingController cityController;
  late TextEditingController districtController;
  late TextEditingController stateController;
  late TextEditingController pinController;
  late TextEditingController streetNameController;
  late TextEditingController locationController;
  late TextEditingController landmarkController;
  late TextEditingController propertyAddressController;
  late TextEditingController corrCityController;
  late TextEditingController corrDistrictController;
  late TextEditingController corrStateController;
  late TextEditingController corrPinController;
  late TextEditingController corrPropertyAddressController;
  late TextEditingController ElectricitykNoController;
  late TextEditingController accNoController;
  late TextEditingController bindBookNoController;
  late TextEditingController buildingPlanApprovalNoController;
  late TextEditingController buildingPlanApprovalDateController;
  late TextEditingController waterConsumerNoController;
  late TextEditingController waterConsumerDateController;
  late TextEditingController totalAreaOfMobileTowerController;
  late TextEditingController installationOfMobileTowerController;
  late TextEditingController totalAreaOfHoardingBoardController;
  late TextEditingController installationOfHoardingBoardController;
  late TextEditingController totalAreaOfPetrolPumpController;
  late TextEditingController installationOfPetrolPumpController;
  late TextEditingController completeRainWaterHarvController;

  //PAYMENT
  var mPaymentMode = "".obs;
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController chequeNoController;
  late TextEditingController chequeDateController;
  late TextEditingController remarksController;

  var isDataProcessing = false.obs;


  clearForm() {
    latePurchaseDateController.clear();
    khataNoController.clear();
    plotNoController.clear();
    villageNameController.clear();
    areaOfPlotController.clear();
    roadWidthController.clear();
    cityController.clear();
    districtController.clear();
    stateController.clear();
    pinController.clear();
    streetNameController.clear();
    locationController.clear();
    landmarkController.clear();
    propertyAddressController.clear();
    corrCityController.clear();
    corrDistrictController.clear();
    corrStateController.clear();
    corrPinController.clear();
    corrPropertyAddressController.clear();
    ElectricitykNoController.clear();
    accNoController.clear();
    bindBookNoController.clear();
    buildingPlanApprovalNoController.clear();
    buildingPlanApprovalDateController.clear();
    waterConsumerNoController.clear();
    waterConsumerDateController.clear();
    totalAreaOfMobileTowerController.clear();
    installationOfMobileTowerController.clear();
    totalAreaOfHoardingBoardController.clear();
    installationOfHoardingBoardController.clear();
    totalAreaOfPetrolPumpController.clear();
    installationOfPetrolPumpController.clear();
    completeRainWaterHarvController.clear();
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    latePurchaseDateController = TextEditingController();
    khataNoController = TextEditingController();
    plotNoController = TextEditingController();
    villageNameController = TextEditingController();
    areaOfPlotController = TextEditingController();
    roadWidthController = TextEditingController();
    cityController = TextEditingController();
    districtController = TextEditingController();
    stateController = TextEditingController();
    pinController = TextEditingController();
    streetNameController = TextEditingController();
    locationController = TextEditingController();
    landmarkController = TextEditingController();
    propertyAddressController = TextEditingController();
    corrCityController = TextEditingController();
    corrDistrictController = TextEditingController();
    corrStateController = TextEditingController();
    corrPinController = TextEditingController();
    corrPropertyAddressController = TextEditingController();
    ElectricitykNoController = TextEditingController();
    accNoController = TextEditingController();
    bindBookNoController = TextEditingController();
    buildingPlanApprovalNoController = TextEditingController();
    buildingPlanApprovalDateController = TextEditingController();
    waterConsumerNoController = TextEditingController();
    waterConsumerDateController = TextEditingController();;
    totalAreaOfMobileTowerController = TextEditingController();
    installationOfMobileTowerController = TextEditingController();
    totalAreaOfHoardingBoardController = TextEditingController();
    installationOfHoardingBoardController = TextEditingController();
    totalAreaOfPetrolPumpController = TextEditingController();
    installationOfPetrolPumpController = TextEditingController();
    completeRainWaterHarvController = TextEditingController();
    //PAYMENT
    bankNameController = TextEditingController();
    branchNameController = TextEditingController();
    chequeNoController = TextEditingController();
    chequeDateController = TextEditingController();
    remarksController = TextEditingController();
    getDropdownListDetail();
    fetchAppartmentList();
    // getWardByZone(zoneId);
    getStateCityDetailsByUlB();
    // fetchNewWardList(oldWardNo.value);
  }


  // MASTER SAF DATA - (DROPDOWN LIST)
  void getDropdownListDetail() async {
    isDataProcessing(true);
    APIResponse result = await PropertyNewAssessmentProvider().getlistData();
    if(!result.error){
        //using the responseData as a Map
        Map<String, dynamic> data = result.data;
        data.forEach((key, value) {
          switch (key) {
            case 'ward_master':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["ward_name"] = item["ward_name"];
                  wardList.add(dataListMap);
                });
              }
              break;
            case 'ownership_types':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["ownership_type"] = item["ownership_type"];
                  ownershipList.add(dataListMap);
                });
              }
              break;
            case 'property_type':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["property_type"] = item["property_type"];
                  propertyList.add(dataListMap);
                });
              }
              break;
            case 'floor_type':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["floor_name"] = item["floor_name"];
                  floorList.add(dataListMap);
                });
              }
              break;
            case 'usage_type':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["usage_type"] = item["usage_type"];
                  usageList.add(dataListMap);
                });
              }
              break;
            case 'occupancy_type':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["occupancy_type"] = item["occupancy_type"];
                  occuppancyList.add(dataListMap);
                });
              }
              break;
            case 'construction_type':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["construction_type"] = item["construction_type"];
                  constructionList.add(dataListMap);
                });
              }
              break;
            case 'zone':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["zone_name"] = item["zone_name"];
                  zoneList.add(dataListMap);
                });
              }
              break;
            case 'categories':
              {
                value.forEach((item) {
                  Map<String, dynamic> dataListMap = Map<String, dynamic>();
                  dataListMap["id"] = item["id"];
                  dataListMap["category"] = item["category"];
                  categoryList.add(dataListMap);
                });
              }
              break;
            default:
              {
                break;
              }
          }
        });
        isDataProcessing.value = false;
      } else {
        Get.snackbar(
          'Oops!!!',
          result.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }
    isDataProcessing.value = false;
  }


  //WARD BY ZONE - (DROPDOWN LIST)
  Future<void>  getWardByZone({required String zoneId}) async {
    isDataProcessing.value = true;
    WardListByZone.clear();
    APIResponse response = await PropertyNewAssessmentProvider().WardByZone(zoneId);
    if (!response.error) {
      List<dynamic> responseDataList = List<dynamic>.from(response.data);
      for (var responseData in responseDataList) {
        Map<String, dynamic> zoneWardData = Map<String, dynamic>.from(
            responseData);
        // Creating a map to hold the processed data
        Map<String, dynamic> WardData = {
          'id': zoneWardData['id'],
          'zone': zoneWardData['zone'],
          'ward_name': zoneWardData['ward_name'],
          'old_ward_name': zoneWardData['old_ward_name'],
        };
        // Add the processed data to the wardList
        WardListByZone.add(WardData);
      }
      isDataProcessing.value = false;
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isDataProcessing.value = false;
  }

  //ADD FLOOR DETAILS KEY
  var floorDataList = List<dynamic>.empty(growable: true).obs;
  //ADD FLOOR
  var floorType ="".obs;
  var floorUseType = "".obs;
  var floorOccupancyType = "".obs;
  var floorConstructionType = "".obs;
  final floorBuiltUpController = [].obs;
  final floorDateFromController = [].obs;
  final floordateUptoController = [].obs;
  //ADD FLOOR
  final remarkControllers = <TextEditingController>[].obs;
  //REMOVE FLOOR
  void removeFloor(int index) {
    remarkControllers.removeAt(index);
  }
  //DELETE FLOOR
  void deleteFloorData(int index) {
    floorDataList.removeAt(index);
  }
  //EDIT FLOOR
  void editFloorData(int index, Map<String, dynamic> newData) {
    floorDataList[index] = newData;
  }
  //ADD FLOOR
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


  // RxString marathiText = ''.obs;
  //
  // Future<void> convertToMarathi(String input) async {
  //   final apiKey = 'YOUR_GOOGLE_API_KEY';
  //   final url =
  //       'https://inputtools.google.com/request?ime=transliteration_en_mr&num=1&cp=0&cs=0&ie=utf-8&oe=utf-8&app=jsapi&text=$input';
  //
  //   final response = await get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     final marathiResult = jsonData[0]['result'][0][0]['translit'];
  //     marathiText.value = marathiResult;
  //   }
  // }


  // // Reactive state variables
  // var inputText = ''.obs;
  // var translatedText = ''.obs;
  //
  // Future<void> translateText(String apiKey, String text) async {
  //   final url = 'https://translation.googleapis.com/language/translate/v2?key=$apiKey';
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = json.encode({
  //     'q': text,
  //     'source': 'en',  // Source language (English)
  //     'target': 'mr',  // Target language (Marathi)
  //   });
  //
  //   final response = await http.post(Uri.parse(url), headers: headers, body: body);
  //
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     final translated = jsonData['data']['translations'][0]['translatedText'];
  //     // Update reactive state variables
  //     translatedText.value = translated;
  //   } else {
  //     print('Translation API error: ${response.reasonPhrase}');
  //   }
  // }

  //ADD OWNERS DETAILS KEY
  var ownerDataList = List<dynamic>.empty(growable: true).obs;
  //ADD OWNERS
  final ownersController = <TextEditingController>[].obs;
  //REMOVE OWNERS
  void removeOwnerData(int index) {
    ownersController.removeAt(index);
  }
  //DELETE OWNERS
  void deleteOwnerData(int index) {
    ownerDataList.removeAt(index);
  }
  //EDIT OWNERS
  void editOwnerData(int index, Map<String, dynamic> newData) {
    ownerDataList[index] = newData;
  }
//ADD OWNERS DETAILS

  final ownerNameController = [].obs;
  final ownerMarathiNameController = [].obs;
  final dobController = [].obs;
  final guardianNameController = [].obs;
  final guardianMarathiNameController = [].obs;
  final mobileNoController = [].obs;
  final aadharNoController = [].obs;
  final panNoController = [].obs;
  final emailController = [].obs;
  var gender ="".obs;
  var relation = "".obs;
  var isArmedForce ="".obs;
  var isSpeciallyAbled = "".obs;
 //ADD OWNERS
  void addOwners() {
    ownersController.add(TextEditingController());
    ownerNameController.add(TextEditingController());
    ownerMarathiNameController.add(TextEditingController());
    guardianMarathiNameController.add(TextEditingController());
    dobController.add(TextEditingController());
    mobileNoController.add(TextEditingController());
    guardianNameController.add(TextEditingController());
    aadharNoController.add(TextEditingController());
    panNoController.add(TextEditingController());
    emailController.add(TextEditingController());
    // clear the values of the previous text fields
    ownerNameController.last.clear();
    ownerMarathiNameController.last.clear();
    guardianMarathiNameController.last.clear();
    dobController.last.clear();
    mobileNoController.last.clear();
    guardianNameController.last.clear();
    aadharNoController.last.clear();
    panNoController.last.clear();
    emailController.last.clear();

  }

  //data of tax calculation being stored
  var tax_pendingYears = "";
  var tax_payableAmount = "";
  var tax_rebateAmount = "";
  //data of fyearWiseTaxes and floorsTaxes are stored in the respective lists
  List<Map<String, dynamic>> tax_floorsTaxesList = [];
  List<Map<String, dynamic>> tax_fyearWiseTaxesList = [];
  List<Map<String, dynamic>> tax_grandTaxesList = [];

// TAX CALCULATION
  Future<void> TaxDescriptionForm() async {
    tax_fyearWiseTaxesList.clear();
    tax_floorsTaxesList.clear();
    final isValid = newAssessmentFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    newAssessmentFormKey.currentState!.save();

    List<Map<String, dynamic>> floorDataList = [];
    for (int i = 0; i < remarkControllers.length; i++) {
      Map<String, dynamic> floorData = {
        'floorNo': floorType.value.toString(),
        'usageType': floorUseType.value.toString(),
        'occupancyType': floorOccupancyType.value.toString(),
        'constructionType': floorConstructionType.value.toString(),
        'buildupArea': floorBuiltUpController[i].text,
        'dateFrom': floorDateFromController[i].text,
        'dateUpto': floordateUptoController[i].text,
      };
      floorDataList.add(floorData);
    }

    List<Map<String, dynamic>> ownersDataList = [];
    for (int i = 0; i < remarkControllers.length; i++) {
      Map<String, dynamic> ownerData = {
        'ownerName': ownerNameController[i].text,
        'gender': gender.value.toString(),
        'dob': dobController[i].text,
        'guardianName': guardianNameController[i].text,
        'relation': relation.value.toString(),
        'mobileNo': mobileNoController[i].text,
        'aadhar': aadharNoController[i].text,
        'pan':panNoController[i].text,
        'email':emailController[i].text,
        'isArmedForce': isArmedForce.value,
        'isSpeciallyAbled': isSpeciallyAbled.value,
      };
      ownersDataList.add(ownerData);}

    var result = await PropertyNewAssessmentProvider().taxCalculation({
      'assessmentType': assessmentType.value.toString(),
      'ward': oldWardNo.value,
      'newWard': newWardNo.value,
      'ownershipType': ownershipType.value,
      'propertyType': propertyType.value,
      'apartmentId': appartment.value,
      'zone': zoneType.value,
      'dateOfPurchase': latePurchaseDateController.value.text,
      'khataNo': khataNoController.value.text,
      'plotNo': plotNoController.value.text,
      'villageMaujaName': villageNameController.value.text,
      'areaOfPlot': areaOfPlotController.value.text,
      // 'roadType': roadWidthController.value.text,
      'category':   categoryType.value,
      'city': cityController.value.text,
      'district': districtController.value.text,
      'state': stateController.value.text,
      'pin': pinController.value.text,
      'streetName':streetNameController.value.text,
      'location':locationController.value.text,
      'landmark': landmarkController.value.text,
      'locality': propertyAddressController.value.text,
      'corrCity': corrCityController.value.text,
      'corrDistrict': corrDistrictController.value.text,
      'corrState': corrStateController.value.text,
      'corrPin': corrPinController.value.text,
      'corrlocality': corrPropertyAddressController.value.text,
      'electricityKNo':ElectricitykNoController.value.text,
      'electricityAccNo' :accNoController.value.text,
      'electricityBindBookNo' : bindBookNoController.value.text,
      'electrictyConsCategory' : electricityConsumer.value,
      'buildingPlanApprovalNo' :buildingPlanApprovalNoController.value.text,
      'buildingPlanApprovalDate' : buildingPlanApprovalDateController.value.text,
      'waterConnNo' : waterConsumerNoController.value.text,
      'waterConnDate' :waterConsumerDateController.value.text,
      'owners': ownersDataList,
      'isMobileTower': mobileTower.value,
      'mobileTower' :{
        'area': totalAreaOfMobileTowerController.value.text,
        'dateFrom': installationOfMobileTowerController.value.text,
      },
      'isHoardingBoard': hoardingBoard.value,
      'hoardingBoard':{
        'area': totalAreaOfHoardingBoardController.value.text,
        'dateFrom': installationOfHoardingBoardController.value.text,
      },
      'isPetrolPump': petrolPump.value,
      'petrolPump':{
        'area': totalAreaOfPetrolPumpController.value.text,
        'dateFrom': installationOfPetrolPumpController.value.text,
      },
      'isWaterHarvesting': rainwaterHarvesting.value,
      'rwhDateFrom': completeRainWaterHarvController.value.text,
      'isTrust': TrustType.value,
      'newfloors': floorDataList,
    });
    if(!result.error){

      //  condition in response data status

         tax_pendingYears = result.data['demandPendingYrs'].toString();
         tax_payableAmount = result.data['payableAmt'].toString();
         tax_rebateAmount = result.data['rebateAmt'].toString();
         //Financial Tax
         // fyearWiseTaxesList  contains data from fyearWiseTaxes
         Map<String, dynamic> fyearWiseTaxes = result.data['fyearWiseTaxes'];
         fyearWiseTaxes.forEach((key, value) {
           tax_fyearWiseTaxesList.add(value);
         });
        //Floor Tax
        // floorsTaxesList contains data from floorsTaxes
        List<Map<String, dynamic>> floorsTaxes = List<Map<String, dynamic>>.from(result.data['floorsTaxes']);
         tax_floorsTaxesList.addAll(floorsTaxes);
         //Grand Total Tax
         // grandTaxesList  contains data from grandTaxes
         Map<String, dynamic> grandTaxes = result.data['grandTaxes'];
         tax_grandTaxesList.add(grandTaxes);
      } else {
        Get.snackbar(
          'Oops!!!',
          result.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }
    isDataProcessing.value = false;
    Get.to(PropertyNATaxCalculationFormView());
  }


  void fetchAppartmentList() async {
    APIResponse result =
    await PropertyNewAssessmentProvider().appartmentList({});
    if (!result.error) {
      List<Map<String, dynamic>> dataList =
      List<Map<String, dynamic>>.from(result.data);
      apartmentData.assignAll(dataList);
    } else {
      CommonUtils.showSnackBar(
          'Could not Save', result.errorMessage, Colors.red);
    }
  }




  var cityName = "";
  var  stateName = "";
  void  getStateCityDetailsByUlB() async {
    APIResponse response = await PropertyNewAssessmentProvider().ulbDataToPrefill();
    // condition for response error
    if ( response.error == false) {

        Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
        cityName =  responseData["city_name"].toString();
        stateName = responseData["name"].toString();
        cityController.text = cityName .toString();
        districtController.text = cityName .toString();
        stateController.text = stateName .toString();
      } else {
        Get.snackbar(
          'Oops!!!',
          response.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }

      isDataProcessing.value = false;
    }








  var propertySafNo = "";
  var propertySafId = "";
  var propertyApplyDate = "";
  //data of tax calculation being stored
  var saf_pendingYears = "";
  var saf_payableAmount = "";
  var saf_rebateAmount = "";
  //data of fyearWiseTaxes and floorsTaxes are stored in the respective lists
  List<Map<String, dynamic>> saf_floorsTaxesList = [];
  List<Map<String, dynamic>> saf_fyearWiseTaxesList = [];
  List<Map<String, dynamic>> saf_grandTaxesList = [];
  Future<void> validateForm() async {
    // final isValid = newAssessmentFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // newAssessmentFormKey.currentState!.save();
    saf_floorsTaxesList.clear();
    saf_fyearWiseTaxesList.clear();
    saf_grandTaxesList.clear();
    List<Map<String, dynamic>> floorDataList = [];
    for (int i = 0; i < remarkControllers.length; i++) {
      Map<String, dynamic> floorData = {
        'floorNo': floorType.value.toString(),
        'usageType': floorUseType.value.toString(),
        'occupancyType': floorOccupancyType.value.toString(),
        'constructionType': floorConstructionType.value.toString(),
        'buildupArea': floorBuiltUpController[i].text,
        'dateFrom': floorDateFromController[i].text,
        'dateUpto': floordateUptoController[i].text,
      };
      floorDataList.add(floorData);
    }

    List<Map<String, dynamic>> ownersDataList = [];
    for (int i = 0; i < remarkControllers.length; i++) {
      Map<String, dynamic> ownerData = {
        'ownerName': ownerNameController[i].text,
        'ownerNameMarathi': ownerMarathiNameController[i].text,
        'guardianNameMarathi': guardianMarathiNameController[i].text,
        'gender': gender.value.toString(),
        'dob': dobController[i].text,
        'guardianName': guardianNameController[i].text,
        'relation': relation.value.toString(),
        'mobileNo': mobileNoController[i].text,
        'aadhar': aadharNoController[i].text,
        'pan':panNoController[i].text,
        'email':emailController[i].text,
        'isArmedForce': isArmedForce.value,
        'isSpeciallyAbled': isSpeciallyAbled.value,
      };
      ownersDataList.add(ownerData);}
    var result = await PropertyNewAssessmentProvider().saveReAssessment({
      'assessmentType': assessmentType.value.toString(),
      'ward': oldWardNo.value,
      'newWard': newWardNo.value,
      'ownershipType': ownershipType.value,
      'propertyType': propertyType.value,
      'apartmentId': appartment.value,
      'zone': zoneType.value,
      'dateOfPurchase': latePurchaseDateController.value.text,
      'khataNo': khataNoController.value.text,
      'plotNo': plotNoController.value.text,
      'villageMaujaName': villageNameController.value.text,
      'areaOfPlot': areaOfPlotController.value.text,
      // 'roadType': roadWidthController.value.text,
      'category':   categoryType.value,
      'city': cityController.value.text,
      'district': districtController.value.text,
      'state': stateController.value.text,
      'pin': pinController.value.text,
      'streetName':streetNameController.value.text,
      'location':locationController.value.text,
      'landmark': landmarkController.value.text,
      'locality': propertyAddressController.value.text,
      'corrCity': corrCityController.value.text,
      'corrDistrict': corrDistrictController.value.text,
      'corrState': corrStateController.value.text,
      'corrPin': corrPinController.value.text,
      'corrlocality': corrPropertyAddressController.value.text,
      'electricityKNo':ElectricitykNoController.value.text,
      'electricityAccNo' :accNoController.value.text,
      'electricityBindBookNo' : bindBookNoController.value.text,
      'electrictyConsCategory' : electricityConsumer.value,
      'buildingPlanApprovalNo' :buildingPlanApprovalNoController.value.text,
      'buildingPlanApprovalDate' : buildingPlanApprovalDateController.value.text,
      'waterConnNo' : waterConsumerNoController.value.text,
      'waterConnDate' :waterConsumerDateController.value.text,
      'owners': ownersDataList,
      'isMobileTower': mobileTower.value,
      'mobileTower' :{
        'area': totalAreaOfMobileTowerController.value.text,
        'dateFrom': installationOfMobileTowerController.value.text,
      },
      'isHoardingBoard': hoardingBoard.value,
      'hoardingBoard':{
        'area': totalAreaOfHoardingBoardController.value.text,
        'dateFrom': installationOfHoardingBoardController.value.text,
      },
      'isPetrolPump': petrolPump.value,
      'petrolPump':{
        'area': totalAreaOfPetrolPumpController.value.text,
        'dateFrom': installationOfPetrolPumpController.value.text,
      },
      'isWaterHarvesting': rainwaterHarvesting.value,
      'rwhDateFrom': completeRainWaterHarvController.value.text,
      'isTrust': TrustType.value,
      'newfloors': floorDataList,
    });
    if(!result.error){

      //  condition in response data status

        propertySafNo = result.data['safNo'].toString();
        propertySafId = result.data['safId'].toString();
        propertyApplyDate = result.data['applyDate'].toString();
        saf_pendingYears = result.data['calculatedTaxes']['demandPendingYrs'].toString();
        saf_payableAmount = result.data['calculatedTaxes']['payableAmt'].toString();
        saf_rebateAmount = result.data['calculatedTaxes']['rebateAmt'].toString();
        //Financial Tax
        // fyearWiseTaxesList  contains data from fyearWiseTaxes
        Map<String, dynamic> fyearWiseTaxes = result.data['calculatedTaxes']['fyearWiseTaxes'];
        fyearWiseTaxes.forEach((key, value) {
          saf_fyearWiseTaxesList.add(value);
        });
        //Floor Tax
        // floorsTaxesList contains data from floorsTaxes
        List<Map<String, dynamic>> floorsTaxes = List<Map<String, dynamic>>.from(result.data['calculatedTaxes']['floorsTaxes']);
        saf_floorsTaxesList.addAll(floorsTaxes);
        //Grand Total Tax
        // grandTaxesList  contains data from grandTaxes
        Map<String, dynamic> grandTaxes = result.data['calculatedTaxes']['grandTaxes'];
        saf_grandTaxesList.add(grandTaxes);
      } else {
        Get.snackbar(
          'Oops!!!',
          result.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }

    isDataProcessing.value = false;
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.success,
      title: 'Success',
      desc: 'Your property form has been submitted successfully.',
      btnOkOnPress: () {
        Get.to(PropertySubmittedFormView());
      },
    )..show();
  }


  Future<void> paymentForm(context) async {
    var result = await PropertyNewAssessmentProvider().safPayment(userID,{
      'paymentMode': mPaymentMode.value.toString(),
      'bankName': bankNameController.value.text,
      'branchName': branchNameController.value.text,
      'chequeNo': chequeNoController.value.text,
      'chequeDate': chequeDateController.value.text,
      'remarks': remarksController.value.text,
    });
    if (result.error == true) {
      CommonUtils.showSnackBar('Could not Save', result.errorMessage, Colors.red);
    }
    else {
      CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
      var data = result.data;
      tranNo = data['TransactionNo'].toString();
    }
  }


  var ptransactionDate = "";
  var ptransactionNo = "";
  var papplicationNo = "";
  var pnewApplicationNo = "";
  var poldWardNo = "";
  var pcustomerName = "";
  var paddress = "";
  var ppaidFrom = "";
  var ppaidUpto = "";
  var pdemandAmount = "";
  var ptotalPenalty = "";
  var ptotalRebate = "";
  var ptotalPaidAmount = "";
  var ppaymentMode = "";
  var ptcName = "";
  var ptcMobile = "";
  var tranNo = " ";


  Future<bool> SafReceipt() async {
    APIResponse safReceipts1 = await PropertyNewAssessmentProvider().PrintSafRecipt(tranNo);
    if(!safReceipts1.error){
      if(safReceipts1.data != null) {
        Map<String, dynamic> data = safReceipts1.data;
        ptransactionDate =  data["transactionDate"]?? '';
        ptransactionNo =  data["transactionNo"] ==null ? '' : data["transactionNo"].toString();
        papplicationNo =  data["applicationNo"] ==null ? '' : data["applicationNo"].toString();
        pnewApplicationNo =  data["applicationNo"] ==null ? '' : data["applicationNo"].toString();
        poldWardNo =  data["oldWardNo"] ==null ? '' : data["oldWardNo"].toString();
        pcustomerName =  data["customerName"] ==null ? '' : data["customerName"].toString();
        paddress =  data["address"] ==null ? '' : data["address"].toString();
        ppaidFrom = data["paidFrom"] ==null ? '' : data["paidFrom"].toString();
        ppaidUpto =  data["paidUpto"] ==null ? '' : data["paidUpto"].toString();
        pdemandAmount = data["demandAmount"] ==null ? '' : data["demandAmount"].toString();
        ptotalPenalty = data["totalPenalty"] ==null ? '' : data["totalPenalty"].toString();
        ptotalRebate =  data["totalRebate"] ==null ? '' : data["totalRebate"].toString();
        ptotalPaidAmount =  data["totalPaidAmount"] ==null ? '' : data["totalPaidAmount"].toString();
        ppaymentMode =  data["paymentMode"] ==null ? '' : data["paymentMode"].toString();
        ptcName =  data["tcName"] ==null ? '' : data["tcName"].toString();
        ptcMobile =  data["tcMobile"] ==null ? '' : data["tcMobile"].toString();
      }
    } else {
      CommonUtils.showSnackBar('Could not Save', safReceipts1.errorMessage, Colors.red);
    }

    return true;
  }

  var paysafNo ='';
  var payPropAddress ='';
  var payOldWard ='';
  var payNewWard ='';
  var payPropType ='';
  var payPropHoldingType ='';
  var payOwnerShipType ='';
  var paydemandAmount ='';
  var payTotalTax ='';
  var payTotalOnePercPenalty ='';
  var payLateAssessmentPenalty='';
  var payRebateAmt ='';
  var paySpecialRebateAmt ='';
  var payPayableAmount='';

  Future<bool> PaymentDemand() async {
    APIResponse response = await PropertyNewAssessmentProvider().PaymentDemandById(userID);
    if (response.error == true) {
      CommonUtils.showSnackBar(
          'Could not Save', response.errorMessage, Colors.red);
    } else {
      CommonUtils.showSnackBar('Success', response.errorMessage, Colors.blue);
      var data = response.data;
      paysafNo = data['basicDetails']['saf_no'];
      payPropAddress= data['basicDetails']['prop_address'];
      payOldWard= data['basicDetails']['old_ward_no'].toString();
      payNewWard= data['basicDetails']['new_ward_no'].toString();
      payPropType= data['basicDetails']['property_type'].toString();
      payPropHoldingType= data['basicDetails']['holding_type'].toString();
      payOwnerShipType= data['basicDetails']['ownership_type'].toString();
      paydemandAmount = data['amounts'].toString();
      payTotalTax = data['amounts']['totalTax'].toString();
      payTotalOnePercPenalty = data['amounts']['totalOnePercPenalty'].toString();
      payLateAssessmentPenalty = data['amounts']['lateAssessmentPenalty'].toString();
      payRebateAmt = data['amounts']['rebateAmt'].toString();
      paySpecialRebateAmt = data['amounts']['specialRebateAmt'].toString();
      payPayableAmount = data['amounts']['payableAmount'].toString();
    }
    return true;

  }

  getPrintString1() {
    var retStr = "";
    // retStr += " Payment Receipt\n" ;
    // retStr += "===========================\n" ;
    retStr += "Date :" + ptransactionDate + "\n" ;
    retStr += "POS ID :" + 'xxxxxxxxxxxxx' + "\n" ;
    retStr += "Transaction No :" + ptransactionNo+ "\n" ;
    retStr += "Holding No :" + pnewApplicationNo + "\n" ;
    retStr += "New Holding No :" + pnewApplicationNo + "\n" ;
    retStr += "Ward No :" + poldWardNo + "\n" ;
    retStr += "Citizen Name :" + pcustomerName.toString() + "\n" ;
    retStr += "Address :" + paddress.toString() + "\n" ;

    return retStr;
  }

  getPrintString2() {
    var retStr = "";
    retStr = "Paid From :" + ppaidFrom + "\n" ;
    retStr += "Paid Upto :" + ppaidUpto + "\n" ;
    retStr = "Demand Amount :" + pdemandAmount + "\n" ;
    retStr += "Penalty Amount :" + ptotalRebate + "\n" ;
    retStr = "Rebate Amount :" + ptotalPaidAmount + "\n" ;
    retStr += "Amount Paid :" + ptotalPaidAmount + "\n" ;
    retStr = "Payment Mode :" + ppaymentMode + "\n" ;
    return retStr;
  }

  getPrintString3() {
    var retStr = "";
    retStr = "TC Name :" + ptcName + "\n" ;
    retStr += "Mobile No :" + ptcMobile + "\n" ;
    retStr += "Note:For Detail Please Visit : udhd jharkhand.gov.in";
    retStr += "or call us at 1800 8941115 or 0651-3500700. ";
    retStr += "Please keep This Bill For Future Reference";
    return retStr;
  }


//GEOTAGGING - TC
  File? _selectedFile1 = null;
  File? _selectedFile2 = null;
  File? _selectedFile3 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage2Path = ''.obs;
  var selectedImage3Path = ''.obs;
  var selectedImage1Size = ''.obs;
  var selectedImage2Size = ''.obs;
  var selectedImage3Size = ''.obs;
  final ImagePicker _picker = ImagePicker();


  //GEOTAGGING - TC
  var directionType0 = 'Left';
  var directionType1 = 'Right';
  var directionType2 = 'Front';
  var imagePath0 = '';
  var imagePath1 = '';
  var imagePath2 = '';
  late TextEditingController longitude0Controller = TextEditingController();
  late TextEditingController latitude0Controller = TextEditingController();
  late TextEditingController longitude1Controller = TextEditingController();
  late TextEditingController latitude1Controller = TextEditingController();
  late TextEditingController longitude2Controller = TextEditingController();
  late TextEditingController latitude2Controller = TextEditingController();
  //GEOTAGGING - TC
  Future<void> geotagging() async {
    String _img64Image1, _img64Image2, _img64Image3;
    final bytes1 = await _selectedFile1!.readAsBytes();
    final bytes2 = await _selectedFile2!.readAsBytes();
    final bytes3 = await _selectedFile3!.readAsBytes();
    _img64Image1 = base64Encode(bytes1);
    _img64Image2 = base64Encode(bytes2);
    _img64Image3 = base64Encode(bytes3);

      // Create temporary files to save base64 encoded image data
      // final tempDir = await getTemporaryDirectory();
      final bytes01 = base64Decode(_img64Image1);
      final bytes02 = base64Decode(_img64Image2);
      final bytes03 = base64Decode(_img64Image3);
      final directory = await getApplicationDocumentsDirectory();
      final file1 = await File('${directory.path}/image1.png').create();
      final file2 = await File('${directory.path}/image2.png').create();
      final file3 = await File('${directory.path}/image3.png').create();
      await file1.writeAsBytes(bytes01);
      await file2.writeAsBytes(bytes02);
      await file3.writeAsBytes(bytes03);

      // Make API call to server with valid image files
      final result = await FieldVerificationPendingListProvider().GeoTaggingForm(propertySafId, {
        'imagePath[0]': file1,
        'directionType[0]': directionType0,
        'longitude[0]': longitude0Controller.value.text,
        'latitude[0]': latitude0Controller.value.text,
        'imagePath[1]': file2,
        'directionType[1]': directionType1,
        'longitude[1]': longitude1Controller.value.text,
        'latitude[1]': latitude1Controller.value.text,
        'imagePath[2]': file3,
        'directionType[2]': directionType2,
        'longitude[2]': longitude2Controller.value.text,
        'latitude[2]': latitude2Controller.value.text,
      });
      if (result.error == false) {
        Get.snackbar(
          '😁😁',
          result.errorMessage,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Oops!!!',
          result.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }
      isDataProcessing(false);

  }

  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      maxWidth: 850,
      maxHeight: 850,
      imageQuality: 1,
    );
    if (image != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 900,
        maxHeight: 900,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (cropped != null) {
        _selectedFile1 = File(cropped.path);
        selectedImage1Path.value = cropped.path;
        selectedImage1Size.value =
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "Mb";
      }
    }
  }

  void getImage1(ImageSource imageSource) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedFile != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 900,
        maxHeight: 900,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (cropped == null) {
        _selectedFile1 = null;
        selectedImage1Path.value = '';
        selectedImage1Size.value = '';
      } else {
        // Add a check for valid file types
        if (!['.jpg', '.jpeg', '.png']
            .contains(path.extension(cropped.path).toLowerCase())) {
          Get.snackbar(
            'Error',
            'Invalid file format. Please select a valid image.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
          return;
        }

        selectedImage1Path.value = cropped.path;
        _selectedFile1 = File(selectedImage1Path.value);
        selectedImage1Size.value =
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "Mb";
      }
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  void getImage2(ImageSource imageSource) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedFile != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 900,
        maxHeight: 900,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (cropped == null) {
        _selectedFile2 = null;
        selectedImage2Path.value = '';
        selectedImage2Size.value = '';
      } else {
        // Add a check for valid file types
        if (!['.jpg', '.jpeg', '.png'].contains(path.extension(cropped.path).toLowerCase())) {
          Get.snackbar(
            'Error',
            'Invalid file format. Please select a valid image.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
          return;
        }

        selectedImage2Path.value = cropped.path;
        _selectedFile2 = File(selectedImage2Path.value);
        selectedImage2Size.value =
            (File(selectedImage2Path.value).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "Mb";
      }
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  void getImage3(ImageSource imageSource) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedFile != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 900,
        maxHeight: 900,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (cropped == null) {
        _selectedFile3 = null;
        selectedImage3Path.value = '';
        selectedImage3Size.value = '';
      } else {
        // Add a check for valid file types
        if (!['.jpg', '.jpeg', '.png'].contains(path.extension(cropped.path).toLowerCase())) {
          Get.snackbar(
            'Error',
            'Invalid file format. Please select a valid image.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
          return;
        }

        selectedImage3Path.value = cropped.path;
        _selectedFile3 = File(selectedImage3Path.value);
        selectedImage3Size.value =
            (File(selectedImage3Path.value).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "Mb";
      }
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
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
    // for (var controller in addFloorController) {
    //   controller.dispose();
    // }
    for (var controller in remarkControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void increment() => count.value++;
}
