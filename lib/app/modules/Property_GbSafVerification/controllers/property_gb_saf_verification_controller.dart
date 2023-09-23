import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../providers/property_gb_saf_verification_provider.dart';

class PropertyGbSafVerificationController extends GetxController {
  var verifyUser = List<dynamic>.empty(growable: true).obs;
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getUserDetails(page);
  }


  //PAGINATION
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isPageLoading = false.obs;
  int page = 1;
  int perPage = 10;
  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getUserDetails(currentPage.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getUserDetails(currentPage.value);
    }
  }

  //INBOX
  Future<bool> getUserDetails(int page) async {
    isLoading.value = true;
    APIResponse verifyuserResponse = await GbSafVerificationProvider().getVerificationList(page, perPage);
    if (verifyuserResponse != null && verifyuserResponse.error == false) {
      var data = verifyuserResponse.data['data'];
      if (data != null && data.isNotEmpty) {
        List<Map<String, dynamic>> newVerifyUserList = []; // Create a new list to store the updated data
        for (var item in data) {
          Map<String, dynamic> userData = {
            'vId': item['id'] == null ? '' : item['id'].toString(),
            'vOwnerName': item['officer_name'] == null ? '' : item['officer_name'].toString(),
            'vwardNo': item['ward_no'] == null ? '' : item['ward_no'].toString(),
            'vSafno': item['saf_no'] == null ? '' : item['saf_no'].toString(),
            'vPropertyType': item['building_type'] == null ? '' : item['building_type'].toString(),
            'vAssessmentType': item['assessment'] == null ? '' : item['assessment'].toString(),
            'vApplyDate': item['apply_date'] == null ? '' : item['apply_date'].toString(),
            'vMobileNo': item['mobile_no'] == null ? '' : item['mobile_no'].toString(),
          };
          newVerifyUserList.add(userData);
        }
        // Update the pagination information if it's the first page
        if (page == 1) {
          currentPage.value = verifyuserResponse.data['current_page'];
          totalPages.value = verifyuserResponse.data['last_page'];
        }
        verifyUser.clear(); // Clear the previous data
        verifyUser.addAll(newVerifyUserList); // Add the new data to the list
      }
    }
    isLoading.value = false;
    return true;
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
