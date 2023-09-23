import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../property_HomeScreen/views/property_home_screen_view.dart';
import '../controllers/property_gb_saf_apply_controller.dart';

class PropertySubmitResponseView extends GetView<PropertyGbSafApplyController> {
  const PropertySubmitResponseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF0F6F9),
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF1F7FC),
          title:Text("    Government SAF Form",style:GoogleFonts.publicSans(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(69, 70, 70, 0.9),
          ),),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //SUCCESSFULLY SUBMITTED
              SizedBox(height:20,),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.9, // adjust this value as per your requirement
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/6236/6236992.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Your form has been submitted \nsuccessfully.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              //SAF DETAILS
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(8.0),
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
                  border: Border.all(color: Colors.greenAccent.shade100, width: 2.0),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.9, // adjust this value as per your requirement
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SAF NO:', style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),),
                            Text(
                              controller.safNo.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ), ),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Apply Date :'),
                            Text(
                              controller.applyDate.toString(),
                            ),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rebate :'),
                            Text(
                              controller.demandAmount['rebateAmt'].toString(),
                            ),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Late Assessment Penalty(Rs):'),
                            Text(
                              controller.demandAmount['lateAssessmentPenalty'].toString(),
                            ),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1% Penalty  :'),
                            Text(
                              controller.demandAmount['totalOnePercPenalty'].toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //TOTAL TAX
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(8.0),
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
                  border: Border.all(color: Colors.greenAccent.shade100, width: 2.0),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Tax : ',  style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),),
                            Text(
                              controller.demandAmount['payableAmount'].toString(),  style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //TAX DETAIL
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('TAX DETAIL',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w500),),
                          ),
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
                            child:
                            Column(
                              children: [
                                //TOTAL TAX
                                SizedBox(height: 3,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tax Amount :    '),
                                    Text(
                                      controller.demandAmount['totalTax'].toString(),
                                    ),
                                  ],
                                ),
                                //LATE ASSESSMENT PENALTY
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Late Assessment Penalty  :    '),
                                    Text(
                                      controller.demandAmount['lateAssessmentPenalty'].toString(),
                                    ),
                                  ],
                                ),
                                //1% PENALTY
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('1% Penalty (Rs)  :    '),
                                    Text(
                                      controller.demandAmount['totalOnePercPenalty'].toString(),
                                    ),
                                  ],
                                ),
                                // REBATE (10%)
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Rebate(10% IN RS)  :    '),
                                    Text(
                                      controller.demandAmount['rebateAmt'].toString(),
                                    ),
                                  ],
                                ),
                                //SPECIAL REBATE
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Special Rebate(0% IN RS)  :    '),
                                    Text(
                                      controller.demandAmount['specialRebateAmt'].toString(),
                                    ),
                                  ],
                                ),
                                //AMOUNT PAYABLE
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Payable Amount(Rs) :    '),
                                    Text(
                                      controller.demandAmount['payableAmount'].toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              //REBATE DESCRIPTION
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('REBATE DESCRIPTION ',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w500),),
                          ),
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
                              child:
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                    2: FlexColumnWidth(),
                                    3: FlexColumnWidth(),
                                  },
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      children: [
                                        // TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('#'))),
                                        TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Rebate Type'))),
                                        TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Percent (%)'))),
                                        TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Amount'))),
                                      ],
                                    ),
                                    for (var rebate in controller.demandAmountRebate)
                                      TableRow(
                                        children: [
                                          // TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(rebate['rebateTypeId'].toString()))),
                                          TableCell(child: Padding(padding: EdgeInsets.all(10), child: Text(rebate['keyString'],textAlign: TextAlign.center))),
                                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(rebate['rebatePerc'].toString(),textAlign: TextAlign.center))),
                                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(rebate['rebateAmount'].toString(),textAlign: TextAlign.center))),
                                        ],
                                      ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // controller.ruleSet1 != null && controller.ruleSet1.isNotEmpty

              //TAX DESCRIPTION
              //RULESET - 1
              if (controller.ruleSet1 != null && controller.ruleSet1.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tax Description of Annual Rental Value - As Per Old Rule (Effect Upto 31-03-2016)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
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
                                  columnSpacing: 10,
                                  columns: [
                                    DataColumn(label: Center(child: Text('ARV')),),
                                    DataColumn(label: Center(child: Text('Quarter')),),
                                    DataColumn(label: Center(child: Text('Quarter / Year')),),
                                    DataColumn(label: Center(child: Text('Holding Tax (Rs)')),),
                                    DataColumn(label: Center(child: Text('1% penalty (Rs)')),),
                                    DataColumn(label: Center(child: Text('Water Tax (Rs)')),),
                                    DataColumn(label: Center(child: Text('Latrine/Conservancy Tax (Rs)')),),
                                    DataColumn(label: Center(child: Text('Education Cess (Rs)')),),
                                    DataColumn(label: Center(child: Text('Health Cess (Rs)')),),
                                    DataColumn(label: Center(child: Text('Quarterly Tax (Rs)')),),
                                    DataColumn(label: Center(child: Text('Due Date')),),

                                  ],
                                  rows: [
                                    for (var rule1 in controller.ruleSet1)
                                      DataRow(
                                        cells: [
                                          DataCell(Center(child: Text(rule1['arv'].toString()),),),
                                          DataCell(Center(child: Text(rule1['qtr'].toString()),), ),
                                          DataCell(Center(child: Text(rule1['quarterYear'].toString()),), ),
                                          DataCell(Center(child: Text(rule1['holdingTax'].toString()),), ),
                                          DataCell(Center(child: Text(rule1['onePercPenaltyTax'].toString()),), ),
                                          DataCell(Center(child: Text(rule1['waterTax'].toString()),), ),
                                          DataCell(Center(child: Text(rule1['latrineTax'].toString()),),),
                                          DataCell(Center(child: Text(rule1['educationTax'].toString()),),),
                                          DataCell(Center(child: Text(rule1['healthCess'].toString()),),),
                                          DataCell(Center(child: Text(rule1['totalTax'].toString()),),),
                                          DataCell(Center(child: Text(rule1['dueDate'].toString()),), ),

                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),
              //TAX DESCRIPTION
              //RULESET - 2
              SizedBox(
                height: 20,
              ),
              if (controller.ruleSet2 != null && controller.ruleSet2.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tax Description Annual Rental Value - As ARV Rule (Effect From 01-04-2016 to 31-03-2022)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
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
                              child:  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 10,
                                  columns: [
                                    DataColumn(label: Center(child: Text('ARV'),),),
                                    DataColumn(label: Center(child: Text('Quarter'),),),
                                    DataColumn(label: Center(child: Text('Quarter / Year'),),),
                                    DataColumn(label: Center(child: Text('Holding Tax (Rs)'),),),
                                    DataColumn(label: Center(child: Text('1% penalty (Rs)'),),),
                                    DataColumn(label: Center(child: Text('Additional Tax(RWH Penalty) (Rs)'),),),
                                    DataColumn(label: Center(child: Text('Total Tax (Rs)'),),),
                                    DataColumn(label: Center(child: Text('Due Date'),),),
                                  ],
                                  rows: [
                                    for (var rule2 in controller.ruleSet2)
                                      DataRow(
                                        cells: [
                                          DataCell(Center(child: Text(rule2['arv'].toString()),),),
                                          DataCell(Center(child: Text(rule2['qtr'].toString()),),),
                                          DataCell(Center(child: Text(rule2['quarterYear'].toString()),),),
                                          DataCell(Center(child: Text(rule2['holdingTax'].toString()),),),
                                          DataCell(Center(child: Text(rule2['onePercPenaltyTax'].toString()),),),
                                          DataCell(Center(child: Text(rule2['rwhPenalty'].toString()),),),
                                          DataCell(Center(child: Text(rule2['totalTax'].toString()),),),
                                          DataCell(Center(child: Text(rule2['dueDate'].toString()),),),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),
              //TAX DESCRIPTION
              //RULESET - 3
              SizedBox(height: 20,),
              if (controller.ruleSet3 != null && controller.ruleSet3.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Tax Description of Capital Value - As Per Current Rule (Effect From 01-04-2022)',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
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
                                  columnSpacing: 10,
                                  columns: [
                                    DataColumn(label: Center(child: Text('ARV'),),),
                                    DataColumn(label: Center(child: Text('Quarter'),),),
                                    DataColumn(label: Center(child: Text('Quarter / Year'),),),
                                    DataColumn(label: Center(child: Text('Holding Tax (Rs)'),),),
                                    DataColumn(label: Center(child: Text('1% penalty (Rs)'),),),
                                    DataColumn(label: Center(child: Text('Additional Tax(RWH Penalty) (Rs)'),),),
                                    DataColumn(label: Center(child: Text('Total Tax (Rs)'),),),
                                    DataColumn(label: Center(child: Text('Due Date'),),),
                                  ],
                                  rows: [
                                    for (var rule3 in controller.ruleSet3)
                                      DataRow(
                                        cells: [
                                          DataCell(Center(child: Text(rule3['arv'].toString()),),),
                                          DataCell(Center(child: Text(rule3['qtr'].toString()),),),
                                          DataCell(Center(child: Text(rule3['quarterYear'].toString()),),),
                                          DataCell(Center(child: Text(rule3['holdingTax'].toString()),),),
                                          DataCell(Center(child: Text(rule3['onePercPenaltyTax'].toString()),),),
                                          DataCell(Center(child: Text(rule3['rwhPenalty'].toString()),),),
                                          DataCell(Center(child: Text(rule3['totalTax'].toString()),),),
                                          DataCell(Center(child: Text(rule3['dueDate'].toString()),),),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),

              SizedBox(
                height: 20,
              ),
              Column(
                children: [

                  ElevatedButton(
                      onPressed: () async {

                      },
                      child: Text('Proceed To Pay')),
                  ElevatedButton(
                    onPressed: () async {
                      // await controller.clearForm();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => PropertyHomeScreenView()),
                            (route) => false,
                      );
                    },
                    child: Text('Back'),
                  )
                ],
              )
            ],
          ),

        ),),
    );
  }
}

