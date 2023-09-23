import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/property_search_assessment_detail_controller.dart';
import 'SearchAssessment_DemandDetails_view.dart';

class SafDetailsView extends GetView<SearchAssessmentDetailController> {
  const SafDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saf Detail"),
      elevation: 0,),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height:20,),
                    //Basic detail
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Basic Details',
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Application No',controller.searchedDataById[0].holdingNo.toString()),
                                  _buildDetailsRow('Old Ward No',  controller.searchedDataById[0].oldWardNo.toString()),
                                  _buildDetailsRow('New Ward No',controller.searchedDataById[0].newWardNo.toString()),
                                  _buildDetailsRow('Ownership Type',controller.searchedDataById[0].ownershipType),
                                  _buildDetailsRow('Property Type', controller.searchedDataById[0].propertyType),
                                  _buildDetailsRow('Holding Type',  controller.searchedDataById[0].holdingType),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //PROPERTY DETAIL
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Property Address & Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Khata No', controller.searchedDataById[0].khataNo),
                                  _buildDetailsRow('Plot No', controller.searchedDataById[0].plotNo),
                                  _buildDetailsRow('Village/Mauja Name', controller.searchedDataById[0].villageMaujaName),
                                  _buildDetailsRow('Area of Plot(decimal)', controller.searchedDataById[0].areaOfPlot),
                                  _buildDetailsRow('Road Width(ft)', controller.searchedDataById[0].roadWidth),
                                  _buildDetailsRow('Property Address', controller.searchedDataById[0].propAddress),
                                  _buildDetailsRow('Corresponding Address', controller.searchedDataById[0].corrAddress),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //OWNER DETAIL
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Owner Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Owner Name', controller.searchedDataById[0].owners[0].ownerName.toString() ?? ''),
                                  _buildDetailsRow('Gender', controller.searchedDataById[0].owners[0].gender.toString() ?? ''),
                                  _buildDetailsRow('DOB', controller.searchedDataById[0].owners[0].dob.toString() ?? ''),
                                  _buildDetailsRow('Guardian Name', controller.searchedDataById[0].owners[0].guardianName.toString() ?? ''),
                                  _buildDetailsRow('Relation', controller.searchedDataById[0].owners[0].relationType.toString() ?? ''),
                                  _buildDetailsRow('Mobile No', controller.searchedDataById[0].owners[0].mobileNo.toString() ?? ''),
                                  _buildDetailsRow('Aadhar', controller.searchedDataById[0].owners[0].aadharNo.toString() ?? ''),
                                  _buildDetailsRow('Pan No', controller.searchedDataById[0].owners[0].panNo.toString() ?? ''),
                                  _buildDetailsRow('Email', controller.searchedDataById[0].owners[0].email.toString() ?? ''),
                                  _buildDetailsRow('Is Armed-Force?', controller.searchedDataById[0].owners[0].isArmedForce.toString()),
                                  _buildDetailsRow('Is Specially Abled?', controller.searchedDataById[0].owners[0].isSpeciallyAbled.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //ELECTRICITY DETAIL
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Electricity Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Electricity k. No', controller.searchedDataById[0].electConsumerNo),
                                  _buildDetailsRow('ACC No', controller.searchedDataById[0].electAccNo),
                                  _buildDetailsRow('Bind/Book No', controller.searchedDataById[0].electBindBookNo),
                                  _buildDetailsRow('Electricity Consumer Category', controller.searchedDataById[0].electConsCategory),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //BUILDING DETAILS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Building Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Building Plan Approval No', controller.searchedDataById[0].buildingPlanApprovalNo),
                                  _buildDetailsRow('Building Plan Approval Date', controller.searchedDataById[0].buildingPlanApprovalDate),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //WATER DETAILS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Water Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Water Consumer No', controller.searchedDataById[0].waterConnNo),
                                  _buildDetailsRow('Water Connection Date', controller.searchedDataById[0].waterConnDate),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //FLOOR DETAILS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Floor Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // _buildDetailsRow('Floor', controller.searchedDataById[0].floors[0].floorName.toString() ?? ''),
                                  // _buildDetailsRow('Usage Type',  controller.searchedDataById[0].floors[0].usageType.toString() ?? ''),
                                  // _buildDetailsRow('Occupancy Type', controller.searchedDataById[0].floors[0].occupancyType.toString() ?? ''),
                                  // _buildDetailsRow('Construction Type', controller.searchedDataById[0].floors[0].constructionType.toString() ?? ''),
                                  // _buildDetailsRow('Built Up Area(Sqt)', controller.searchedDataById[0].floors[0].builtupArea.toString() ?? ''),
                                  // _buildDetailsRow('From Date',  controller.searchedDataById[0].floors[0].dateFrom.toString() ?? ''),
                                  // _buildDetailsRow('Upto Date', controller.searchedDataById[0].floors[0].dateUpto.toString() ?? ''),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //ADDITIONAL DETAILS
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    ' Additional Details',
                                    // textAlign: TextAlign.start,
                                    style:  GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDetailsRow('Property has Mobile Tower(s)?',controller.searchedDataById[0].isMobileTower.toString() ),
                                  _buildDetailsRow('Property has Hoarding Board(s)?', controller.searchedDataById[0].isHoardingBoard.toString() ),
                                  _buildDetailsRow('Is Property a Petrol Pump?',controller.searchedDataById[0].isPetrolPump.toString() ),
                                  _buildDetailsRow('Rainwater Harvesting Provision?', controller.searchedDataById[0].isWaterHarvesting.toString() ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // //DOCUMENT LIST
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     padding: const EdgeInsets.all(6),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.2),
                    //           spreadRadius: 2,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 1),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    //           child: Row(
                    //             children: [
                    //               Icon(Icons.person_pin_outlined,
                    //                   color: Colors.indigo),
                    //               Text(
                    //                 'Document List',
                    //                 // textAlign: TextAlign.start,
                    //                 style:  GoogleFonts.publicSans(
                    //                   fontSize: 16,
                    //                   fontStyle: FontStyle.normal,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.indigo,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Container(
                    //                 child: SingleChildScrollView(
                    //                   scrollDirection: Axis.horizontal,
                    //                   child: DataTable(
                    //                     columnSpacing: 20,
                    //                     columns: [
                    //                       DataColumn(label: Center(child: Text('#'))),
                    //                       DataColumn(label: Center(child: Text('Document Name'))),
                    //                       DataColumn(label: Center(child: Text('View'))),
                    //                       DataColumn(label: Center(child: Text('Status'))),
                    //                       DataColumn(label: Center(child: Text('Remarks'))),
                    //                     ],
                    //                     rows: controller.documents.map((document) {
                    //                       Widget viewWidget;
                    //
                    //                       if (document['doc_path'].toString().endsWith('.pdf')) {
                    //                         viewWidget = Text('Document'); // Display 'Document' for PDF files
                    //                       } else if (document['doc_path'].toString().isNotEmpty) {
                    //                         // viewWidget = Image.network(document['doc_path'].toString()); // Display the image
                    //                         viewWidget = Image.network(
                    //                           document['doc_path'].toString(),
                    //                           errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    //                             // Handle the error here, for example, display a placeholder image or an error message.
                    //                             return Icon(Icons.error_outline_outlined); // Replace with your custom error widget.
                    //                           },
                    //                         );
                    //
                    //                       // Image.network(document['doc_path'].toString());
                    //                       } else {
                    //                         viewWidget = Text('No Data');
                    //                       }
                    //                       String statusText;
                    //                       if (document['verify_status'] == 1) {
                    //                         statusText = 'Verified';
                    //                       } else if (document['verify_status'] == 0) {
                    //                         statusText = 'Pending';
                    //                       } else {
                    //                         statusText = 'NA';
                    //                       }
                    //                       return DataRow(
                    //                         cells: [
                    //                           DataCell(Center(child: Text((controller.documents.indexOf(document) + 1).toString()))),
                    //                           DataCell(Center(child: Text(document['doc_code'].toString()))),
                    //                           DataCell(Center(child: viewWidget)),
                    //                           DataCell(Center(child: Text(statusText))),
                    //                           DataCell(Center(child: Text(document['remarks'].toString()))),
                    //                         ],
                    //                       );
                    //                     }).toList(),
                    //                   ),
                    //                 ),
                    //
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //
                    // //TC COMPARISOON LIST
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     padding: const EdgeInsets.all(6),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.2),
                    //           spreadRadius: 2,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 1),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    //           child:    Row(
                    //             children: [
                    //               Icon(Icons.person_pin_outlined,
                    //                   color: Colors.indigo),
                    //               Text(
                    //                 'TC Comparision List',
                    //                 // textAlign: TextAlign.start,
                    //                 style:  GoogleFonts.publicSans(
                    //                   fontSize: 16,
                    //                   fontStyle: FontStyle.normal,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.indigo,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                    //           child:  Column(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Container(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child: SingleChildScrollView(
                    //                   scrollDirection: Axis.horizontal,
                    //                   child: DataTable(
                    //                     columnSpacing: 20,
                    //                     columns: [
                    //                       DataColumn(label: Center(child: Text('#'))),
                    //                       DataColumn(label: Center(child: Text('Verified By'))),
                    //                       DataColumn(label: Center(child: Text('Verification On'))),
                    //                       DataColumn(label: Center(child: Text('View'))),
                    //
                    //                     ],
                    //                     rows: controller.verifications.map((verification) {
                    //                       return DataRow(
                    //                         cells: [
                    //                           DataCell(Center(child: Text(verification['id'].toString()))),
                    //                           DataCell(Center(child: Text(verification['verified_by'].toString()))),
                    //                           DataCell(Center(child: Text(verification['created_at'].toString()))),
                    //                           DataCell(Center(child: ElevatedButton(onPressed: (){}, child: Text('View')))),
                    //
                    //                         ],
                    //                       );
                    //                     }).toList(),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0),
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
