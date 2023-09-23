import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../property_water_harvesting_model.dart';
import '../providers/property_water_harvestingfieldverify_provider.dart';

class PropertyWaterHarvestingFieldVerifyController extends GetxController {
  final GlobalKey<FormState>waterHarvestingFormKey = GlobalKey<FormState>();

 var applicantdata = List<dynamic>.empty(growable: true).obs;
 var userDataByverifyID = List<dynamic>.empty(growable: true);
 var userDataFiltered = List<dynamic>.empty(growable: true);
 var isDataProcessing = false.obs;

 var action = 'forward'.toString();
 var verifyID = 208;
 var statusID = 1;


 File? _selectedFile1 = null;
 var selectedImage1Path = ''.obs;
 var selectedImage1Size = ''.obs;
  late TextEditingController rwhLongitudeController = TextEditingController();
  late TextEditingController rwhLatitudeController = TextEditingController();

 final ImagePicker _picker = ImagePicker();



 //WATER HARVESTING INBOX...........!!!
  var wardNo = "";
  var propertyType = "";
  var applicationNo= "";
  var applicantName = "";
  var holdingNo = "";
  var date = "";
 //WATER HARVESTING FORM...........!!!
 var mapplicationNo = "";
 var mharvestingBefore2017 = "";
 var mholdingNo= "";
 var mnewHoldingNo = "";
 var mguardianName = "";
 var mapplicantName = "";
 var mwardNo = "";
 var mpropertyAddress = "";
 var mmobileNo = "";
 var mdateOfCompletion = "";
 var mharvestingImage = "";
  var verificationstatus = "".obs;
// WORKFLOW ACTION ..........!!!
  TextEditingController commentController = TextEditingController();



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    waterHarvestingDetail(page);
    // clearForm();
  }

 //WATER HARVESTING INBOX...........!!!
 //  Future<bool> waterHarvestingDetail() async {
 //    APIResponse data = await PropertyWaterHarvestingProvider().WaterHarvesting(page,perPage);
 //    if (data != null && data.isNotEmpty) {
 //      applicantdata.assignAll(data);
 //    }
 //    return true;
 //  }
  var applicantData = <WaterHarvestingData>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isLoading = false.obs;
  int page = 1;
  int perPage = 10;
  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      waterHarvestingDetail(currentPage.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      waterHarvestingDetail(currentPage.value);
    }
  }

  String selectedFilterOption = ""; // Variable to store the selected filter option from the dropdown
  String searchQuery = ""; // Variable to store the search query from the text input

  Future<bool> waterHarvestingDetail(int page, {bool performSearch = false}) async {
    try {
      isLoading.value = true;
      APIResponse response = await PropertyWaterHarvestingProvider().WaterHarvesting(page, perPage);
      if (!response.error) {
        List<dynamic> responseData = response.data['data'];
        List<WaterHarvestingData> data = responseData.map((item) => WaterHarvestingData.fromJson(item)).toList();

        if (performSearch && (selectedFilterOption.isNotEmpty || searchQuery.isNotEmpty)) {
          // Filter the data based on the selected filter option and search query
          List<WaterHarvestingData> filteredData = data.where((item) {
            if (selectedFilterOption == "applicationNo") {
              return item.applicationNo?.contains(searchQuery) ?? false;
            } else if (selectedFilterOption == "applicantName") {
              return item.applicantName?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false;
            } else if (selectedFilterOption == "holdingNo") {
              return item.holdingNo?.contains(searchQuery) ?? false;
            } else {
              // If no filter option selected, include the item in the list
              return true;
            }
          }).toList();
          applicantData.clear();
          applicantData.assignAll(filteredData); // Update the observable list with the filtered data
        } else {
          applicantData.assignAll(data); // Update the observable list with the fetched data
        }

        if (page == 1) {
          currentPage = response.data['current_page'];
          totalPages = response.data['last_page'];
        }
        return true;
      } else {
        // Handle the API error if needed
        return false;
      }
    } catch (error) {
      // Handle any other errors that occurred during the fetch
      return false;
    } finally {
      isLoading.value = false; // Set the loading state to false after completing the API request
    }
  }


  // Future<bool> waterHarvestingDetail(int page) async {
  //   try {
  //     isLoading.value = true;
  //     APIResponse response = await PropertyWaterHarvestingProvider().WaterHarvesting(page, perPage);
  //     if (!response.error) {
  //       List<dynamic> responseData = response.data['data'];
  //       List<WaterHarvestingData> data = responseData.map((item) => WaterHarvestingData.fromJson(item)).toList();
  //       applicantData.assignAll(data); // Update the observable list with the fetched data
  //       if (page == 1) {
  //         currentPage = response.data['current_page'];
  //         totalPages = response.data['last_page'];
  //       }
  //       return true;
  //     } else {
  //       // Handle the API error if needed
  //       return false;
  //     }
  //   } catch (error) {
  //     // Handle any other errors that occurred during the fetch
  //     return false;
  //   }
  //   finally {
  //     isLoading.value = false; // Set the loading state to false after completing the API request
  //   }
  // }


 //WATER HARVESTING FORM...........!!!
 filterbyUserData(askverifyID) async{
    verifyID = askverifyID;
    await verifyWaterHarvestingForm();
 }

 Future<bool> verifyWaterHarvestingForm() async{
    try{
   var userDataFiltered = await PropertyWaterHarvestingProvider().WaterHarvestingForm(verifyID);
   if (userDataFiltered != null){
      mapplicationNo =userDataFiltered.data['applicationNo'].toString();
      mharvestingBefore2017 = userDataFiltered.data['harvestingBefore2017'].toString();
      mholdingNo= userDataFiltered.data['holdingNo'].toString();
      mnewHoldingNo = userDataFiltered.data['newHoldingNo'].toString();
      mguardianName = userDataFiltered.data['guardianName'].toString();
      mapplicantName = userDataFiltered.data['applicantName'].toString();
      mwardNo = userDataFiltered.data['wardNo'].toString();
      mpropertyAddress = userDataFiltered.data['propertyAddress'].toString();
      mmobileNo = userDataFiltered.data['mobileNo'].toString();
      mdateOfCompletion =userDataFiltered.data['dateOfCompletion'].toString();
      mharvestingImage = userDataFiltered.data['harvestingImage'].toString();
   }
   if(userDataFiltered.error == true){
     CommonUtils.showSnackBar('Error',userDataFiltered.errorMessage, Colors.red);
     return false;
   }
   // isDataProcessing(false);
   return true;
 } catch (exception) {
 // isDataProcessing(false);
 CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
 return false;
 }
}
  void clearForm() {
    _selectedFile1 = null;
    verificationstatus.value = '';
    selectedImage1Path.value = '';
    selectedImage1Size.value = '';
  }

