// Importing necessary packages and libraries
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../../../common/api_response.dart';
import '../../../common/cluster.dart';
import '../providers/water_consumer_search_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../views/print_receipt_view.dart';

class WaterConsumerSearchController extends GetxController {
  // Global keys for diffrent form states
  final GlobalKey<FormState> partPaymentFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> fullPaymentFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> generateDemandFormkey = GlobalKey<FormState>();

  // Observable variables for managing searched consumer data and demand details
  var searchedconsumerData = List<dynamic>.empty(growable: true).obs;
  var searchedConsumerDataById = List<dynamic>.empty(growable: true).obs;
  var generatedDemandList = List<dynamic>.empty(growable: true).obs;
  var PaymentHistoryById = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  //SEARCH-PROPERTY-DETAILS
  var filterByValue = "".obs;
  late TextEditingController searchByController;

  //***DEMAND DETAIL
  late TextEditingController finalMeterReading;
  late TextEditingController demandDateUpto;

  //Consumer Basic Details(BY ID)
  var consumer_id_pay = "";


  //Demand Detail(BY ID)
  var consumerDemands = <Map<String, dynamic>>[].obs;
  var meterDetails = <String, dynamic>{}.obs;
  var basicDetails = <String, dynamic>{}.obs;
  var totalSumDemand = "".obs;
  var totalPenalty = "".obs;
  var demandStatus = "".obs;

  //CALCULATE DEMAND
  RxBool isLoading = false.obs;
  var selectDateUpto = "".obs;
  var Calculation_totalPayAmount = "".obs;
  var Calculation_totalPenalty = "".obs;
  var Calculation_totalDemand = "".obs;
  var Calculation_totalAdvance = "".obs;
  var Calculation_totalRebate = "".obs;
  var Calculation_remaningAdvanceAmount = "".obs;

  //PAYMENT RECEIPT
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
  var ReceiptUlbId = "";
  var ReceiptWardNo = "";
  var ReceiptZoneNo = "";
  var ReceiptnewWardNo = "";
  var towards = "";
  var ConsumerNo = "";
  var tax_description = "";
  var totalPaidAmount = "";
  var paidAmtInWords = "";
  var tcName = "";
  var tcMobile = "";
  var website = "";
  var tollFreeNo = "";
  var bookNo = "";
  var bindBookNo  = "";
  var meterNo  = "";
  var lastMeterReadingDate  = "";
  var currentMeterReadingDate  = "";
  var description  = "";
  var session  = "";
  List<Map<String, dynamic>> penaltyRebatesList = [];
  List<Widget> penaltyRebateWidgets = [];

  //*******FULL PAYMENT*******
  var demand_PaymentMode = "".obs;
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController chequeNoController;
  late TextEditingController chequeDateController;
  late TextEditingController remarksController;
  late TextEditingController amountController;

  //*******PART PAYMENT*******
  late TextEditingController partPayment_bankNameController;
  late TextEditingController partPayment_branchNameController;
  late TextEditingController partPayment_chequeNoController;
  late TextEditingController partPayment_chequeDateController;
  late TextEditingController partPayment_remarksController;
  late TextEditingController partPayment_amountController;

  //DETAIL AFTER PAYMENT FOR RECEIPT
  var transaction_Id = "";
  var transaction_No = "";
  var consumerId = "";

  //Payment History
  var consumerReceiptDetails = <Map<String, dynamic>>[].obs;

  final count = 0.obs;
  final responseMessage = RxString("");

// Initialize text controllers for various input fields
  @override
  void onInit() {
    super.onInit();
   finalMeterReading = TextEditingController();
   demandDateUpto = TextEditingController();
    searchByController  = TextEditingController();
    bankNameController = TextEditingController();
    branchNameController = TextEditingController();
    chequeNoController = TextEditingController();
    chequeDateController = TextEditingController();
    remarksController = TextEditingController();
    amountController = TextEditingController();
    partPayment_bankNameController = TextEditingController();
    partPayment_branchNameController = TextEditingController();
    partPayment_chequeNoController = TextEditingController();
    partPayment_chequeDateController = TextEditingController();
    partPayment_remarksController = TextEditingController();
    partPayment_amountController = TextEditingController();

    // Setting  method channel for handling payment responses and print response from platform
    const platform = MethodChannel("com.amcakola.tc_verification_app/com.pinelabs.masterapp");
    platform. setMethodCallHandler((call) async {
      handlePaymentResponse(call.arguments);
      if (call.method == 'handleResponse') {
        responseMessage.value = call.arguments;
      }
    });
  }

