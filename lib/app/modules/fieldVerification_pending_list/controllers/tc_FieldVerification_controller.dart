import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../../../common/api_response.dart';
import '../../../common/cluster.dart';
import '../../../common/function.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../../property_HomeScreen/views/property_home_screen_view.dart';
import '../../property_NewAssessment/providers/property_new_assessment_provider.dart';
import '../providers/field_verification_pending_list_provider.dart';
import '../views/geo_tagging_check_by_utc_view.dart';
import '../views/geotagging_verification_form_view.dart';
import '../views/pend_verification_form_view.dart';

class TcFieldVerificationController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> VerificationFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> geotaggingFormkey = GlobalKey<FormState>();
  final RxInt totalFloors = 0.obs;
  List<bool> _expandedPanels = [false]; // Set the initial expansion state here


  var verifyuser = List<dynamic>.empty(growable: true).obs;
  var newverifyuser = List<dynamic>.empty(growable: true).obs;
  var floorsList = List<Map<String, dynamic>>.empty(growable: true).obs;
  var citizenFloor = List<Map<String, dynamic>>.empty(growable: true).obs;
  var tcNewFloor = List<Map<String, dynamic>>.empty(growable: true).obs;
  var tcVerifyFloor = List<Map<String, dynamic>>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isLoading = false.obs;
  var isDropdownLoading = false.obs;
  bool isVacant = false;
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
  // var selectedFilterBy = "".obs;
  // late TextEditingController searchQuery;

  //DROPDOWN LIST
  List<Map<String, dynamic>> wardList = [];
  List<Map<String, dynamic>> WardListByZone = [];
  List<Map<String, dynamic>> ownershipList = [];
  List<Map<String, dynamic>> propertyList = [];
  List<Map<String, dynamic>> floorList = [];
  List<Map<String, dynamic>> usageList = [];
  List<Map<String, dynamic>> occuppancyList = [];
  List<Map<String, dynamic>> constructionList = [];
  List<Map<String, dynamic>> zoneList = [];
  List<Map<String, dynamic>> categoryList = [];


  // WORKFLOW ACTION ..........!!!
  var userID = "290176";
  var action = 'forward'.toString();
  TextEditingController commentController = TextEditingController();

  final count = 0.obs;


  late TextEditingController percentageofPropertyTransferController;
  late TextEditingController areaOfPlotController;
  late TextEditingController roadWidthController;
  late TextEditingController tHoardingBoardController;
  late TextEditingController sHoardingBoardController;
  late TextEditingController tMobileTowerController;
  late TextEditingController sMobileTowerController;
  late TextEditingController tPetrolPumpController;
  late TextEditingController sPetrolPumpController;
  late List<TextEditingController> builtUpAreaControllers;
  late List<TextEditingController>dateFromController;
  late List<TextEditingController>dateUptoController;
  late TextEditingController sRainWaterHarvesting;
  late TextEditingController remarkController;


  var newWardNo = "".obs;
  var zone = "".obs;
  var propertyType = "".obs;
  var categoryType = "".obs;
  var hoardingBoard = "".obs;
  var mobileTower = "".obs;
  var petrolPump = "".obs;
  var floorNo = List<dynamic>.empty(growable: true).obs;
  var useType = List<dynamic>.empty(growable: true).obs;
  var occupancyType = List<dynamic>.empty(growable: true).obs;
  var constructionType = List<dynamic>.empty(growable: true).obs;
  var rainwaterHarvesting = "".obs;

  //inbox
  var vOwnerName = "";
  var vwardNo = "";
  var vSafno = "";
  var vPropertyType = "";
  var vAssessmentType = "";
  var vApplyDate = "";
  var vMobileNo = "";

  bool atcVerified = false;
  bool utcVerified = false;
  bool geoTagged = false;


