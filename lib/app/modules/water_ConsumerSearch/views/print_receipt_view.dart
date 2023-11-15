import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/cluster.dart';
import '../controllers/water_consumer_search_controller.dart';

class PrintReceiptView extends GetView<WaterConsumerSearchController> {
  const PrintReceiptView({Key? key}) : super(key: key);
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
                  Text(controller.session,style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10.0),
              buildRow('Date :', controller.transactionDate),
              SizedBox(height: 8.0),
              buildRow('Time :', controller.transactionTime),
              SizedBox(height: 8.0),
              buildRow('Book No :', controller.bookNo),
              SizedBox(height: 8.0),
              buildRow('Receipt Book No :', controller.bindBookNo),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('****************************************'),
                ],
              ),
              SizedBox(height: 16.0),
              buildRow('Description :', controller.description),
              SizedBox(height: 8.0),
              buildRow('Zone. :', controller.ReceiptZoneNo),
              SizedBox(height: 8.0),
              buildRow('Ward No. :', controller.ReceiptWardNo),
              SizedBox(height: 8.0),
              buildRow('Consumer No. :', controller.ConsumerNo),
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
              buildRow('Meter No:', controller.meterNo),
              SizedBox(height: 8.0),
              buildRow('Last Meter Reading:', indianDate(controller.lastMeterReadingDate)),
              SizedBox(height: 8.0),
              buildRow('Current Meter Reading:', indianDate(controller.currentMeterReadingDate)),
              SizedBox(height: 8.0),
              buildRow('Trans No:', controller.transactionNo),
              SizedBox(height: 8.0),
              buildRow('Mode:', controller.paymentMode),
              SizedBox(height: 8.0),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
                buildRow('Bank Name:', controller.bankName),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
              SizedBox(height: 8.0),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
                buildRow('Branch Name:', controller.branchName),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
              SizedBox(height: 8.0),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
                buildRow('Cheque No:', controller.chequeNo),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
              SizedBox(height: 8.0),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
                buildRow('Cheque Date:',controller.chequeDate),
              if (controller.paymentMode != "Cash" && controller.paymentMode != "CARD" && controller.paymentMode != "UPI")
              SizedBox(height: 8.0),
              buildRow('Total Amount Paid:', controller.totalPaidAmount),
              SizedBox(height: 8.0),
              buildRow('In Words:', controller.paidAmtInWords),
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
              Center(child: Text("www.akolaamc.org")),
              SizedBox(height:10.0),
              Center(child: Text('+911800907909')),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Please keep this Bill For Future Reference',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () async {
                  await controller.getPaymentReceipt(controller.transaction_No);
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
