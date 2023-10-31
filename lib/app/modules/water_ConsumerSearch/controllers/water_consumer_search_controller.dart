import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../common/api_response.dart';
import '../providers/water_consumer_search_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../views/generate_demand_view.dart';
import '../views/water_ConsumerSearch(main)_view.dart';

class WaterConsumerSearchController extends GetxController {
  var searchedconsumerData = List<dynamic>.empty(growable: true).obs;
  var searchedConsumerDataById = List<dynamic>.empty(growable: true).obs;
  var generatedDemandList = List<dynamic>.empty(growable: true).obs;
  var PaymentHistoryById = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var propertyId = "48306";


  //SEARCH-PROPERTY-DETAILS
  var filterByValue = "".obs;
  late TextEditingController searchByController;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
   finalMeterReading = TextEditingController();
   demandDateUpto = TextEditingController();
    searchByController  = TextEditingController();
    bankNameController = TextEditingController();
    branchNameController = TextEditingController();
    chequeNoController = TextEditingController();
    chequeDateController = TextEditingController();
    remarksController = TextEditingController();

  }

  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var totalPages = 1.obs;
  var isPageLoading = false.obs;
  int page = 1;
  int perPage = 10;

  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getDetailBySearch();
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getDetailBySearch();
    }
  }
  //Search List***
  var consumer_Id = <String>[];
  Future<void> getDetailBySearch() async {
    isPageLoading.value = true;
    consumer_Id.clear();
    searchedconsumerData.clear();
    APIResponse response = await WaterConsumerSearchProvider().searchConsumerDetail( {
      "filteredBy": filterByValue.value.toString(),
      "parameter": searchByController.text.toString(),
    });
    if (response.error == false) {
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      if (page == 1) {
        currentPage.value = responseData["current_page"];
        totalPages.value = responseData["last_page"];
      }
      List<dynamic> data = List<dynamic>.from(responseData["data"]);
      for (var consumerId in data) {
        if (consumerId.containsKey("id")) {
          consumer_Id.add(consumerId["id"].toString());
        }
      }
      searchedconsumerData.addAll(data);
    }
    isPageLoading.value = false;
  }


  var consumer_id_pay = "";
  //Consumer Basic Details(BY ID)
  searchConsumerById(int consumerId) async {
    await getConsumerDetail(consumerId);
  }
  //Consumer Basic Details(BY ID)
  Future<bool> getConsumerDetail(consumerId) async {
    consumer_id_pay = "";
    APIResponse response = await WaterConsumerSearchProvider().SearchedComsumerData(consumerId);
    searchedConsumerDataById.clear();
    if (response.error == false) {
      Map<String, dynamic> idData = response.data;
       consumer_id_pay = idData['id'].toString();
      searchedConsumerDataById.add(idData);
      return true;
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
      return false;
    }
  }

  //Demand Detail(BY ID)
  var consumerDemands = <Map<String, dynamic>>[].obs;
  var meterDetails = <String, dynamic>{}.obs;
  var basicDetails = <String, dynamic>{}.obs;
  var totalSumDemand = "".obs;
  var totalPenalty = "".obs;
  Future<void> getConsumerDemandDetail(consumerId) async {
   isDataProcessing.value == true;
    consumerDemands.value.clear();
    meterDetails.value.clear();
    basicDetails.value.clear();
    totalSumDemand.value = '';
    totalPenalty.value = '';
    APIResponse response = await WaterConsumerSearchProvider().ConsumerListDemandDetails(consumerId);
    if (response.error == false) {
      Map<String, dynamic> DemandDetailData = response.data;
      consumerDemands.value = List<Map<String, dynamic>>.from(DemandDetailData['consumerDemands']);
      meterDetails.value = Map<String, dynamic>.from(DemandDetailData['meterDetails']);
      basicDetails.value = Map<String, dynamic>.from(DemandDetailData['meterDetails']['basicDetails']);
      totalSumDemand.value = DemandDetailData['totalSumDemand'].toString();
      totalPenalty.value = DemandDetailData['totalPenalty'].toString();
    } else {
      // Get.to(GenerateDemandView());
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
   isDataProcessing.value == false;
  }
  RxBool isLoading = false.obs;
var selectDateUpto = "".obs;
  var Calculation_totalPayAmount = "".obs;
  var Calculation_totalPenalty = "".obs;
  var Calculation_totalDemand = "".obs;
  var Calculation_totalAdvance = "".obs;
  var Calculation_totalRebate = "".obs;
  var Calculation_remaningAdvanceAmount = "".obs;

  //CALCULATE DEMAND
  Future<void> getCalculationDemandDetails() async {
    isLoading.value = true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    Calculation_totalPayAmount.value = "";
    Calculation_totalPenalty.value = "";
    Calculation_totalDemand.value = "";
    Calculation_totalAdvance.value = "";
    Calculation_totalRebate.value = "";
    Calculation_remaningAdvanceAmount.value = "";
    APIResponse response = await WaterConsumerSearchProvider().CalculateConsumerDeamnd(
      {
        "consumerId": consumer_id_pay.toString(),
        "demandUpto": selectDateUpto.value.toString(),
      }
    );
    if (response.error == false) {
      Map<String, dynamic> CalculatedDemandDetailData = response.data;
      Calculation_totalPayAmount.value = CalculatedDemandDetailData['totalPayAmount'].toString();
      Calculation_totalPenalty.value = CalculatedDemandDetailData['totalPenalty'].toString();
      Calculation_totalDemand.value = CalculatedDemandDetailData['totalDemand'].toString();
      Calculation_totalAdvance.value = CalculatedDemandDetailData['totalAdvance'].toString();
      Calculation_totalRebate.value = CalculatedDemandDetailData['totalRebate'].toString();
      Calculation_remaningAdvanceAmount.value = CalculatedDemandDetailData['remaningAdvanceAmount'].toString();
      isLoading.value = false;
      Get.back();
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }
  //PAYMENT
  var demand_PaymentMode = "".obs;
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController chequeNoController;
  late TextEditingController chequeDateController;
  late TextEditingController remarksController;


  Future<void>DemandPaymentDetail() async {
    isLoading.value = true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    APIResponse response = await WaterConsumerSearchProvider().ConsumerDemandPayment({
      'consumerId': consumer_id_pay.toString(),
      'demandUpto': selectDateUpto.value.toString(),
      'amount': Calculation_totalPayAmount.value,
      'paymentMode': demand_PaymentMode.value.toString(),
      'bankName': bankNameController.value.text,
      'branchName': branchNameController.value.text,
      'chequeNo': chequeNoController.value.text,
      'chequeDate': chequeDateController.value.text,
      'remarks': remarksController.value.text,
    });
    if (response.error == false) {
      // Map<String, dynamic> AfterPaymentData = response.data;
      isLoading.value = false;
      Get.back();
      Get.off(WaterConsumerSearchView());
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }


  //Payment History
  var consumerReceiptDetails = <Map<String, dynamic>>[].obs;
  Future<void> getPaymentHistoryDetail(consumerId) async {
    consumerReceiptDetails.value.clear();
    APIResponse response = await WaterConsumerSearchProvider().ComsumerPaymentHistory(consumerId);
    PaymentHistoryById.clear();
    if (response.error == false) {
      Map<String, dynamic> idData = response.data;
      consumerReceiptDetails.value = List<Map<String, dynamic>>.from(idData['Consumer']);
     // PaymentHistoryById.add(id_Data);
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
  }


  late TextEditingController finalMeterReading;
  late TextEditingController demandDateUpto;
  //***DEMAND DETAIL
  //GENERATE DEMAND
  Future<bool> generateDemand(consumerId,{String type = ''}) async {
    isDataProcessing.value == true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    var file1;
    if(type != 'Fixed') {
      String _img64Image1;
      final bytes1 = await _selectedFile1!.readAsBytes();
      _img64Image1 = base64Encode(bytes1);
      // Create temporary files to save base64 encoded image data
      // final tempDir = await getTemporaryDirectory();
      final bytes01 = base64Decode(_img64Image1);
      final directory = await getApplicationDocumentsDirectory();
      file1 = await File('${directory.path}/image1.png').create();
      await file1.writeAsBytes(bytes01);
    }
    APIResponse response = await WaterConsumerSearchProvider().GenerateConsumerDemand(consumerId ,{
      'finalRading':finalMeterReading.text.toString(),
      'demandUpto':demandDateUpto.text.toString(),
      'imagePath[0]': file1,
    });
    if (response.error == false) {
      var data = response.data;
      generatedDemandList.add(data);
      Get.back();
      return true;
    } else {
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
      isDataProcessing.value == false;
      return false;
    }
  }

  void clearPaymentFields() {
     bankNameController.clear();
     branchNameController.clear();
     chequeNoController.clear();
     chequeDateController.clear();
     remarksController.clear();
  }



  File? _selectedFile1 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage1Size = ''.obs;
  final ImagePicker _picker = ImagePicker();

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
