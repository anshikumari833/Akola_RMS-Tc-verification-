import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../../../common/api_response.dart';
import '../../home/views/home_view.dart';
import '../providers/municipal_rental_add_toll_provider.dart';

class MunicipalRentalAddTollController extends GetxController {
  var isPageLoading = false.obs;
  final GlobalKey<FormState> TollFormkey = GlobalKey<FormState>();
  RxList<Map<String, dynamic>> CircleList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> MarketListByCircle = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> RateList = <Map<String, dynamic>>[].obs;

  File? _selectedFile1 = null;
  File? _selectedFile2 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage2Path = ''.obs;
  var selectedImage1Size = ''.obs;
  var selectedImage2Size = ''.obs;
  final ImagePicker _picker = ImagePicker();

  var currentValue = "";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCircleDetail();
    getRateDetail();
    vendorNameController = TextEditingController();
    mobileNoController = TextEditingController();
    addressController = TextEditingController();
    longitudeController = TextEditingController();
    latitudeController = TextEditingController();
    remarkController = TextEditingController();
    landmarkController = TextEditingController();
    resetFormFields();
  }

  //CIRCLE LIST (--DROPDOWN LIST--)
  Future<void> getCircleDetail() async {
    isPageLoading.value = true;
    APIResponse response = await MunicipalRentalAddTollProvider().CircleListData();
    // condition for response error
    if ( response.error == false) {
      var ResponseList = response.data;
      for (var circleDetail in ResponseList) {
        var id = circleDetail['id'].toString();
        var circleName = circleDetail['circle_name'].toString();
        CircleList.add({
          'id': id,
          'circle_name': circleName,
        });
      }
      isPageLoading.value = false;
    } else {
      Get.snackbar(
        '😫😫',
        response.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      isPageLoading.value = false;
    }
  }
  var selectedCircleId;
  //MARKET LIST BY CIRCLE (--DROPDOWN LIST--)
  Future<void> getMarketDetail() async {
    isPageLoading.value = true;
    MarketListByCircle.clear();
    APIResponse response = await MunicipalRentalAddTollProvider().MarketListData(selectedCircleId);
    // condition for response error
    if ( response.error == false) {
      var ResponseList = response.data;
      for (var marketDetail in ResponseList) {
        var id = marketDetail['id'];
        var marketName = marketDetail['market_name'];
        MarketListByCircle.add({
          'id': id,
          'market_name': marketName,
        });
      }
      isPageLoading.value = false;
    } else {
      Get.snackbar(
        '😫😫',
        response.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      isPageLoading.value = false;
    }
  }

  //RATE LIST (--DROPDOWN LIST--)
  Future<void> getRateDetail() async {
    isPageLoading.value = true;
    APIResponse response = await MunicipalRentalAddTollProvider().RateListData();
    // condition for response error
    if ( response.error == false) {
      var ResponseList = response.data;
      for (var constructionDetail in ResponseList) {
        var id = constructionDetail['id'].toString();
        var rateDetail = constructionDetail['rate'].toString();
        RateList.add({
          'id': id,
          'rate': rateDetail,
        });
      }
      isPageLoading.value = false;
    } else {
      Get.snackbar(
        '😫😫',
        response.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      isPageLoading.value = false;
    }
  }



  var circle = "".obs;
  var market = "".obs;
  var vendorType = "".obs;
  var rate = "".obs;
  late TextEditingController vendorNameController;
  late TextEditingController mobileNoController;
  late TextEditingController addressController;
  late TextEditingController landmarkController;
  late TextEditingController longitudeController;
  late TextEditingController latitudeController;
  late TextEditingController remarkController;

  bool validateForm() {
    if (circle.value.isEmpty ||
        market.value.isEmpty ||
        rate.value.isEmpty ||
        vendorNameController.text.isEmpty ||
         mobileNoController.text.isEmpty ||
        landmarkController.text.isEmpty

    ) {
      Get.snackbar(
        'Validation Error',
        'Please fill the fields properly.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }



  //SUBMIT APPLICATION
  Future<void> TollsApplicationForm() async {
    isPageLoading.value = true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    String _img64Image1, _img64Image2;
    final bytes1 = await _selectedFile1!.readAsBytes();
    _img64Image1 = base64Encode(bytes1);
    final bytes01 = base64Decode(_img64Image1);;
    final directory = await getApplicationDocumentsDirectory();
    final file1 = await File('${directory.path}/image1.png').create();
    await file1.writeAsBytes(bytes01);
    var result = await MunicipalRentalAddTollProvider().SubmitTollApplication(
        {
          'circle':circle.value.toString(),
          'market': market.value.toString(),
          'vendorType': vendorType.value.toString(),
          'vendorName': vendorNameController.value.text.toString(),
          'MobileNo': mobileNoController.value.text,
          'Landmark': landmarkController.value.text,
          'rate': rate.value.toString(),
          // 'longitude': longitudeController.value.text,
          // 'latitude': latitudeController.value.text,
          'photograph1':file1,
        });
    Get.back();
    if (result.error == false) {
      // Close the loading dialog
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.success,
        title: 'Success',
        desc: 'Your form has been submitted successfully.',
        btnOkOnPress: () {
          resetFormFields();
         Get.to(HomeView());
        },
      )..show();
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.lightBlueAccent,
        colorText: Colors.white,
      );
      isPageLoading.value = false;
    }
    // isPageLoading.value = false;
    else {
      Get.back();
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        headerAnimationLoop: false,
        title: 'Error',
        desc: result.errorMessage,
        btnOkOnPress: () {
          Get.back();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
      Get.snackbar(
        '😫😫',
        result.errorMessage,
        backgroundColor: Colors.lightBlueAccent,
        colorText: Colors.white,
      );
      isPageLoading.value = false;
      // isPageLoading.value = false;
    }
  }



  void resetFormFields() {
    vendorNameController.clear();
    mobileNoController.clear();
    landmarkController.clear();
    // Reset the observables
    circle.value = "";
    market.value = "";
    vendorType.value = "";
    rate.value = "";
    _selectedFile1 = null;
    // Clear image paths and sizes if needed
    selectedImage1Path.value = "";
    selectedImage2Path.value = "";
    selectedImage1Size.value = "";
    selectedImage2Size.value = "";
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
