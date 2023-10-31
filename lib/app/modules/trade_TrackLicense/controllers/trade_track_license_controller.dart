import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../providers/trade_track_license_provider.dart';

class TradeTrackLicenseController extends GetxController {
  var searchedLicenseData = List<dynamic>.empty(growable: true).obs;
  var applicantDataById = List<dynamic>.empty(growable: true).obs;
  var isPageLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    searchByController  = TextEditingController();
  }




  //Search Trade License List
  // ****START****
  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var totalPages = 1.obs;
  int page = 1;
  int perPage = 10;

  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getLicenseDetailBySearch();
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getLicenseDetailBySearch();
    }
  }

  var entity_Id = <String>[];
  var filterByValue = "".obs;
  late TextEditingController searchByController;

  Future<void> getLicenseDetailBySearch() async {
    isPageLoading.value = true;
    APIResponse response = await TradeTrackLicenseProvider().searchLicenseDetail( {
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
      for (var consumerId in data) {
        if (consumerId.containsKey("id")) {
          entity_Id.add(consumerId["id"].toString());
        }
      }
      searchedLicenseData.addAll(data);
    }
    isPageLoading.value = false;
  }
  // ****END****


  //Trade License Basic Details(BY ID)
  // ****START****
  Map<String, dynamic> basicLicenseDetails= {};
  var ownerDetailList = List<dynamic>.empty(growable: true).obs;
  var transactionDetails = List<dynamic>.empty(growable: true).obs;
  var paymentStatus = ''.obs;

  //APPLICANT DETAIL
  Future<bool> getapplicantDetail(applicationId) async {
    basicLicenseDetails.clear();
    ownerDetailList.clear();
    transactionDetails.clear();
    paymentStatus.value = '';
    APIResponse response = await TradeTrackLicenseProvider().SearchedApplicantData(applicationId);
    applicantDataById.clear();
    if (response.error == false) {
      Map<String, dynamic> applicantionData = response.data;
      basicLicenseDetails = Map<String, dynamic>.from(applicantionData['basicDetails']);
      ownerDetailList.value = List<Map<String, dynamic>>.from(applicantionData['ownerDtl']);
      transactionDetails.value = List<Map<String, dynamic>>.from(applicantionData['transactionDtl']);
      paymentStatus.value = applicantionData['pendingStatus'];
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
  // ****END****

  //
  // ****START****

  // ****END****

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