// SUBMISSION FORM...........!!!
  Future<bool> submitForm() async{
    String _img64Image1;
    final bytes1 = _selectedFile1!.readAsBytesSync();
    _img64Image1 = base64Encode(bytes1);
try{
  // Decode the base64 string to bytes
  final bytes = base64Decode(_img64Image1);
  // Get a reference to the app's local directory
  final directory = await getApplicationDocumentsDirectory();
  // Create a new file in the directory
  final file = File('${directory.path}/image.png');
  // Write the bytes to the file
  await file.writeAsBytes(bytes);

  var result =  await PropertyWaterHarvestingProvider().WaterHarvestingSubmission(verifyID, statusID,{
    'harvestingImage': file,
    'verificationstatus': verificationstatus.value,
    'longitude':rwhLongitudeController.value.text,
    'latitude': rwhLatitudeController.value.text,
      });
    if(result.error == true){
      CommonUtils.showSnackBar('Error',result.errorMessage, Colors.red);
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
// WORKFLOW ACTION ..........!!!
  void ForwardHarvestingForm(BuildContext context) async {
    commentController = TextEditingController();
    bool isSuccess = await submitForm();
    if (isSuccess) {
      await showDialog(
        context: context,
          barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text('Workflow Action'),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Comment...',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                var result = await PropertyWaterHarvestingProvider()
                    .WaterHarvestingWorkflowAction(verifyID, action, {
                  'comment': commentController?.value.text ?? '',
                });
                if (result.error == true) {
                  CommonUtils.showSnackBar(
                    'Something went wrong',
                    result.errorMessage,
                    Colors.red,
                  );
                } else {
                  commentController.clear();
                  // Clear form data
                  _selectedFile1 = null;
                  selectedImage1Path.value = "";
                  selectedImage1Size.value = "";
                  verificationstatus.value = "";
                  Get.back();
                  Get.back();
                  CommonUtils.showSnackBar(
                    'Success',
                    'Form submitted successfully',
                    Colors.blue,
                  );
               fetchAndDisplayData();
                }
              },
              child: Text('Forward'),
            ),
          ],
        ),
      );
    } else {
      CommonUtils.showSnackBar(
        'Error',
        'Please try again.',
        Colors.red,
      );
    }
  }

  void fetchAndDisplayData() {
    waterHarvestingDetail(page);
  }



