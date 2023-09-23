import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../providers/water_consumer_search_provider.dart';

class WaterConsumerSearchController extends GetxController {
  var searchedconsumerData = List<dynamic>.empty(growable: true).obs;
  var searchedDataById = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var propertyId = "48306";


  //SEARCH-PROPERTY-DETAILS
  var filterByValue = "".obs;
  late TextEditingController searchByController;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    searchByController  = TextEditingController();
  }

  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var totalPages = 1.obs;
  var isPageLoading = false.obs;
  int page = 1;
  int perPage = 10;

  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getDetailBySearch();
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getDetailBySearch();
    }
  }

  // SEARCH-PROPERTY-DETAILS
  Future<void> getDetailBySearch() async {
    isPageLoading.value = true;
    searchedconsumerData.clear();
    APIResponse response = await WaterConsumerSearchProvider().searchConsumerDetail( {
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
      searchedconsumerData.addAll(data);
    }
    isPageLoading.value = false;
  }



  //Search Consumer Detail By Id
  searchConsumerById(int consumerId) async {
    await getPropertyDetail(consumerId);
  }


  //CONSUMER DETAIL
  Future<bool> getPropertyDetail(consumerId) async {
    APIResponse response = await WaterConsumerSearchProvider().SearchedComsumerData(consumerId);
    searchedDataById.clear();
    if (response.error == false) {
      Map<String, dynamic> data = response.data;
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

  void clearAllFields() {
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
