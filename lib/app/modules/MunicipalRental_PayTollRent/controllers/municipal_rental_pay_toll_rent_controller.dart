import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    payableAmount.value = "";
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
  var receiptTollId = "";
  RxBool isLoading = false.obs;
  // PAYMENT
  Future<bool> TollPayment_id() async {
    isLoading.value = true;
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    APIResponse response = await MunicipalRentalPayTollRentProvider().payTollTax({
      'tollId': toll_Id.toString(),
      'dateUpto': dateUptoController.value.text.toString(),
      'dateFrom': dateFromController.value.text.toString(),
      'paymentMode': toll_PaymentMode.value.toString(),
    });
    if (response.error == false) {
      Map<String, dynamic> data = response.data;
      payableAmount.value = data['tollAmount'].toString();
      receiptTollId= data['tollId'].toString();
      isLoading.value = false;
      Get.back();
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
                   await getPaymentReceipt(receiptTollId);
                    // openPrintPOS();
                  },
                  child: Text("Print Receipt"),
                ),
              ],
            ),
          ],
        ),
      );
      return true;
    } else {
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
      return false;
    }
  }


  void resetFields() {
    dateFromController.clear();
    dateUptoController.clear();
  }


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

  Future<void> getPaymentReceipt(receiptTollId) async {
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
    APIResponse response = await MunicipalRentalPayTollRentProvider().paymentReceiptDetail(receiptTollId);
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
    // Get.to(PrintReceiptView());
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
