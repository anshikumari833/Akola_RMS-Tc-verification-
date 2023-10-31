import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../common/api_response.dart';
import '../providers/property_DailyTcReport_provider.dart';
import '../views/property_daily_search_tc_list_view.dart';

class PropertyDailyTcReportController extends GetxController {
  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();

  var reportList = List<dynamic>.empty(growable: true);
  var isDataProcessing = false.obs;
  final count = 0.obs;
  late TextEditingController dateFromController;
  late TextEditingController dateUptoController;
  final responseMessage = RxString("");
  @override
  void onInit() {
    super.onInit();
    dateFromController = TextEditingController();
    dateUptoController = TextEditingController();
    const platform = MethodChannel("com.amcakola.tc_verification_app/com.pinelabs.masterapp");
    platform. setMethodCallHandler((call) async {
      handlePaymentResponse(call.arguments);
      if (call.method == 'handleResponse') {
        responseMessage.value = call.arguments;
      }
    });

  }





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

  var report_totalCount;
  var report_totalAmount;
  var report_tcName;
  var report_tcMobileNo;
  List<Map<String, dynamic>> report_detailData = [];
  List<Map<String, dynamic>> report_footerData = [];
  Future<void> getReportDetail(int page) async {
    isLoading.value = true;
    // Clear the variables and lists before populating them with new data
    report_totalCount = null;
    report_totalAmount = null;
    report_detailData.clear();
    report_footerData.clear();
    reportList.clear();
    APIResponse response = await PropertyDailyTcReportProvider().searchReportDetail(page, perPage,{
      "fromDate": dateFromController.text.toString(),
      "uptoDate": dateUptoController.text.toString(),
    });
    // condition for response error
    if ( response.error == false) {
      Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
      report_totalCount = responseData['totalCount'].toString();
      report_totalAmount = responseData['totalAmount'].toString();
      report_tcName = responseData['tcName'].toString();
      report_tcMobileNo = responseData['tcMobile'].toString();
      report_detailData = List<Map<String, dynamic>>.from(responseData['data']);
      report_footerData = List<Map<String, dynamic>>.from(responseData['footer']);
    } else {
      Get.snackbar(
        'Oops!!!',
        response.errorMessage,
        backgroundColor: Colors.pinkAccent,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
    Get.to(PropertyDailySearchTcListView());
  }
  //***************************************************************************************************************************************
  //RECEIPT TABLE
  String generateReceiptTable() {
    final StringBuffer tableText = StringBuffer();

    // Define column widths
    final List<int> columnWidths = [4, 10, 12, 6, 8]; // Adjust these widths as needed

    // Add table headers
    tableText.writeln('SL'.padRight(columnWidths[0]) +
        'Trans No.'.padRight(columnWidths[1]) +
        '  Date'.padRight(columnWidths[2]) +
        'Mode'.padRight(columnWidths[3]) +
        'Amt');
    // Add space after the header
    tableText.writeln(''); //empty lines
    // tableText.writeln(''.padRight(columnWidths.reduce((a, b) => a + b), '-'));

    // Add table data
    for (var entry in report_detailData.asMap().entries) {
      final int serialNumber = entry.key + 1;
      final rowData = entry.value;

      // Extract the last 5 digits of the trans_no
      final String transNo = rowData['tran_no'];
      final String truncatedTransNo = transNo.length > 5 ? 'xxxx${transNo.substring(transNo.length - 5)}' : transNo;

      tableText.writeln('$serialNumber'.padRight(columnWidths[0]) +
          '$truncatedTransNo'.padRight(columnWidths[1]) +
          '${rowData['tran_date']}'.padRight(columnWidths[2]) +
          '${rowData['transaction_mode']}'.padRight(columnWidths[3]) +
          '${rowData['amount']}');
    }

    return tableText.toString();
  }
  
  //***************************************************************************************************************************************

  String generateFooterData(List<Map<String, dynamic>> footerData) {
    final StringBuffer footerText = StringBuffer();

    for (var footerItem in footerData) {
      footerText.writeln(
        '${footerItem['mode']}(${footerItem['count']})  >>  ${footerItem['amount']}',
      );
    }

    return footerText.toString();
  }

  //PRINT
  static const MethodChannel _channel = MethodChannel('com.amcakola.tc_verification_app/com.pinelabs.masterapp');
  Future<void> openPrintPOS() async {
    if (Platform.isAndroid) {
      try {
        // Generate the receipt table
        String receiptTable = generateReceiptTable();
        // Generate the footer data
        String footerData = generateFooterData(report_footerData);
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
                    "Collection Summary\n"
                    "Property\n"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                // "IsCenterAligned": true,
                "DataToPrint":
                    " - - - - - - - - - - -\n"
                    // "From Date: $dateFromController\n"
                    // "To Date: $dateUptoController\n"
                        "From Date: ${dateFromController.text.toString()}\n"
                        "To Date: ${dateUptoController.text.toString()}\n"
                        "Tc Name: $report_tcName\n"
                        "Mobile No: $report_tcMobileNo\n"
                        " - - - - - - - - - - -\n"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":22,
                // "IsCenterAligned": true,
                "DataToPrint":
                    "${receiptTable}"
              },
              {
                "PrintDataType": "0",
                "PrinterWidth":24,
                // "IsCenterAligned": true,
                "DataToPrint": " - - - - - - - - - - -\n"
                    "${footerData}"
                    "No of Transaction: $report_totalCount\n"
                    "Total Amount: $report_totalAmount\n"
                    " - - - - - - - - - - -\n\n\n"
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
    } catch (e) {
      print('Error decoding JSON: $e');
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



