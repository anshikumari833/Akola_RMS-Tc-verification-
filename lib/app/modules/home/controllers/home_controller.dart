import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../common/api_response.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var currentDate = ''.obs;
  // Function to update the current date
  void updateDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd-MM-yyyy').format(now);
    currentDate.value = formattedDate;
  }


  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCollectionDetail();
    updateDate();
  }

  @override
  void onReady() {
    super.onReady();
    // getCollectionDetail();
  }

  var report_totalCount = "".obs;
  var report_totalCollection = "".obs;
  var report_tcName = "".obs;
  var report_tcMobileNo = "".obs;

  Future<void> getCollectionDetail() async {
    isLoading.value = true;
    report_totalCount.value = '';
    report_totalCollection.value = '';
    APIResponse response = await HomeProvider().getTcCollection();
    // condition for response error
    if ( response.error == false) {
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      report_totalCount.value = responseData['total_counter'].toString();
      report_totalCollection.value= responseData['total_collection'].toString();
      report_tcName.value = responseData['tcName'].toString();
      report_tcMobileNo.value = responseData['tcMobile'].toString();
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }


  void increment() => count.value++;
}
