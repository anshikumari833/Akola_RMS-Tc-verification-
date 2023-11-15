//PHASE - 1 (CODE OF DEMAND PAYMENT WITHOUT PART PAYMENT)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/SearchHolding_controller.dart';


class PropertyDemandDetailsView extends GetView<PropertyPayPropertyTaxController> {
  const PropertyDemandDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Demand Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  SingleChildScrollView(
          child: Column(
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
                      ' Basic Details',
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
              //DETAIL SECTION
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
                    _buildDetailsRow('Holding No',controller.basicDetails['holding_no'].toString()),
                    _buildDetailsRow('Property No',controller.basicDetails['property_no'].toString()),
                    _buildDetailsRow('Applicant Name',controller.basicDetails['applicant_name'].toString()),
                    _buildDetailsRow('Property Address',controller.basicDetails['prop_address'].toString()),
                    _buildDetailsRow('Zone',controller.basicDetails['zone_name'].toString()),
                    _buildDetailsRow('Ward No',controller.basicDetails['ward_no'].toString()),
                    _buildDetailsRow('Ownership Type',controller.basicDetails['ownership_type'].toString()),
                    _buildDetailsRow('Property Type', controller.basicDetails['property_type'].toString()),
                    // _buildDetailsRow('Property has Mobile Tower(s)?',controller.basicDetails['is_mobile_tower'].toString() == 'true' ? 'Yes' : 'No',),
                    // _buildDetailsRow('Property has Hoarding Board(s)?', controller.basicDetails['is_hoarding_board'].toString()== 'true' ? 'Yes' : 'No',),
                    // _buildDetailsRow('Is Property a Petrol Pump?',controller.basicDetails['is_petrol_pump'].toString() == 'true' ? 'Yes' : 'No',),
                    // _buildDetailsRow('Rainwater Harvesting Provision?', controller.basicDetails['is_water_harvesting'].toString() == 'true' ? 'Yes' : 'No',),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.paid_outlined, color: Colors.indigo),
                        Text(
                          '  Demand Details',
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
                  Obx(() {
                    if (  !controller.demandError.value && controller.paymentStatus.value == '0') {
                      return Column(
                        children: [
                          //DEMAND DETAIL TABLE
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange.shade100,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Icon(    Icons.auto_graph_outlined),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ' Demand Detail',
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            columnSpacing: 15,
                                            columns: [
                                              DataColumn(label: buildDecoratedContainer(Text('Financial Year '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Alv           '))),
                                              DataColumn(label: buildDecoratedContainer( Text('General Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Road Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('State Education Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Water Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Tree Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Professional Tax '))),
                                              DataColumn(label: buildDecoratedContainer( Text('Total Tax   '))),
                                              DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Monthly Penalty'))),)),
                                            ],
                                            rows: controller.demandList.map((fyearWiseTax) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['fyear'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['alv'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['general_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['road_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['firefighting_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['education_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['water_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['cleanliness_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['sewarage_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['tree_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['professional_tax'])))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['total_tax'])))),
                                                  DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: Text(nullToNA(fyearWiseTax['monthlyPenalty']))),)),
                                                ],
                                              );
                                            }).toList(),

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),],
                            ),
                          ),
                          //GRAND TAXES DETAIL TABLE
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Icon(    Icons.auto_graph_outlined),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ' Grand Tax ',
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        // padding: const EdgeInsets.all(10.0),
                                        padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            columnSpacing: 15,
                                            columns: [
                                              DataColumn(label: buildDecoratedContainer( Text('General Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Road Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Education Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Water Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Tree Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('State Education Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Professional Tax'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Tax 1'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Tax 2'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Tax 3'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Water Benefit'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Water Bill'))),
                                              DataColumn(label: buildDecoratedContainer( Text('SP Water Cess'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Drain Cess'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Light Cess'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Major Building'))),
                                              DataColumn(label: buildDecoratedContainer( Text('Total Tax'))),
                                              DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Monthly Penalty'))),)),
                                            ],
                                            rows: [
                                              DataRow(
                                                cells: [
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['general_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['road_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['firefighting_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['education_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['water_tax'].toString().toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['cleanliness_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['sewarage_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tree_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['state_education_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['professional_tax'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tax1'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tax2'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tax3'].toString().toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['water_benefit'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['water_bill'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['sp_water_cess'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['drain_cess'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['light_cess'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['major_building'].toString())))),
                                                  DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['total_tax'].toString())))),
                                                  DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(nullToNA(controller.grandTaxes['monthlyPenalty'].toString())))),)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),],
                            ),
                          ),
                          //TOTAL ARREAR AMOUNT
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(20),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height:5,),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text( " 🔸 Total Arrear Amount - ",
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                            SizedBox(width: 14),
                                            Text(controller.arrear.toString(),
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(10.0),
                                      //   child: Row(
                                      //     children: [
                                      //       Text( "  Monthly Penalty - ",
                                      //         style: GoogleFonts.publicSans(
                                      //           fontWeight: FontWeight.w600,
                                      //           fontSize: 15,
                                      //           fontStyle: FontStyle.normal,
                                      //           color: Colors.black,
                                      //         ),),
                                      //       SizedBox(width: 14),
                                      //       Text(controller.monthlyPenaltyAmount.toString(),
                                      //         style: GoogleFonts.publicSans(
                                      //           fontWeight: FontWeight.w600,
                                      //           fontSize: 15,
                                      //           fontStyle: FontStyle.normal,
                                      //           color: Colors.black,
                                      //         ),),
                                      //     ],
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text( " 🔸 Total Penalty Interest - ",
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                            SizedBox(width: 14),
                                            Text(controller.totalPenaltyIntrest.toString(),
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text( " 🔸 Current Demand - ",
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                            SizedBox(width: 14),
                                            Text(controller.currentDemand.toString(),
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          children: [
                                            Text( " 🔸 Total Amount - ",
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                            SizedBox(width: 14),
                                            Text(controller.payableAmount.toString(),
                                              style: GoogleFonts.publicSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height:5,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.library_add_check_outlined, color: Colors.indigo),
                                Text(
                                  ' Demand Payment',
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

                          //PAYMENT FIELDS
                          Divider(),
                          Obx(() =>
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[50],
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Icon(Icons.info_outlined, color: Colors.red,size: 23,),
                                              Text(
                                                ' Please Select Payment Option',
                                                style: GoogleFonts.publicSans(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          if(controller.arrearPayableAmt.toString() != "0.00" )
                                            Obx(() =>  Row(
                                              children: [
                                                Checkbox(
                                                  onChanged: (value) {
                                                    // Update the checkbox state when it's clicked
                                                    controller.isCheckboxChecked.value = value ?? false;
                                                  },
                                                  value: controller.isCheckboxChecked.value,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Please Select if you want to pay only arrear amount',
                                                    style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontStyle: FontStyle.normal,
                                                      // fontWeight: FontWeight.,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                          Visibility(
                                            visible: (
                                                controller.isCheckboxChecked.value
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          "( Arrear Amount + Penalty Interest )",
                                                          style: GoogleFonts.publicSans(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 12,
                                                            fontStyle: FontStyle.normal,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          "Total Arrear Amount to be paid is ${controller.arrearPayableAmt.toString()}",
                                                          style: GoogleFonts.publicSans(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 15,
                                                            fontStyle: FontStyle.normal,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          SizedBox(height:10,),
                                          //SELECT PAYMENT METHOD
                                          CustomDropdownFormField(
                                            headingText: 'Payment Method',
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("Cash"),
                                                value: "CASH",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("Cheque"),
                                                value: "CHEQUE",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("DD"),
                                                value: "DD",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("NEFT"),
                                                value: "NEFT",
                                              ),
                                              DropdownMenuItem(
                                                child: Text("ONILNE"),
                                                value: "ONLINE",
                                              ),
                                            ],
                                            hintText: 'Select an option',
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select an option';
                                              }
                                              return null;
                                            },
                                            onChanged: (DemandPayment) {
                                              controller.demand_PaymentMode.value = DemandPayment.toString();
                                            },
                                          ),
                                          Visibility(
                                            visible: controller.demand_PaymentMode.value == '',
                                            child: SizedBox(height: 30),
                                          ),
                                          //IN CASE OF CASH PAYEMNT
                                          if (controller.demand_PaymentMode.value == 'CASH')
                                            Container(
                                              child: Column(
                                                children: [
                                                  SizedBox(height:20,),
                                                  Container(
                                                    padding: const EdgeInsets.all(6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            // ElevatedButton(
                                                            //   onPressed: controller.isPaymentInProgress.value ? null : () => controller.DemandTaxPayment(type : 'cash'),
                                                            //   child: controller.isPaymentInProgress.value
                                                            //       ? Text('Processing Payment...')
                                                            //       : Obx(() {
                                                            //     if (controller.isCheckboxChecked.value) {
                                                            //       // Show the arrear amount when the checkbox is selected
                                                            //       return Row(
                                                            //         children: [
                                                            //           Text('Pay Now: '),
                                                            //           Text(
                                                            //             controller.arrearPayableAmt.toString(),
                                                            //             style: GoogleFonts.publicSans(
                                                            //               fontWeight: FontWeight.w600,
                                                            //               fontSize: 15,
                                                            //               fontStyle: FontStyle.normal,
                                                            //               color: Colors.white,
                                                            //             ),
                                                            //           ),
                                                            //         ],
                                                            //       );
                                                            //     } else {
                                                            //       // Show the payable amount when the checkbox is not selected
                                                            //       return Row(
                                                            //         children: [
                                                            //           Text('Pay Now: '),
                                                            //           Text(
                                                            //             controller.payableAmount.toString(),
                                                            //             style: GoogleFonts.publicSans(
                                                            //               fontWeight: FontWeight.w600,
                                                            //               fontSize: 15,
                                                            //               fontStyle: FontStyle.normal,
                                                            //               color: Colors.white,
                                                            //             ),
                                                            //           ),
                                                            //         ],
                                                            //       );
                                                            //     }
                                                            //   }),
                                                            // ),
                                                            ElevatedButton(
                                                              onPressed: controller.isPaymentInProgress.value
                                                                  ? null
                                                                  : () {
                                                                // Show a confirmation dialog
                                                                showDialog(
                                                                  context: context, // Replace 'context' with the appropriate context
                                                                  builder: (BuildContext context) {
                                                                    return AlertDialog(
                                                                      title: Text("Confirmation"),
                                                                      content: Text("Are you sure you want to proceed with the payment?"),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () {
                                                                            Navigator.of(context).pop(); // Close the dialog
                                                                          },
                                                                          child: Text("Cancel"),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () {
                                                                            Navigator.of(context).pop(); // Close the dialog
                                                                            controller.DemandTaxPayment(type: 'cash');
                                                                          },
                                                                          child: Text("Confirm"),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: controller.isPaymentInProgress.value
                                                                  ? Text('Processing Payment...')
                                                                  : Obx(() {
                                                                if (controller.isCheckboxChecked.value) {
                                                                  // Show the arrear amount when the checkbox is selected
                                                                  return Row(
                                                                    children: [
                                                                      Text('Pay Now: '),
                                                                      Text(
                                                                        controller.arrearPayableAmt.toString(),
                                                                        style: GoogleFonts.publicSans(
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 15,
                                                                          fontStyle: FontStyle.normal,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  // Show the payable amount when the checkbox is not selected
                                                                  return Row(
                                                                    children: [
                                                                      Text('Pay Now: '),
                                                                      Text(
                                                                        controller.payableAmount.toString(),
                                                                        style: GoogleFonts.publicSans(
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 15,
                                                                          fontStyle: FontStyle.normal,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }
                                                              }),
                                                            )

                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          //IN CASE OF CHEQUE/DD
                                          if (controller.demand_PaymentMode.value == 'CHEQUE'||controller.demand_PaymentMode.value == 'DD')
                                            Container(
                                              child: Column(
                                                children: [
                                                  //BANK NAME
                                                  CustomTextField(
                                                    controller: controller.bankNameController,
                                                    headingText: "Bank Name", hintText: "Enter Bank Name",validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'This field is required';
                                                    }
                                                    return "";
                                                  },),
                                                  //BRANCH NAME
                                                  CustomTextField(
                                                    controller: controller.branchNameController,
                                                    headingText: "Branch Name", hintText: "Enter Branch Name",validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'This field is required';
                                                    }
                                                    return "";
                                                  },),
                                                  //CHEQUE /DD NO
                                                  CustomTextField(
                                                    controller: controller.chequeNoController,
                                                    headingText: "Cheque/DD No", hintText: "Enter Cheque/DD No",validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'This field is required';
                                                    }
                                                    return "";
                                                  },),
                                                  //CHEQUE DD/DATE
                                                  CustomDateTimeField(
                                                    headingText: 'Cheque/DD Date ',
                                                    controller: controller.chequeDateController,
                                                    decoration: InputDecoration(
                                                      labelText: 'Date',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    format: DateFormat("yyyy-MM-dd"),
                                                    onShowPicker: (context, currentValue) {
                                                      return showDatePicker(
                                                          context: context,
                                                          firstDate: DateTime(1900),
                                                          initialDate: currentValue ?? DateTime.now(),
                                                          lastDate: DateTime(2100));
                                                    },
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Please select a date and time';
                                                      }
                                                      // Add more validation if needed
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(height: 30),
                                                  Obx(() => controller.selectedImage1Path == ''
                                                      ? Padding(
                                                    padding: const EdgeInsets.only(top: 20.0),
                                                    child: Center(
                                                      child: Text(
                                                        'Select image from camera/gallery',
                                                        style: TextStyle(fontSize: 10, color: Colors.black),
                                                      ),
                                                    ),
                                                  )
                                                      : Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Center(
                                                          child: Image.file(
                                                            File(controller.selectedImage1Path.value),
                                                          ),
                                                        ),
                                                      ),
                                                      Obx(() => Center(
                                                        child: Text(
                                                          controller.selectedImage1Size.value,
                                                          style: TextStyle(fontSize: 12, color: Colors.black),
                                                        ),
                                                      )),
                                                    ],
                                                  )),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      MaterialButton(
                                                        color: Colors.blueGrey.shade300,
                                                        child: Text(
                                                          "Camera",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          controller.getImage1(ImageSource.camera);
                                                        },
                                                      ),
                                                      MaterialButton(
                                                        color: Colors.teal.shade300,
                                                        child: Text(
                                                          "Device",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          controller.getImage1(ImageSource.gallery);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height:30,),
                                                  Container(
                                                    padding: const EdgeInsets.all(6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                controller.DemandTaxPayment();
                                                              },
                                                              child: Obx(() {
                                                                if (controller.isCheckboxChecked.value) {
                                                                  // arrear amount to be shown  when the checkbox is selected
                                                                  return Row(
                                                                    children: [
                                                                      Text('Pay Now: '),
                                                                      Text(
                                                                        controller.arrearPayableAmt.toString(),
                                                                        style: GoogleFonts.publicSans(
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 15,
                                                                          fontStyle: FontStyle.normal,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  // payable amount to be shown when the checkbox is not selected
                                                                  return Row(
                                                                    children: [
                                                                      Text('Pay Now: '),
                                                                      Text(
                                                                        controller.payableAmount.toString(),
                                                                        style: GoogleFonts.publicSans(
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 15,
                                                                          fontStyle: FontStyle.normal,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }
                                                              }),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height:30,),
                                                ],
                                              ),
                                            ),
                                          //IN CASE OF NEFT
                                          if (controller.demand_PaymentMode.value == 'NEFT')
                                            Container(
                                              child: Column(
                                                children: [
                                                  //CHEQUE DD/DATE
                                                  CustomDateTimeField(
                                                    headingText: 'Date ',
                                                    controller: controller.chequeDateController,
                                                    decoration: InputDecoration(
                                                      labelText: 'Date',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    format: DateFormat("yyyy-MM-dd"),
                                                    onShowPicker: (context, currentValue) {
                                                      return showDatePicker(
                                                          context: context,
                                                          firstDate: DateTime(1900),
                                                          initialDate: currentValue ?? DateTime.now(),
                                                          lastDate: DateTime(2100));
                                                    },
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Please select a date and time';
                                                      }
                                                      // Add more validation if needed
                                                      return null;
                                                    },
                                                  ),
                                                  //
                                                  CustomTextField(
                                                    controller: controller.chequeNoController,
                                                    headingText: "Trans Ref No/UTR No", hintText: "Enter UTR No",validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'This field is required';
                                                    }
                                                    return "";
                                                  },),
                                                  SizedBox(height:20,),
                                                  Container(
                                                    padding: const EdgeInsets.all(6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                controller.DemandTaxPayment();
                                                              },
                                                              child: Obx(() {
                                                                if (controller.isCheckboxChecked.value) {
                                                                  // arrear amount to be shown  when the checkbox is selected
                                                                  return Row(
                                                                    children: [
                                                                      Text('Pay Now: '),
                                                                      Text(
                                                                        controller.arrearPayableAmt.toString(),
                                                                        style: GoogleFonts.publicSans(
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 15,
                                                                          fontStyle: FontStyle.normal,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  // payable amount to be shown when the checkbox is not selected
                                                                  return Row(
                                                                    children: [
                                                                      Text('Pay Now: '),
                                                                      Text(
                                                                        controller.payableAmount.toString(),
                                                                        style: GoogleFonts.publicSans(
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 15,
                                                                          fontStyle: FontStyle.normal,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }
                                                              }),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          //IN CASE OF ONLINE PAYMENT (PINELAB)
                                          Visibility(
                                            visible: (
                                                controller.demand_PaymentMode.value == 'ONLINE'
                                            ),
                                            child:   Container(
                                              padding: const EdgeInsets.all(0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      //UPI BUTTON
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          await controller.DemandOnlineUpiPayment();
                                                          // await controller.openPineUPIPOS();
                                                        },
                                                        child: Obx(() {
                                                          if (controller.isCheckboxChecked.value) {
                                                            // arrear amount to be shown  when the checkbox is selected
                                                            return Row(
                                                              children: [
                                                                Text('  UPI  : '),
                                                                Text(
                                                                  controller.arrearPayableAmt.toString(),
                                                                  style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 15,
                                                                    fontStyle: FontStyle.normal,
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            // Show the payable amount when the checkbox is not selected
                                                            return Row(
                                                              children: [
                                                                Text('  UPI  : '),
                                                                Text(
                                                                  controller.payableAmount.toString(),
                                                                  style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 15,
                                                                    fontStyle: FontStyle.normal,
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                        }),
                                                      ),
                                                      //CARD BUTTON
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          await controller.DemandOnlineCardPayment();
                                                          // await controller.openPineCardPOS();
                                                        },
                                                        child: Obx(() {
                                                          if (controller.isCheckboxChecked.value) {
                                                            // arrear amount to be shown  when the checkbox is selected
                                                            return Row(
                                                              children: [
                                                                Text(' CARD  :   '),
                                                                Text(
                                                                  controller.arrearPayableAmt.toString(),
                                                                  style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 15,
                                                                    fontStyle: FontStyle.normal,
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          } else {
                                                            // payable amount to be shown when the checkbox is not selected
                                                            return Row(
                                                              children: [
                                                                Text(' CARD  :   '),
                                                                Text(
                                                                  controller.payableAmount.toString(),
                                                                  style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 15,
                                                                    fontStyle: FontStyle.normal,
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }
                                                        }),
                                                      ),
                                                    ],
                                                  ),
                                                  if(controller.pineLabStatus.value == true )
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        ElevatedButton(onPressed: () async {await controller.getUpiStatus();},
                                                            child: Row(
                                                              children: [
                                                                Text(' GET STATUS   ',style: GoogleFonts.publicSans(
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: 15,
                                                                  fontStyle: FontStyle.normal,
                                                                  color: Colors.white,
                                                                ),),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ),

                                          ),
                                          SizedBox(height: 15,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),)
                        ],
                      );
                    }
                    return Container();
                  }),
                  Obx(() {
                    if (!controller.demandError.value && controller.paymentStatus.value == '1') {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/property_DemandPaid.png",),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Icon(Icons.info_outlined,
                                color: Colors.redAccent, size: 20),
                                Text(' ALL DEMAND ARE CLEARED',style: GoogleFonts.publicSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.blueAccent,
                                ),),
                              ],
                            )
                          ],
                        ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.green[200],
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Row(
                        //       children: [
                        //         SizedBox(width: 14),
                        //         Expanded(
                        //           child: RichText(
                        //             text: TextSpan(
                        //               children: [
                        //                 WidgetSpan(
                        //                   child: Padding(
                        //                     padding: EdgeInsets.only(
                        //                         top: 3, right: 4, bottom: 1),
                        //                     child: Icon(Icons.info_outlined,
                        //                         color: Colors.black, size: 20),
                        //                   ),
                        //                 ),
                        //                 TextSpan(
                        //                   text:
                        //                   " ALL DEMAND ARE CLEARED ",
                        //                   style: GoogleFonts.publicSans(
                        //                     fontWeight: FontWeight.w500,
                        //                     fontSize: 15,
                        //                     fontStyle: FontStyle.normal,
                        //                     color: Colors.black,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      );
                    }
                    return Container();}),
                  Obx(() {
                    if (controller.demandError.value) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child:   Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0,1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 14),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 3, right: 4, bottom: 1),
                                              child: Icon(Icons.info_outlined,
                                                  color: Colors.red, size: 20),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            controller.demandMessage.value,
                                            style: GoogleFonts.publicSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  }),
                  // Visibility(
                  //   visible: (
                  //       !controller.demandError && controller.paymentStatus == '0'
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       //DEMAND DETAIL TABLE
                  //       Container(
                  //         margin: EdgeInsets.all(8.0),
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //               padding: const EdgeInsets.all(2),
                  //               decoration: BoxDecoration(
                  //                 color: Colors.deepOrange.shade100,
                  //                 borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  //               ),
                  //               child: Column(
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.all(8.0),
                  //                         child: Text(
                  //                           ' Demand Detail',
                  //                           style: GoogleFonts.publicSans(
                  //                             fontWeight: FontWeight.w600,
                  //                             fontSize: 15,
                  //                             fontStyle: FontStyle.normal,
                  //                             color: Colors.black,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Container(
                  //                     padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  //                     ),
                  //                     child: SingleChildScrollView(
                  //                       scrollDirection: Axis.horizontal,
                  //                       child: DataTable(
                  //                         columnSpacing: 15,
                  //                         columns: [
                  //                           DataColumn(label: buildDecoratedContainer(Text('Financial Year '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Alv           '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('General Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Road Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Education Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Water Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Tree Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Professional Tax '))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Total Tax   '))),
                  //                           DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Monthly Penalty'))),)),
                  //                         ],
                  //                         rows: controller.demandList.map((fyearWiseTax) {
                  //                           return DataRow(
                  //                             cells: [
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['fyear'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['alv'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['general_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['road_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['firefighting_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['education_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['water_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['cleanliness_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['sewarage_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['tree_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['professional_tax'])))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['total_tax'])))),
                  //                               DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: Text(nullToNA(fyearWiseTax['monthlyPenalty']))),)),
                  //                             ],
                  //                           );
                  //                         }).toList(),
                  //
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),],
                  //         ),
                  //       ),
                  //       //GRAND TAXES DETAIL TABLE
                  //       SizedBox(height: 10,),
                  //       Container(
                  //         margin: EdgeInsets.all(8.0),
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //               padding: const EdgeInsets.all(2),
                  //               decoration: BoxDecoration(
                  //                 color: Colors.amber.shade100,
                  //                 borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  //               ),
                  //               child: Column(
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.all(8.0),
                  //                         child: Text(
                  //                           ' Grand Tax ',
                  //                           style: GoogleFonts.publicSans(
                  //                             fontWeight: FontWeight.w600,
                  //                             fontSize: 15,
                  //                             fontStyle: FontStyle.normal,
                  //                             color: Colors.black,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Container(
                  //                     // padding: const EdgeInsets.all(10.0),
                  //                     padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  //                     ),
                  //                     child: SingleChildScrollView(
                  //                       scrollDirection: Axis.horizontal,
                  //                       child: DataTable(
                  //                         columnSpacing: 15,
                  //                         columns: [
                  //                           DataColumn(label: buildDecoratedContainer( Text('General Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Road Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Education Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Water Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Tree Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('State Education Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Professional Tax'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Tax 1'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Tax 2'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Tax 3'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Water Benefit'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Water Bill'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('SP Water Cess'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Drain Cess'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Light Cess'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Major Building'))),
                  //                           DataColumn(label: buildDecoratedContainer( Text('Total Tax'))),
                  //                           DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Monthly Penalty'))),)),
                  //                         ],
                  //                         rows: [
                  //                           DataRow(
                  //                             cells: [
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['general_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['road_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['firefighting_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['education_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['water_tax'].toString().toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['cleanliness_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['sewarage_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tree_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['state_education_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['professional_tax'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tax1'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tax2'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['tax3'].toString().toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['water_benefit'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['water_bill'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['sp_water_cess'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['drain_cess'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['light_cess'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['major_building'].toString())))),
                  //                               DataCell(buildDecoratedContainer(Text(nullToNA(controller.grandTaxes['total_tax'].toString())))),
                  //                               DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(nullToNA(controller.grandTaxes['monthlyPenalty'].toString())))),)),
                  //                             ],
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),],
                  //         ),
                  //       ),
                  //       //TOTAL ARREAR AMOUNT
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             color: Colors.lightGreen[100],
                  //             borderRadius: BorderRadius.circular(0),
                  //
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               SizedBox(height:5,),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 child: Row(
                  //                   children: [
                  //                     Text( "  Total Arrear Amount - ",
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                     SizedBox(width: 14),
                  //                     Text(controller.arrear.toString(),
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 child: Row(
                  //                   children: [
                  //                     Text( "  Monthly Penalty - ",
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                     SizedBox(width: 14),
                  //                     Text(controller.monthlyPenaltyAmount.toString(),
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 child: Row(
                  //                   children: [
                  //                     Text( "  Current Demand - ",
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                     SizedBox(width: 14),
                  //                     Text(controller.currentDemand.toString(),
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(10.0),
                  //                 child: Row(
                  //                   children: [
                  //                     Text( "  Total Amount - ",
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                     SizedBox(width: 14),
                  //                     Text(controller.payableAmount.toString(),
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w600,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(height:5,),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       SizedBox(height: 20,),
                  //       Container(
                  //         padding: const EdgeInsets.all(10),
                  //         child: Row(
                  //           children: [
                  //             Icon(Icons.library_add_check_outlined, color: Colors.indigo),
                  //             Text(
                  //               ' Demand Payment',
                  //               style: GoogleFonts.publicSans(
                  //                 fontSize: 16,
                  //                 fontStyle: FontStyle.normal,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.indigo,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //
                  //       //PAYMENT FIELDS
                  //       Divider(),
                  //       Obx(() => Container(
                  //         margin: EdgeInsets.all(8.0),
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey[50],
                  //           borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Column(
                  //             children: [
                  //               SizedBox(height: 8,),
                  //               Row(
                  //                 children: [
                  //                   Icon(Icons.info_outlined, color: Colors.red,size: 23,),
                  //                   Text(
                  //                     ' Please Select Payment Option',
                  //                     style: GoogleFonts.publicSans(
                  //                       fontSize: 16,
                  //                       fontStyle: FontStyle.normal,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.red,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               SizedBox(height: 5,),
                  //               if(controller.arrear.toString() != "0.00" )
                  //                 Obx(() =>  Row(
                  //                   children: [
                  //                     Checkbox(
                  //                       onChanged: (value) {
                  //                         // Update the checkbox state when it's clicked
                  //                         controller.isCheckboxChecked.value = value ?? false;
                  //                       },
                  //                       value: controller.isCheckboxChecked.value,
                  //                     ),
                  //                     Expanded(
                  //                       child: Text(
                  //                         'Please Select if you want to pay only arrear amount',
                  //                         style: GoogleFonts.publicSans(
                  //                           fontSize: 14,
                  //                           fontStyle: FontStyle.normal,
                  //                           // fontWeight: FontWeight.,
                  //                           color: Colors.red,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 )),
                  //               Visibility(
                  //                 visible: (
                  //                     controller.isCheckboxChecked.value
                  //                 ),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.all(10.0),
                  //                   child: Row(
                  //                     children: [
                  //                       Text( "  Total Arrear Amount to be paid is ",
                  //                         style: GoogleFonts.publicSans(
                  //                           fontWeight: FontWeight.w600,
                  //                           fontSize: 15,
                  //                           fontStyle: FontStyle.normal,
                  //                           color: Colors.black,
                  //                         ),),
                  //                       SizedBox(width: 3),
                  //                       Text(controller.arrear.toString(),
                  //                         style: GoogleFonts.publicSans(
                  //                           fontWeight: FontWeight.w600,
                  //                           fontSize: 15,
                  //                           fontStyle: FontStyle.normal,
                  //                           color: Colors.black,
                  //                         ),),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //
                  //               SizedBox(height:10,),
                  //               //SELECT PAYMENT METHOD
                  //               CustomDropdownFormField(
                  //                 headingText: 'Payment Method',
                  //                 items: [
                  //                   DropdownMenuItem(
                  //                     child: Text("Cash"),
                  //                     value: "CASH",
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text("Cheque"),
                  //                     value: "CHEQUE",
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text("DD"),
                  //                     value: "DD",
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text("NEFT"),
                  //                     value: "NEFT",
                  //                   ),
                  //                   DropdownMenuItem(
                  //                     child: Text("ONILNE"),
                  //                     value: "ONLINE",
                  //                   ),
                  //                 ],
                  //                 hintText: 'Select an option',
                  //                 validator: (value) {
                  //                   if (value == null) {
                  //                     return 'Please select an option';
                  //                   }
                  //                   return null;
                  //                 },
                  //                 onChanged: (DemandPayment) {
                  //                   controller.demand_PaymentMode.value = DemandPayment.toString();
                  //                 },
                  //               ),
                  //               //IN CASE OF CASH PAYEMNT
                  //               if (controller.demand_PaymentMode.value == 'CASH')
                  //                 Container(
                  //                   child: Column(
                  //                     children: [
                  //                       SizedBox(height:20,),
                  //                       Container(
                  //                         padding: const EdgeInsets.all(6),
                  //                         child: Column(
                  //                           crossAxisAlignment: CrossAxisAlignment.start,
                  //                           children: [
                  //                             Row(
                  //                               mainAxisAlignment: MainAxisAlignment.center,
                  //                               children: [
                  //                                 ElevatedButton(
                  //                                   onPressed: controller.isPaymentInProgress.value ? null : () => controller.DemandTaxPayment(),
                  //                                   child: controller.isPaymentInProgress.value
                  //                                       ? Text('Processing Payment...')
                  //                                       : Obx(() {
                  //                                     if (controller.isCheckboxChecked.value) {
                  //                                       // Show the arrear amount when the checkbox is selected
                  //                                       return Row(
                  //                                         children: [
                  //                                           Text('Pay Now: '),
                  //                                           Text(
                  //                                             controller.arrear.toString(),
                  //                                             style: GoogleFonts.publicSans(
                  //                                               fontWeight: FontWeight.w600,
                  //                                               fontSize: 15,
                  //                                               fontStyle: FontStyle.normal,
                  //                                               color: Colors.white,
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     } else {
                  //                                       // Show the payable amount when the checkbox is not selected
                  //                                       return Row(
                  //                                         children: [
                  //                                           Text('Pay Now: '),
                  //                                           Text(
                  //                                             controller.payableAmount.toString(),
                  //                                             style: GoogleFonts.publicSans(
                  //                                               fontWeight: FontWeight.w600,
                  //                                               fontSize: 15,
                  //                                               fontStyle: FontStyle.normal,
                  //                                               color: Colors.white,
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     }
                  //                                   }),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               //IN CASE OF CHEQUE/DD
                  //               if (controller.demand_PaymentMode.value == 'CHEQUE'||controller.demand_PaymentMode.value == 'DD')
                  //                 Container(
                  //                   child: Column(
                  //                     children: [
                  //                       //BANK NAME
                  //                       CustomTextField(
                  //                         controller: controller.bankNameController,
                  //                         headingText: "Bank Name", hintText: "Enter Bank Name",validator: (value) {
                  //                         if (value == null || value.isEmpty) {
                  //                           return 'This field is required';
                  //                         }
                  //                         return "";
                  //                       },),
                  //                       //BRANCH NAME
                  //                       CustomTextField(
                  //                         controller: controller.branchNameController,
                  //                         headingText: "Branch Name", hintText: "Enter Branch Name",validator: (value) {
                  //                         if (value == null || value.isEmpty) {
                  //                           return 'This field is required';
                  //                         }
                  //                         return "";
                  //                       },),
                  //                       //CHEQUE /DD NO
                  //                       CustomTextField(
                  //                         controller: controller.chequeNoController,
                  //                         headingText: "Cheque/DD No", hintText: "Enter Cheque/DD No",validator: (value) {
                  //                         if (value == null || value.isEmpty) {
                  //                           return 'This field is required';
                  //                         }
                  //                         return "";
                  //                       },),
                  //                       //CHEQUE DD/DATE
                  //                       CustomDateTimeField(
                  //                         headingText: 'Cheque/DD Date ',
                  //                         controller: controller.chequeDateController,
                  //                         decoration: InputDecoration(
                  //                           labelText: 'Date',
                  //                           border: OutlineInputBorder(),
                  //                         ),
                  //                         format: DateFormat("yyyy-MM-dd"),
                  //                         onShowPicker: (context, currentValue) {
                  //                           return showDatePicker(
                  //                               context: context,
                  //                               firstDate: DateTime(1900),
                  //                               initialDate: currentValue ?? DateTime.now(),
                  //                               lastDate: DateTime(2100));
                  //                         },
                  //                         validator: (value) {
                  //                           if (value == null) {
                  //                             return 'Please select a date and time';
                  //                           }
                  //                           // Add more validation if needed
                  //                           return null;
                  //                         },
                  //                       ),
                  //                       SizedBox(height: 30),
                  //                       Obx(() => controller.selectedImage1Path == ''
                  //                           ? Padding(
                  //                         padding: const EdgeInsets.only(top: 20.0),
                  //                         child: Center(
                  //                           child: Text(
                  //                             'Select image from camera/gallery',
                  //                             style: TextStyle(fontSize: 10, color: Colors.black),
                  //                           ),
                  //                         ),
                  //                       )
                  //                           : Column(
                  //                         children: [
                  //                           Padding(
                  //                             padding: const EdgeInsets.all(8.0),
                  //                             child: Center(
                  //                               child: Image.file(
                  //                                 File(controller.selectedImage1Path.value),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           Obx(() => Center(
                  //                             child: Text(
                  //                               controller.selectedImage1Size.value,
                  //                               style: TextStyle(fontSize: 12, color: Colors.black),
                  //                             ),
                  //                           )),
                  //                         ],
                  //                       )),
                  //                       Row(
                  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                         children: <Widget>[
                  //                           MaterialButton(
                  //                             color: Colors.blueGrey.shade300,
                  //                             child: Text(
                  //                               "Camera",
                  //                               style: TextStyle(color: Colors.white),
                  //                             ),
                  //                             onPressed: () {
                  //                               controller.getImage1(ImageSource.camera);
                  //                             },
                  //                           ),
                  //                           MaterialButton(
                  //                             color: Colors.teal.shade300,
                  //                             child: Text(
                  //                               "Device",
                  //                               style: TextStyle(color: Colors.white),
                  //                             ),
                  //                             onPressed: () {
                  //                               controller.getImage1(ImageSource.gallery);
                  //                             },
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       SizedBox(height:30,),
                  //                       Container(
                  //                         padding: const EdgeInsets.all(6),
                  //                         child: Column(
                  //                           crossAxisAlignment: CrossAxisAlignment.start,
                  //                           children: [
                  //                             Row(
                  //                               mainAxisAlignment: MainAxisAlignment.center,
                  //                               children: [
                  //                                 ElevatedButton(
                  //                                   onPressed: () {
                  //                                     controller.DemandTaxPayment();
                  //                                   },
                  //                                   child: Obx(() {
                  //                                     if (controller.isCheckboxChecked.value) {
                  //                                       // arrear amount to be shown  when the checkbox is selected
                  //                                       return Row(
                  //                                         children: [
                  //                                           Text('Pay Now: '),
                  //                                           Text(
                  //                                             controller.arrear.toString(),
                  //                                             style: GoogleFonts.publicSans(
                  //                                               fontWeight: FontWeight.w600,
                  //                                               fontSize: 15,
                  //                                               fontStyle: FontStyle.normal,
                  //                                               color: Colors.white,
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     } else {
                  //                                       // payable amount to be shown when the checkbox is not selected
                  //                                       return Row(
                  //                                         children: [
                  //                                           Text('Pay Now: '),
                  //                                           Text(
                  //                                             controller.payableAmount.toString(),
                  //                                             style: GoogleFonts.publicSans(
                  //                                               fontWeight: FontWeight.w600,
                  //                                               fontSize: 15,
                  //                                               fontStyle: FontStyle.normal,
                  //                                               color: Colors.white,
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     }
                  //                                   }),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       SizedBox(height:30,),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               //IN CASE OF NEFT
                  //               if (controller.demand_PaymentMode.value == 'NEFT')
                  //                 Container(
                  //                   child: Column(
                  //                     children: [
                  //                       //CHEQUE DD/DATE
                  //                       CustomDateTimeField(
                  //                         headingText: 'Date ',
                  //                         controller: controller.chequeDateController,
                  //                         decoration: InputDecoration(
                  //                           labelText: 'Date',
                  //                           border: OutlineInputBorder(),
                  //                         ),
                  //                         format: DateFormat("yyyy-MM-dd"),
                  //                         onShowPicker: (context, currentValue) {
                  //                           return showDatePicker(
                  //                               context: context,
                  //                               firstDate: DateTime(1900),
                  //                               initialDate: currentValue ?? DateTime.now(),
                  //                               lastDate: DateTime(2100));
                  //                         },
                  //                         validator: (value) {
                  //                           if (value == null) {
                  //                             return 'Please select a date and time';
                  //                           }
                  //                           // Add more validation if needed
                  //                           return null;
                  //                         },
                  //                       ),
                  //                       //
                  //                       CustomTextField(
                  //                         controller: controller.chequeNoController,
                  //                         headingText: "Trans Ref No/UTR No", hintText: "Enter UTR No",validator: (value) {
                  //                         if (value == null || value.isEmpty) {
                  //                           return 'This field is required';
                  //                         }
                  //                         return "";
                  //                       },),
                  //                       SizedBox(height:20,),
                  //                       Container(
                  //                         padding: const EdgeInsets.all(6),
                  //                         child: Column(
                  //                           crossAxisAlignment: CrossAxisAlignment.start,
                  //                           children: [
                  //                             Row(
                  //                               mainAxisAlignment: MainAxisAlignment.center,
                  //                               children: [
                  //                                 ElevatedButton(
                  //                                   onPressed: () {
                  //                                     controller.DemandTaxPayment();
                  //                                   },
                  //                                   child: Obx(() {
                  //                                     if (controller.isCheckboxChecked.value) {
                  //                                       // arrear amount to be shown  when the checkbox is selected
                  //                                       return Row(
                  //                                         children: [
                  //                                           Text('Pay Now: '),
                  //                                           Text(
                  //                                             controller.arrear.toString(),
                  //                                             style: GoogleFonts.publicSans(
                  //                                               fontWeight: FontWeight.w600,
                  //                                               fontSize: 15,
                  //                                               fontStyle: FontStyle.normal,
                  //                                               color: Colors.white,
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     } else {
                  //                                       // payable amount to be shown when the checkbox is not selected
                  //                                       return Row(
                  //                                         children: [
                  //                                           Text('Pay Now: '),
                  //                                           Text(
                  //                                             controller.payableAmount.toString(),
                  //                                             style: GoogleFonts.publicSans(
                  //                                               fontWeight: FontWeight.w600,
                  //                                               fontSize: 15,
                  //                                               fontStyle: FontStyle.normal,
                  //                                               color: Colors.white,
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     }
                  //                                   }),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               //IN CASE OF ONLINE PAYMENT (PINELAB)
                  //               Visibility(
                  //                 visible: (
                  //                     controller.demand_PaymentMode.value == 'ONLINE'
                  //                 ),
                  //                 child:   Container(
                  //                   padding: const EdgeInsets.all(0),
                  //                   child: Column(
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       SizedBox(height: 20,),
                  //                       Row(
                  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                         children: [
                  //                           //UPI BUTTON
                  //                           ElevatedButton(
                  //                             onPressed: () async {
                  //                               await controller.DemandOnlineUpiPayment();
                  //                               // await controller.openPineUPIPOS();
                  //                             },
                  //                             child: Obx(() {
                  //                               if (controller.isCheckboxChecked.value) {
                  //                                 // arrear amount to be shown  when the checkbox is selected
                  //                                 return Row(
                  //                                   children: [
                  //                                     Text('  UPI  : '),
                  //                                     Text(
                  //                                       controller.arrear.toString(),
                  //                                       style: GoogleFonts.publicSans(
                  //                                         fontWeight: FontWeight.w600,
                  //                                         fontSize: 15,
                  //                                         fontStyle: FontStyle.normal,
                  //                                         color: Colors.white,
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 );
                  //                               } else {
                  //                                 // Show the payable amount when the checkbox is not selected
                  //                                 return Row(
                  //                                   children: [
                  //                                     Text('  UPI  : '),
                  //                                     Text(
                  //                                       controller.payableAmount.toString(),
                  //                                       style: GoogleFonts.publicSans(
                  //                                         fontWeight: FontWeight.w600,
                  //                                         fontSize: 15,
                  //                                         fontStyle: FontStyle.normal,
                  //                                         color: Colors.white,
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 );
                  //                               }
                  //                             }),
                  //                           ),
                  //                           //CARD BUTTON
                  //                           ElevatedButton(
                  //                             onPressed: () async {
                  //                               await controller.DemandOnlineCardPayment();
                  //                               // await controller.openPineCardPOS();
                  //                             },
                  //                             child: Obx(() {
                  //                               if (controller.isCheckboxChecked.value) {
                  //                                 // arrear amount to be shown  when the checkbox is selected
                  //                                 return Row(
                  //                                   children: [
                  //                                     Text(' CARD  :   '),
                  //                                     Text(
                  //                                       controller.arrear.toString(),
                  //                                       style: GoogleFonts.publicSans(
                  //                                         fontWeight: FontWeight.w600,
                  //                                         fontSize: 15,
                  //                                         fontStyle: FontStyle.normal,
                  //                                         color: Colors.white,
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 );
                  //                               } else {
                  //                                 // payable amount to be shown when the checkbox is not selected
                  //                                 return Row(
                  //                                   children: [
                  //                                     Text(' CARD  :   '),
                  //                                     Text(
                  //                                       controller.payableAmount.toString(),
                  //                                       style: GoogleFonts.publicSans(
                  //                                         fontWeight: FontWeight.w600,
                  //                                         fontSize: 15,
                  //                                         fontStyle: FontStyle.normal,
                  //                                         color: Colors.white,
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 );
                  //                               }
                  //                             }),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       if(controller.pineLabStatus.value == true )
                  //                         Row(
                  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                           children: [
                  //                             ElevatedButton(onPressed: () async {await controller.getUpiStatus();},
                  //                                 child: Row(
                  //                                   children: [
                  //                                     Text(' GET STATUS   ',style: GoogleFonts.publicSans(
                  //                                       fontWeight: FontWeight.w600,
                  //                                       fontSize: 15,
                  //                                       fontStyle: FontStyle.normal,
                  //                                       color: Colors.white,
                  //                                     ),),
                  //                                   ],
                  //                                 )),
                  //                           ],
                  //                         ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //
                  //               ),
                  //               SizedBox(height: 15,),
                  //             ],
                  //           ),
                  //         ),
                  //       ),)
                  //     ],
                  //   ),
                  // ),
                  //IF PAYMENT STATUS IS 1 - ALL DEMAND CLEAR
                  // Visibility(
                  //   visible: (
                  //       !controller.demandError && controller.paymentStatus == '1'
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12.0),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.green[200],
                  //         borderRadius: BorderRadius.circular(15.0),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(width: 14),
                  //             Expanded(
                  //               child: RichText(
                  //                 text: TextSpan(
                  //                   children: [
                  //                     WidgetSpan(
                  //                       child: Padding(
                  //                         padding: EdgeInsets.only(
                  //                             top: 3, right: 4, bottom: 1),
                  //                         child: Icon(Icons.info_outlined,
                  //                             color: Colors.black, size: 20),
                  //                       ),
                  //                     ),
                  //                     TextSpan(
                  //                       text:
                  //                       " ALL DEMAND ARE CLEARED ",
                  //                       style: GoogleFonts.publicSans(
                  //                         fontWeight: FontWeight.w500,
                  //                         fontSize: 15,
                  //                         fontStyle: FontStyle.normal,
                  //                         color: Colors.black,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Visibility(
                  //   visible: (
                  //       controller.demandError
                  //   ),
                  //   child:Container(
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFFFFFFF),
                  //       borderRadius: BorderRadius.circular(0),
                  //     ),
                  //     child:   Padding(
                  //       padding: const EdgeInsets.all(12.0),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.red[100],
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.5),
                  //               spreadRadius: 1,
                  //               blurRadius: 1,
                  //               offset: Offset(0,1),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Row(
                  //             children: [
                  //               SizedBox(width: 14),
                  //               Expanded(
                  //                 child: RichText(
                  //                   text: TextSpan(
                  //                     children: [
                  //                       WidgetSpan(
                  //                         child: Padding(
                  //                           padding: EdgeInsets.only(
                  //                               top: 3, right: 4, bottom: 1),
                  //                           child: Icon(Icons.info_outlined,
                  //                               color: Colors.red, size: 20),
                  //                         ),
                  //                       ),
                  //                       TextSpan(
                  //                         text:
                  //                         controller.demandMessage,
                  //                         style: GoogleFonts.publicSans(
                  //                           fontWeight: FontWeight.w500,
                  //                           fontSize: 15,
                  //                           fontStyle: FontStyle.normal,
                  //                           color: Colors.red,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              // if(controller.paymentStatus == '1')
              SizedBox(height:200,),
            ],
          ),),
    );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0 ,horizontal: 15.0),
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
            nullToNA(value),
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




Container buildDecoratedContainer(Widget child) {
  return Container(
    padding:  EdgeInsets.only(right: 15.0),
    decoration: BoxDecoration(
      border: Border(right: BorderSide(width: 1, color: Colors.grey)),
    ),
    child: Center(child: child),
  );
}