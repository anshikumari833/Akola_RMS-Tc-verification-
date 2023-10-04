import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../home/views/home_view.dart';
import '../providers/login_screen_provider.dart';

class LoginScreenController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool incorrectPasswordError = RxBool(false);
  RxBool invalidEmailError = RxBool(false);
  RxBool isPasswordVisible = RxBool(false);
  var isLoading = false.obs;


  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<bool> login() async {
    isLoading.value = true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    invalidEmailError.value = email.isEmpty || !GetUtils.isEmail(email);
    incorrectPasswordError.value = password.isEmpty || password.length < 6;

    if (invalidEmailError.value || incorrectPasswordError.value) {
      isLoading.value = false;
      return false;
    }

    if (emailController.value.text.length == 0) {
      print('Invalid Email');
      invalidEmailError.value = true;
      return false;
    }
    if (!GetUtils.isEmail(emailController.value.text)) {
      print('Invalid Email !!!');
      invalidEmailError.value = true;
      return false;
    }
    if (passwordController.value.text.length < 6) {
      print('Invalid Password');
      incorrectPasswordError.value = true;
      return false;
    }
       // await Future.delayed(Duration(seconds: 5));
       //Api Hit for login
    var result = await LoginScreenProvider().userLogin(
        {
          'email': emailController.value.text,
          'password': passwordController.value.text,
          'type': 'mobile',
        });
    //RESPONSE
    // Handling response
    if (result.error == true) {
      print('Unsuccessful! PLEASE TRY AGAIN');
      GetSnackBar(
        dismissDirection: DismissDirection.horizontal,
        title: 'Could not Login',
        message: result.errorMessage,
        snackPosition: SnackPosition.TOP,
         margin: EdgeInsets.all(5),
        backgroundColor: Color(0xFFf44336),
        borderRadius: 80,
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        duration: Duration(seconds: 19),
        isDismissible: true,
      ).show();
      isLoading.value = false;
      return false;
    } else {
      // Temporary variable storing
      var token = result.data['token'];
      var userName = result.data['userDetails']['name'];
      var description = result.data['userDetails']['description'];
      final isTc = (result.data['userDetails']['role']).isNotEmpty && (result.data['userDetails']['role']).any((role) => role.toLowerCase() == 'tax collector');
      final isUtc = (result.data['userDetails']['role']).isNotEmpty && (result.data['userDetails']['role']).any((role) => role.toLowerCase() == 'seniour lipik');
      final isJe = (result.data['userDetails']['role']).isNotEmpty && (result.data['userDetails']['role']).any((role) => role.toLowerCase() == 'junior engineer');
      final isTd = (result.data['userDetails']['role']).isNotEmpty && (result.data['userDetails']['role']).any((role) => role.toLowerCase() == 'tax daroga');
      // Storing data to local storage
      GetStorage().write('key', token);
      GetStorage().write('isTc', isTc);
      GetStorage().write('isUtc', isUtc);
      GetStorage().write('userName', userName);
      GetStorage().write('description', description);
      GetStorage().write('isJe', isJe);
      GetStorage().write('isTd', isTd);
      isLoading.value = false;
      // Redirecting to Home screen
      Get.offAll(() => HomeView());
      GetStorage().remove('assessmentType');
      // Pop Up message for login success
      print('Successfully logged in');
      GetSnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.all(5),
        title: 'Success',
        message: 'Logged in successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xFF388e3c),
        borderRadius: 80,
        icon: Icon(
          Icons.done,
          color: Colors.white,
        ),
        duration: Duration(seconds: 5),
        isDismissible: true,
      ).show();
      return true;
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

