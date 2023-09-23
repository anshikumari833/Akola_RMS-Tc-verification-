import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../property_missing_geotagging_model.dart';
import '../providers/property_missing_geotagging_provider_provider.dart';

class PropertyMissingGeotaggingController extends GetxController {
  final GlobalKey<FormState>MissingGeoFormkey = GlobalKey<FormState>();

  var listDetail = List<dynamic>.empty(growable: true).obs;
  var listDetailByUser = List<dynamic>.empty(growable: true);

  var isDataProcessing = false.obs;
  var verifyID = 290559 ;


  var dWardNo = "";
  var dAssessmentType = "";
  var dPropertyType = "";
  var dApplicantName = "";
  var dMobileNo = "";
  var dSafNo = "";
  var dHoldingNo = "";
  var dPropertyAddress = "";
  var dApplyDate = "";
  var dForwardDate = "";

  var applicationNo = "";
  var applicationType = "";
  var propertyType = "";
  var applyDate = "";
  var ownerName = "";
  var mobileNo = "";

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


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    missingGeoDetail(page);
  }


  // Future<bool> missingGeoDetail() async {
  //   listDetail.value = await PropertyMissingGeotaggingProvider().getMissingGeoTaggingList();
  //   if (listDetail != null) {
  //     // dWardNo = listDetail[0]['wardNo'].toString();
  //     // dAssessmentType = listDetail[0]['assessment'].toString();
  //     // dPropertyType = listDetail[0]['property_type'].toString();
  //     // dApplicantName = listDetail[0]['owner_name'].toString();
  //     // dSafNo = listDetail[0]['saf_no'].toString();
  //     // dPropertyAddress = listDetail[0]['appartment_name'].toString();
  //     // dApplyDate = listDetail[0]['apply_date'].toString();
  //     // dForwardDate = listDetail[0]['apply_date'].toString();
  //   }
  //   return true;
  // }

  var missingListData = <MissingGeoTaggingList>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isLoading = false.obs;
  int page = 1;
  int perPage = 10;
  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      missingGeoDetail(currentPage.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      missingGeoDetail(currentPage.value);
    }
  }


  //INBOX
  Future<bool> missingGeoDetail(int page) async {
    try {
      isLoading.value = true; // Set the loading state to true before making the API request
      APIResponse response = await PropertyMissingGeotaggingProvider().getMissingGeoTaggingList(page, perPage);
      if (!response.error) {
        List<dynamic> responseData = response.data['data'];
        List<MissingGeoTaggingList> data = responseData.map((item) => MissingGeoTaggingList.fromJson(item)).toList();
        missingListData.assignAll(data);
        if (page == 1) {
          currentPage = response.data['current_page'];
          totalPages = response.data['last_page'];
        }
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    } finally {
      isLoading.value = false;
    }
  }


  filterbyUserIdData( int askverifyID) async{
    verifyID = askverifyID;
    await GeoTaggingFormById();
  }



  Future<bool> GeoTaggingFormById() async{
    try{
      var listDetailByUser = await PropertyMissingGeotaggingProvider().GeoTaggingForm(verifyID);
      if (listDetailByUser != null){
         applicationNo = listDetailByUser.data['saf_no'].toString();
         applicationType = listDetailByUser.data['assessment'].toString();
         propertyType = listDetailByUser.data['property_type'].toString();
         applyDate = listDetailByUser.data['application_date'].toString();
         ownerName = listDetailByUser.data['applicant_name'].toString();
      }
      if(listDetailByUser.error == true){
        CommonUtils.showSnackBar('Error',listDetailByUser.errorMessage, Colors.red);
        return false;
      }
      isDataProcessing(false);
      return true;
    } catch (exception) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
      return false;
    }
  }

  Future<bool> MissinggeotaggingForm() async {
    String _img64Image1, _img64Image2, _img64Image3;
    final bytes1 = await _selectedFile1!.readAsBytes();
    final bytes2 = await _selectedFile2!.readAsBytes();
    final bytes3 = await _selectedFile3!.readAsBytes();
    _img64Image1 = base64Encode(bytes1);
    _img64Image2 = base64Encode(bytes2);
    _img64Image3 = base64Encode(bytes3);
    try {
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
      final result =
      await PropertyMissingGeotaggingProvider().MissingGeoTaggingForm(verifyID, {
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
      if (result.error == true) {
        CommonUtils.showSnackBar('Error', result.errorMessage, Colors.red);
        return false;
      }
      isDataProcessing(false);
      return true;
    } catch (exception) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
      return false;
    }
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  void increment() => count.value++;
}
