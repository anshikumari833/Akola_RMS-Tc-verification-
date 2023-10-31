import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../../../common/api_response.dart';
import '../../../common/cluster.dart';
import '../../home/controllers/home_controller.dart';
import '../../property_NewAssessment/providers/property_new_assessment_provider.dart';
import '../providers/SearchHolding_provider.dart';
import '../search_propert_model.dart';
import '../views/property_prop_receipt_view.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

class PropertyPayPropertyTaxController extends GetxController {
  final GlobalKey<FormState> SearchHoldingFormKey = GlobalKey<FormState>();
  var searchedPropData = List<dynamic>.empty(growable: true).obs;
  var searchedDataById = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isLoading = false.obs;
  // Method to set the loading state
  void setLoading(bool value) {
    isLoading.value = value;
  }

  RxList<Map<String, dynamic>> wardList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> WardListByZone = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ownershipList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> propertyList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> floorList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> usageList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> occuppancyList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> constructionList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> zoneList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> categoryList = <Map<String, dynamic>>[].obs;
  var newWardNo = ''.obs;
  var zoneType = ''.obs;
  // MASTER SAF DATA - (DROPDOWN LIST)
  void getDropdownListDetail() async {
    isDataProcessing(true);
    APIResponse result = await PropertyNewAssessmentProvider().getlistData();
    if(!result.error){
      //using the responseData as a Map
      Map<String, dynamic> data = result.data;
      data.forEach((key, value) {
        switch (key) {
          case 'ward_master':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["ward_name"] = item["ward_name"];
                wardList.add(dataListMap);
              });
            }
            break;
          case 'ownership_types':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["ownership_type"] = item["ownership_type"];
                ownershipList.add(dataListMap);
              });
            }
            break;
          case 'property_type':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["property_type"] = item["property_type"];
                propertyList.add(dataListMap);
              });
            }
            break;
          case 'floor_type':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["floor_name"] = item["floor_name"];
                floorList.add(dataListMap);
              });
            }
            break;
          case 'usage_type':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["usage_type"] = item["usage_type"];
                usageList.add(dataListMap);
              });
            }
            break;
          case 'occupancy_type':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["occupancy_type"] = item["occupancy_type"];
                occuppancyList.add(dataListMap);
              });
            }
            break;
          case 'construction_type':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["construction_type"] = item["construction_type"];
                constructionList.add(dataListMap);
              });
            }
            break;
          case 'zone':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["zone_name"] = item["zone_name"];
                zoneList.add(dataListMap);
              });
            }
            break;
          case 'categories':
            {
              value.forEach((item) {
                Map<String, dynamic> dataListMap = Map<String, dynamic>();
                dataListMap["id"] = item["id"];
                dataListMap["category"] = item["category"];
                categoryList.add(dataListMap);
              });
            }
            break;
          default:
            {
              break;
            }
        }
      });
      isDataProcessing.value = false;
    } else {
      Get.snackbar(
        'Oops!!!',
        result.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isDataProcessing.value = false;
  }
  //SEARCH-PROPERTY-DETAILS
  var filterByValue = "".obs;
  late TextEditingController searchByController;

  //WARD BY ZONE - (DROPDOWN LIST)
  Future<void>  getWardByZone({required String zoneId}) async {
    isDataProcessing.value = true;
    WardListByZone.clear();
    APIResponse response = await PropertyNewAssessmentProvider().WardByZone(zoneId);
    if (!response.error) {
      List<dynamic> responseDataList = List<dynamic>.from(response.data);
      for (var responseData in responseDataList) {
        Map<String, dynamic> zoneWardData = Map<String, dynamic>.from(
            responseData);
        // Creating a map to hold the processed data
        Map<String, dynamic> WardData = {
          'id': zoneWardData['id'],
          'zone': zoneWardData['zone'],
          'ward_name': zoneWardData['ward_name'],
          'old_ward_name': zoneWardData['old_ward_name'],
        };
        // Add the processed data to the wardList
        WardListByZone.add(WardData);
      }
      isDataProcessing.value = false;
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isDataProcessing.value = false;
  }

  final count = 0.obs;
  final responseMessage = RxString("");
  // String responseNewMessage = "";
  final responseNewMessage = ''.obs;
  var responseCode = '';
  var responseMsg = '';
  var pineLabStatus = false.obs;

  void updateMessage(String message) {
    responseNewMessage.value = message;
  }
  @override
  void onInit() {
    super.onInit();
    getDropdownListDetail();
    searchByController  = TextEditingController();
    bankNameController = TextEditingController();
    branchNameController = TextEditingController();
    chequeNoController = TextEditingController();
    chequeDateController = TextEditingController();
    remarksController = TextEditingController();
    partPaymentAmountController = TextEditingController();
    const platform = MethodChannel("com.amcakola.tc_verification_app/com.pinelabs.masterapp");
    platform. setMethodCallHandler((call) async {
      if (call.method == 'handleResponse') {
        // if (shouldHandlePaymentResponse.value) {
          handlePaymentResponse(call.arguments);
        // }
        pineLabStatus.value = true;
        responseMessage.value = call.arguments;
      }
    });
  }

  //     handlePaymentResponse(call.arguments);
  //     pineLabStatus.value = true;
  //     if (call.method == 'handleResponse') {
  //       responseMessage.value = call.arguments;
  //     }
  //   });
  // }

  //*********************************************************PINE LAB METHODS IMPLEMENTATION****************************************************************************************

  // ***CARD IMPLEMENTATION***
  static const MethodChannel _channel = MethodChannel('com.amcakola.tc_verification_app/com.pinelabs.masterapp');
  // CARD PAYMENT
  Future<void> openPineCardPOS() async {
    if (Platform.isAndroid) {
      try {
        shouldHandlePaymentResponse.value = true;
        // Determine the amount to be paid based on the checkbox state
        double amountToPay = isCheckboxChecked.value
            ? double.parse(arrearPayableAmt.value)
            : double.parse(payableAmount.value);

        // Convert amount to cents format
        int amountInDollars = (amountToPay * 100).toInt();
        // Convert payableAmount to cents format
        // int amountInDollars = int.parse(payableAmount.value) * 100;
        final Map<String, dynamic> paymentDetail = {
          "BillingRefNo": billRefNo,
          "PaymentAmount": amountInDollars.toStringAsFixed(2), // Format as 2 decimal places
          "TransactionType": 4001,
        };
        final Map<String, dynamic> payload = {
          "Detail": paymentDetail,
          "Header": {
            "ApplicationId": "4fb3fd901e2449819eedad73a6656ae4",
            "MethodId": "1001",
            "UserId": "1234",
            "VersionNo": "1.0",
          },
        };
        final String payloadJson = json.encode(payload);
        final String responseDataJson = await _channel.invokeMethod('sendPaymentIntent', payloadJson);
        shouldHandlePaymentResponse.value = true;
        if (responseDataJson != null) {
          try {
            final Map<String, dynamic> response = json.decode(responseDataJson);
            handlePaymentResponse(responseDataJson);
            // SenddPinelabResponse(responseDataJson);
          } catch (e) {
            print('Error parsing JSON: $e');
          }
        } else {
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  //***UPI GET STATUS
  Future<void> getUpiStatus() async {
    if (Platform.isAndroid) {
      try {
        // Convert payableAmount to cents format
        // int amountInDollars = payableAmount * 100;
        int amountInDollars = int.parse(payableAmount.value) * 100;
        final Map<String, dynamic> paymentDetail = {
          "BillingRefNo": billRefNo,
          "PaymentAmount": amountInDollars.toStringAsFixed(2), // Format as 2 decimal places
          "TransactionType": 5122,
        };
        final Map<String, dynamic> payload = {
          "Detail": paymentDetail,
          "Header": {
            "ApplicationId": "4fb3fd901e2449819eedad73a6656ae4",
            "MethodId": "1001",
            "UserId": "1234",
            "VersionNo": "1.0",
          },
        };
        final String payloadJson = json.encode(payload);
        final String responseDataJson = await _channel.invokeMethod('sendPaymentIntent', payloadJson);
        shouldHandlePaymentResponse.value = true;
        if (responseDataJson != null) {
          try {
            final Map<String, dynamic> response = json.decode(responseDataJson);
            handlePaymentResponse(responseDataJson);
            // SenddPinelabResponse(responseDataJson);
          } catch (e) {
            print('Error parsing JSON: $e');
          }
        } else {
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  // ***UPI IMPLEMENTATION***
  Future<void> openPineUPIPOS() async {
    if (Platform.isAndroid) {
      try {
        shouldHandlePaymentResponse.value = true;
        // Determine the amount to be paid based on the checkbox state
        double amountToPay = isCheckboxChecked.value
            ? double.parse(arrearPayableAmt.value)
            : double.parse(payableAmount.value);

        // Convert amount to cents format
        int amountInDollars = (amountToPay * 100).toInt();

        // Convert payableAmount to cents format
        // int amountInDollars = int.parse(payableAmount.value) * 100;
        final Map<String, dynamic> paymentDetail = {
          "BillingRefNo": billRefNo,
          "PaymentAmount": amountInDollars.toStringAsFixed(2), // Format as 2 decimal places
          "TransactionType": 5120,
        };
        final Map<String, dynamic> payload = {
          "Detail": paymentDetail,
          "Header": {
            "ApplicationId": "4fb3fd901e2449819eedad73a6656ae4",
            "MethodId": "1001",
            "UserId": "1234",
            "VersionNo": "1.0",
          },
        };

        final String payloadJson = json.encode(payload);

        final String responseDataJson = await _channel.invokeMethod('sendPaymentIntent', payloadJson);
        shouldHandlePaymentResponse.value = true;
        if (responseDataJson != null) {
          try {
            final Map<String, dynamic> response = json.decode(responseDataJson);
            handlePaymentResponse(responseDataJson);
            // SenddPinelabResponse(responseDataJson);

            // if(response['Response']['ResponseCode'] == 100){
            //
            // }

          } catch (e) {
            print('Error parsing JSON: $e');
          }
        } else {
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  // Define a function to generate the lines conditionally
  String generateConditionalLines(String paymentMode) {
    if (paymentMode == "CASH") {
      return ''; // Return an empty string if payment mode is "CASH"
    } else {
      // Return the lines for bank details
      return """
      Bank Name: $bankName
      Branch Name: $branchName
      Cheque No: $chequeNo
      Cheque Date: $chequeDate
    """;
    }
  }


  var shouldHandlePaymentResponse = false.obs;
  //PRINT
  Future<void> openPrintPOS() async {
    if (Platform.isAndroid) {
      try {
        shouldHandlePaymentResponse.value = false;
        final Map<String, dynamic> payload = {
          "Header": {
            "ApplicationId": "4fb3fd901e2449819eedad73a6656ae4",
            "UserId": "user1234",
            "MethodId": "1002",
            "VersionNo": "1.0"
          },
          "Detail": {
            "PrintRefNo": "123456789",
            "SavePrintData": true,
            "Data": [
              {
                "PrintDataType": "0",
                "PrinterWidth": 24,
                "IsCenterAligned": true,
                "DataToPrint": "Akola Municipal Corporation\n"
                    "Maharashtra\n"
                    "( Payment Receipt )\n"
                    " $paidFrom\n "
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                "DataToPrint": "Date: $transactionDate\n"
                    "Time: $transactionTime\n"
                    "Book No: $bookNo\n"
                    "Receipt Book No: $receiptNo\n"
                    "   ********************\n"
                    "Desc: $accountDescription\n"
                    "Zone: $ReceiptZoneNo\n"
                    "Ward No.: $ReceiptWardNo\n"
                    "Holding No.: $applicationNo\n"
                    "Property No.: $propertyNo\n"
                    "Tax Ow. Name: $customerName\n"
                    "Address: $ReceiptAddress\n"
                    "   ********************\n"
                    "Trans No.: $transactionNo\n"
                    "Paid Upto: $paidUpto\n"
                    "Mode: $paymentMode\n"
                    "${paymentMode == "CASH" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Bank Name: $bankName\n"}"
                    "${paymentMode == "CASH" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Branch Name: $branchName\n"}"
                    "${paymentMode == "CASH" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Cheque No: $chequeNo\n"}"
                    "${paymentMode == "CASH" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Cheque Date: $chequeDate\n"}"
                // "${generateConditionalLines(paymentMode)}"
                //     "Demand: $demandAmount\n"
                //     "Arrear : $arrearAmount\n"
                //     "Total Amount Paid: $totalPaidAmount\n"
                    "Total Amount Paid: $totalPaidAmount\n"
                    "In Words: ${(paidAmtInWords)} only\n"
                    "   ********************\n"
                    "TC Name: $tcName\n"
                    "Mobile No: $tcMobile\n"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                 "IsCenterAligned": true,
                "DataToPrint":
                    "Thank You!\n"
                    "For More Details Please visit: $website\n"
                    "$tollFreeNo\n"
                    "Please keep this Bill \n For Future Reference\n\n\n\n",
              },
            ]
          }
        };

        final String payloadJson = json.encode(payload);
        final String responseDataJson =
        await _channel.invokeMethod('sendPaymentIntent', payloadJson);
        shouldHandlePaymentResponse.value = false;
        if (responseDataJson != null) {
          try {
            final Map<String, dynamic> response = json.decode(responseDataJson);
            handlePaymentResponse(responseDataJson);
          } catch (e) {
            print('Error parsing JSON: $e');
          }
        } else {
          // Handle the case where responseDataJson is null
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }




  //HANDLE RESPONSE MESSAGE
  void handlePaymentResponse(String response) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response);
       //Storing pinelab response
       if (shouldHandlePaymentResponse.value) {
         SenddPinelabResponse(responseData);
      }
      // SenddPinelabResponse(responseData);
      // Access the response message from the JSON
      responseCode = responseData['Response']['ResponseCode'].toString();
      responseMsg = responseData['Response']['ResponseMsg'].toString();
      if(responseCode != '0'){
        Get.snackbar(
          'Message',
          responseMsg,
          // duration: Duration(seconds: 3),
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
        );
      }
      if(responseCode == '100'){
        // checkPaymentStatus();
      }

      if(responseCode != '0' && responseCode != '100'){
        // submitPaymentResponse()
      }
    } catch (e) {
      print('Error decoding JSON: $e');
    }
  }

//*********************************************************PINE LAB METHODS IMPLEMENTATION****************************************************************************************


  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var totalPages = 1.obs;
  var isPageLoading = false.obs;
  int page = 1;
  int perPage = 10;

  void nextPage() {
    isPageLoading.value = true;
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getDetaiBySearch(currentPage.value); // Pass the updated currentPage.value
    }
  }

  void previousPage() {
    isPageLoading.value = true;
    if (currentPage.value > 1) {
      currentPage.value--;
      getDetaiBySearch(currentPage.value);
    }
  }

  // SEARCH-PROPERTY-DETAILS
  Future<void> getDetaiBySearch(int page) async {
    // final isValid = SearchHoldingFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    isPageLoading.value = true;
    APIResponse response = await SearchHoldingProvider().searchDetail(page, perPage, {
      "zone": zoneType.value.toString(),
      "wardNo":newWardNo.value.toString(),
      "filteredBy": filterByValue.value.toString(),
      "parameter": searchByController.text.toString(),
    });
    // condition for response error
    if ( response.error == false) {
    //  condition in response data status
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      if (page == 1) {
        currentPage.value = responseData["current_page"];
        totalPages.value = responseData["last_page"];
        searchedPropData.clear();
      }
      List<dynamic> data = List<dynamic>.from(response.data['data']);
      searchedPropData.addAll(data);
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




  //Search Holding Detail By Id
  searchHoldingById(int propertyId) async {
    await getPropertyDetail(propertyId);
  }

  //PROPERTY DETAIL
  Future<bool> getPropertyDetail(propertyId) async {
    APIResponse response = await SearchHoldingProvider().SearchedPropertyData(propertyId);
    searchedDataById.clear();
    if (response.error == false) {
      Map<String, dynamic> data = response.data;

      SearchedData searchedData = SearchedData.fromJson(data);
      // Fetch and populate floors
      List<SearchedFloorsData> floorsData = [];
      for (var floorData in data['floors']) {
        floorsData.add(SearchedFloorsData.fromJson(floorData));
      }
      searchedData.floors = floorsData;
      // Fetch and populate owners
      List<SerchedOwnersData> ownersData = [];
      for (var ownerData in data['owners']) {
        ownersData.add(SerchedOwnersData.fromJson(ownerData));
      }
      searchedData.owners = ownersData;
      searchedDataById.add(searchedData);
      // searchedDataById.clear();
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


  // Storing duesList values
  // var paymentStatus;
  // var currentDemand;
  // List<Map<String, dynamic>> demandList = [];
  // Map<String, dynamic> grandTaxes = {};
  // var arrear;
  // var payableAmount;
  // var monthlyPenaltyAmount;
  // Map<String, dynamic> basicDetails= {};
  // var demand_PropertyId;
  // var  demand_ModuleId;
  // var  demand_WorkflowId;
  // var demandMessage;
  // bool demandError = false;
  var paymentStatus = ''.obs;
  var currentDemand = ''.obs;
  var demandList = <Map<String, dynamic>>[].obs;
  var grandTaxes = <String, dynamic>{}.obs;
  var arrear = ''.obs;
  var arrearPayableAmt = ''.obs;
  var payableAmount = ''.obs;
  var monthlyPenaltyAmount = '';
  var totalPenaltyIntrest = '';
  // var basicDetails = <String, dynamic>{};
  Map<String, dynamic> basicDetails= {};
  var demand_PropertyId = '';
  var demand_ModuleId = '';
  var demand_WorkflowId = '';
  var demandMessage = ''.obs;
  var demandError = false.obs;

  //DEMAND- DETAIL
  Future<void> getDemandDetail(propertyId,type) async {

    isPaymentInProgress.value = false;

    // Clear the previous data when fetching data for a different propertyId
   //  demandError = false;
   //  demandList = [];
   //  grandTaxes = {};
   //  basicDetails = {};
    demandError.value = false;
    currentDemand.value = '';
    demandMessage.value = '';
    paymentStatus.value = '';
    demandList.clear();
    grandTaxes.clear();
    arrear.value = '';
    payableAmount.value = '';
    basicDetails.clear();
    demand_PropertyId = '';
    demand_ModuleId = '';
    demand_WorkflowId = '';
    APIResponse response = await SearchHoldingProvider().SearchedDemandData(propertyId,type);
    demandError.value = response.error;
    demandMessage.value = response.errorMessage;
    if (response.error == false) {
      Map<String, dynamic> responseData = response.data;
      paymentStatus.value = nullToNA(responseData['paymentStatus'].toString());
      demandList.value = List<Map<String, dynamic>>.from(responseData['demandList']);
      grandTaxes.value = Map<String, dynamic>.from(responseData['grandTaxes']);
      arrear.value = nullToNA(responseData['arrear']);
      arrearPayableAmt.value = nullToNA(responseData['arrearPayableAmt']);
      payableAmount.value = nullToNA(responseData['payableAmt'].toString());
      currentDemand.value = nullToNA(responseData['currentDemand'].toString());
      monthlyPenaltyAmount = nullToNA(responseData['monthlyPenalty'].toString());
      totalPenaltyIntrest = nullToNA(responseData['totalInterestPenalty'].toString());
      basicDetails = Map<String, dynamic>.from(responseData['basicDetails']);
      demand_PropertyId = basicDetails['id'].toString();
      demand_ModuleId= basicDetails['moduleId'].toString();
      demand_WorkflowId = basicDetails['workflowId'].toString();
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
  }


  var selectedPaymentUptoYr = "".obs;
  var selectedPaymentUptoQtr  = "".obs;

  var holdingData =<Map<String, dynamic>>[];
  var safData = <Map<String, dynamic>>[];
  //PAYMENT HISTORY
  Future<void> getPaymentDetail(propertyId) async {
    APIResponse response = await SearchHoldingProvider().SearchedPaymentData(propertyId);
    if (response.error == false) {
      var data = response.data;
      holdingData = List<Map<String, dynamic>>.from(data['Holding']);
      safData = List<Map<String, dynamic>>.from(data['Saf']);
    }else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
  }

  var departmentSection = "";
  var accountDescription = "";
  var transactionDate = "";
  var transactionNo = "";
  var transactionTime = "";
  var applicationNo = "";
  var customerName = "";
  var mobileNo = "";
  var receiptWard = "";
  var ReceiptAddress  = "";
  var paidFrom = "";
  var paidFromQtr = "";
  var paidUpto = "";
  var paidUptoQtr = "";
  var paymentMode = "";
  var bankName = "";
  var branchName = "";
  var chequeNo = "";
  var chequeDate = "";
  var demandAmount = "";
  var taxDetails = "";
  var totalRebate = "";
  var arrearAmount = "";
  var totalPenalty = "";
  var ReceiptUlbId = "";
  var ReceiptWardNo = "";
  var ReceiptZoneNo = "";
  var ReceiptnewWardNo = "";
  var towards = "";
  var propertyNo = "";
  var tax_description = "";
  var totalPaidAmount = "";
  var paidAmtInWords = "";
  var tcName = "";
  var tcMobile = "";
  var website = "";
  var tollFreeNo = "";
  var tranId = "";
  var bookNo = "";
  var receiptNo = "";

  List<Map<String, dynamic>> penaltyRebatesList = [];
  List<Widget> penaltyRebateWidgets = [];

  Future<void> getPaymentReceipt(printTranId) async {
    tranId = printTranId.toString();
    departmentSection = "";
    accountDescription = "";
    transactionDate = "";
    transactionNo = "";
    transactionTime = "";
    applicationNo = "";
    customerName = "";
    mobileNo = "";
    receiptWard = "";
    ReceiptAddress  = "";
    paidFrom = "";
    paidFromQtr = "";
    paidUpto = "";
    paidUptoQtr = "";
    paymentMode = "";
    bankName = "";
    branchName = "";
    chequeNo = "";
    chequeDate = "";
    demandAmount = "";
    taxDetails = "";
    totalRebate = "";
    arrearAmount = "";
    totalPenalty = "";
    ReceiptUlbId = "";
    ReceiptWardNo = "";
    ReceiptZoneNo = "";
    ReceiptnewWardNo = "";
    towards = "";
    propertyNo = "";
    tax_description = "";
    totalPaidAmount = "";
    paidAmtInWords = "";
    tcName = "";
    tcMobile = "";
    website = "";
    tollFreeNo = "";
    bookNo = "";
    receiptNo = "";


    APIResponse response = await SearchHoldingProvider().PropPaymentReceip(printTranId);
    if (response.error == false) {
      var data = response.data;
      // Extract penalty amounts and store them in the controller's list
      // var penaltyRebates = data['penaltyRebates'];
      // if (penaltyRebates is List) {
      //   penaltyRebatesList = List<Map<String, dynamic>>.from(penaltyRebates);
      // }
      // Check if penaltyRebatesList is not empty and build penalty rebate widgets
      for (final penaltyRebate in penaltyRebatesList) {
        final headName = penaltyRebate['head_name'];
        final amount = penaltyRebate['amount'];
        final penaltyRebateWidget = ListTile(
          title: Text('$headName:'),
          subtitle: Text('Amount: $amount'),
        );
        penaltyRebateWidgets.add(penaltyRebateWidget);
      }
      departmentSection = data['receiptDtls']['departmentSection'].toString();
      accountDescription = data['receiptDtls']['accountDescription'].toString();
      transactionDate = data['receiptDtls']['transactionDate'].toString();
      propertyNo = data['receiptDtls']['propertyNo'].toString();
      transactionNo = data['receiptDtls']['transactionNo'].toString();
      transactionTime =data['receiptDtls']['transactionTime'].toString();
      applicationNo = data['receiptDtls']['applicationNo'].toString();
      customerName = data['receiptDtls']['customerName'].toString();
      mobileNo = data['receiptDtls']['mobileNo'].toString();
      ReceiptAddress = data['receiptDtls']['address'].toString();
      paidFrom = data['receiptDtls']['paidFrom'].toString();
      paidUpto = data['receiptDtls']['paidUpto'].toString();
      paymentMode = data['receiptDtls']['paymentMode'].toString();
      bankName = data['receiptDtls']['bankName'].toString();
      branchName = data['receiptDtls']['branchName'].toString();
      chequeNo = data['receiptDtls']['chequeNo'].toString();
      chequeDate = data['receiptDtls']['chequeDate'].toString();
      demandAmount = data['receiptDtls']['demandAmount'].toString();
      arrearAmount = data['receiptDtls']['arrearSettled'].toString();
      ReceiptWardNo = data['receiptDtls']['wardNo'].toString();
      ReceiptZoneNo = data['receiptDtls']['zone_name'].toString();
      towards = data['receiptDtls']['towards'].toString();
      tax_description = data['receiptDtls']['description'].toString();
      totalPaidAmount = data['receiptDtls']['totalPaidAmount'].toString();
      paidAmtInWords = data['receiptDtls']['paidAmtInWords'].toString();
      tcName = data['receiptDtls']['tcName'].toString();
      tcMobile = data['receiptDtls']['tcMobile'].toString();
      website = data['receiptDtls']['ulbDetails']['website'].toString();
      tollFreeNo = data['receiptDtls']['ulbDetails']['toll_free_no'].toString();
      bookNo = data['receiptDtls']['bookNo'].toString();
      receiptNo = data['receiptDtls']['receiptNo'].toString();
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    Get.to(PropReceiptView());
  }


  //PAY DEMAND TAX
//PAYMENT
  var demand_PaymentMethod = "".obs;
  var demand_PaymentMode = "".obs;

  var tranNo = "";
  // var tranId = "";
  late TextEditingController partPaymentAmountController;
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController chequeNoController;
  late TextEditingController chequeDateController;
  late TextEditingController remarksController;
  var isCheckboxChecked = false.obs;
  var billRefNo = "";
  var isPaymentInProgress = false.obs;
  var paymentSuccessful = false.obs;

  void showLoadingDialog(bool value) {
    if(value)
      {
        Get.dialog(
          Stack(
            children: [
              // Blurred background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Adjust the opacity
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              // Loading dialog
              AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(), // Display a loading indicator
                    SizedBox(height: 16),
                    Text(
                      'Waiting for payment...',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          barrierDismissible: false,
        );
      }
  }

  //PHASE - 2 (version 2)(CODE OF DEMAND PAYMENT WITH PART PAYMENT)
  // PAYMENT (CASH,CHEQUE,DD)
  Future<void> DemandTaxPayment({String type = ''}) async {
    showLoadingDialog(true);
    isPaymentInProgress.value = true;
    tranNo = '';
    tranId = '';
    var file1;
    if(type != 'cash') {
      String _img64Image1;
      final bytes1 = await _selectedFile1!.readAsBytes();
      _img64Image1 = base64Encode(bytes1);
      // Create temporary files to save base64 encoded image data
      // final tempDir = await getTemporaryDirectory();
      final bytes01 = base64Decode(_img64Image1);
      final directory = await getApplicationDocumentsDirectory();
      file1 = await File('${directory.path}/image1.png').create();
      await file1.writeAsBytes(bytes01);
    }
    var result = await SearchHoldingProvider().DemandTaxDuePayment(demand_PropertyId, {
      'paymentType': demand_PaymentMethod.value.toString(),
      'paidAmount': partPaymentAmountController.value.text,
      'paymentMode': demand_PaymentMode.value.toString(),
      'bankName': bankNameController.value.text,
      'branchName': branchNameController.value.text,
      'chequeNo': chequeNoController.value.text,
      'chequeDate': chequeDateController.value.text,
      'imagePath[0]': file1,
    });
    // // Close the loading dialog here
    // Get.back();
    showLoadingDialog(false);
    if (result.error == false) {
      paymentSuccessful.value = true;
      var data = result.data;
      tranNo = data['TransactionNo'].toString();
      tranId = data['transactionId'].toString();
      // Clear the temporary image file
      if (file1 != null && await file1.exists()) {
        await file1.delete();
      }
      await getDemandDetail(demand_PropertyId, "demand");
      showLoadingDialog(false);
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.task_alt_rounded, size: 85.0, color: Colors.green),
              SizedBox(height: 7,),
              Text(
                result.errorMessage,
                style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clearAllFields();
                    Get.back();
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getPaymentReceipt(tranId);
                    // Get.to(PrintReceipt(),
                    //     transition: Transition.rightToLeft,
                    //     duration: Duration(seconds: 1),
                    //     arguments: [
                    //       { 'print_string1': getPrintString1()},
                    //       { 'print_string2': getPrintString2()},
                    //       { 'print_string3': getPrintString3()},
                    //     ],
                    //     preventDuplicates: true);
                    openPrintPOS();
                  },
                  child: Text("Print Receipt"),
                ),
              ],
            ),
          ],
        ),
      );
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      showLoadingDialog(false);
      Get.snackbar(
        'Oops!!!',
        result.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    isPaymentInProgress.value = false;

  }





  //PINLAB PAYMENT ONLINE (for card ):(PAYMENT REF NO )
  Future<void> DemandOnlineCardPayment() async {
    showLoadingDialog(true);
    isPaymentInProgress.value = true;
    var result = await SearchHoldingProvider().Pinelab_PaymentOnline({
      "propId": demand_PropertyId,
      "paymentMode": "CARD".toString(),
       "isArrear": isCheckboxChecked.value,
    });
    if (result.error == false) {
      var data = result.data;
      billRefNo = data['billRefNo'].toString();
      await openPineCardPOS();
      await getDemandDetail(demand_PropertyId,"demand");
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.task_alt_rounded, size:85.0, color: Colors.green),
              SizedBox(height: 7,),
              Text(result.errorMessage,style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.green),),
              SizedBox(height: 5,),
              // Text("Amount Paid: $payableAmount"),
              // Text("Amount Paid: ${indianAmount(payableAmount)}"),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clearAllFields();
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getPaymentReceipt(tranId);
                    openPrintPOS();
                  },
                  child: Text("Print Receipt"),
                ),
              ],
            ),
          ],
        ),
      );
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else {
      // isPaymentInProgress.value = false;
      Get.snackbar(
        'Oops!!!',
        result.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isPaymentInProgress.value = false;
  }


  //PINLAB PAYMENT ONLINE (for upi ):(PAYMENT REF NO )
  Future<void> DemandOnlineUpiPayment() async {
    showLoadingDialog(true);
    isPaymentInProgress.value = true;
    var result = await SearchHoldingProvider().Pinelab_PaymentOnline({
      "propId": demand_PropertyId,
      "paymentMode": "UPI".toString(),
      "isArrear": isCheckboxChecked.value,
    });
    if (result.error == false) {
      var data = result.data;
      billRefNo = data['billRefNo'].toString();
      await openPineUPIPOS();
      // await getDemandDetail(demand_PropertyId,"demand");
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.task_alt_rounded, size:85.0, color: Colors.green),
              SizedBox(height: 7,),
              Text(result.errorMessage,style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.green),),
              SizedBox(height: 5,),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clearAllFields();
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getPaymentReceipt(tranId);
                    openPrintPOS();
                  },
                  child: Text("Print Receipt"),
                ),
              ],
            ),
          ],
        ),
      );
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Oops!!!',
        result.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isPaymentInProgress.value = false;
    // showLoadingDialog(isPaymentInProgress.value);
  }

  var online_tranNo ;
  //PINLAB PAYMENT ONLINE
  Future<void> SenddPinelabResponse(responseData) async {
    isPaymentInProgress.value = true;
    var result = await SearchHoldingProvider().Pinelab_PaymentResponse({
      "BillingRefNo":billRefNo.toString(),
      'amount': payableAmount.toString(),
      'applicationId': demand_PropertyId.toString(),
      //Sending pinelab response to backed
      "pinelabResponseBody": responseData});
    showLoadingDialog(false);
    if (result.error == false) {
      var data = result.data;
      online_tranNo = data['res_ref_no'].toString();
      await getDemandDetail(demand_PropertyId, "demand");
      if( result.data['response_code'] == 0){Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.task_alt_rounded, size: 85.0, color: Colors.green),
              SizedBox(height: 7,),
              Text(
                result.data['response_msg'].toString(),
                style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clearAllFields();
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getPaymentReceipt(online_tranNo);
                    openPrintPOS();
                  },
                  child: Text("Print Receipt"),
                ),
              ],
            ),
          ],
        ),
      );}
      else {Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_amber_rounded, size: 85.0, color: Colors.red),
              SizedBox(height: 7,),
              Text(
                result.data['response_msg'].toString(),
                style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
        ),
      );}
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Oops!!!',
        result.errorMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    isPaymentInProgress.value = false;
  }

  //PRINT RECEIPT(BLUETOOTH THERMAL PRINTER)
  getPrintString1() {
    var retStr = "";
    retStr += "( Tax Receipt )\n";
    retStr +=  paidFrom + "\n";
    retStr += "Date: " + transactionDate + "\n";
    retStr += "Time: " + transactionTime + "\n";
    retStr += " ***************************\n";
    retStr += "Description: " + accountDescription + "\n";
    retStr += "POS ID: XXXXXXXXXXX\n";
    retStr += "Transaction No.: " + transactionNo + "\n";
    retStr += "Holding No.: " + applicationNo + "\n";
    retStr += "Ward No.: " + ReceiptWardNo + "\n";
    retStr += "Tax Ow. Name: " + customerName + "\n";
    retStr += "Address: " + ReceiptAddress + "\n";
    return retStr;
  }
  getPrintString2() {
    var retStr = "";
    retStr += " ***************************\n";
    retStr += "Paid Upto: " + paidUpto + "\n";
    retStr += "Demand Amount: " + demandAmount + "\n";
    retStr += "Payment Mode: " + paymentMode + "\n";
    retStr += "Amount Paid: " +totalPaidAmount + "\n";
    retStr += "In Words: " + paidAmtInWords + "\n";
    return retStr;
  }
  getPrintString3() {
    var retStr = "";
    retStr += " ***************************\n";
    retStr += "TC Name: " + tcName + "\n";
    retStr += "Mobile No: " + tcMobile + "\n";
    retStr += "           Thank You!\n";
    retStr += "      For Details Please visit:\n";
    retStr +=         website + "\n";
    retStr +=         tollFreeNo + "\n";
    retStr += "Please keep this Bill For Future Reference\n";
    return retStr;
  }




  void clearAllFields() {
    bankNameController.clear();
    branchNameController.clear();
    chequeNoController.clear();
    chequeDateController.clear();
    remarksController.clear();
    partPaymentAmountController.clear();
    demand_PaymentMethod.value = "";
    demand_PaymentMode.value = "";
    isCheckboxChecked.value = false;
  }


  File? _selectedFile1 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage1Size = ''.obs;
  final ImagePicker _picker = ImagePicker();

  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      maxWidth: 850,
      maxHeight: 850,
      imageQuality: 1,
    );
    if (image != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 900,
        maxHeight: 900,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (cropped != null) {
        _selectedFile1 = File(cropped.path);
        selectedImage1Path.value = cropped.path;
        selectedImage1Size.value =
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
                "Mb";
      }
    }
  }

  void getImage1(ImageSource imageSource) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
    );
    if (pickedFile != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 900,
        maxHeight: 900,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (cropped == null) {
        _selectedFile1 = null;
        selectedImage1Path.value = '';
        selectedImage1Size.value = '';
      } else {
        // Add a check for valid file types
        if (!['.jpg', '.jpeg', '.png']
            .contains(path.extension(cropped.path).toLowerCase())) {
          Get.snackbar(
            'Error',
            'Invalid file format. Please select a valid image.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
          return;
        }

        selectedImage1Path.value = cropped.path;
        _selectedFile1 = File(selectedImage1Path.value);
        selectedImage1Size.value =
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
                "Mb";
      }
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }


  // //PDF
  //
  // Future<Uint8List> generatePDF(PropertyPayPropertyTaxController controller) async {
  //   final pdf = pw.Document();
  //
  //   // Create a PDF page and add your widget to it
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) {
  //         return PropReceiptView();
  //       },
  //     ),
  //   );
  //
  //   // Save the PDF to a file
  //   final output = await getTemporaryDirectory();
  //   final file = File("${output.path}/receipt.pdf");
  //   await file.writeAsBytes(await pdf.save());
  //
  //   return file.readAsBytesSync();
  // }
  //
  //
  // void openPDF(Uint8List pdfBytes) async {
  //   // Save the PDF bytes to a temporary file
  //   final tempDir = await getTemporaryDirectory();
  //   final tempFile = File("${tempDir.path}/receipt.pdf");
  //   await tempFile.writeAsBytes(pdfBytes);
  //
  //   // Open the PDF with a viewer or reader app
  //   OpenFile.open(tempFile.path);
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    navigateBackAndFetchData();
  }

  void navigateBackAndFetchData() {
    // Access the HomeController
    HomeController homeController = Get.find<HomeController>();

    // Call getCollectionDetail() from HomeController to fetch data
    homeController.getCollectionDetail();

    // Navigate back to HomeView
    Get.back();
  }
  void increment() => count.value++;
}





