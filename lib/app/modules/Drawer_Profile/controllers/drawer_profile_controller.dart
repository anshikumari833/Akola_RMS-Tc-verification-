import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/drawer_profile_provider.dart';

class DrawerProfileController extends GetxController {
  //TODO: Implement DrawerProfileController

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
  }

  @override
  void onReady() {
    super.onReady();
  }


  Future<void> submit_UserDetailData() async {
    var result = await DrawerProfileProvider().UserDetailData({
      "name":userNameController.text.toString(),
      "moblieNo":mobileNoController.text.toString(),
      "email":emailController.text.toString(),
      "dateOfBirth":dobController.text.toString(),
      "gender":genderController.text.toString(),
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
  }

  Future<void> submit_UserPassword() async {
    var result = await DrawerProfileProvider().changeUserPassword({
      "password": oldPasswordController.text.toString(),
      "newPassword": newPasswordController.text.toString(),
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
