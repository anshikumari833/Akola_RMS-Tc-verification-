import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/cluster.dart';
import '../controllers/SearchHolding_controller.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class PropReceiptView extends GetView<PropertyPayPropertyTaxController> {
  const PropReceiptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.red,),
                  Flexible(child: Text("  This Receipt on Screen is only for Tc to view   \n   all Details",style: TextStyle(color: Colors.red),))
                ],
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AKola Municipal Corporation',style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height:8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('( Tax Receipt )',style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.paidFrom,style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10.0),
              buildRow('Date :', controller.transactionDate),
              SizedBox(height: 8.0),
              buildRow('Time :', controller.transactionTime),
              SizedBox(height: 8.0),
              buildRow('Book No :', controller.bookNo),
              SizedBox(height: 8.0),
              buildRow('Receipt Book No :', controller.receiptNo),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('****************************************'),
                ],
              ),
              SizedBox(height: 16.0),
              buildRow('Description :', controller.accountDescription),
              SizedBox(height: 8.0),
              buildRow('Zone. :', controller.ReceiptZoneNo),
              SizedBox(height: 8.0),
              buildRow('Ward No. :', controller.ReceiptWardNo),
              SizedBox(height: 8.0),
              buildRow('Holding No. :', controller.applicationNo),
              SizedBox(height: 8.0),
              buildRow('Property No. :', controller.propertyNo),
              SizedBox(height: 8.0),
              buildRow('Tax Ow. Name :', controller.customerName),
              SizedBox(height: 8.0),
              buildFlexibleRow('Address :', controller.ReceiptAddress),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('****************************************'),
                ],
              ),
              SizedBox(height: 16.0),
              buildRow('Transaction No. :', controller.transactionNo),
              SizedBox(height: 8.0),
              buildRow('Paid Upto :', controller.paidUpto),
              SizedBox(height: 8.0),
              buildRow('Mode :', controller.paymentMode),
              SizedBox(height: 8.0),
              buildRow('Current Demand :', controller.demandAmount),
              SizedBox(height: 8.0),
              buildRow('Arrear :', controller.arrearAmount),
              // Dynamic rows for penalty rebates
              if (controller.penaltyRebatesList.isNotEmpty)
                SizedBox(height: 8.0),
              // Create rows for penalty rebates
              for (final penaltyRebate in controller.penaltyRebatesList)
                buildRow(
                  penaltyRebate['head_name'],
                  'Amount: ${penaltyRebate['amount']}',
                ),
              SizedBox(height: 8.0),
              buildRow('Bank Name :', controller.bankName),
              SizedBox(height: 8.0),
              buildRow('Branch Name :', controller.branchName),
              SizedBox(height: 8.0),
              buildRow('Cheque No :', controller.chequeNo),
              SizedBox(height: 8.0),
              buildRow('Cheque Date :', controller.chequeDate),
              SizedBox(height: 8.0),
              buildRow('Total Amount Paid :', controller.totalPaidAmount),
              SizedBox(height: 8.0),
              buildRow('In Words :', controller.paidAmtInWords),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('****************************************'),
                ],
              ),
              SizedBox(height: 16.0),
              buildRow('TC Name :', controller.tcName),
              SizedBox(height: 8.0),
              buildRow('Mobile No :', controller.tcMobile),
              SizedBox(height: 30.0),
              Center(
                child: Text(
                  'Thank You!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'For Details Please visit:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              Center(child: Text(controller.website)),
              SizedBox(height:10.0),
              Center(child: Text(controller.tollFreeNo)),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Please keep this Bill For Future Reference',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40.0),
              // ElevatedButton(
              //   onPressed: () async {
              //     await generateAndSavePDF(context);
              //   },
              //   child: Text('Download Receipt as PDF'),
              // ),
              ElevatedButton(
                onPressed: () async {
                  await controller.getPaymentReceipt(controller.tranId);
                  controller.openPrintPOS();
                },
                child: Text("Print Receipt"),
              ),
               SizedBox(height: 40.0),
            ],
          ),
        ));
  }
}

Future<void> generateAndSavePDF(BuildContext context) async {
  final pdf = pdfWidgets.Document();

  // Add content to the PDF here
  pdf.addPage(
    pdfWidgets.Page(
      build: (context) {
        return pdfWidgets.Center(
          child: pdfWidgets.Text('Hello, PDF!'),
        );
      },
    ),
  );

  // Get the document directory on the device
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/receipt.pdf';

  // Save the PDF file to the device's storage
  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  // Show a dialog or navigate to a new screen to allow the user to download the PDF
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Download Receipt'),
        content: Text('The receipt has been downloaded as a PDF.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


Row buildRow(String label, String value) {
  return Row(
    children: [
      Text(label),
      SizedBox(width:10.0),
      Flexible(
        child: Text(
          nullToNA(value),
        ),
      ),
    ],
  );
}

Row buildFlexibleRow(String label, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      SizedBox(width: 10.0),
      Expanded(
        child: Text(
          nullToNA(value),
        ),
      ),
    ],
  );
}

Widget buildPenaltyRebateRow(String headName, String amount, bool isRebate) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8.0),
      buildRow('Head Name:', headName),
      buildRow('Amount:', amount),
      buildRow('Is Rebate:', isRebate.toString()),
      SizedBox(height: 8.0),
    ],
  );
}
