import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../providers/trade_surrender_provider.dart';

class TradeSurrenderController extends GetxController {
  var searchRenewalData = List<dynamic>.empty(growable: true).obs;
  var messageFromResponse = ''.obs;
  var isDataProcessing = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    licenceNoController  = TextEditingController();
  }


var applicationType = 2;
    late TextEditingController licenceNoController;

  // SEARCH-PROPERTY-DETAILS
  Future<void> getDetailBySearch() async {
    isDataProcessing.value = true;
    APIResponse response = await TradeSurrenderProvider().searchRenewalDetail({
      "applicationType": applicationType,
      "licenceNo": licenceNoController.text.toString(),
    });
    if (!response.error) {
      searchRenewalData.assignAll([response.data]);
      if (response.data['message'] != null) {
        messageFromResponse.value = response.data['message'];
      }
    } else {
      print('Error occurred: ${response.errorMessage}');
    }
    print('MESSAGE: ${response.data['message']}');
    print('DATA: ${searchRenewalData}');
    isDataProcessing.value = false;
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
