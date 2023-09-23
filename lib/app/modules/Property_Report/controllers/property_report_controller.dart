import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../providers/property_report_provider.dart';

class PropertyReportController extends GetxController with GetSingleTickerProviderStateMixin  {
  var reportList = List<dynamic>.empty(growable: true);
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  var isContainerVisible = false.obs;
  var isDataProcessing = false.obs;
  var selectedItems = <String>[].obs;
  var collectionType =[''].obs;
  var wardNo = ''.obs;
  var paymentMode =''.obs;
  late TextEditingController dateFromController;
  late TextEditingController dateUptoController;


  List<Map<String, dynamic>> wardList = [];
  List<Map<String, dynamic>> ownershipList = [];
  List<Map<String, dynamic>> propertyList = [];
  List<Map<String, dynamic>> floorList = [];
  List<Map<String, dynamic>> usageList = [];
  List<Map<String, dynamic>> occuppancyList = [];
  List<Map<String, dynamic>> constructionList = [];
  List<Map<String, dynamic>> transferList = [];
  List<Map<String, dynamic>> roadList = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getWardDetail();
    dateFromController = TextEditingController();
    dateUptoController = TextEditingController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:2000),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      animationController.forward();
      isContainerVisible.value = true;
    });
  }



  void getWardDetail() {
    isDataProcessing(true);
    PropertyReportProvider().getWardData().then((resp) {
      if (resp != null) {
        for (int j = 0; j < resp.length; j++) {
          for (int i = 0; i < resp[j].length; i++) {
            switch (j) {
              case 0:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["ward_name"] = resp[j][i]["ward_name"].toString();
                  wardList.add(wardMap);
                }
                break;
              case 1:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["ownership_type"] = resp[j][i]["ownership_type"];
                  ownershipList.add(wardMap);
                }
                break;
              case 2:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["property_type"] =
                      resp[j][i]["property_type"].toString();
                  propertyList.add(wardMap);
                }
                break;
              case 3:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["floor_name"] = resp[j][i]["floor_name"].toString();
                  floorList.add(wardMap);
                }
                break;
              case 4:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["usage_type"] = resp[j][i]["usage_type"].toString();
                  usageList.add(wardMap);
                }
                break;
              case 5:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["occupancy_type"] =
                      resp[j][i]["occupancy_type"].toString();
                  occuppancyList.add(wardMap);
                }
                break;
              case 6:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["construction_type"] =
                      resp[j][i]["construction_type"].toString();
                  constructionList.add(wardMap);
                }
                break;
              case 7:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["transfer_mode"] =
                      resp[j][i]["transfer_mode"].toString();
                  transferList.add(wardMap);
                }
                break;
              case 8:
                {
                  Map<String, dynamic> wardMap = Map<String, dynamic>();
                  wardMap["id"] = resp[j][i]["id"].toString();
                  wardMap["road_type"] = resp[j][i]["road_type"].toString();
                  roadList.add(wardMap);
                }
                break;

              default:
                {
                  break;
                }
            }
          }
        }
      }
      isDataProcessing(false);
    }, onError: (err) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
    });
  }

  //SEARCH-PROPERTY-DETAILS
  // Future<void> getReportDetail() async {
  //   APIResponse response = await PropertyReportProvider().searchReportDetail({
  //     "collectionType": collectionType.value,
  //     "fromDate": dateFromController.text.toString(),
  //     "uptoDate": dateUptoController.text.toString(),
  //     "wardNo": wardNo.value.toString(),
  //     "paymentMode": paymentMode.value.toString(),
  //   });
  //   if (response != null) {
  //     reportList.add(response); // Add the response to the reportList
  //     print(response);
  //   }
  // }

  var rwardNo = '';
  var id = '';
  var type= '';
  var safNo= '';
  var assessmentType= '';
  var newHoldingNo= '';
  var tranId= '';
  var holdingNo= '';
  var ownerName= '';
  var mobileNo= '';
  var fromUptoFyQtr= '';
  var tranDate= '';
  var transactionMode= '';
  var amount= '';
  var empName= '';
  var userId= '';
  var tranNo= '';
  var chequeNo= '';
  var bankName= '';
  var branchName= '';


  //PAGINATION
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var totalAmount = '';
  var isLoading = false.obs;
  int page = 1;
  int perPage = 10;
  void nextPage() {
    isLoading.value = true;
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getReportDetail(currentPage.value);
    }
  }

  void previousPage() {
    isLoading.value = true;
    if (currentPage.value > 1) {
      currentPage.value--;
      getReportDetail(currentPage.value);
    }
  }


  Future<void> getReportDetail(int page) async {
    isLoading.value = true;
    reportList.clear();
    APIResponse response = await PropertyReportProvider().searchReportDetail(page, perPage,{
      "collectionType": collectionType.value,
      "fromDate": dateFromController.text.toString(),
      "uptoDate": dateUptoController.text.toString(),
      "wardNo": wardNo.value.toString(),
      "paymentMode": paymentMode.value.toString(),
    });
    // condition for response error
    if ( response.error == false) {
      //  condition in response data status
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      if (page == 1) {
              totalAmount = responseData["totalAmt"].toString();
              currentPage.value = responseData["current_page"];
              totalPages.value =responseData["last_page"];
            }
      List<dynamic> data = List<dynamic>.from(response.data['data']);
      reportList.addAll(data);
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



  //
  // if (response != null) {
  //     Map<String, dynamic> responseData = response.data;
  //     rwardNo = responseData["ward_no"].toString();
  //     id = responseData["id"].toString();
  //     type = responseData["type"].toString();
  //     safNo = responseData["saf_no"].toString();
  //     assessmentType = responseData["assessment_type"].toString();
  //     newHoldingNo = responseData["new_holding_no"].toString();
  //     tranId = responseData["tran_id"].toString();
  //     holdingNo = responseData["holding_no"].toString();
  //     ownerName = responseData["owner_name"].toString();
  //     mobileNo = responseData["mobile_no"].toString();
  //     fromUptoFyQtr = responseData["from_upto_fy_qtr"].toString();
  //     tranDate = responseData["tran_date"].toString();
  //     transactionMode = responseData["transaction_mode"].toString();
  //     amount = responseData["amount"].toString();
  //     empName = responseData["emp_name"].toString();
  //     userId = responseData["user_id"].toString();
  //     tranNo = responseData["tran_no"].toString();
  //     chequeNo = responseData["cheque_no"].toString();
  //     bankName = responseData["bank_name"].toString();
  //     branchName = responseData["branch_name"].toString();
  //     if (page == 1) {
  //       totalAmount = responseData["totalAmt"].toString();
  //       currentPage.value = responseData["current_page"];
  //       totalPages.value =responseData["last_page"];
  //     }
  //     reportList.clear();
  //     // reportList.addAll(responseData);
  //     print(reportList);
  //     isLoading.value = false;
  //   }
  //   return true;
  // }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
