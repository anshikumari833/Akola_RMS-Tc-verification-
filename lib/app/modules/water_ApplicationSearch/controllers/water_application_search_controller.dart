import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../providers/water_application_search_provider.dart';

class WaterApplicationSearchController extends GetxController {
  var searchedApplicationData = List<dynamic>.empty(growable: true).obs;
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
    APIResponse response = await WaterApplicationSearchProvider().searchApplicationDetail( {
      "filteredBy": filterByValue.value.toString(),
      "parameter": searchByController.text.toString(),
    });
    if (response != null) {
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      if (page == 1) {
        currentPage.value = responseData["current_page"];
        totalPages.value = responseData["last_page"];
        searchedApplicationData.clear();
      }
      List<dynamic> data = List<dynamic>.from(responseData["data"]);
      searchedApplicationData.addAll(data);
    }
    isPageLoading.value = false;
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
