import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/water_consumer_search_controller.dart';

class WaterPaymentHistoryView extends GetView<WaterConsumerSearchController> {
  const WaterPaymentHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Payment History '),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:10,),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.receipt_long, color: Colors.indigo),
                  Text(
                    '  Receipt Details',
                    style: GoogleFonts.publicSans(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(1.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 25,
                        columns: [
                          DataColumn(label: Center(child: Text('#'))),
                          DataColumn(label: Center(child: Text('Transaction No'))),
                          DataColumn(label: Center(child: Text('Payment Mode'))),
                          DataColumn(label: Center(child: Text('Date'))),
                          DataColumn(label: Center(child: Text('Type'))),
                          DataColumn(label: Center(child: Text('Paid For'))),
                          DataColumn(label: Center(child: Text('Amount'))),
                          DataColumn(label: Center(child: Text('Receipt 1'))),
                        ],
                        rows: [
                          for (var show_Detail in controller.consumerReceiptDetails.value)
                            DataRow(
                              cells: [
                                DataCell(Center(child: Text(show_Detail['id'].toString()))),
                                DataCell(Center(child: Text(show_Detail['tran_no']))),
                                DataCell(Center(child: Text(show_Detail['payment_mode']))),
                                DataCell(Center(child: Text(show_Detail['tran_date']))),
                                DataCell(Center(child: Text(show_Detail['tran_type']))),
                                DataCell(Center(child: Text(show_Detail['tran_date']))),
                                DataCell(Center(child: Text(show_Detail['amount']))),
                                DataCell(Center(child: ElevatedButton(onPressed: () {controller.getPaymentReceipt(show_Detail['tran_no']);},child:Text('  View \nReceipt')))),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 145,
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
            style: GoogleFonts.publicSans(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent),
          ),
        ),
      ],
    ),
  );
}