//data by id - TC
  var safno = "";
  var assessment = "";
  var applicationdate = "";
  var ownername = "";
  var mobileno = "";
  var oldwardno = "";
  var oldwardmstrid = "";
  var newwardno = "";
  var newardmstrid = "";
  var zonemstrid = "";
  var data_zone = "";
  var data_category = "";
  var propertytype = "";
  var categoryTypemstrid = "";
  var propertytypemstrid = "";
  var percentageofpropertytransfer = "";
  var areaofplot = "";
  var roadtypemaster = "";
  var roadwidth = "";
  var roadtypemstrid = "";
  var ishoardingboard = "";
  var hoardingarea = "";
  var hoardinginstallationdate = "";
  var ismobiletower = "";
  var towerarea = "";
  var towerinstallationdate = "";
  var ispetrolpump = "";
  var undergroundarea = "";
  var petrolpumpcompletiondate = "";
  var iswaterharvesting = "";
  var waterharvestinginstallationdate = "";
  var builtupArea = List<dynamic>.empty(growable: true).obs;
  var dateFrom = List<dynamic>.empty(growable: true).obs;
  var dateUpto = List<dynamic>.empty(growable: true).obs;
  var appliedBy = "";

  //Radio
  var NewWardCheckStatus = "".obs;
  var zoneCheckStatus = "".obs;
  var propertyTypeCheckStatus = "".obs;
  var percentageCheckStatus = "".obs;
  var areaofplotCheckStatus = "".obs;
  var categoryTypeCheckStatus = "".obs;
  var hoardingboardCheckStatus = "".obs;
  var mobiletowerCheckStatus = "".obs;
  var petrolpumpCheckStatus = "".obs;
  var waterharvestingCheckStatus = "".obs;
  var floorCheckStatus = List<dynamic>.empty(growable: true).obs;
  var usagetypeCheckStatus = List<dynamic>.empty(growable: true).obs;
  var occupancytypeCheckStatus = List<dynamic>.empty(growable: true).obs;
  var constructiontypeCheckStatus = List<dynamic>.empty(growable: true).obs;
  var builtupareaCheckStatus = <String>[].obs;
  var datefromCheckStatus = <String>[].obs;
  var dateUptoCheckStatus = <String>[].obs;
  var isNewWardEnable = true.obs;
  var iszoneEnable = true.obs;
  var ispropertyTypeEnable = true.obs;
  var ispercentageEnable = true.obs;
  var isareaofplotEnable = true.obs;
  var isCategoryEnable = true.obs;
  var ishoardingboardEnable = true.obs;
  var ismobiletowerEnable = true.obs;
  var ispetrolpumpEnable = true.obs;
  var iswaterharvestingEnable = true.obs;
  var isfloorEnable = List<dynamic>.empty(growable: true).obs;
  var isusagetypeEnable = List<dynamic>.empty(growable: true).obs;
  var isoccupancytypeEnable = List<dynamic>.empty(growable: true).obs;
  var isconstructiontypeEnable = List<dynamic>.empty(growable: true).obs;
  var isbuiltupareaEnable = <bool>[].obs;
  var isdatefromEnable = <bool>[].obs;
  var isdateUptoEnable = <bool>[].obs;




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


  final RxString latitudeError = RxString('');
  final RxString longitudeError = RxString('');

  // Validation for latitude field
  String? validateLatitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'Latitude field is required';
    }
    return null;
  }

  // Validation for longitude field
  String? validateLongitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'Longitude field is required';
    }
    return null;
  }

  void clearValidationErrors() {
    latitudeError.value = '';
    longitudeError.value = '';
  }


  var floorDataList = List<dynamic>.empty(growable: true).obs;
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

  void deleteFloorData(int index) {
    floorDataList.removeAt(index);
    // Remove the controllers for the deleted row
    remarkControllers.removeAt(index);
    floorBuiltUpController.removeAt(index);
    floorDateFromController.removeAt(index);
    floordateUptoController.removeAt(index);
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






  @override
  void onInit() {
    super.onInit();
    // getWardByZone();
    percentageofPropertyTransferController = TextEditingController();
    areaOfPlotController = TextEditingController();
    roadWidthController = TextEditingController();
    tHoardingBoardController = TextEditingController();
    sHoardingBoardController = TextEditingController();
    tMobileTowerController = TextEditingController();
    sMobileTowerController = TextEditingController();
    tPetrolPumpController = TextEditingController();
    sPetrolPumpController = TextEditingController();
    builtUpAreaControllers = List.generate(floorsList.length, (index) => TextEditingController());
    dateFromController =List.generate(floorsList.length, (index) => TextEditingController());
    sRainWaterHarvesting = TextEditingController();
    remarkController = TextEditingController();
    longitude0Controller = TextEditingController();
    latitude0Controller = TextEditingController();
    longitude1Controller = TextEditingController();
    latitude1Controller = TextEditingController();
    longitude2Controller = TextEditingController();
    latitude2Controller = TextEditingController();
    // searchQuery = TextEditingController();

    getUserDetails( page );
    getDropdownListDetail();
  }


  @override
  void onClose() {
    for (var controller in remarkControllers) {
      controller.dispose();
    }
    super.onClose();
  }


  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isPageLoading = false.obs;
  int page = 1;
  int perPage = 10;
  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getUserDetails(currentPage.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getUserDetails(currentPage.value);
    }
  }

  // var selectedFilterBy = "".obs;
  // late TextEditingController searchQuery;


  String selectedFilterOption = ""; // Variable to store the selected filter option from the dropdown
  String searchQuery = ""; // Variable to store the search query from the text input

  Future<bool> getUserDetails(int page, {bool performSearch = false}) async {
    isLoading.value = true;
    verifyuser.clear();
    APIResponse verifyuserResponse = await FieldVerificationPendingListProvider().getUserVerified(page, perPage);
    if (verifyuserResponse.error == false) {
        var data = verifyuserResponse.data["data"];
        if (data != null) {
          List<Map<String, dynamic>> newVerifyUserList = [];
          for (var item in data) {
            Map<String, dynamic> userData = {
              'vId': item['id'] == null ? '' : item['id'].toString(),
              'vOwnerName': item['owner_name'] == null ? '' : item['owner_name'].toString(),
              'vwardNo': item['ward_no'] == null ? '' : item['ward_no'].toString(),
              'vSafno': item['saf_no'] == null ? '' : item['saf_no'].toString(),
              'vPropertyType': item['property_type'] == null ? '' : item['property_type'].toString(),
              'vAssessmentType': item['assessment'] == null ? '' : item['assessment'].toString(),
              'vApplyDate': item['apply_date'] == null ? '' : item['apply_date'].toString(),
              'vMobileNo': item['mobile_no'] == null ? '' : item['mobile_no'].toString(),
              'atcVerified': item['is_agency_verified'] == null ? '' : item['is_agency_verified'].toString(),
              'utcVerified': item['is_field_verified'] == null ? '' : item['is_field_verified'].toString(),
              'geoTagged': item['is_geo_tagged'] == null ? '' : item['is_geo_tagged'].toString(),
            };

            // Check if the item matches the search query based on the selected filter option
            bool matchesFilter = false;
            if (selectedFilterOption == "applicationNo") {
              matchesFilter = userData['vId'].contains(searchQuery);
            } else if (selectedFilterOption == "name") {
              matchesFilter = userData['vOwnerName'].toLowerCase().contains(searchQuery.toLowerCase());
            } else if (selectedFilterOption == "mobileNo") {
              matchesFilter = userData['vMobileNo'].contains(searchQuery);
            } else {
              matchesFilter = true;
            }

            // Add the item to the list only if it matches the filter criteria
            if (matchesFilter) {
              newVerifyUserList.add(userData);
            }
          }

          // Update the pagination information if it's the first page
          if (page == 1) {
            currentPage.value = verifyuserResponse.data['current_page'];
            totalPages.value = verifyuserResponse.data['last_page'];
          }

          // Clear the previous data if performing search, otherwise, add the new filtered data to the list
          if (performSearch) {
            verifyuser.clear();
          }
          verifyuser.addAll(newVerifyUserList);

          // Only update the searchQuery variable when performing a search to avoid persisting the query in the field
          if (performSearch) {
            searchQuery = '';
          }
        }

      } else {
        Get.snackbar(
          'Oops!!!',
          verifyuserResponse.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }

    isLoading.value = false;
    return true;
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

  var selectedZoneId = "";

  Future<void>  getWardByZone() async {
    isDropdownLoading.value = true;
    WardListByZone.clear();
     newWardNo.value = "";
    APIResponse response = await FieldVerificationPendingListProvider().WardByZone(selectedZoneId);
    if(!response.error){
      //  condition in response data status
        List<dynamic> responseDataList = List<dynamic>.from(response.data);
        for (var responseData in responseDataList) {
          // Map<String, dynamic> zoneWardData = Map<String, dynamic>.from(responseData);
          // Creating a map to hold the processed data
          Map<String, dynamic> WardData = {
            'id': responseData['id'],
            'zone': responseData['zone'],
            'ward_name': responseData['ward_name'],
            'old_ward_name': responseData['old_ward_name'],
          };
          // Add the processed data to the wardList
          WardListByZone.add(WardData);
        }
        isDropdownLoading.value = false;
      } else {
        Get.snackbar(
          'Oops!!!',
          response.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }
    isDropdownLoading.value = false;
  }

  //GEOTAGGING - TC
  Future<bool> geotaggingForm() async {
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
      final result = await FieldVerificationPendingListProvider().GeoTaggingForm(userID, {
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
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );

      } else {
        Get.snackbar(
          'Oops!!!',
          result.errorMessage,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
  }
      isDataProcessing(false);
      return true;
  }


  // WORKFLOW ACTION(Forward) ..........!!!
  Future<void> ForwardSafVerifyForm() async {
    commentController = TextEditingController();
    bool isSuccess = true;
    if (isSuccess) {
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text('Workflow Action'),
          content: Obx(
                () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: 'Comment...',
                  ),
                ),
                if (isLoading.value)
                  CircularProgressIndicator(),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: isLoading.value ? null : () async {
                bool isSubmit = false;
                var result;
                isLoading.value = true;
                // isSubmit = GetStorage().read('isUtc') && await tcVerificationForm();
                // isSubmit = GetStorage().read('isTc') && await geotaggingForm();
                // if (GetStorage().read('isUtc')) {isSubmit = await tcVerificationForm();}
                if (GetStorage().read('isTc')) {isSubmit = await geotaggingForm();}
                if (GetStorage().read('isUtc') || (GetStorage().read('isTc') && isSubmit)) {
                  result = await FieldVerificationPendingListProvider().FieldVerificationWorkflowAction(
                    userID,
                    {
                      'action':  action,
                      'comment': commentController?.value.text ?? '',
                    },
                  );
                }
                if(result.error == false) {
                  Get.to(HomeView());
                  fetchAndDisplayData();
                  resetValues();
                  Get.snackbar(
                    '😁😁',
                    result.errorMessage,
                    backgroundColor: Colors.pinkAccent,
                    colorText: Colors.white,
                  );
                  commentController.clear();
                } else {
                  Get.snackbar(
                    'Oops!!!',
                    result.errorMessage,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                }
                isLoading.value = false;
              },
              child: Text(isLoading.value ? 'Loading...' : 'Forward'),
            ),
          ],
        ),
      );
    }
  }

  var backAction = 'backward'.toString();
  // WORKFLOW ACTION(Backward) ..........!!!
  void BackwardSafVerifyForm() async {
    commentController = TextEditingController();
    bool isSuccess = true;
    if (isSuccess) {
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text('Workflow Action'),
          content: Obx(
                () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: 'Comment...',
                  ),
                ),
                if (isLoading.value)
                  CircularProgressIndicator(),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: isLoading.value ? null : () async {
                bool isSubmit = false;
                var result;
                isLoading.value = true;
                  result = await FieldVerificationPendingListProvider().FieldVerificationWorkflowAction(
                    userID,
                    {
                      'action':  backAction,
                      'comment': commentController?.value.text ?? '',
                    },
                  );
                if(result.error == false) {
                  Get.to(HomeView());
                  fetchAndDisplayData();
                  resetValues();
                  Get.snackbar(
                    '😁😁',
                    result.errorMessage,
                    backgroundColor: Colors.pinkAccent,
                    colorText: Colors.white,
                  );
                  commentController.clear();
                } else {
                  Get.snackbar(
                    'Oops!!!',
                    result.errorMessage,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                }
                isLoading.value = false;
              },
              child: Text(isLoading.value ? 'Loading...' : 'Backward'),
            ),
          ],
        ),
      );
    }
  }

  void fetchAndDisplayData() {
    isLoading.value = true;
    getUserDetails(page);
    isLoading.value = false;
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
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
                "Mb";
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
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
                "Mb";
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

        selectedImage2Path.value = cropped.path;
        _selectedFile2 = File(selectedImage2Path.value);
        selectedImage2Size.value =
            (File(selectedImage2Path.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
                "Mb";
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

        selectedImage3Path.value = cropped.path;
        _selectedFile3 = File(selectedImage3Path.value);
        selectedImage3Size.value =
            (File(selectedImage3Path.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
                "Mb";
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

  //UTC
  var safId = 290176;
  var tcApplicationNo = "";
  var tcApplicationType = "";
  var tcApplicationdate = "";
  var tcOwnerName = "";
  var tcMobileNo = "";
  var tcOldWard = "";
  var tcNewWard = "";
  var tcPropertyType = "";
  var tcAreaOfPlot = "";
  var tczone = "";
  var tccategory = "";
  var tcRoadType = "";
  var tcRoadWidth = "";
  var tcHoardingBoard = "";
  var tcHoardingBoardArea = "";
  var tcHoardingBoardDate = "";
  var tcMobileTower = "";
  var tcMobileTowerArea = "";
  var tcMobileTowerDate = "";
  var tcPetrolPump = "";
  var tcPetrolPumpArea = "";
  var tcPetrolPumpDate = "";
  var tcRainwaterHarv = "";
  var tcFrontImage = "";
  var tcFrontRelativeImage = "";
  var tcFrontLat = "";
  var tcFrontLong = "";
  var tcRightImage = "";
  var tcRightRelativeImage = "";
  var tcRightLat = "";
  var tcRightLong = "";
  var tcLeftImage = "";
  var tcLeftRelativeImage = "";
  var tcLeftLat = "";
  var tcLeftLong = "";
  var tcFloorNew = "";
  var tcUsageTypeNew = "";
  var tcOccupancyTypeNew = "";
  var tcConstructionTypeNew = "";
  var tcBuiltupAreaNew = "";
  var tcDateFromNew = "";
  var tcDateUptoNew = "";
  var tcFloor = "";
  var tcUsageType = "";
  var tcOccupancyType = "";
  var tcConstructionType = "";
  var tcBuiltupArea = "";
  var tcDateFrom = "";
  var tcDateUpto = "";
  bool getData = false;

  verificationByUserID(askuserID) async {
    userID = askuserID;
    await getDetails();
  }
  //DATA TO BE VERIFIED COMING BY ID
  Future<bool> getDetails() async{
    isLoading.value = true;
    //citizen data
    APIResponse newverifyuser0 = await FieldVerificationPendingListProvider().TcVerifyData(userID);

    var appliedByTc = '';

    if(!newverifyuser0.error){

      //  Citizen Data is to be verified by TC (#Data-by-id)
        if (newverifyuser0.data != null) {
          Map<String, dynamic> data = newverifyuser0.data;
          // getWardByZone(data['zone_mstr_id'].toString() ?? '');
          appliedByTc = data['applied_by'].toString() ?? '';
          safno = data['saf_no'].toString() ?? '';
          appliedBy = data['applied_by'].toString() ?? '';
          assessment = data['assessment'].toString() ?? '';
          applicationdate = data['application_date'].toString() ?? '';
          ownername = data['owners'][0]['owner_name'].toString() ?? '';
          mobileno = data['owners'][0]['mobile_no'].toString() ?? '';
          // oldwardno = data['old_ward_no'].toString() ?? '';
          // oldwardmstrid =data ['ward_mstr_id'].toString() ?? '';
          newwardno = data['old_ward_no'].toString() ?? '';
          newardmstrid = data['ward_mstr_id'].toString() ?? '';
          zonemstrid =data ['zone_mstr_id'].toString() ?? '';
          data_zone = data ['zone'].toString() ?? '';
          data_category = data ['category'].toString() ?? '';
          categoryTypemstrid = data['category_id'].toString() ?? '';
          propertytype = data['property_type'].toString() ?? '';
          isVacant = (data['property_type'] == 4 || data['property_type'] == '4') ? true : false;
          propertytypemstrid = data['prop_type_mstr_id'].toString() ?? '';
          percentageofpropertytransfer = data['percentage_of_property_transfer'].toString() ?? '';
          areaofplot = data['area_of_plot'].toString() ?? '';
          roadtypemaster =data ['road_type_master'].toString() ?? '';
          roadwidth =data ['road_width'].toString() ?? '';
          roadtypemstrid =data['road_type_mstr_id'].toString() ?? '';
          ishoardingboard =data['is_hoarding_board'].toString() ?? '';
          hoardingarea =data['hoarding_area'].toString() ?? '';
          hoardinginstallationdate =data['hoarding_installation_date'].toString() ?? '';
          ismobiletower =data['is_mobile_tower'].toString() ?? '';
          towerarea = data['tower_area'].toString()  ?? '';
          towerinstallationdate =data['tower_installation_date'].toString() ?? '';
          ispetrolpump = data['is_petrol_pump'].toString() ?? '';
          undergroundarea = data['under_ground_area'].toString() ?? '';
          petrolpumpcompletiondate =data['petrol_pump_completion_date'].toString() ?? '';
          iswaterharvesting = data['is_water_harvesting'].toString() ?? '';
          waterharvestinginstallationdate = data['rwh_date_from'].toString() ?? '';
          atcVerified = boolValue(data["is_agency_verified"]);
          utcVerified =  boolValue(data["is_field_verified"]);
          geoTagged =boolValue(data["is_geo_tagged"]);
          floorsList.clear();
          floorCheckStatus.clear();
          usagetypeCheckStatus.clear();
          occupancytypeCheckStatus.clear();
          constructiontypeCheckStatus.clear();
          builtupareaCheckStatus.clear();
          datefromCheckStatus.clear();
          isfloorEnable.clear();
          isusagetypeEnable.clear();
          isoccupancytypeEnable.clear();
          isconstructiontypeEnable.clear();
          isbuiltupareaEnable.clear();
          isdatefromEnable.clear();
          isdateUptoEnable.clear();
          List<dynamic> floors = data['floors'];
          for (var floor in floors){
            Map<String, dynamic> floorMap = {
              'id': floor['id'].toString() ?? '',
              'floor_name': floor['floor_name'].toString() ?? '',
              'floor_mstr_id': floor['floor_mstr_id'].toString() ?? '',
              'usage_type': floor['usage_type'].toString() ?? '',
              'usage_type_mstr_id' : floor['usage_type_mstr_id'].toString() ?? '',
              'occupancy_type': floor['occupancy_type'].toString() ?? '',
              'occupancy_type_mstr_id' : floor['occupancy_type_mstr_id'].toString() ?? '',
              'construction_type': floor['construction_type'].toString() ?? '',
              ' const_type_mstr_id ': floor['const_type_mstr_id'].toString() ?? '',
              'builtup_area': floor['builtup_area'] ?? '',
              'date_from': floor['date_from'].toString() ?? '',
              'date_upto': floor['date_upto'].toString() ?? '',
            };
            floorsList.add(floorMap);
            floorCheckStatus.addAll(['']);
            isfloorEnable.addAll([true]);
            floorNo.add(['']);
            usagetypeCheckStatus.add(['']);
            isusagetypeEnable.add([false]);
            useType.add(['']);
            occupancytypeCheckStatus.add('');
            isoccupancytypeEnable.add(false);
            occupancyType.add(['']);
            constructiontypeCheckStatus.add('');
            isconstructiontypeEnable.add(false);
            constructionType.add(['']);
            builtupareaCheckStatus.add('');
            isbuiltupareaEnable.add(false);
            datefromCheckStatus.add('');
            isdatefromEnable.add(false);
            dateUptoCheckStatus.add('');
            isdateUptoEnable.add(false);;
          }
          for (var cf in floors){
            Map<String, dynamic> floorCitizenMap = {
              'floorId': cf['id'].toString() ?? '',
              'floorNo': cf['floor_mstr_id'].toString() ?? '',
              'useType' : cf['usage_type_mstr_id'].toString() ?? '',
              'occupancyType' : cf['occupancy_type_mstr_id'].toString() ?? '',
              'constructionType': cf['const_type_mstr_id'].toString() ?? '',
              'buildupArea': cf['builtup_area'] ?? '',
              'dateFrom': cf['date_from'].toString() ?? '',
              'dateUpto': cf['date_upto'].toString() ?? '',
            };
            citizenFloor.add(floorCitizenMap);
          }
          builtUpAreaControllers = List.generate(floors.length, (index) => TextEditingController());
          dateFromController = List.generate(floors.length, (index) => TextEditingController());
          dateUptoController = List.generate(floors.length, (index) => TextEditingController());
        }

    } else {
      Get.snackbar(
        'Oops!!!',
        newverifyuser0.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }

  switch(GetStorage().read('isUtc')){
    case true : {

      //Tc data
      APIResponse newverifyuser1 = await FieldVerificationPendingListProvider().UtcVerifyData(userID);

        // Map<String, dynamic> DataVerifiedByUtc = json.decode(newverifyuser1.data);

        if(!newverifyuser1.error){

          if (newverifyuser1.data != null) {
            Map<String, dynamic> data = newverifyuser1.data;

            tcOldWard = data['old_ward_no'].toString() ?? '';
            tcNewWard = data['ward_no'].toString() ?? '';
            tcPropertyType = data['property_type'].toString() ?? '';
            tcAreaOfPlot = data['area_of_plot'].toString() ?? '';
            tczone = data['zone'].toString() ?? '';
            tccategory = data['category'].toString() ?? '';
            tcRoadType = data['road_type_master'].toString() ?? '';
            tcRoadWidth = data['road_width'].toString() ?? '';
            tcHoardingBoard = data['is_hoarding_board'].toString() ?? '';
            tcHoardingBoardArea = data['hoarding_area'].toString() ?? '';
            tcHoardingBoardDate = data['hoarding_installation_date'].toString() ?? '';
            tcMobileTower = data['is_mobile_tower'].toString() ?? '';
            tcMobileTowerArea = data['tower_area'].toString() ?? '';
            tcMobileTowerDate = data['tower_installation_date'].toString() ?? '';
            tcPetrolPump = data['is_petrol_pump'].toString() ?? '';
            tcPetrolPumpArea = data['under_ground_area'].toString() ?? '';
            tcPetrolPumpDate = data['petrol_pump_completion_date'].toString() ?? '';
            tcRainwaterHarv = data['is_water_harvesting'].toString() ?? '';

            data['geoTagging'].forEach((item){
              switch(item['direction_type']){
                case 'Left' : {
                  tcLeftImage = item['image_path'].toString() ?? '';
                  tcLeftRelativeImage = item['relative_path'].toString() ?? '';
                  tcLeftLat = item['latitude'].toString() ?? '';
                  tcLeftLong = item['longitude'].toString() ?? '';
                }
                break;
                case 'Right' : {
                  tcRightImage = item['image_path'].toString() ?? '';
                  tcRightRelativeImage = item['relative_path'].toString() ?? '';
                  tcRightLat = item['latitude'].toString() ?? '';
                  tcRightLong = item['longitude'].toString() ?? '';
                }
                break;
                case 'Front' : {
                  tcFrontImage = item['image_path'].toString() ?? '';
                  tcFrontRelativeImage = item['relative_path'].toString() ?? '';
                  tcFrontLat = item['latitude'].toString() ?? '';
                  tcFrontLong = item['longitude'].toString() ?? '';
                }
                break;
                default: {
                  break;
                }
              }
            });
            tcNewFloor.clear();
            if(data['newFloors'] != null){
              List<dynamic> newFloors = data['newFloors'];
              for (var floor in newFloors) {
                Map<String, dynamic> newFloorsMap = {
                  'id': floor['id'].toString() ?? '',
                  'floor_name': floor['floor_name'].toString() ?? '',
                  'floor_mstr_id': floor['floor_mstr_id'].toString() ?? '',
                  'usage_type': floor['usage_type'].toString() ?? '',
                  'usage_type_mstr_id': floor['usage_type_mstr_id'].toString() ?? '',
                  'occupancy_type': floor['occupancy_type'].toString() ?? '',
                  'occupancy_type_mstr_id': floor['occupancy_type_mstr_id'].toString() ?? '',
                  'construction_type': floor['construction_type'].toString() ?? '',
                  'const_type_mstr_id ': floor['const_type_mstr_id'].toString() ?? '',
                  'builtup_area': floor['builtup_area'].toString() ?? '',
                  'date_from': floor['date_from'].toString() ?? '',
                  'date_upto': floor['date_upto'].toString() ?? '',
                };
                tcNewFloor.add(newFloorsMap);
              }
            }

            tcVerifyFloor.clear();

            if(data['existingFloors'] != null){
              List<dynamic> existingFloors = data['existingFloors'];
              for (var floor in existingFloors) {
                Map<String, dynamic> existingFloorsMap = {
                  'id': floor['id'].toString() ?? '',
                  'floor_name': floor['floor_name'].toString() ?? '',
                  'floor_mstr_id': floor['floor_mstr_id'].toString() ?? '',
                  'usage_type': floor['usage_type'].toString() ?? '',
                  'usage_type_mstr_id': floor['usage_type_mstr_id'].toString() ?? '',
                  'occupancy_type': floor['occupancy_type'].toString() ?? '',
                  'occupancy_type_mstr_id': floor['occupancy_type_mstr_id'].toString() ?? '',
                  'construction_type': floor['construction_type'].toString() ?? '',
                  ' const_type_mstr_id ': floor['const_type_mstr_id'].toString() ?? '',
                  'builtup_area': floor['builtup_area'].toString() ?? '',
                  'date_from': floor['date_from'].toString() ?? '',
                  'date_upto': floor['date_upto'].toString() ?? '',
                };
                tcVerifyFloor.add(existingFloorsMap);
              }
            }
          }
          if(newverifyuser1.data['geoTagging'].length > 0)
          {
            getData = true;
            isLoading.value = false;
            if(utcVerified){
              Get.to(GeoTaggingCheckByUtcView());
            } else {
              Get.to(PendVerificationFormView(),
                arguments: [{"applicationId": userID},],
                preventDuplicates: true,
              );
            }
            return true;
          } else {
            // Get.back();
            Get.toNamed(Routes.FIELD_VERIFICATION_PENDING_LIST);
            getData = false;
            isLoading.value = false;
            return false;
          }
        } else {
          Get.snackbar(
            'Oops!!!',
            newverifyuser1.errorMessage,
            backgroundColor: Colors.pinkAccent,
            colorText: Colors.white,
          );
        }
      // if(newverifyuser1.data != null && newverifyuser1.data['geoTagging'].length > 0 && newverifyuser1.data['existingFloors'].length > 0)

    } break;
    case false : {
      // && ((!isVacant && floorsList.length > 0) || (isVacant && floorList.length == 0))
      if(!newverifyuser0.error )
      {
        getData = true;
        isLoading.value = false;
        if(atcVerified){
          Get.to(GeotaggingVerificationFormView());
        } else {
          Get.to(PendVerificationFormView(),
            arguments: [{"applicationId": userID },],
            preventDuplicates: true,
          );
        }
        return true;
      } else {
        Get.toNamed(Routes.FIELD_VERIFICATION_PENDING_LIST);
        getData = false;
        isLoading.value = false;
        return false;
      }
    }
    break;
    default: {
      getData = false;
      isLoading.value = false;
      return false;}
  }
    return true;
}


  //SUBMIT FORM - VERIFICATION
  Future<bool> tcVerificationForm() async {
    if (!VerificationFormkey.currentState!.validate()) {
      return false;
    }
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

    List<Map<String, dynamic>> floorDetailList = [];
    for (int i = 0; i < floorsList.length; i++) {
      String floorId = floorsList[i]['id'];
      Map<String, dynamic> floorDetails = {
        'floorId': floorId,
        'floorNo': floorCheckStatus.length > 0 && floorCheckStatus[i] == '1' ? floorNo[i].toString() ?? '' : floorsList[i]['floor_mstr_id'],
        'useType': usagetypeCheckStatus.length > 0 && usagetypeCheckStatus[i] == '1' ? useType[i].toString() ?? '' : floorsList[i]['usage_type_mstr_id'],
        'occupancyType':occupancytypeCheckStatus.length > 0 && occupancytypeCheckStatus[i] == '1' ? occupancyType[i].toString() ?? '' : floorsList[i]['occupancy_type_mstr_id'],
        'constructionType':constructiontypeCheckStatus.length > 0 && constructiontypeCheckStatus[i] == '1' ? constructionType[i].toString() ?? '' : floorsList[i][' const_type_mstr_id '],
        'buildupArea': builtupareaCheckStatus.length > 0 && builtupareaCheckStatus[i] == '1' ? builtUpAreaControllers[i].text.toString() : floorsList[i]['builtup_area'],
        'dateFrom': datefromCheckStatus.length > 0 && datefromCheckStatus[i] == '1' ? dateFromController[i].text.toString() : floorsList[i]['date_from'],
        'dateUpto': dateUptoCheckStatus.length > 0 && dateUptoCheckStatus[i] == '1' ? dateUptoController[i].text.toString() : floorsList[i]['date_upto'],
      };
      floorDetailList.add(floorDetails);
    }
    VerificationFormkey.currentState!.save();
    var result = await FieldVerificationPendingListProvider().VerificationForm(userID, {
      // 'zoneVerificationStatus': iszoneEnable.value,
      'newWardVerificationStatus': NewWardCheckStatus.value,
      'zoneVerificationStatus': zoneCheckStatus.value,
      'percentageVerificationStatus': percentageCheckStatus.value,
      'propertyVerificationStatus': propertyTypeCheckStatus.value,
      'areaofplotVerificationStatus': areaofplotCheckStatus.value,
      'CategoryVerificationStatus': categoryTypeCheckStatus.value,
      'hoardingboardVerificationStatus': hoardingboardCheckStatus.value,
      'mobileTowerVerificationStatus': mobiletowerCheckStatus.value,
      'petrolPumpVerificationStatus': petrolpumpCheckStatus.value,
      'waterHarvestingVerificationStatus': waterharvestingCheckStatus.value,
      'floorVerificationStatus': floorCheckStatus.value,
      'usageTypeVerificationStatus': usagetypeCheckStatus.value,
      'occupancyVerificationStatus': occupancytypeCheckStatus.value,
      'constructionVerificationStatus': constructiontypeCheckStatus.value,
      'buildUpVerificationStatus': builtupareaCheckStatus.value,
      'dateFromVerificationStatus': datefromCheckStatus.value,
      'zone': iszoneEnable.value == "true" ? zone.value.toString() : zonemstrid,
      'newWardNo': NewWardCheckStatus.value == "true" ? newWardNo.value.toString() : newardmstrid,
      'percentageOfProperty':percentageCheckStatus.value == 0 ? percentageofpropertytransfer : percentageofPropertyTransferController.text.toString(),
      'propertyType': propertyTypeCheckStatus.value == "true" ? propertyType.value.toString() : propertytypemstrid,
      'areaOfPlot': areaofplotCheckStatus.value == 0 ? areaofplot : areaOfPlotController.text.toString(),
      'category': categoryTypeCheckStatus.value == "true" ? categoryType.value.toString() : categoryTypemstrid,
      // 'roadWidth': categoryTypeCheckStatus.value == 0 ? roadwidth : roadWidthController.text.toString(),
      // 'roadWidth': roadtypeCheckStatus.value == "true" ? roadType.value.toString() : roadtypemstrid,
      'isHoardingBoard': hoardingBoard.value.toString() == 'true' ? 1 : 0,
      'tHoardingBoard': hoardingboardCheckStatus.value == 0 ? hoardingarea.toString() : tHoardingBoardController.text.toString(),
      'sHoardingBoard': hoardingboardCheckStatus.value == 0 ? hoardinginstallationdate.toString() : sHoardingBoardController.text.toString(),
      'isMobileTower': mobileTower.value.toString() == 'true' ? 1 : 0,
      'tMobileTower': mobiletowerCheckStatus.value == 0 ? towerarea.toString() : tMobileTowerController.text.toString(),
      'sMobileTower': mobiletowerCheckStatus.value == 0 ? towerinstallationdate.toString() : sMobileTowerController.text.toString(),
      'isPetrolPump': petrolPump.value.toString() == 'true' ? 1 : 0,
      'tPetrolPump': petrolpumpCheckStatus.value == 0 ? undergroundarea.toString() : tPetrolPumpController.text.toString(),
      'sPetrolPump': petrolpumpCheckStatus.value == 0 ? petrolpumpcompletiondate.toString() : sPetrolPumpController.text.toString(),
      'isWaterHarvesting': rainwaterHarvesting.value.toString() == 'true' ? 1 : 0,
      'waterharvestinginstallationdate': waterharvestingCheckStatus.value == 0 ? waterharvestinginstallationdate.toString() : sRainWaterHarvesting.text.toString(),
      'remark': remarkController.text.toString(),
      'newFloors': floorDataList, //add floor
      'oldFloors':floorDetailList, //citizen+tc || citizen+utc
      "isVacant" : propertyTypeCheckStatus.value == "true" ? (propertyType.value.toString() == '4' ? true : false) : (propertytypemstrid.toString() == '4' ? true : false),
    });
    if (result.error == true) {
      CommonUtils.showSnackBar('Could not Save', result.errorMessage, Colors.red);
      return false;
    } else {
      if(GetStorage().read('isTc')){
        CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
        Get.to(GeotaggingVerificationFormView());
        return true;
      }
      if(GetStorage().read('isUtc')){
        CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
        Get.to(GeoTaggingCheckByUtcView());
        return true;
      }
      return false;
      // Get.back();
      // CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
    }
  }



  void clearAll(){
    tcApplicationNo = "";
    tcApplicationType = "";
    tcApplicationdate = "";
    tcOwnerName = "";
    tcMobileNo = "";
    tcOldWard = "";
    tcNewWard = "";
    tcPropertyType = "";
    tcAreaOfPlot = "";
    tcRoadType = "";
    tcRoadWidth = "";
    tcHoardingBoard = "";
    tcHoardingBoardArea = "";
    tcHoardingBoardDate = "";
    tcMobileTower = "";
    tcMobileTowerArea = "";
    tcMobileTowerDate = "";
    tcPetrolPump = "";
    tcPetrolPumpArea = "";
    tcPetrolPumpDate = "";
    tcRainwaterHarv = "";
    tcFrontImage = "";
    tcFrontRelativeImage = "";
    tcFrontLat = "";
    tcFrontLong = "";
    tcRightImage = "";
    tcRightRelativeImage = "";
    tcRightLat = "";
    tcRightLong = "";
    tcLeftImage = "";
    tcLeftRelativeImage = "";
    tcLeftLat = "";
    tcLeftLong = "";
    tcFloorNew = "";
    tcUsageTypeNew = "";
    tcOccupancyTypeNew = "";
    tcConstructionTypeNew = "";
    tcBuiltupAreaNew = "";
    tcDateFromNew = "";
    tcDateUptoNew = "";
    tcFloor = "";
    tcUsageType = "";
    tcOccupancyType = "";
    tcConstructionType = "";
    tcBuiltupArea = "";
    tcDateFrom = "";
    tcDateUpto = "";
  }


  void resetValues() {
    zoneCheckStatus.value = "";
    NewWardCheckStatus.value = "";
    zoneCheckStatus.value = "";
    propertyTypeCheckStatus.value = "";
    percentageCheckStatus.value = "";
    areaofplotCheckStatus.value = "";
    categoryTypeCheckStatus.value = "";
    hoardingboardCheckStatus.value = "";
    mobiletowerCheckStatus.value = "";
    petrolpumpCheckStatus.value = "";
    waterharvestingCheckStatus.value = "";
    floorsList.value.clear();
    floorCheckStatus.value.clear();
    usagetypeCheckStatus.value.clear();
    occupancytypeCheckStatus.value.clear();
    constructiontypeCheckStatus.value.clear();
    builtupareaCheckStatus.value.clear();
    datefromCheckStatus.value.clear();
    dateUptoCheckStatus.value.clear();
    iszoneEnable.value = true;
    isNewWardEnable.value = true;
    iszoneEnable.value = true;
    ispropertyTypeEnable.value = true;
    ispercentageEnable.value = true;
    isareaofplotEnable.value = true;
    isCategoryEnable.value = true;
    ishoardingboardEnable.value = true;
    ismobiletowerEnable.value = true;
    ispetrolpumpEnable.value = true;
    iswaterharvestingEnable.value = true;
    isfloorEnable.value.clear();
    isusagetypeEnable.value.clear();
    isoccupancytypeEnable.value.clear();
    isconstructiontypeEnable.value.clear();
    isbuiltupareaEnable.value.clear();
    isdatefromEnable.value.clear();
    isdateUptoEnable.value.clear();
  }
}
