import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/api_response.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../providers/property_DailyTcReport_provider.dart';

class PropertyDailyTcReportController extends GetxController {
  //TODO: Implement PropertyDailyTcReportController
  var reportList = List<dynamic>.empty(growable: true);
  var isDataProcessing = false.obs;
  final count = 0.obs;
  late TextEditingController dateFromController;
  late TextEditingController dateUptoController;
  @override
  void onInit() {
    super.onInit();
    dateFromController = TextEditingController();
    dateUptoController = TextEditingController();

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
  List<Map<String, dynamic>> report_detailData = [];
  List<Map<String, dynamic>> report_footerData = [];
  Future<void> getReportDetail(int page) async {
    isLoading.value = true;
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
  }
  //***************************************************************************************************************************************
  //RECEIPT TABLE
  // String generateReceiptTable() {
  //   String tableText = '';
  //   // Add table headers
  //   tableText += 'SL\tTrans No.\tDate\tMode\tAmount\n';
  //   // Add table data
  //   for (var entry in report_detailData.asMap().entries) {
  //     final int serialNumber = entry.key + 1;
  //     final rowData = entry.value;
  //     tableText += '$serialNumber\t${rowData['tran_no']}\t${rowData['tran_date']}\t${rowData['transaction_mode']}\t${rowData['amount']}\n';
  //   }
  //   return tableText;
  // }
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



