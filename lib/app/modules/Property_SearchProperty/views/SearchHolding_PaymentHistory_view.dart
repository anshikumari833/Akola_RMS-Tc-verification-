import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/SearchHolding_controller.dart';

class PropertyPaymentHistoryView
    extends GetView<PropertyPayPropertyTaxController> {
  const PropertyPaymentHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),
              //Basic detail
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined, color: Colors.indigo),
                    Text(
                      '  Basic Details',
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
                margin: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailsRow('Holding No', controller.searchedDataById[0].holdingNo),
                    _buildDetailsRow('Property No', controller.searchedDataById[0].propertyNo),
                    _buildDetailsRow('Applicant Name', controller.searchedDataById[0].applicantName),
                    _buildDetailsRow('Property Address', controller.searchedDataById[0].propAddress),
                    _buildDetailsRow('Zone',controller.searchedDataById[0].zoneName.toString() ),
                    _buildDetailsRow('Ward No',  controller.searchedDataById[0].wardNo.toString()),
                    _buildDetailsRow('Ownership Type', controller.searchedDataById[0].ownershipType),
                    _buildDetailsRow('Property Type', controller.searchedDataById[0].propertyType),
                    // _buildDetailsRow('Property has Mobile Tower(s)?', controller.searchedDataById[0].isMobileTower.toString() == 'true' ? 'Yes' : 'No',),
                    // _buildDetailsRow('Property has Hoarding Board(s)?', controller.searchedDataById[0].isHoardingBoard.toString() == 'true' ? 'Yes' : 'No',),
                    // _buildDetailsRow('Is Property a Petrol Pump?', controller.searchedDataById[0].isPetrolPump.toString() == 'true' ? 'Yes' : 'No',),
                    // _buildDetailsRow('Rainwater Harvesting Provision?', controller.searchedDataById[0].isWaterHarvesting.toString() == 'true' ? 'Yes' : 'No',),
                  ],
                ),
              ),
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
                            DataColumn(label: Center(child: Text('From Qtr/Year'))),
                            DataColumn(label: Center(child: Text('Upto Qtr/Year'))),
                            DataColumn(label: Center(child: Text('Amount'))),
                            DataColumn(label: Center(child: Text('Receipt 1'))),
                          ],
                          rows: [
                            for (var holding in controller.holdingData)
                              DataRow(
                                cells: [
                                  DataCell(Center(child: Text(holding['id'].toString()))),
                                  DataCell(Center(child: Text(holding['tran_no']))),
                                  DataCell(Center(child: Text(holding['payment_mode']))),
                                  DataCell(Center(child: Text(holding['tran_date']))),
                                  DataCell(Center(child: Text('${holding['from_qtr']}/${holding['from_fyear']}'))),
                                  DataCell(Center(child: Text('${holding['to_qtr']}/${holding['to_fyear']}'))),
                                  DataCell(Center(child: Text(holding['amount']))),
                                  DataCell(Center(child: ElevatedButton(onPressed: () { controller.getPaymentReceipt(holding['tran_no']);},child:Text('  View \nReceipt')))),
                                ],
                              ),
                            for (var saf in controller.safData)
                              DataRow(
                                cells: [
                                  DataCell(Center(child: Text(saf['id'].toString()))),
                                  DataCell(Center(child: Text(saf['tran_no']))),
                                  DataCell(Center(child: Text(saf['payment_mode']))),
                                  DataCell(Center(child: Text(saf['tran_date']))),
                                  DataCell(Center(child: Text('${saf['from_qtr']}/${saf['from_fyear']}'))),
                                  DataCell(Center(child: Text('${saf['to_qtr']}/${saf['to_fyear']}'))),
                                  DataCell(Center(child: Text(saf['amount']))),
                                  DataCell(Center(child: ElevatedButton(onPressed: () {}, child: Text(' View \nReceipt')))),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70,),
            ],
          ),),
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
