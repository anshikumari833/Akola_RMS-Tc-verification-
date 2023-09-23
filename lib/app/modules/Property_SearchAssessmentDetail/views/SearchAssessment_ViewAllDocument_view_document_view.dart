import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/property_search_assessment_detail_controller.dart';

class SearchAssessmentViewDocumentView extends GetView<SearchAssessmentDetailController> {
  const SearchAssessmentViewDocumentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Document"),
        elevation: 0,),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height:20,),
                    //DOCUMENT LIST
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
                                    'Document List',
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        columnSpacing: 20,
                                        columns: [
                                          DataColumn(label: Center(child: Text('#'))),
                                          DataColumn(label: Center(child: Text('Document Name'))),
                                          DataColumn(label: Center(child: Text('View'))),
                                          DataColumn(label: Center(child: Text('Status'))),
                                          DataColumn(label: Center(child: Text('Remarks'))),
                                        ],
                                        rows: controller.documents.map((document) {
                                          Widget viewWidget;

                                          if (document['doc_path'].toString().endsWith('.pdf')) {
                                            viewWidget = Text('Document'); // Display 'Document' for PDF files
                                          } else if (document['doc_path'].toString().isNotEmpty) {
                                            // viewWidget = Image.network(document['doc_path'].toString()); // Display the image
                                            viewWidget = Image.network(
                                              document['doc_path'].toString(),
                                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                // Handle the error here, for example, display a placeholder image or an error message.
                                                return Icon(Icons.error_outline_outlined); // Replace with your custom error widget.
                                              },
                                            );

                                            // Image.network(document['doc_path'].toString());
                                          } else {
                                            viewWidget = Text('No Data');
                                          }
                                          String statusText;
                                          if (document['verify_status'] == 1) {
                                            statusText = 'Verified';
                                          } else if (document['verify_status'] == 0) {
                                            statusText = 'Pending';
                                          } else {
                                            statusText = 'NA';
                                          }
                                          return DataRow(
                                            cells: [
                                              DataCell(Center(child: Text((controller.documents.indexOf(document) + 1).toString()))),
                                              DataCell(Center(child: Text(document['doc_code'].toString()))),
                                              DataCell(Center(child: viewWidget)),
                                              DataCell(Center(child: Text(statusText))),
                                              DataCell(Center(child: Text(document['remarks'].toString()))),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //TC COMPARISOON LIST
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
                              child:    Row(
                                children: [
                                  Icon(Icons.person_pin_outlined,
                                      color: Colors.indigo),
                                  Text(
                                    'TC Comparision List',
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
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        columnSpacing: 20,
                                        columns: [
                                          DataColumn(label: Center(child: Text('#'))),
                                          DataColumn(label: Center(child: Text('Verified By'))),
                                          DataColumn(label: Center(child: Text('Verification On'))),
                                          DataColumn(label: Center(child: Text('View'))),

                                        ],
                                        rows: controller.verifications.map((verification) {
                                          return DataRow(
                                            cells: [
                                              DataCell(Center(child: Text(verification['id'].toString()))),
                                              DataCell(Center(child: Text(verification['verified_by'].toString()))),
                                              DataCell(Center(child: Text(verification['created_at'].toString()))),
                                              DataCell(Center(child: ElevatedButton(onPressed: (){}, child: Text('View')))),

                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
