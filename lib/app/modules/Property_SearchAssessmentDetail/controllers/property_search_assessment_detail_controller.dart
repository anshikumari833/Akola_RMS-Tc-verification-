import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../property_assessment_detail_by_id_model.dart';
import '../property_search_assessment_detail_model.dart';
import '../providers/property_search_assessment_detail_provider.dart';

class SearchAssessmentDetailController extends GetxController {
  var searchDetailList = List<dynamic>.empty(growable: true).obs;
  var searchedDataById = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var filteredBy = "".obs;
  var searchBy = "".obs;
  late TextEditingController searchValueController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    searchValueController  = TextEditingController();
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
      getSearchData(currentPage.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
       getSearchData(currentPage.value);
    }
  }



  Future<void> getSearchData(page) async {
    // Clear the searchDetailList before performing a new search
    searchDetailList.clear();
    APIResponse response = await PropertySearchAssessmentProvider().searchDetail(page, perPage, {
      "filteredBy": filteredBy.value.toString(),
      "searchBy": searchBy.value.toString(),
      "value": searchValueController.text.toString(),
    });
    if (response != null) {
      dynamic responseData = response.data;
      if (responseData != null) {
        var data = responseData['data'];
        if (data != null) {
          if (filteredBy.value == 'saf') {
            searchDetailList.assignAll(
              (data as List<dynamic>)
                  .map((data) => SearchSafData.fromJson(data)).toList(),
            );
          } else if (filteredBy.value == 'gbsaf') {
            searchDetailList.assignAll(
              (data as List<dynamic>)
                  .map((data) => SearchGbSafData.fromJson(data)).toList(),
            );
          } else {
            searchDetailList.assignAll(
              (data as List<dynamic>)
                  .map((data) => SearchOtherData.fromJson(data)).toList(),
            );
          }
          if (page == 1) {
            currentPage.value = responseData["current_page"];
            totalPages.value = responseData["last_page"];
          }
        }
      }
    }
  }


//GET-ASSESSMENT-DETAIL-BY-ID
  searchAssessmentById(applicationId) async {
    await getSafDetail(applicationId);
  }
//GET-ASSESSMENT-DETAIL-BY-ID
  Future<bool> getSafDetail(applicationId) async {
    searchedDataById.clear();
    APIResponse response = await PropertySearchAssessmentProvider().StaticSafData(applicationId);
    if (response.error == false) {
      Map<String, dynamic> data = response.data;
      AssessmentDataById searchedData = AssessmentDataById.fromJson(data);
      // Fetch and populate floors
      List<AssessmentFloorsData> floorsData = [];
      for (var floorData in data['floors']) {
        floorsData.add(AssessmentFloorsData.fromJson(floorData));
      }
      searchedData.floors = floorsData;
      // Fetch and populate owners
      List<AssessmentOwnersData> ownersData = [];
      for (var ownerData in data['owners']) {
        ownersData.add(AssessmentOwnersData.fromJson(ownerData));
      }
      searchedData.owners = ownersData;
      searchedDataById.add(searchedData);
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



  List<Map<String, dynamic>> documents = [];

  searchDocumentById(applicationId) async {
    await getDocumentDetail(applicationId);
  }

  Future<bool> getDocumentDetail(applicationId) async {
    documents.clear();
    APIResponse response = await PropertySearchAssessmentProvider().UploadedDocData(applicationId);
    if (response.error == false ) {
      List<dynamic> responseData = response.data;
      for (var document in responseData) {
        Map<String, dynamic> documentData = {
          'id': document['id'],
          'document': document['document'],
          'doc_path': document['doc_path'],
          'remarks': document['remarks'],
          'verify_status': document['verify_status'],
          'doc_code': document['doc_code'],
          'owner_name': document['owner_name'],
        };
        documents.add(documentData);
      }
      return true;
    } else {
      Get.snackbar( 'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
      return false;
    }
  }

  List<Map<String, dynamic>> verifications = [];
 IndiVerificationsListById(applicationId) async {
    await getIndiVerificationsList(applicationId);
  }

  Future<bool> getIndiVerificationsList(applicationId) async {
    verifications.clear();
    APIResponse response = await PropertySearchAssessmentProvider().IndiVerificationsData(applicationId);
    if (response.error == false) {
      List<dynamic> responseData = response.data;
      for (var verification in responseData) {
        Map<String, dynamic> verificationData = {
          'id': verification['id'],
          'created_at': verification['created_at'],
          'agency_verification': verification['agency_verification'],
          'ulb_verification': verification['ulb_verification'],
          'verified_by': verification['veryfied_by'],
        };
        verifications.add(verificationData);
      }
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



  //DEMAND- DETAIL
  //data of tax calculation being stored
  var tax_pendingYears = "";
  var tax_payableAmount = "";
  var tax_rebateAmount = "";
  //data of fyearWiseTaxes and floorsTaxes are stored in the respective lists
  List<Map<String, dynamic>> tax_floorsTaxesList = [];
  List<Map<String, dynamic>> tax_fyearWiseTaxesList = [];
  List<Map<String, dynamic>> tax_grandTaxesList = [];
  List<Map<String, dynamic>> tax_BasicDetailList = [];

  Future<void> getDemandDetailById(applicationId) async {
    tax_fyearWiseTaxesList.clear();
    tax_floorsTaxesList.clear();
    APIResponse result = await PropertySearchAssessmentProvider().fetchDemandDetail(applicationId);
    if (result.error == false) {
      //  condition in response data status
      tax_pendingYears = result.data['demandPendingYrs'].toString();
      tax_payableAmount = result.data['payableAmt'].toString();
      tax_rebateAmount = result.data['rebateAmt'].toString();
      //Financial Tax
      // fyearWiseTaxesList  contains data from fyearWiseTaxes
      Map<String, dynamic> fyearWiseTaxes = result.data['fyearWiseTaxes'];
      fyearWiseTaxes.forEach((key, value) {
        tax_fyearWiseTaxesList.add(value);
      });
      //Floor Tax
      // floorsTaxesList contains data from floorsTaxes
      List<Map<String, dynamic>> floorsTaxes = List<Map<String, dynamic>>.from(result.data['floorsTaxes']);
      tax_floorsTaxesList.addAll(floorsTaxes);
      //Grand Total Tax
      // grandTaxesList  contains data from grandTaxes
      Map<String, dynamic> grandTaxes = result.data['grandTaxes'];
      tax_grandTaxesList.add(grandTaxes);

      Map<String, dynamic> BasicDetail = result.data['basicDetails'];
      tax_BasicDetailList.add(BasicDetail);
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
