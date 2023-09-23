import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_GeoTagging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../../property_HomeScreen/views/property_home_screen_view.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertySubmittedFormView extends GetView<PropertyNewAssessmentController> {
  const PropertySubmittedFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        // backgroundColor: Color(0xFFF0F6F9),
        appBar: AssessmentAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text( " Saf No - ",
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigoAccent,
                              ),),
                            Text( controller.propertySafNo.toString(),
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigoAccent,
                              ),),
                            SizedBox(width: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text( " Apply Date - ",
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigoAccent,
                              ),),
                            Text( controller.propertyApplyDate.toString(),
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigoAccent,
                              ),),
                            SizedBox(width: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text( " Total Pending Year - ",
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigoAccent,
                              ),),
                            Text( controller.saf_pendingYears.toString(),
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.indigoAccent,
                              ),),
                            SizedBox(width: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          ),
                          child: Column(

                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ' Floor Wise Tax Bifurcation',
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
                                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 15,
                                    columns: [
                                      DataColumn(label: buildDecoratedContainer(Text('Built-up Area(Sqmt.)'))),
                                      DataColumn(label: buildDecoratedContainer(Text('   Alv    '))),
                                      DataColumn(label: buildDecoratedContainer(Text('Maintenance %'))),
                                      DataColumn(label: buildDecoratedContainer(Text('Maintenance'))),
                                      DataColumn(label: buildDecoratedContainer (Text('Value After Maintenance'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Aging %'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Aging Amount'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Total Tax Value'))),
                                      DataColumn(label: buildDecoratedContainer( Text('General Tax\n    (30%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Road Tax\n    (3%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax\n        (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Water Tax\n    (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax\n      (2%)'))),
                                      DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Tree Tax\n    (1%)'))),)),
                                    ],
                                    rows: controller.saf_floorsTaxesList.map((floorTax) {
                                      return DataRow(
                                        cells: [
                                          DataCell(buildDecoratedContainer(Text(floorTax['buildupAreaInSqmt'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['alv'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['maintancePerc'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['maintantance10Perc'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['valueAfterMaintance'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['agingPerc'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['agingAmt'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['taxValue'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['generalTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['roadTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['firefightingTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['waterTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(floorTax['sewerageTax'].toString()))),
                                          DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(floorTax['treeTax']))),)),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['educationTax']))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['cleanlinessTax']))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['treeTax']))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['isCommercial'].toString()))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['stateEducationTaxPerc'].toString()))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['stateEducationTax']))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['professionalTaxPerc'].toString()))),
                                          // DataCell(buildDecoratedContainer(Text(floorTax['professionalTax']))),
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
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          ),
                          child: Column(

                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ' Financial Year Wise Tax Bifurcation',
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
                                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 15,
                                    columns: [
                                      DataColumn(label: buildDecoratedContainer(Text('Financial Year'))),
                                      DataColumn(label: buildDecoratedContainer( Text('General Tax\n    (30%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Road Tax\n    (3%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax\n        (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Education Tax\n        (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Water Tax\n    (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax\n    (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax\n      (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Tree Tax\n      (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Professional Tax\n      (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('State Education Tax\n      (2%)'))),
                                      DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Total Tax Value'))),)),
                                    ],
                                    rows: controller.saf_fyearWiseTaxesList.map((fyearWiseTax) {
                                      return DataRow(
                                        cells: [
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['fyear'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['generalTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['roadTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['firefightingTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['educationTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['waterTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['cleanlinessTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['sewerageTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['treeTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['professionalTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(fyearWiseTax['stateEducationTax'].toString()))),
                                          DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(fyearWiseTax['totalTax'].toString()))),)),
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
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.cyan.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          ),
                          child: Column(

                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ' Grand Total Tax Bifurcation',
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
                                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 15,
                                    columns: [
                                      DataColumn(label: buildDecoratedContainer( Text('General Tax\n    (30%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Road Tax\n    (3%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax\n        (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Education Tax\n        (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Water Tax\n    (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax\n    (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax\n      (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Tree Tax\n      (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('State Education Tax\n      (2%)'))),
                                      DataColumn(label: buildDecoratedContainer( Text('Professional Tax\n      (2%)'))),
                                      DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Total Tax '))),)),
                                    ],
                                    rows: [
                                      DataRow(
                                        cells: [
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['generalTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['roadTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['firefightingTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['educationTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['waterTax'].toString().toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['cleanlinessTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['sewerageTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['treeTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['stateEducationTax'].toString()))),
                                          DataCell(buildDecoratedContainer(Text(controller.saf_grandTaxesList[0]['professionalTax'].toString()))),
                                          DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(controller.saf_grandTaxesList[0]['professionalTax'].toString()))),)),
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text( " Total Amount - ",
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.pinkAccent,
                              ),),
                            SizedBox(width: 14),
                            Text(controller.saf_payableAmount.toString(),
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.pinkAccent,
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text( " Rebate Amount - ",
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.pinkAccent,
                              ),),
                            SizedBox(width: 14),
                            Text( nullToNA(controller.saf_rebateAmount.toString()),
                              style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.pinkAccent,
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                    child: new Text('Submit',
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white)),
                    onPressed: () async {
                      await Get.to(PropertyNAGeoTaggingView());
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



Container buildDecoratedContainer(Widget child) {
  return Container(
    padding:  EdgeInsets.only(right: 15.0),
    decoration: BoxDecoration(
      border: Border(right: BorderSide(width: 1, color: Colors.grey)),
    ),
    child: Center(child: child),
  );
}
//       WillPopScope(
//         onWillPop: () async => true,
//     child: Scaffold(   backgroundColor: Color(0xFFF0F6F9),
//       appBar: AssessmentAppbar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children:
//           [
//             //SUCCESSFULLY SUBMITTED
//
//             // //SUCCESSFULLY SUBMITTED
//             // SizedBox(height:20,),
//             // Container(
//             //   padding: const EdgeInsets.all(8.0),
//             //   decoration: BoxDecoration(
//             //     color: Colors.greenAccent.shade200,
//             //     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //   ),
//             //   child: FractionallySizedBox(
//             //     widthFactor: 0.9,
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //       children: [
//             //         Container(
//             //           width: MediaQuery.of(context).size.width * 0.2,
//             //           height: MediaQuery.of(context).size.width * 0.2,
//             //           decoration: BoxDecoration(
//             //             shape: BoxShape.rectangle,
//             //             borderRadius: BorderRadius.circular(8),
//             //             image: DecorationImage(
//             //               image: NetworkImage(
//             //                 "https://cdn-icons-png.flaticon.com/512/6236/6236992.png",
//             //               ),
//             //               fit: BoxFit.cover,
//             //             ),
//             //           ),
//             //         ),
//             //         SizedBox(height: 8.0),
//             //         Text(
//             //           'Your form has been submitted \nsuccessfully.',
//             //           style: TextStyle(
//             //             color: Colors.black,
//             //             fontSize: 16,
//             //             fontWeight: FontWeight.w700,
//             //           ),
//             //           textAlign: TextAlign.center,
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             // //SAF DETAILS
//             // SizedBox(height: 10,),
//             // Container(
//             //   padding: const EdgeInsets.all(8.0),
//             //   decoration: BoxDecoration(
//             //     color: Colors.white,
//             //     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //     boxShadow: [
//             //       BoxShadow(
//             //         color: Colors.grey.withOpacity(0.2),
//             //         spreadRadius: 2,
//             //         blurRadius: 3,
//             //         offset: Offset(0, 1),
//             //       ),
//             //     ],
//             //     border: Border.all(color: Colors.greenAccent.shade200, width: 2.0),
//             //   ),
//             //   child: FractionallySizedBox(
//             //     widthFactor: 0.9,
//             //     child: Padding(
//             //       padding: const EdgeInsets.all(8.0),
//             //       child: Column(
//             //         children: [
//             //           SizedBox(height: 4,),
//             //           Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Text('SAF NO:'),
//             //               Text(
//             //                 controller.safNo.toString(),
//             //               ),
//             //             ],
//             //           ),
//             //           SizedBox(height: 4,),
//             //           Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Text('Apply Date :'),
//             //               Text(
//             //                 controller.applyDate.toString(),
//             //               ),
//             //             ],
//             //           ),
//             //           SizedBox(height: 4,),
//             //           Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Text('Rebate :'),
//             //               Text(
//             //                 controller.demandAmount['rebateAmt'].toString(),
//             //               ),
//             //             ],
//             //           ),
//             //           SizedBox(height: 4,),
//             //           Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Text('Late Assessment Penalty(Rs):'),
//             //               Text(
//             //                 controller.demandAmount['lateAssessmentPenalty'].toString(),
//             //               ),
//             //             ],
//             //           ),
//             //           SizedBox(height: 4,),
//             //           Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Text('1% Penalty  :'),
//             //               Text(
//             //                 controller.demandAmount['totalOnePercPenalty'].toString(),
//             //               ),
//             //             ],
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // //TOTAL TAX
//             // SizedBox(height: 10,),
//             // Container(
//             //   padding: const EdgeInsets.all(8.0),
//             //   decoration: BoxDecoration(
//             //     color: Colors.white,
//             //     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //     boxShadow: [
//             //       BoxShadow(
//             //         color: Colors.grey.withOpacity(0.2),
//             //         spreadRadius: 2,
//             //         blurRadius: 3,
//             //         offset: Offset(0, 1),
//             //       ),
//             //     ],
//             //     border: Border.all(color: Colors.greenAccent.shade200, width: 2.0),
//             //   ),
//             //   child: FractionallySizedBox(
//             //     widthFactor: 0.9,
//             //     child: Padding(
//             //       padding: const EdgeInsets.all(8.0),
//             //       child: Column(
//             //         children: [
//             //           Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Text('Total Tax : '),
//             //               Text(
//             //                 controller.demandAmount['payableAmount'].toString(),
//             //               ),
//             //             ],
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // //TAX DETAIL
//             // Container(
//             //   padding: EdgeInsets.all(8.0),
//             //   margin: EdgeInsets.all(8.0),
//             //   child: Column(
//             //     children: [
//             //       Container(
//             //         padding: const EdgeInsets.all(4.0),
//             //         decoration: BoxDecoration(
//             //           color: Colors.greenAccent.shade200,
//             //           borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //           boxShadow: [
//             //             BoxShadow(
//             //               color: Colors.grey.withOpacity(0.2),
//             //               spreadRadius: 2,
//             //               blurRadius: 3,
//             //               offset: Offset(0, 1), // changes position of shadow
//             //             ),
//             //           ],
//             //         ),
//             //         child: Column(
//             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //           children: [
//             //             Padding(
//             //               padding: const EdgeInsets.all(8.0),
//             //               child: Text('TAX DETAIL',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w500),),
//             //             ),
//             //             Container(
//             //               padding: const EdgeInsets.all(10.0),
//             //               decoration: BoxDecoration(
//             //                 color: Colors.white,
//             //                 borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //                 boxShadow: [
//             //                   BoxShadow(
//             //                     color: Colors.grey.withOpacity(0.2),
//             //                     spreadRadius: 2,
//             //                     blurRadius: 3,
//             //                     offset: Offset(0, 1), // changes position of shadow
//             //                   ),
//             //                 ],
//             //               ),
//             //               child:
//             //               Column(
//             //                 children: [
//             //                   //TOTAL TAX
//             //                   SizedBox(height: 3,),
//             //                   Row(
//             //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                     children: [
//             //                       Text('Tax Amount :    '),
//             //                       Text(
//             //                         controller.demandAmount['totalTax'].toString(),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                   //LATE ASSESSMENT PENALTY
//             //                   SizedBox(height: 4,),
//             //                   Row(
//             //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                     children: [
//             //                       Text('Late Assessment Penalty  :    '),
//             //                       Text(
//             //                         controller.demandAmount['lateAssessmentPenalty'].toString(),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                   //1% PENALTY
//             //                   SizedBox(height: 4,),
//             //                   Row(
//             //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                     children: [
//             //                       Text('1% Penalty (Rs)  :    '),
//             //                       Text(
//             //                         controller.demandAmount['totalOnePercPenalty'].toString(),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                   // REBATE (10%)
//             //                   SizedBox(height: 4,),
//             //                   Row(
//             //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                     children: [
//             //                       Text('Rebate(10% IN RS)  :    '),
//             //                       Text(
//             //                         controller.demandAmount['rebateAmt'].toString(),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                   //SPECIAL REBATE
//             //                   SizedBox(height: 4,),
//             //                   Row(
//             //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                     children: [
//             //                       Text('Special Rebate(0% IN RS)  :    '),
//             //                       Text(
//             //                         controller.demandAmount['specialRebateAmt'].toString(),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                   //AMOUNT PAYABLE
//             //                   SizedBox(height: 4,),
//             //                   Row(
//             //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                     children: [
//             //                       Text('Payable Amount(Rs) :    '),
//             //                       Text(
//             //                         controller.demandAmount['payableAmount'].toString(),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                 ],
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             //
//             //
//             // //REBATE DESCRIPTION
//             // Container(
//             //   padding: EdgeInsets.all(8.0),
//             //   margin: EdgeInsets.all(8.0),
//             //   child: Column(
//             //     children: [
//             //       Container(
//             //         padding: const EdgeInsets.all(4.0),
//             //         decoration: BoxDecoration(
//             //           color: Colors.greenAccent.shade200,
//             //           borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //           boxShadow: [
//             //             BoxShadow(
//             //               color: Colors.grey.withOpacity(0.2),
//             //               spreadRadius: 2,
//             //               blurRadius: 3,
//             //               offset: Offset(0, 1), // changes position of shadow
//             //             ),
//             //           ],
//             //         ),
//             //         child: Column(
//             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //           children: [
//             //             Padding(
//             //               padding: const EdgeInsets.all(8.0),
//             //               child: Text('REBATE DESCRIPTION ',style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w500),),
//             //             ),
//             //             Container(
//             //               padding: const EdgeInsets.all(10.0),
//             //               decoration: BoxDecoration(
//             //                 color: Colors.white,
//             //                 borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //                 boxShadow: [
//             //                   BoxShadow(
//             //                     color: Colors.grey.withOpacity(0.2),
//             //                     spreadRadius: 2,
//             //                     blurRadius: 3,
//             //                     offset: Offset(0, 1), // changes position of shadow
//             //                   ),
//             //                 ],
//             //               ),
//             //               child:
//             //               // Column(
//             //               //   children: List.generate(
//             //               //     controller.demandAmountRebates.length,
//             //               //         (index) {
//             //               //       final rebate = controller.demandAmountRebates[index];
//             //               //       return Padding(
//             //               //         padding: EdgeInsets.symmetric(vertical: 10),
//             //               //         child: Column(
//             //               //           children: [
//             //               //             Row(
//             //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               //               children: [
//             //               //                 Text('# :    '),
//             //               //                 Text(rebate['rebateTypeId'].toString()),
//             //               //               ],
//             //               //             ),
//             //               //             SizedBox(height: 4),
//             //               //             Row(
//             //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               //               children: [
//             //               //                 Text('Rebate Type  :    '),
//             //               //                 Text(rebate['rebateType']),
//             //               //               ],
//             //               //             ),
//             //               //             SizedBox(height: 4),
//             //               //             Row(
//             //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               //               children: [
//             //               //                 Text('Percent(%)  :    '),
//             //               //                 Text(rebate['rebatePerc'].toString()),
//             //               //               ],
//             //               //             ),
//             //               //             SizedBox(height: 4),
//             //               //             Row(
//             //               //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               //               children: [
//             //               //                 Text('Amount :    '),
//             //               //                 Text(rebate['rebateAmount'].toString()),
//             //               //               ],
//             //               //             ),
//             //               //           ],
//             //               //         ),
//             //               //       );
//             //               //     },
//             //               //   ),
//             //               // ),
//             //               SingleChildScrollView(
//             //                 scrollDirection: Axis.vertical,
//             //                 child: Table(
//             //                   columnWidths: {
//             //                     0: FlexColumnWidth(),
//             //                     2: FlexColumnWidth(),
//             //                     2: FlexColumnWidth(),
//             //                     3: FlexColumnWidth(),
//             //                   },
//             //                   children: [
//             //                     TableRow(
//             //                       decoration: BoxDecoration(
//             //                         color: Colors.grey[200],
//             //                       ),
//             //                       children: [
//             //                         // TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('#'))),
//             //                         TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Rebate Type'))),
//             //                         TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Percent (%)'))),
//             //                         TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text('Amount'))),
//             //                       ],
//             //                     ),
//             //                     for (var rebate in controller.demandAmountRebates)
//             //                       TableRow(
//             //                         children: [
//             //                           // TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(rebate['rebateTypeId'].toString()))),
//             //                           TableCell(child: Padding(padding: EdgeInsets.all(10), child: Text(rebate['keyString'],textAlign: TextAlign.center))),
//             //                           TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(rebate['rebatePerc'].toString(),textAlign: TextAlign.center))),
//             //                           TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text(rebate['rebateAmount'].toString(),textAlign: TextAlign.center))),
//             //                         ],
//             //                       ),
//             //                   ],
//             //                 ),
//             //               )
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // // controller.ruleSet1 != null && controller.ruleSet1.isNotEmpty
//             //
//             // //TAX DESCRIPTION
//             // //RULESET - 1
//             // if (controller.ruleSet1 != null && controller.ruleSet1.isNotEmpty)
//             //   Container(
//             //     padding: EdgeInsets.all(8.0),
//             //     margin: EdgeInsets.all(8.0),
//             //     child: Column(
//             //       children: [
//             //         Container(
//             //           padding: const EdgeInsets.all(4.0),
//             //           decoration: BoxDecoration(
//             //             color: Colors.greenAccent.shade200,
//             //             borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //             boxShadow: [
//             //               BoxShadow(
//             //                 color: Colors.grey.withOpacity(0.2),
//             //                 spreadRadius: 2,
//             //                 blurRadius: 3,
//             //                 offset: Offset(0, 1), // changes position of shadow
//             //               ),
//             //             ],
//             //           ),
//             //           child: Column(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.all(8.0),
//             //                 child: Text(
//             //                   'Tax Description of Annual Rental Value - As Per Old Rule (Effect Upto 31-03-2016)',
//             //                   style: TextStyle(
//             //                     color: Colors.black,
//             //                     fontSize: 16,
//             //                     fontWeight: FontWeight.w500,
//             //                   ),
//             //                 ),
//             //               ),
//             //               Container(
//             //                 padding: const EdgeInsets.all(10.0),
//             //                 decoration: BoxDecoration(
//             //                   color: Colors.white,
//             //                   borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //                   boxShadow: [
//             //                     BoxShadow(
//             //                       color: Colors.grey.withOpacity(0.2),
//             //                       spreadRadius: 2,
//             //                       blurRadius: 3,
//             //                       offset: Offset(0, 1), // changes position of shadow
//             //                     ),
//             //                   ],
//             //                 ),
//             //                 child: SingleChildScrollView(
//             //                   scrollDirection: Axis.horizontal,
//             //                   child: DataTable(
//             //                     columnSpacing: 10,
//             //                     columns: [
//             //                       DataColumn(label: Center(child: Text('ARV')),),
//             //                       DataColumn(label: Center(child: Text('Quarter')),),
//             //                       DataColumn(label: Center(child: Text('Quarter / Year')),),
//             //                       DataColumn(label: Center(child: Text('Holding Tax (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('1% penalty (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('Water Tax (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('Latrine/Conservancy Tax (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('Education Cess (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('Health Cess (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('Quarterly Tax (Rs)')),),
//             //                       DataColumn(label: Center(child: Text('Due Date')),),
//             //
//             //                     ],
//             //                     rows: [
//             //                       for (var rule1 in controller.ruleSet1)
//             //                         DataRow(
//             //                           cells: [
//             //                             DataCell(Center(child: Text(rule1['arv'].toString()),),),
//             //                             DataCell(Center(child: Text(rule1['qtr'].toString()),), ),
//             //                             DataCell(Center(child: Text(rule1['quarterYear'].toString()),), ),
//             //                             DataCell(Center(child: Text(rule1['holdingTax'].toString()),), ),
//             //                             DataCell(Center(child: Text(rule1['onePercPenaltyTax'].toString()),), ),
//             //                             DataCell(Center(child: Text(rule1['waterTax'].toString()),), ),
//             //                             DataCell(Center(child: Text(rule1['latrineTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule1['educationTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule1['healthCess'].toString()),),),
//             //                             DataCell(Center(child: Text(rule1['totalTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule1['dueDate'].toString()),), ),
//             //
//             //                           ],
//             //                         ),
//             //                     ],
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ),],
//             //     ),
//             //   ),
//             // //TAX DESCRIPTION
//             // //RULESET - 2
//             // SizedBox(
//             //   height: 20,
//             // ),
//             // if (controller.ruleSet2 != null && controller.ruleSet2.isNotEmpty)
//             //   Container(
//             //     padding: EdgeInsets.all(8.0),
//             //     margin: EdgeInsets.all(8.0),
//             //     child: Column(
//             //       children: [
//             //         Container(
//             //           padding: const EdgeInsets.all(4.0),
//             //           decoration: BoxDecoration(
//             //             color: Colors.greenAccent.shade200,
//             //             borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //             boxShadow: [
//             //               BoxShadow(
//             //                 color: Colors.grey.withOpacity(0.2),
//             //                 spreadRadius: 2,
//             //                 blurRadius: 3,
//             //                 offset: Offset(0, 1), // changes position of shadow
//             //               ),
//             //             ],
//             //           ),
//             //           child: Column(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.all(8.0),
//             //                 child: Text(
//             //                   'Tax Description Annual Rental Value - As ARV Rule (Effect From 01-04-2016 to 31-03-2022)',
//             //                   style: TextStyle(
//             //                     color: Colors.black,
//             //                     fontSize: 16,
//             //                     fontWeight: FontWeight.w500,
//             //                   ),
//             //                 ),
//             //               ),
//             //               Container(
//             //                 padding: const EdgeInsets.all(10.0),
//             //                 decoration: BoxDecoration(
//             //                   color: Colors.white,
//             //                   borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //                   boxShadow: [
//             //                     BoxShadow(
//             //                       color: Colors.grey.withOpacity(0.2),
//             //                       spreadRadius: 2,
//             //                       blurRadius: 3,
//             //                       offset: Offset(0, 1), // changes position of shadow
//             //                     ),
//             //                   ],
//             //                 ),
//             //                 child: SingleChildScrollView(
//             //                   scrollDirection: Axis.horizontal,
//             //                   child: DataTable(
//             //                     columnSpacing: 10,
//             //                     columns: [
//             //                       DataColumn(label: Center(child: Text('ARV'),),),
//             //                       DataColumn(label: Center(child: Text('Quarter'),),),
//             //                       DataColumn(label: Center(child: Text('Quarter / Year'),),),
//             //                       DataColumn(label: Center(child: Text('Holding Tax (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('1% penalty (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('Additional Tax(RWH Penalty) (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('Total Tax (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('Due Date'),),),
//             //                     ],
//             //                     rows: [
//             //                       for (var rule2 in controller.ruleSet2)
//             //                         DataRow(
//             //                           cells: [
//             //                             DataCell(Center(child: Text(rule2['arv'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['qtr'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['quarterYear'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['holdingTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['onePercPenaltyTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['rwhPenalty'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['totalTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule2['dueDate'].toString()),),),
//             //                           ],
//             //                         ),
//             //                     ],
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ),],
//             //     ),
//             //   ),
//             // //TAX DESCRIPTION
//             // //RULESET - 3
//             // SizedBox(height: 20,),
//             // if (controller.ruleSet3 != null && controller.ruleSet3.isNotEmpty)
//             //   Container(
//             //     padding: EdgeInsets.all(8.0),
//             //     margin: EdgeInsets.all(8.0),
//             //     child: Column(
//             //       children: [
//             //         Container(
//             //           padding: const EdgeInsets.all(4.0),
//             //           decoration: BoxDecoration(
//             //             color: Colors.greenAccent.shade200,
//             //             borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //             boxShadow: [
//             //               BoxShadow(
//             //                 color: Colors.grey.withOpacity(0.2),
//             //                 spreadRadius: 2,
//             //                 blurRadius: 3,
//             //                 offset: Offset(0, 1),
//             //               ),
//             //             ],
//             //           ),
//             //           child: Column(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.all(8.0),
//             //                 child: Text(
//             //                   'Tax Description of Capital Value - As Per Current Rule (Effect From 01-04-2022)',
//             //                   style: TextStyle(
//             //                     color: Colors.black,
//             //                     fontSize: 16,
//             //                     fontWeight: FontWeight.w500,
//             //                   ),
//             //                 ),
//             //               ),
//             //               Container(
//             //                 padding: const EdgeInsets.all(10.0),
//             //                 decoration: BoxDecoration(
//             //                   color: Colors.white,
//             //                   borderRadius: BorderRadius.all(Radius.circular(1.0)),
//             //                   boxShadow: [
//             //                     BoxShadow(
//             //                       color: Colors.grey.withOpacity(0.2),
//             //                       spreadRadius: 2,
//             //                       blurRadius: 3,
//             //                       offset: Offset(0, 1),
//             //                     ),
//             //                   ],
//             //                 ),
//             //                 child: SingleChildScrollView(
//             //                   scrollDirection: Axis.horizontal,
//             //                   child: DataTable(
//             //                     columnSpacing: 10,
//             //                     columns: [
//             //                       DataColumn(label: Center(child: Text('ARV'),),),
//             //                       DataColumn(label: Center(child: Text('Quarter'),),),
//             //                       DataColumn(label: Center(child: Text('Quarter / Year'),),),
//             //                       DataColumn(label: Center(child: Text('Holding Tax (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('1% penalty (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('Additional Tax(RWH Penalty) (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('Total Tax (Rs)'),),),
//             //                       DataColumn(label: Center(child: Text('Due Date'),),),
//             //                     ],
//             //                     rows: [
//             //                       for (var rule3 in controller.ruleSet3)
//             //                         DataRow(
//             //                           cells: [
//             //                             DataCell(Center(child: Text(rule3['arv'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['qtr'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['quarterYear'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['holdingTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['onePercPenaltyTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['rwhPenalty'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['totalTax'].toString()),),),
//             //                             DataCell(Center(child: Text(rule3['dueDate'].toString()),),),
//             //                           ],
//             //                         ),
//             //                     ],
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ),],
//             //     ),
//             //   ),
//
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//
//                 ElevatedButton(
//                   onPressed: () async {
//                     await controller.clearForm();
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => PropertyHomeScreenView()), (route) => false,
//                     );
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.arrow_left),
//                       Text('  Back'),
//
//                     ],
//                   ),
//                 ),
//
//                 ElevatedButton(
//                     onPressed: () async {
//
//                      await Get.to(PropertyNAGeoTaggingView());
//                     },
//                     child: Row(
//                       children: [
//                         Text('GeoTagging'),
//                         Icon(Icons.arrow_right),
//                       ],
//                     ))
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//           ],
//         ),
//
//       ),),
//     );
//   }
// }
