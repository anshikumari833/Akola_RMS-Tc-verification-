import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/drawer_profile_provider.dart';

class DrawerProfileController extends GetxController {
  var isLoading = false.obs;
  late TextEditingController userNameController;
  late TextEditingController mobileNoController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  late TextEditingController genderController;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    userNameController  = TextEditingController();
    mobileNoController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    submit_UserDetailData();
  }

  @override
  void onReady() {
    super.onReady();
  }
  var id = "".obs;
  var name= "".obs;
  var user_name= "".obs;
  var mobile= "".obs;
  var email= "".obs;
  var ulb_id= "".obs;
  var ulb_name= "".obs;
  Future<void> submit_UserDetailData() async {
    isLoading.value = true;
    var result = await DrawerProfileProvider().getUserDetails();
    if (result.error == false) {
      id.value = result.data['id'].toString();
      name.value = result.data['NAME'].toString();
      user_name.value = result.data['USER_NAME'].toString();
      mobile.value= result.data['mobile'].toString();
      email.value= result.data['email'].toString();
      ulb_id.value= result.data['ulb_id'].toString();
      ulb_name.value = result.data['ulb_name'].toString();
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.green,
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
    isLoading.value = false;
  }


  // Future<void> submit_UserDetailData() async {
  //   var result = await DrawerProfileProvider().UserDetailData({
  //     "name":userNameController.text.toString(),
  //     "moblieNo":mobileNoController.text.toString(),
  //     "email":emailController.text.toString(),
  //     "dateOfBirth":dobController.text.toString(),
  //     "gender":genderController.text.toString(),
  //   });
  //   if (result.error == false) {
  //     Get.snackbar(
  //       '😁😁',
  //       result.errorMessage,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );
  //   } else {
  //     Get.snackbar(
  //       'Oops!!!',
  //       result.errorMessage,
  //       backgroundColor: Colors.redAccent,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  Future<void> submit_UserPassword() async {
    isLoading.value = true;
    var result = await DrawerProfileProvider().changeUserPassword({
      "password": oldPasswordController.text.toString(),
      "newPassword": newPasswordController.text.toString(),
    });
    if (result.error == false) {
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Clear the text fields
      oldPasswordController.clear();
      newPasswordController.clear();
    } else {
      Get.snackbar(
        'Oops!!!',
        result.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      // Clear the text fields
      oldPasswordController.clear();
      newPasswordController.clear();
    }
    isLoading.value = true;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