// PHASE - 1(version 1)
// CODE OF PAYMENT (CASH,CHEQUE,DD)
// Future<void> DemandTaxPayment({String type = ''}) async {
//   showLoadingDialog(true);
//   isPaymentInProgress.value = true;
//   tranNo = '';
//   tranId = '';
//   var file1;
//  if(type != 'cash') {
//     String _img64Image1;
//     final bytes1 = await _selectedFile1!.readAsBytes();
//     _img64Image1 = base64Encode(bytes1);
//     // Create temporary files to save base64 encoded image data
//     // final tempDir = await getTemporaryDirectory();
//     final bytes01 = base64Decode(_img64Image1);
//     final directory = await getApplicationDocumentsDirectory();
//     file1 = await File('${directory.path}/image1.png').create();
//     await file1.writeAsBytes(bytes01);
//   }
//   var result = await SearchHoldingProvider().DemandTaxDuePayment(demand_PropertyId, {
//       'paymentMode': demand_PaymentMode.value.toString(),
//       'bankName': bankNameController.value.text,
//       'branchName': branchNameController.value.text,
//       'chequeNo': chequeNoController.value.text,
//       'chequeDate': chequeDateController.value.text,
//       'isArrear': isCheckboxChecked.value,
//       'imagePath[0]': file1,
//     });
//     // // Close the loading dialog here
//     // Get.back();
//       showLoadingDialog(false);
//     if (result.error == false) {
//       paymentSuccessful.value = true;
//       var data = result.data;
//       tranNo = data['TransactionNo'].toString();
//       tranId = data['transactionId'].toString();
//       // Clear the temporary image file
//       if (file1 != null && await file1.exists()) {
//         await file1.delete();
//       }
//       await getDemandDetail(demand_PropertyId, "demand");
//       showLoadingDialog(false);
//       Get.dialog(
//         barrierDismissible: false,
//         AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(Icons.task_alt_rounded, size: 85.0, color: Colors.green),
//               SizedBox(height: 7,),
//               Text(
//                 result.errorMessage,
//                 style: GoogleFonts.publicSans(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 16,
//                   fontStyle: FontStyle.normal,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 5,),
//             ],
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     clearAllFields();
//                     Get.back();
//                     Get.back();
//                     Get.back();
//                   },
//                   child: Text("Close"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await getPaymentReceipt(tranId);
//                     // Get.to(PrintReceipt(),
//                     //     transition: Transition.rightToLeft,
//                     //     duration: Duration(seconds: 1),
//                     //     arguments: [
//                     //       { 'print_string1': getPrintString1()},
//                     //       { 'print_string2': getPrintString2()},
//                     //       { 'print_string3': getPrintString3()},
//                     //     ],
//                     //     preventDuplicates: true);
//                     openPrintPOS();
//                   },
//                   child: Text("Print Receipt"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//       Get.snackbar(
//         '😁😁',
//         result.errorMessage,
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//       );
//     } else {
//       showLoadingDialog(false);
//       Get.snackbar(
//         'Oops!!!',
//         result.errorMessage,
//         backgroundColor: Colors.redAccent,
//         colorText: Colors.white,
//       );
//     }
//     isPaymentInProgress.value = false;
//
// }
//
//
