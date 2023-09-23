import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../../../common/api_response.dart';
import '../../../common/cluster.dart';
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


  //SEARCH-PROPERTY-DETAILS
  var filterByValue = "".obs;
  late TextEditingController searchByController;



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
    searchByController  = TextEditingController();
    bankNameController = TextEditingController();
    branchNameController = TextEditingController();
    chequeNoController = TextEditingController();
    chequeDateController = TextEditingController();
    remarksController = TextEditingController();
    const platform = MethodChannel("com.amcakola.tc_verification_app/com.pinelabs.masterapp");
    platform. setMethodCallHandler((call) async {
      handlePaymentResponse(call.arguments);
      pineLabStatus.value = true;
      if (call.method == 'handleResponse') {
        responseMessage.value = call.arguments;
      }
    });
  }

  //*********************************************************PINE LAB METHODS IMPLEMENTATION****************************************************************************************

  // ***CARD IMPLEMENTATION***
  static const MethodChannel _channel = MethodChannel('com.amcakola.tc_verification_app/com.pinelabs.masterapp');
  // CARD PAYMENT
  Future<void> openPineCardPOS() async {
    if (Platform.isAndroid) {
      try {
        // Convert payableAmount to cents format
        int amountInDollars = payableAmount * 100;

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
        int amountInDollars = payableAmount * 100;

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
        // Convert payableAmount to cents format
        int amountInDollars = payableAmount * 100;

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
  //PRINT
  Future<void> openPrintPOS() async {
    if (Platform.isAndroid) {
      try {
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
                    "( Tax Receipt )\n"
                    " $paidFrom\n "
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                // "IsCenterAligned": true,
                "DataToPrint":
                "Date: $transactionDate\n"
                    "Time: $transactionTime\n"
                    "  *********************\n"
                    "Description: $accountDescription\n"
                    "Transaction No.: $transactionNo\n"
                    "Holding No.: $applicationNo\n"
                    "Ward No.: $ReceiptWardNo\n"
                    "Tax Ow. Name: $customerName\n"
                    "Address: $ReceiptAddress\n"
                    "  *********************\n"
                    "Paid Upto: $paidUpto\n"
                    "Demand Amount: $demandAmount\n"
                    "Payment Mode: $paymentMode\n"
                    "Bank Name: $bankName\n"
                    "Branch Name: $branchName\n"
                    "Cheque No: $chequeNo\n"
                    "Cheque Date: $chequeDate\n"
                    "Amount Paid: $totalPaidAmount\n"
                    "In Words: $paidAmtInWords\n"
                    "  *********************\n"
                    "TC Name: $tcName\n"
                    "Mobile No: $tcMobile\n"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                 "IsCenterAligned": true,
                "DataToPrint":
                    "Thank You!\n"
                    "For Details Please visit:\n"
                    "$website\n"
                    "$tollFreeNo\n"
                    "Please keep this Bill \n For Future Reference\n\n\n\n",
              },
            ]
          }
        };

        final String payloadJson = json.encode(payload);
        final String responseDataJson =
        await _channel.invokeMethod('sendPaymentIntent', payloadJson);

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
      SenddPinelabResponse(responseData);
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
    final isValid = SearchHoldingFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isPageLoading.value = true;
    APIResponse response = await SearchHoldingProvider().searchDetail(page, perPage, {
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
  var paymentStatus;
  var currentDemand;
  List<Map<String, dynamic>> demandList = [];
  Map<String, dynamic> grandTaxes = {};
  var arrear;
  var payableAmount;
  var monthlyPenaltyAmount;
  Map<String, dynamic> basicDetails= {};
  var demand_PropertyId;
  var  demand_ModuleId;
  var  demand_WorkflowId;
  var demandMessage;
  bool demandError = false;
  //DEMAND- DETAIL
  Future<void> getDemandDetail(propertyId,type) async {
    // Clear the previous data when fetching data for a different propertyId
    demandError = false;
    currentDemand = null;
    demandMessage = null;
    paymentStatus = null;
    demandList = [];
    grandTaxes = {};
    arrear = null;
    payableAmount = null;
    basicDetails = {};
    demand_PropertyId = null;
    demand_ModuleId = null;
   demand_WorkflowId= null;
    APIResponse response = await SearchHoldingProvider().SearchedDemandData(propertyId,type);
    demandError = response.error;
    demandMessage = response.errorMessage;
    if (response.error == false) {
      Map<String, dynamic> responseData = response.data;
      paymentStatus = responseData['paymentStatus'].toString();
     demandList = List<Map<String, dynamic>>.from(responseData['demandList']);
     grandTaxes = Map<String, dynamic>.from(responseData['grandTaxes']);
      arrear = nullToZero(responseData['arrear']);
      payableAmount = responseData['payableAmt'];
      currentDemand = responseData['currentDemand'].toString();
      monthlyPenaltyAmount = responseData['monthlyPenalty'];
      basicDetails = Map<String, dynamic>.from(responseData['basicDetails']);
      demand_PropertyId = basicDetails['id'].toString();
      demand_ModuleId = basicDetails['moduleId'].toString();
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
  var totalPenalty = "";
  var ReceiptUlbId = "";
  var ReceiptWardNo = "";
  var ReceiptnewWardNo = "";
  var towards = "";
  var tax_description = "";
  var totalPaidAmount = "";
  var paidAmtInWords = "";
  var tcName = "";
  var tcMobile = "";
  var website = "";
  var tollFreeNo = "";
  List<String> penaltyAmounts = [];

  Future<void> getPaymentReceipt(tran_no) async {
    APIResponse response = await SearchHoldingProvider().PropPaymentReceip(tran_no);
    if (response.error == false) {
      var data = response.data;
      // Extract penalty amounts and store them in the controller's list
      if (data['penaltyRebates'] is List) {
        for (var entry in data['penaltyRebates']) {
          if (entry is Map) {
            String penaltyAmount = entry['amount'].toString();
          penaltyAmounts.add(penaltyAmount);
          }
        }
      }

      departmentSection = data['receiptDtls']['departmentSection'].toString();
      accountDescription = data['receiptDtls']['accountDescription'].toString();
      transactionDate = data['receiptDtls']['transactionDate'].toString();
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
      ReceiptWardNo = data['receiptDtls']['wardNo'].toString();
      towards = data['receiptDtls']['towards'].toString();
      tax_description = data['receiptDtls']['description'].toString();
      totalPaidAmount = data['receiptDtls']['totalPaidAmount'].toString();
      paidAmtInWords = data['receiptDtls']['paidAmtInWords'].toString();
      tcName = data['receiptDtls']['tcName'].toString();
      tcMobile = data['receiptDtls']['tcMobile'].toString();
      website = data['receiptDtls']['ulbDetails']['website'].toString();
      tollFreeNo = data['receiptDtls']['ulbDetails']['toll_free_no'].toString();
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
  var demand_PaymentMode = "".obs;
  var tranNo = "";
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController chequeNoController;
  late TextEditingController chequeDateController;
  late TextEditingController remarksController;
  var isCheckboxChecked = false.obs;
  var billRefNo = "";
  var isPayButtonLoading = false.obs;
  var isPaymentInProgress = false.obs;
  var paymentSuccessful = false.obs;

  void showLoadingDialog() {
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

  //PAYMENT (CASH,CHEQUE,DD)
  Future<void> DemandTaxPayment() async {
    showLoadingDialog();
    isPaymentInProgress.value = true;

      var result = await SearchHoldingProvider().DemandTaxDuePayment(demand_PropertyId, {
        'paymentMode': demand_PaymentMode.value.toString(),
        'bankName': bankNameController.value.text,
        'branchName': branchNameController.value.text,
        'chequeNo': chequeNoController.value.text,
        'chequeDate': chequeDateController.value.text,
        'isArrear': isCheckboxChecked.value,
      });

      // Close the loading dialog here
      Get.back();
      if (result.error == false) {
        paymentSuccessful.value = true;
        var data = result.data;
        tranNo = data['TransactionNo'].toString();
        await getDemandDetail(demand_PropertyId, "demand");
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
                      // Get.off(PropertyPayPropertyTaxView());
                      Get.back();
                      Get.back();
                    },
                    child: Text("Close"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await getPaymentReceipt(tranNo);
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
        Get.snackbar(
          'Oops!!!',
          result.errorMessage,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
      isPaymentInProgress.value = false; // Payment process completed

  }




  //PINLAB PAYMENT ONLINE (for card )
  Future<void> DemandOnlineCardPayment() async {
    var result = await SearchHoldingProvider().Pinelab_PaymentOnline({
      // 'workflowId': bankNameController.value.text,
      'amount': payableAmount.toString(),
      // 'moduleId': demand_PropertyId,
      'applicationId': demand_PropertyId,
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
                    // Get.off(PropertyPayPropertyTaxView());
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getPaymentReceipt(tranNo);
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
  }


  //PINLAB PAYMENT ONLINE (for upi )
  Future<void> DemandOnlineUpiPayment() async {
    var result = await SearchHoldingProvider().Pinelab_PaymentOnline({
      // 'workflowId': bankNameController.value.text,
      'amount': payableAmount.toString(),
      // 'moduleId': demand_PropertyId,
      'applicationId': demand_PropertyId,
    });
    if (result.error == false) {
      var data = result.data;
      billRefNo = data['billRefNo'].toString();
      await openPineUPIPOS();
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
                    await getPaymentReceipt(tranNo);
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
  }

  //PINLAB PAYMENT ONLINE
  Future<void> SenddPinelabResponse(responseData) async {
    var result = await SearchHoldingProvider().Pinelab_PaymentResponse({
      "BillingRefNo":billRefNo.toString(),
      'amount': payableAmount.toString(),
      'applicationId': demand_PropertyId.toString(),
      "pinelabResponseBody": responseData});
    if (result.error == false) {
      Get.snackbar(
        '😁😁',
        result.errorMessage,
        backgroundColor: Colors.pinkAccent,
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
  }

  //PRINT RECEIPT
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
