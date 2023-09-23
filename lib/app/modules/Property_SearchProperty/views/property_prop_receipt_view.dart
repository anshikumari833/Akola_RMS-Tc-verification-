import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/cluster.dart';
import '../../../widgets/custom_appbar.dart';
import '../controllers/SearchHolding_controller.dart';

class PropReceiptView extends GetView<PropertyPayPropertyTaxController> {
  const PropReceiptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
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
              buildRow('Transaction No. :', controller.transactionNo),
              SizedBox(height: 8.0),
              buildRow('Holding No. :', controller.applicationNo),
              SizedBox(height: 8.0),
              buildRow('Ward No. :', controller.ReceiptWardNo),
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
              buildRow('Paid Upto :', controller.paidUpto),
              SizedBox(height: 8.0),
              buildRow('Demand Amount :', controller.demandAmount),
              SizedBox(height: 8.0),
              buildRow('Payment Mode :', controller.paymentMode),
              SizedBox(height: 8.0),
              buildRow('Bank Name :', controller.bankName),
              SizedBox(height: 8.0),
              buildRow('Branch Name :', controller.branchName),
              SizedBox(height: 8.0),
              buildRow('Cheque No :', controller.chequeNo),
              SizedBox(height: 8.0),
              buildRow('Cheque Date :', controller.chequeDate),
              SizedBox(height: 8.0),
              buildRow('Amount Paid :', controller.totalPaidAmount),
              SizedBox(height: 8.0),
              // Display penalty amounts if available
              if (controller.penaltyAmounts.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 16.0),
                    // Text(
                    //   'Penalty Amounts:',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(height: 8.0),
                    // Iterate through the penaltyAmounts list and display each amount
                    for (var penaltyAmount in controller.penaltyAmounts)
                      buildRow('Penalty Amount:', penaltyAmount),
                  ],
                ),
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
