import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../common/api_response.dart';
import '../providers/water_consumer_search_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class WaterConsumerSearchController extends GetxController {
  var searchedconsumerData = List<dynamic>.empty(growable: true).obs;
  var searchedConsumerDataById = List<dynamic>.empty(growable: true).obs;
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
    searchByController  = TextEditingController();
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
      // Iterate through the data and collect all the id values
      for (var consumerId in data) {
        if (consumerId.containsKey("id")) {
          consumer_Id.add(consumerId["id"].toString());
        }
      }
      searchedconsumerData.addAll(data);
    }
    isPageLoading.value = false;
  }



  //Consumer Basic Details(BY ID)
  searchConsumerById(int consumerId) async {
    await getConsumerDetail(consumerId);
  }
  //Consumer Basic Details(BY ID)
  Future<bool> getConsumerDetail(consumerId) async {
    APIResponse response = await WaterConsumerSearchProvider().SearchedComsumerData(consumerId);
    searchedConsumerDataById.clear();
    if (response.error == false) {
      Map<String, dynamic> id_Data = response.data;
      searchedConsumerDataById.add(id_Data);
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
  var totalSumDemand;
  var totalPenalty;
  Future<void> getConsumerDemandDetail(consumerId) async {
    APIResponse response = await WaterConsumerSearchProvider().ComsumerListDemandDetails(consumerId);
    consumerDemands.clear();
    meterDetails.clear();
    totalSumDemand = '';
    totalPenalty = '';
    if (response.error == false) {
      Map<String, dynamic> DemandDetailData = response.data;
      consumerDemands.value = List<Map<String, dynamic>>.from(DemandDetailData['consumerDemands']);
      meterDetails.value = Map<String, dynamic>.from(DemandDetailData['meterDetails']);
      totalSumDemand = DemandDetailData['totalSumDemand'].toString();
      totalPenalty = DemandDetailData['totalPenalty'].toString();
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
  }


  //Payment History
  var consumerReceiptDetails = <Map<String, dynamic>>[].obs;
  Future<void> getPaymentHistoryDetail(consumerId) async {
    consumerReceiptDetails.value.clear();
    APIResponse response = await WaterConsumerSearchProvider().ComsumerPaymentHistory(consumerId);
    PaymentHistoryById.clear();
    if (response.error == false) {
      Map<String, dynamic> id_Data = response.data;
      consumerReceiptDetails.value = List<Map<String, dynamic>>.from(id_Data['Consumer']);
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

  void clearAllFields() {
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
