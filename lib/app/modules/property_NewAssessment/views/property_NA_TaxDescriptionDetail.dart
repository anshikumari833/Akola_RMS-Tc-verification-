import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyNATaxDescriptionDetailView extends GetView<PropertyNewAssessmentController> {
  const PropertyNATaxDescriptionDetailView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
    child: Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //RULE SET - 1--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--!!!!!!!!!!!!!!!
                if (controller.ruleSet1Data != null &&
                    controller.ruleSet1Data.isNotEmpty)
                  Container(
                      padding: EdgeInsets.all(6.0),
                      margin: EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          //FLOORS
                          Container(
                            padding: EdgeInsets.only(
                                left: 6.0, right: 6.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax Description of Annual Rental Value - \nAs Per Old Rule (Effect Upto:31-03-2016) : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var floor in controller
                                              .ruleSet1Data['floors'] ??
                                          [])
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text('# : ${floor['key']}'),
                                            Text('Usage Type : ${floor['mUsageType']}'),
                                            Text('Rental Rate : ${floor['rentalValue']}'),
                                            Text('Built Up Area (in Sq. Ft) : ${floor['buildupArea']}'),
                                            Text('Effect From : ${floor['quarterYear']}'),
                                            Text('ARV: ${floor['arv']}'),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //TOTAL QTR TAXES
                          Container(
                            padding: EdgeInsets.only(
                                left: 6.0, right: 6.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Below taxes are calculated on quarterly basis( Property Tax / 4 ) : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var qtrTax in controller
                                              .ruleSet1Data['totalQtrTaxes'] ??
                                          [])
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text('# : ${qtrTax['key']}'),
                                            Text(
                                                'Effect From : ${qtrTax['effectingFrom']}'),
                                            Text('ARV : ${qtrTax['arv']}'),
                                            Text(
                                                'Holding Tax : ${qtrTax['holdingTax']}'),
                                            Text(
                                                'Water Tax : ${qtrTax['waterTax']}'),
                                            Text(
                                                'Latrine/Conservancy Tax : ${qtrTax['latrineTax']}'),
                                            Text(
                                                'Education Cess: ${qtrTax['educationTax']}'),
                                            Text(
                                                'Health Cess: ${qtrTax['healthTax']}'),
                                            Text(
                                                'Quarterly Tax: ${qtrTax['quaterlyTax']}'),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),

                //RULE SET - 2--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--!!!!!!!!!!!!!!!
                if (controller.ruleSet2Data != null && controller.ruleSet2Data.isNotEmpty)
                  Container(
                      padding: EdgeInsets.all(6.0),
                      margin: EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          //FLOORS
                          Container(
                            padding: EdgeInsets.only(
                                left: 6.0, right: 6.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax Description Annual Rental Value - As ARV Rule (Effect From 01-04-2016 to 31-03-2022) : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var floor in controller
                                              .ruleSet2Data['floors'] ??
                                          [])
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text('# : ${floor['key']}'),
                                            Text(
                                                'Usage Factor : ${floor['mUsageType']}'),
                                            Text(
                                                'Occupancy Factor : ${floor['occupancyFactor']}'),
                                            Text(
                                                'Rental Rate : ${floor['rentalRate']}'),
                                            Text(
                                                'Carpet Area (in Sq. Ft) : ${floor['carpetArea']}'),
                                            Text(
                                                'Effect From : ${floor['quarterYear']}'),
                                            Text('ARV : ${floor['arv']}'),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //TOTAL QTR TAXES
                          Container(
                            padding: EdgeInsets.only(
                                left: 6.0, right: 6.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' Total Quarterly Tax Details ( (ARV X 2%) / 4 )  : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var qtrTax in controller
                                              .ruleSet2Data['totalQtrTaxes'] ??
                                          [])
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text('#: ${qtrTax['key']}'),
                                            Text(
                                                'Effect From: ${qtrTax['effectingFrom']}'),
                                            Text('ARV: ${qtrTax['arv']}'),
                                            Text(
                                                'Holding Tax (Quarterly): ${qtrTax['holdingTax']}'),
                                            Text(
                                                'RWH Penalty : ${qtrTax['rwhPenalty']}'),
                                            Text(
                                                'Quarterly Tax (Total): ${qtrTax['quaterlyTax']}'),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                //RULE SET - 3--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--!!!!!!!!!!!!!!!
                if (controller.ruleSet3Data != null &&
                    controller.ruleSet3Data.isNotEmpty)
                  Container(
                      padding: EdgeInsets.all(6.0),
                      margin: EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          //FLOORS
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax Description of Capital Value - As Per Current Rule (Effect From 01-04-2022) : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('For Building:',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var floor in controller
                                              .ruleSet3Data['floors'] ??
                                          [])
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              '# : ${floor['key']}',
                                            ),
                                            Text(
                                                'Circle Rate : ${floor['circleRate']}'),
                                            Text(
                                                'Buildup Area (in Sq. Ft) : ${floor['buildupArea']}'),
                                            Text(
                                                'Occupancy Factor : ${floor['occupancyFactor']}'),
                                            Text(
                                                'Tax Percentage : ${floor['taxPerc']}'),
                                            Text(
                                                'Calculation Factor : ${floor['calculationFactor']}'),
                                            Text(
                                                'Matrix Factor : ${floor['matrixFactor']}'),
                                            Text(
                                                'Effect From : ${floor['quarterYear']}'),
                                            Text(
                                                'Property Tax : ${floor['arv']}'),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //TOTAL QTR TAXES
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Below taxes are calculated on quarterly basis( Property Tax / 4 ) : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var qtrTax in controller
                                              .ruleSet3Data['totalQtrTaxes'] ??
                                          [])
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text('#: ${qtrTax['key']}'),
                                            Text(
                                                'Effect From : ${qtrTax['effectingFrom']}'),
                                            Text('ARV: ${qtrTax['arv']}'),
                                            Text(
                                                'Holding Tax (Quarterly) : ${qtrTax['holdingTax']}'),
                                            Text(
                                                'RWH Penalty : ${qtrTax['rwhPenalty']}'),
                                            Text(
                                                'Quarterly Tax (Total) : ${qtrTax['quaterlyTax']}'),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
              ],
            ),

            //TOTAL AMOUNT PAYABLE--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--!!!!!!!!!!!!!!!
            Container(
              padding: EdgeInsets.all(6.0),
              margin: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade200,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL AMOUNT PAYABLE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax Amount (Rs):     '),
                        Text(
                          controller.taxResult['totalTax'].toString(),
                        ),
                      ],
                    ),
                  ),
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Late Assessment Penalty (Rs) :    '),
                        Text(controller.taxResult['lateAssessmentPenalty']
                            .toString()),
                      ],
                    ),
                  ),
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1% Penalty (Rs) :    '),
                        Text(controller.taxResult['totalOnePercPenalty']
                            .toString()),
                      ],
                    ),
                  ),
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rebate :    '),
                        // Text(controller.taxResult['rebateAmt']),
                      ],
                    ),
                  ),
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Special Rebate :    '),
                        // Text(controller.taxResult['specialRebateAmt'].toString()),
                      ],
                    ),
                  ),
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
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Payable Amount (Rs)  :    '),
                        Text(controller.taxResult['payableAmount'].toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //SUBMIT BUTTON--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--!!!!!!!!!!!!!!!
            SizedBox(
              height: 15,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  minWidth: 200.0,
                  height: 35,
                  color: Colors.blue,
                  child: new Text('Submit', style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: () async {
                    await controller.validateForm();
                   // await Get.to(PropertySubmittedFormView());
                  },
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}

// //BUILD UP AREA
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text('Build up Area(in sq.ft) :'),
//       Text(controller.taxResult['totalTax']),
//     ],
//   ),
// ),
// //OCCUPANCY TYPE
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text('Occupancy Factor :'),
//
//     ],
//   ),
// ),
// //TAX PERCENTAGE
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         'Tax Percentage :',
//       ),
//
//     ],
//   ),
// ),
// //CALCUTATION FACTOR
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text('Calculation Factor :'),
//
//     ],
//   ),
// ),
// //MATRIX FACTOR
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           Text('Matrix Factor :'),
//
//         ],
//       ),
//     ],
//   ),
// ),
// //EFFECT FROM
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           Text(' Effect From :'),
//
//         ],
//       ),
//     ],
//   ),
// ),
// //PROPERTY TAX
// Container(
//   padding: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     color: Colors.yellow.shade50,
//     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 2,
//         blurRadius: 3,
//         offset: Offset(0, 1), // changes position of shadow
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children: [
//           Text('Property Tax :'),
//
//         ],
//       ),
//     ],
//   ),
// ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////
// if(controller.ruleSet1Data != null && controller.ruleSet1Data.isNotEmpty) Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     // Text('RuleSet1'),
//     //Floor
//     Text('Tax Description of Annual Rental Value - As Per Old Rule (Effect Upto:31-03-2016'),
//     for(var floor in controller.ruleSet1Data['floors'] ?? []) Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('# : ${floor['key']}'),
//         Text('Usage Type : ${floor['mUsageType']}'),
//         Text('Rental Rate : ${floor['rentalValue']}'),
//         Text('Built Up Area (in Sq. Ft) : ${floor['buildupArea']}'),
//         Text('Effect From : ${floor['quarterYear']|['qtr']}'),
//         Text('ARV: ${floor['arv']}'),
//       ],
//     ),
//     // Text('Total Qtr Taxes:'),
//     Text('Below taxes are calculated on quarterly basis( Property Tax / 4 )'),
//     for(var qtrTax in controller.ruleSet1Data['totalQtrTaxes'] ?? []) Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('# : ${qtrTax['key']}'),
//         Text('Effect From : ${qtrTax['effectingFrom']|['qtr']}'),
//         Text('ARV : ${qtrTax['arv']}'),
//         Text('Holding Tax : ${qtrTax['holdingTax']}'),
//         Text('Water Tax : ${qtrTax['waterTax']}'),
//         Text('Latrine/Conservancy Tax : ${qtrTax['latrineTax']}'),
//         Text('Education Cess: ${qtrTax['educationTax']}'),
//         Text('Health Cess: ${qtrTax['healthTax']}'),
//         Text('Quarterly Tax: ${qtrTax['quaterlyTax']}'),
//       ],
//     ),
//   ],
// ),
// if(controller.ruleSet2Data != null && controller.ruleSet2Data.isNotEmpty) Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     // Text('RuleSet2'),
//     // Text('Floors:'),
//     Text('Tax Description Annual Rental Value - As ARV Rule (Effect From 01-04-2016 to 31-03-2022):'),
//     for(var floor in controller.ruleSet2Data['floors'] ?? []) Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('# : ${floor['key']}'),
//         Text('Usage Factor : ${floor['multiFactor']}'),
//         Text('Occupancy Factor : ${floor['occupancyFactor']}'),
//         Text('Rental Rate : ${floor['rentalRate']}'),
//         Text('Carpet Area (in Sq. Ft) : ${floor['carpetArea']}'),
//         Text('Effect From : ${floor['quarterYear']|['qtr']}'),
//         Text('ARV : ${floor['arv']}'),
//       ],
//     ),
//     // Text('Total Qtr Taxes:'),
//     Text('Total Quarterly Tax Details ((ARV X 2%) / 4) :'),
//     for(var qtrTax in controller.ruleSet2Data['totalQtrTaxes'] ?? []) Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('#: ${qtrTax['key']}'),
//         Text('Effect From: ${qtrTax['effectingFrom']|['qtr']}'),
//         Text('ARV: ${qtrTax['arv']}'),
//         Text('Holding Tax (Quarterly): ${qtrTax['holdingTax']}'),
//         Text('RWH Penalty : ${qtrTax['rwhPenalty']}'),
//         Text('Quarterly Tax (Total): ${qtrTax['quaterlyTax']}'),
//       ],
//     ),
//   ],
// ),
// if(controller.ruleSet3Data != null && controller.ruleSet3Data.isNotEmpty) Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     // Text('RuleSet3'),
//     // Text('Floors:')
//     Text('Tax Description of Capital Value - As Per Current Rule (Effect From 01-04-2022) :'),
//     Text('For Building:'),
//     for(var floor in controller.ruleSet3Data['floors'] ?? []) Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('# : ${floor['key']}'),
//         Text('Circle Rate : ${floor['circleRate']}'),
//         Text('Buildup Area (in Sq. Ft) : ${floor['buildupArea']}'),
//         Text('Occupancy Factor : ${floor['occupancyFactor']}'),
//         Text('Tax Percentage : ${floor['taxPerc']}'),
//         Text('Calculation Factor : ${floor['calculationFactor']}'),
//         Text('Matrix Factor : ${floor['matrixFactor']}'),
//         Text('Effect From : ${floor['quarterYear']|['qtr']}'),
//         Text('Property Tax : ${floor['arv']}'),
//       ],
//     ),
//     // Text('Total Qtr Taxes:'),
//     Text('Below taxes are calculated on quarterly basis( Property Tax / 4 ) :'),
//     for(var qtrTax in controller.ruleSet3Data['totalQtrTaxes'] ?? []) Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('#: ${qtrTax['key']}'),
//         Text('Effect From : ${qtrTax['effectingFrom']|['qtr']}'),
//         Text('ARV: ${qtrTax['arv']}'),
//         Text('Holding Tax (Quarterly) : ${qtrTax['holdingTax']}'),
//         Text('RWH Penalty : ${qtrTax['rwhPenalty']}'),
//         Text('Quarterly Tax (Total) : ${qtrTax['quaterlyTax']}'),
//       ],
//     ),
//   ],
// ),
///////////////////////////////////////////////////////////////////////////////////////////////////