//Image
  Widget getImageWidget(File? selectedFile) {
   if (selectedFile != null) {
     return Image.file(
       selectedFile,
       width: 250,
       height: 250,
       fit: BoxFit.cover,
     );
   } else {
     return Image.asset(
       "assets/images/placeholder.jpg",
       width: 250,
       height: 250,
       fit: BoxFit.cover,
     );
   }
 }
 void getImage(ImageSource source) async {
   // _inProcess = true;
   final XFile? image = await _picker.pickImage(
     source: source,
     maxWidth: 850,
     maxHeight: 850,
     imageQuality: 1,
   );
   if (image != null) {
     CroppedFile? cropped = await ImageCropper().cropImage(
         sourcePath: image.path,
         aspectRatio: CropAspectRatio(
             ratioX: 1, ratioY: 1),
         compressQuality: 100,
         maxWidth: 900,
         maxHeight: 900,
         compressFormat: ImageCompressFormat.jpg,
         uiSettings: [AndroidUiSettings(
         toolbarTitle: 'Cropper',
         toolbarColor: Colors.deepOrange,
         toolbarWidgetColor: Colors.white,
         initAspectRatio: CropAspectRatioPreset.original,
         lockAspectRatio: false),
         IOSUiSettings(
     title: 'Cropper',
     ),
         ],
     );if (cropped != null) {
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
   if(pickedFile != null){
     CroppedFile ? cropped = await ImageCropper().cropImage(
         sourcePath: pickedFile.path,
         aspectRatio: CropAspectRatio(
             ratioX: 1, ratioY: 1),
         compressQuality: 100,
         maxWidth: 900,
         maxHeight: 900,
         compressFormat: ImageCompressFormat.jpg,
         uiSettings:[ AndroidUiSettings(
         toolbarTitle: 'Cropper',
         toolbarColor: Colors.deepOrange,
         toolbarWidgetColor: Colors.white,
         initAspectRatio: CropAspectRatioPreset.original,
         lockAspectRatio: false),
         IOSUiSettings(
     title: 'Cropper',
     ),],
     );
     if(cropped == null) {
       _selectedFile1 = null;
       selectedImage1Path.value = '';
       selectedImage1Size.value = '';
     } else {
       selectedImage1Path.value = cropped.path;
       _selectedFile1 = File(selectedImage1Path.value);
       selectedImage1Size.value = (File(selectedImage1Path.value).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb";
     }
   } else {
     Get.snackbar('Error',
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
