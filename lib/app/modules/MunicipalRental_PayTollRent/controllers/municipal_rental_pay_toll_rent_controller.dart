import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../providers/municipal_rental_pay_toll_rent_provider.dart';

class MunicipalRentalPayTollRentController extends GetxController {
  var searchedTollData = List<dynamic>.empty(growable: true).obs;
  var searchedTollDataBy_Id = List<dynamic>.empty(growable: true).obs;

  //SEARCH-PROPERTY-DETAILS
  var searchByValue = "".obs;
  late TextEditingController parameterByController;
  var isPageLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    parameterByController  = TextEditingController();
    dateFromController = TextEditingController();
    dateUptoController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }


  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var totalPages = 1.obs;
  int page = 1;
  int perPage = 10;

  void nextPage() {
    isPageLoading.value = true;
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getTollDetaiBySearch(); // Pass the updated currentPage.value
    }
  }

  void previousPage() {
    isPageLoading.value = true;
    if (currentPage.value > 1) {
      currentPage.value--;
      getTollDetaiBySearch();
    }
  }
  Future<void> getTollDetaiBySearch() async {
    isPageLoading.value = true;
    APIResponse response = await MunicipalRentalPayTollRentProvider().searchTollDetail({
      "searchBy": searchByValue.value.toString(),
      "value": parameterByController.text.toString(),
    });
    // condition for response error
    if ( response.error == false) {
      //  condition in response data status
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      if (page == 1) {
        currentPage.value = responseData["current_page"];
        totalPages.value = responseData["last_page"];
        searchedTollData.clear();
      }
      List<dynamic> data = List<dynamic>.from(response.data['data']);
      searchedTollData.addAll(data);

    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isPageLoading.value = false;
  }



  //Toll DETAIL by id
  searchTollById(int tollId) async {
    await getTollDetail(tollId);
  }
var toll_Id = "";
  //Toll DETAIL by id
  Future<bool> getTollDetail(tollId) async {
    APIResponse response = await MunicipalRentalPayTollRentProvider().SearchedTollDataById(tollId);
    if (response.error == false) {
    Map<String, dynamic> data = response.data;
    toll_Id = data['id'].toString();
    searchedTollDataBy_Id.assignAll([data]);
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
  late TextEditingController dateFromController;
  late TextEditingController dateUptoController;
  var payableAmount = "".obs;
  // PAYMENT CALCULATION DETAILS
  Future<bool> CalculatePaymentDetail() async {
    APIResponse response = await MunicipalRentalPayTollRentProvider().PaymentCalculationDetails({
      'tollId': toll_Id.toString(),
      'dateUpto': dateUptoController.value.text.toString(),
      'dateFrom': dateFromController.value.text.toString(),
    });
    if (response.error == false) {
      Map<String, dynamic> data = response.data;
      payableAmount.value = data['tollAmount'].toString();
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

  var toll_PaymentMode = "".obs;
  // PAYMENT CALCULATION DETAILS
  Future<bool> TollPayment_id() async {
    APIResponse response = await MunicipalRentalPayTollRentProvider().payTollTax({
      'tollId': toll_Id.toString(),
      'dateUpto': dateUptoController.value.text.toString(),
      'dateFrom': dateFromController.value.text.toString(),
      'paymentMode': toll_PaymentMode.value.toString(),
    });
    if (response.error == false) {
      Map<String, dynamic> data = response.data;
      payableAmount.value = data['tollAmount'].toString();
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


  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