  // ^^^^ Pagination Functions ^^^
  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var totalPages = 1.obs;
  var isPageLoading = false.obs;
  int page = 1;
  int perPage = 10;
  //**navigating between pages of consumer data
  //nextPage()
  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getDetailBySearch();
    }
  }
  //previousPage()
  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getDetailBySearch();
    }
  }

  //Search List***
  var consumer_Id = <String>[];
  Future<void> getDetailBySearch() async {
    isPageLoading.value = true;
    consumer_Id.clear();
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
      for (var consumerId in data) {
        if (consumerId.containsKey("id")) {
          consumer_Id.add(consumerId["id"].toString());
        }
      }
      searchedconsumerData.addAll(data);
    }
    isPageLoading.value = false;
  }


  //Consumer Basic Details(BY ID)
  searchConsumerById(int consumerId) async {
    await getConsumerDetail(consumerId);
  }
  //Consumer Basic Details(BY ID)
  //*** fetch consumer basic details based on consumerId ***
  Future<bool> getConsumerDetail(consumerId) async {
    consumer_id_pay = "";
    APIResponse response = await WaterConsumerSearchProvider().SearchedComsumerData(consumerId);
    searchedConsumerDataById.clear();
    if (response.error == false) {
      Map<String, dynamic> idData = response.data;
       consumer_id_pay = idData['id'].toString();
      searchedConsumerDataById.add(idData);
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


  //Demand Detail(BY ID)
  //*** fetch consumer demand details based on consumerId ***
  Future<void> getConsumerDemandDetail(consumerId) async {
   isDataProcessing.value == true;
   Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    consumerDemands.value.clear();
    meterDetails.value.clear();
    basicDetails.value.clear();
    totalSumDemand.value = '';
    totalPenalty.value = '';
    APIResponse response = await WaterConsumerSearchProvider().ConsumerListDemandDetails(consumerId);
      Get.back();
    if (response.error == false) {
      Map<String, dynamic> DemandDetailData = response.data;
      demandStatus.value = DemandDetailData['demandStatus'].toString();
      consumerDemands.value = List<Map<String, dynamic>>.from(DemandDetailData['consumerDemands']);
      meterDetails.value = Map<String, dynamic>.from(DemandDetailData['meterDetails']);
      basicDetails.value = Map<String, dynamic>.from(DemandDetailData['meterDetails']['basicDetails']);
      totalSumDemand.value = DemandDetailData['totalSumDemand'].toString();
      totalPenalty.value = DemandDetailData['totalPenalty'].toString();
    } else {
      if(response.data is Map<String, dynamic> && response.data.length > 0){
        demandStatus.value = response.data['demandStatus'].toString();
      } else {
        Get.snackbar(
          'Oops!!!',
          response.errorMessage,
          backgroundColor: Colors.pinkAccent,
          colorText: Colors.white,
        );
      }
      // Get.to(GenerateDemandView());
    }
   isDataProcessing.value == false;
  }




  //CALCULATE DEMAND
  //*** function to fetches details of consumer demands ***
  Future<void> getCalculationDemandDetails() async {
    isLoading.value = true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    Calculation_totalPayAmount.value = "";
    Calculation_totalPenalty.value = "";
    Calculation_totalDemand.value = "";
    Calculation_totalAdvance.value = "";
    Calculation_totalRebate.value = "";
    Calculation_remaningAdvanceAmount.value = "";
    APIResponse response = await WaterConsumerSearchProvider().CalculateConsumerDeamnd(
      {
        "consumerId": consumer_id_pay.toString(),
        "demandUpto": selectDateUpto.value.toString(),
      }
    );
    if (response.error == false) {
      Map<String, dynamic> CalculatedDemandDetailData = response.data;
      Calculation_totalPayAmount.value = CalculatedDemandDetailData['totalPayAmount'].toString();
      Calculation_totalPenalty.value = CalculatedDemandDetailData['totalPenalty'].toString();
      Calculation_totalDemand.value = CalculatedDemandDetailData['totalDemand'].toString();
      Calculation_totalAdvance.value = CalculatedDemandDetailData['totalAdvance'].toString();
      Calculation_totalRebate.value = CalculatedDemandDetailData['totalRebate'].toString();
      Calculation_remaningAdvanceAmount.value = CalculatedDemandDetailData['remaningAdvanceAmount'].toString();
      isLoading.value = false;
      Get.back();
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }


//DETAIL AFTER PAYMENT FOR RECEIPT
//***  handles the payment process and triggers the generation of receipts after successful payment ***
  Future<void>DemandPaymentDetail() async {
    isLoading.value = true;
    transaction_Id = "";
    transaction_No = "";
    consumerId = "";
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    APIResponse response = await WaterConsumerSearchProvider().ConsumerDemandPayment({
      'consumerId': consumer_id_pay.toString(),
      'demandUpto': selectDateUpto.value.toString(),
      'amount': Calculation_totalPayAmount.value,
      'paymentMode': demand_PaymentMode.value.toString(),
      'bankName': bankNameController.value.text,
      'branchName': branchNameController.value.text,
      'chequeNo': chequeNoController.value.text,
      'chequeDate': chequeDateController.value.text,
      'remarks': remarksController.value.text,
    });
    if (response.error == false) {
    Map<String, dynamic> AfterPaymentData = response.data;
    transaction_Id = AfterPaymentData['tranId'].toString();
    transaction_No = AfterPaymentData['tranNo'].toString();
    consumerId = AfterPaymentData['consumerId'].toString();
      isLoading.value = false;
      Get.back();
    //  AFTER PAYMENT IS DONE DIALOGUE WILL OPEN FOR PRINT RECEIPT
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.task_alt_rounded, size: 85.0, color: Colors.green),
            SizedBox(height: 7,),
            Text(
              response.errorMessage,
              style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontStyle: FontStyle.normal,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 5,),
            Flexible(
              child: Text(
               "Don't go back without printing receipt. Once you go back you won't be able to print the payment receipt",
                style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // clearAllFields();
                  Get.back();
                  Get.back();
                  Get.back();
                },
                child: Text("Close"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await getPaymentReceipt(transaction_No);
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
      response.errorMessage,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }




  //PAYMENT RECEIPT
  //*** generates payment receipts based on transactions ***
  Future<void> getPaymentReceipt(transaction_No) async {
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
    ReceiptUlbId = "";
    ReceiptWardNo = "";
    ReceiptZoneNo = "";
    ReceiptnewWardNo = "";
    towards = "";
    ConsumerNo = "";
    tax_description = "";
    totalPaidAmount = "";
    paidAmtInWords = "";
    tcName = "";
    tcMobile = "";
    website = "";
    tollFreeNo = "";
    bookNo = "";
    bindBookNo  = "";
    meterNo  = "";
    lastMeterReadingDate  = "";
    currentMeterReadingDate  = "";
    description  = "";
    session  = "";
    // tranId = printTranId.toString();
    APIResponse response = await WaterConsumerSearchProvider().ComsumerReceiptDetail(transaction_No);
    if (response.error == false) {
      // var data = response.data;
      Map<String, dynamic> data = response.data;
      departmentSection = data['departmentSection'].toString();
      accountDescription = data['accountDescription'].toString();
      transactionDate = data['transactionDate'].toString();
      transactionTime = data['transactionTime'].toString();
      session = data['session'].toString();
      ConsumerNo = data['consumerNo'].toString();
      transactionNo = data['transactionNo'].toString();
      customerName = data['customerName'].toString();
      mobileNo = data['customerMobile'].toString();
      ReceiptAddress = data['address'].toString();
      paidFrom = data['paidFrom'].toString();
      paidUpto = data['paidUpto'].toString();
      paymentMode = data['paymentMode'].toString();
      bankName = data['bankName'].toString();
      branchName = data['branchName'].toString();
      chequeNo = data['chequeNo'].toString();
      chequeDate = data['chequeDate'].toString();
      demandAmount = data['demandAmount'].toString();
      ReceiptWardNo = data['WardNo'].toString();
      ReceiptZoneNo = data['zoneName'].toString();
      towards = data['towards'].toString();
      description = data['description'].toString();
      totalPaidAmount = data['totalPaidAmount'].toString();
      lastMeterReadingDate = data['lastMeterReadingDate'].toString();
      currentMeterReadingDate = data['currentMeterReadingDate'].toString();
      paidAmtInWords = data['paidAmtInWords'].toString();
      tcName = data['empName'].toString();
      tcMobile = data['empMobile'].toString();
      // website = data['receiptDtls']['ulbDetails']['website'].toString();
      // tollFreeNo = data['receiptDtls']['ulbDetails']['toll_free_no'].toString();
      bookNo = data['bookNo'].toString();
      bindBookNo = data['bindBookNo'].toString();
      meterNo = data['meterNo'].toString();
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    Get.to(PrintReceiptView());
  }


  //PRINT AFTER PAYMENT(POS)
  static const MethodChannel _channel = MethodChannel('com.amcakola.tc_verification_app/com.pinelabs.masterapp');
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
                    "( Payment Receipt )\n"
                    "( $session )\n"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                "DataToPrint":
                "Date: $transactionDate\n"
                    "Time: $transactionTime\n"
                    "Book No: $bookNo\n"
                    "Receipt Book No: $bindBookNo\n"
                    "   ********************\n"
                    "Desc: $description\n"
                    "Zone: $ReceiptZoneNo\n"
                    "Ward No.: $ReceiptWardNo\n"
                    "Consumer No.: $ConsumerNo\n"
                    "Tax Ow. Name: $customerName\n"
                    "Address: $ReceiptAddress\n"
                     "   ********************\n"
                    "Meter No.: $meterNo\n"
                    "Last Meter Reading: $lastMeterReadingDate\n"
                    "Current Meter Reading: $currentMeterReadingDate\n"
                    "Trans No.: $transaction_No\n"
                    "Mode: $paymentMode\n"
                    "${paymentMode == "Cash" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Bank Name: $bankName\n"}"
                    "${paymentMode == "Cash" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Branch Name: $branchName\n"}"
                    "${paymentMode == "Cash" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Cheque No: $chequeNo\n"}"
                    "${paymentMode == "Cash" || paymentMode == "CARD" || paymentMode == "UPI" ? "" : "Cheque Date: $chequeDate\n"}"
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
                    "For More Details Please visit: www.akolaamc.org\n"
                    "+911800907909\n"
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


  //HANDLE RESPONSE MESSAGE(POS)
  void handlePaymentResponse(String response) {
    try {
      final Map<String, dynamic> responseData = jsonDecode(response);
    } catch (e) {
      print('Error decoding JSON: $e');
    }
  }



  //PAYMENT HISTORY
  //*** fetches payment history ***
  Future<void> getPaymentHistoryDetail(consumerId) async {
    consumerReceiptDetails.value.clear();
    APIResponse response = await WaterConsumerSearchProvider().ComsumerPaymentHistory(consumerId);
    PaymentHistoryById.clear();
    if (response.error == false) {
      Map<String, dynamic> idData = response.data;
      consumerReceiptDetails.value = List<Map<String, dynamic>>.from(idData['Consumer']);
     // PaymentHistoryById.add(id_Data);
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
  }


  //***DEMAND DETAIL
  //GENERATE DEMAND
  //*** handle demand generation based on consumer data ***
  Future<bool> generateDemand(consumerId,{String type = ''}) async {
    isDataProcessing.value == true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    var file1;
    if(type != 'Fixed') {
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
    APIResponse response = await WaterConsumerSearchProvider().GenerateConsumerDemand(consumerId ,{
      'finalRading':finalMeterReading.text.toString(),
      'demandUpto':demandDateUpto.text.toString(),
      'imagePath[0]': file1,
    });
    if (response.error == false) {
      var data = response.data;
      generatedDemandList.add(data);
      Get.back();
      return true;
    } else {
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
      isDataProcessing.value == false;
      return false;
    }
  }




  //PART PAYMENT
    Future<void> PartPaymentDetail({String type = ''}) async {
      isLoading.value = true;
      transaction_Id = "";
      transaction_No = "";
      consumerId = "";
      Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
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
      APIResponse response = await WaterConsumerSearchProvider().ConsumerPartPayment({
        'consumerId': consumer_id_pay.toString(),
        'demandUpto': selectDateUpto.value.toString(),
        'amount': partPayment_amountController.value.text,
        'paymentMode': demand_PaymentMode.value.toString(),
        'bankName': partPayment_bankNameController.value.text,
        'branchName': partPayment_branchNameController.value.text,
        'chequeNo': partPayment_chequeNoController.value.text,
        'chequeDate': partPayment_chequeDateController.value.text,
        'remarks': partPayment_remarksController.value.text,
        'document': file1,
      });
    if (response.error == false) {
      Map<String, dynamic> AfterPaymentData = response.data;
      transaction_Id = AfterPaymentData['tranId'].toString();
      transaction_No = AfterPaymentData['tranNo'].toString();
      consumerId = AfterPaymentData['consumerId'].toString();
      isLoading.value = false;
      Get.back();
      // AFTER PAYMENT IS DONE DIALOGUE WILL OPEN FOR PRINT RECEIPT
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.task_alt_rounded, size: 85.0, color: Colors.green),
              SizedBox(height: 7,),
              Text(
                response.errorMessage,
                style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 5,),
              Flexible(
                child: Text(
                  "Don't go back without printing receipt.Once you go back you won't be able to print the payment receipt",
                  style: GoogleFonts.publicSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // clearAllFields();
                    Get.back();
                    Get.back();
                    Get.back();
                  },
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getPaymentReceipt(transaction_No);
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
        response.errorMessage,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }



  //CLEARING IMAGE FIELDS
  void resetImageFields() {
    _selectedFile1 = null;
    selectedImage1Path.value = "";
    selectedImage1Size.value = "";
    finalMeterReading.clear();
  }

  //CLEARING PART PAYMENT FIELD
  void resetPartPaymentFields() {
    _selectedFile1 = null;
    selectedImage1Path.value = "";
    selectedImage1Size.value = "";
    demand_PaymentMode.value = "";
    selectDateUpto.value = "";
    partPayment_amountController.clear();
    partPayment_bankNameController.clear();
    partPayment_branchNameController.clear();
    partPayment_chequeNoController.clear();
    partPayment_chequeDateController.clear();
    partPayment_remarksController.clear();
  }

  //CLEARING FULL PAYMENT FIELDS
  void resetFullPaymentFields() {
    _selectedFile1 = null;
    selectedImage1Path.value = "";
    selectedImage1Size.value = "";
    selectDateUpto.value = "";
    demand_PaymentMode.value = "";
    Calculation_totalPayAmount.value = '';
    bankNameController.clear();
    branchNameController.clear();
    chequeNoController.clear();
    chequeDateController.clear();
    remarksController.clear();
  }

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^PRINT  GENERATED  DEMAND TABLE***
  Future<void> printDemandTablePOS() async {
    if (Platform.isAndroid) {
      try {
        // Generate the receipt table
        String receiptTable = generateReceiptTable();
        // Generate the footer data

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
                    "Generated Demand \n"
                    "Water\n"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":22,
                "IsCenterAligned": true,
                "DataToPrint":
                " \n\n"
                "${receiptTable}"
                "- - - - - - - - - - - - - - -\n\n\n\n\n"
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



  //FORMAT OF GENERATED DEMAND TABLE
  String generateReceiptTable() {
    final StringBuffer tableText = StringBuffer();
    // column widths and spacing
    final List<int> columnWidths = [4, 12, 12, 8, 8, 8, 8]; //column widths
    final String columnSpacing = '   ';

    //table headers
    tableText.writeln(
        'SL'.padRight(columnWidths[0]) +
            'Date'.padRight(columnWidths[1]) +
            'From'.padRight(columnWidths[2]) +
            'Upto'.padRight(columnWidths[3]) +
            'Demand'.padRight(columnWidths[4]) +
            'Penalty'.padRight(columnWidths[5]) +
            'Type'.padRight(columnWidths[6]) +
            'Pay Amt'
    );

    // separator line
    tableText.writeln(''.padRight(columnWidths.reduce((a, b) => a + b), '-'));

    // table data
    for (var index = 0; index < consumerDemands.value.length; index++) {
      final fyearWiseTax = consumerDemands.value[index];
      final serialNumber = (index + 1).toString();

      tableText.writeln(
          serialNumber.padRight(columnWidths[0]) +
              nullToNA(fyearWiseTax['demand_from']).padRight(columnWidths[1]) +
              nullToNA(fyearWiseTax['demand_upto']).padRight(columnWidths[2]) +
              nullToNA(fyearWiseTax['amount']).padRight(columnWidths[3]) +
              nullToNA(fyearWiseTax['penalty']).padRight(columnWidths[4]) +
              nullToNA(fyearWiseTax['connection_type']).padRight(columnWidths[5]) +
              nullToNA(fyearWiseTax['balance_amount']).padRight(columnWidths[6])
      );
    }

    return tableText.toString();
  }




  //^^^ Image Handling ^^^
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
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "Mb";
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
            (File(selectedImage1Path.value).lengthSync() / 1024 / 1024).toStringAsFixed(2) + "Mb";
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
