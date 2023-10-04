import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../controllers/property_report_controller.dart';

class ReportListView extends GetView<PropertyReportController> {
  const ReportListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tc Collection Report'),
        centerTitle: true,
        elevation: 0,
      ),
        body: Obx(
        () {
      if (controller.isLoading.value) {
        return Container(
          color: const Color(0xFFF0F6F9),
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.blue,
              size: 50.0,
            ), // Loader widget
          ),
        );
      } else if (controller.reportList.isEmpty) {
        return Container(
          color: const Color(0xFFF0F6F9),
          child: Center(
            child: Text("No results found"),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom:0, left: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total Amount : ",
                            style: GoogleFonts.publicSans(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF454646),
                            ),
                          ),
                          SizedBox(
                            height: 5.3,
                          ),
                          Text(
                            controller.totalAmount,
                            style: GoogleFonts.publicSans(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF454646),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.keyboard_double_arrow_left),
                            onPressed: controller.previousPage,
                            disabledColor: Colors.grey,
                          ),
                          Obx(() => Text(
                            ' ${controller.currentPage.value}' ' to ${controller.totalPages.value}',
                            style: TextStyle(fontSize: 16.0),
                          )),

                          // SizedBox(width: 5.0),
                          IconButton(
                            icon: Icon(Icons.keyboard_double_arrow_right),
                            onPressed: controller.nextPage,
                            disabledColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.reportList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (controller.reportList.isEmpty || index >= controller.reportList.length) {
                    return SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ExpansionTileCard(
                           borderRadius: BorderRadius.circular(20.0),
                          // leading: Icon(Icons.arrow_drop_down_circle),
                          // title: _buildDetailsRow('Holding No',controller.reportList[index]['holding_no'].toString()),
                          title: _buildDetailsRow('${index + 1}. Holding No', controller.reportList[index]['holding_no'].toString()),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  _buildDetailsRow('Type', controller.reportList[index]['type'].toString()),
                                  _buildDetailsRow('Owner Name', controller.reportList[index]['owner_name'].toString()),
                                  _buildDetailsRow('Ward No', controller.reportList[index]['ward_no'].toString()),
                                  _buildDetailsRow('Mobile No', controller.reportList[index]['mobile_no'].toString()),
                                  _buildDetailsRow('Transaction Date', controller.reportList[index]['tran_date'].toString()),
                                  _buildDetailsRow('Transaction Mode', controller.reportList[index]['transaction_mode'].toString()),
                                  _buildDetailsRow('Transaction No', controller.reportList[index]['tran_no'].toString()),
                                  _buildDetailsRow('Amount', controller.reportList[index]['amount'].toString()),
                                  _buildDetailsRow('Cheque No', controller.reportList[index]['cheque_no'].toString()),
                                  _buildDetailsRow('Bank Name', controller.reportList[index]['bank_name'].toString()),
                                  _buildDetailsRow('Branch Name', controller.reportList[index]['branch_name'].toString()),
                                  _buildDetailsRow('Employee Name', controller.reportList[index]['emp_name'].toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
        //   SingleChildScrollView(
        //   child: Container(
        //     child: Column(
        //       children: [
        //         Container(
        //           child: Padding(
        //             padding: EdgeInsets.only(top: 5, bottom:0, left: 30, right: 10),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Text(
        //                       "Total Amount : ",
        //                       style: GoogleFonts.publicSans(
        //                         fontSize: 16,
        //                         fontStyle: FontStyle.normal,
        //                         fontWeight: FontWeight.w600,
        //                         color: Color(0xFF454646),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 5.3,
        //                     ),
        //                     Text(
        //                       controller.totalAmount,
        //                       style: GoogleFonts.publicSans(
        //                         fontSize: 16,
        //                         fontStyle: FontStyle.normal,
        //                         fontWeight: FontWeight.w600,
        //                         color: Color(0xFF454646),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     IconButton(
        //                       icon: Icon(Icons.keyboard_double_arrow_left),
        //                       onPressed: controller.previousPage,
        //                       disabledColor: Colors.grey,
        //                     ),
        //                     Obx(() => Text(
        //                       ' ${controller.currentPage.value}' ' to ${controller.totalPages.value}',
        //                       style: TextStyle(fontSize: 16.0),
        //                     )),
        //
        //                     // SizedBox(width: 5.0),
        //                     IconButton(
        //                       icon: Icon(Icons.keyboard_double_arrow_right),
        //                       onPressed: controller.nextPage,
        //                       disabledColor: Colors.grey,
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Obx(() {
        //           if (controller.isLoading.value) {
        //             return Container(
        //               height:400,
        //               child: Center(
        //                 child: SpinKitFadingCircle(
        //                   color: Colors.blue,
        //                   size: 50.0,
        //                 ),
        //               ),
        //             );
        //           }
        //           if (controller.reportList.isEmpty) {
        //             return
        //               Container(
        //                 height:400,
        //                 child: Center(
        //                   child: Text("No results found"),
        //                 ),
        //               );
        //           }
        //           return SingleChildScrollView(
        //             child:
        //             ListView.builder(
        //               shrinkWrap: true,
        //               physics: NeverScrollableScrollPhysics(),
        //               itemCount: controller.reportList.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 if (controller.reportList.isEmpty || index >= controller.reportList.length) {
        //                   return SizedBox.shrink();
        //                 }
        //                 return
        //                   GestureDetector(
        //                     onTap: () async{
        //                     },
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(10.0),
        //                       child: Container(
        //                         decoration: BoxDecoration(
        //                           color: Colors.blue[100],
        //                           borderRadius: BorderRadius.circular(20.0),
        //                         ),
        //                         child: Column(
        //                           children: [
        //                             SizedBox(height: 5,),
        //                             Text(
        //                               'Details',
        //                               textAlign: TextAlign.center,
        //                               style: TextStyle(
        //                                 fontWeight: FontWeight.bold,
        //                                 fontSize: 18,
        //                               ),
        //                             ),
        //                             Card(
        //                               margin: EdgeInsets.all(2.0),
        //                               shape: RoundedRectangleBorder(
        //                                 borderRadius: BorderRadius.circular(20.0),
        //                               ),
        //                               elevation: 2,
        //                               child: Column(
        //                                 crossAxisAlignment: CrossAxisAlignment.stretch,
        //                                 children: [
        //                                   Container(
        //                                     padding: const EdgeInsets.all(10.0),
        //                                     child: Column(
        //                                       crossAxisAlignment: CrossAxisAlignment.start,
        //                                       children: [
        //                                         _buildDetailsRow('Holding No',controller.reportList[index]['holding_no'].toString()),
        //                                         _buildDetailsRow('Owner Name', controller.reportList[index]['owner_name'].toString()),
        //                                         _buildDetailsRow('Ward No', controller.reportList[index]['ward_no'].toString()),
        //                                         _buildDetailsRow('Mobile No', controller.reportList[index]['mobile_no'].toString()),
        //                                         _buildDetailsRow('Transaction Date', controller.reportList[index]['tran_date'].toString()),
        //                                         _buildDetailsRow('Transaction Mode', controller.reportList[index]['transaction_mode'].toString()),
        //                                         _buildDetailsRow('Amount', controller.reportList[index]['amount'].toString()),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   );
        //               },
        //             ),
        //
        //
        //
        //             // ListView.builder(
        //             //   shrinkWrap: true,
        //             //   itemCount: controller.reportList.length,
        //             //   itemBuilder: (BuildContext context, int index) {
        //             //     if (controller.reportList.isEmpty || index >= controller.reportList.length) {
        //             //       return SizedBox.shrink();
        //             //     }
        //             //     return Padding(
        //             //       padding: const EdgeInsets.all(10.0),
        //             //       child: ExpansionTile(
        //             //         title: Text(
        //             //           'Holding No: ${controller.reportList[index]['holding_no']}',
        //             //           style: TextStyle(
        //             //             fontWeight: FontWeight.bold,
        //             //             fontSize: 18,
        //             //           ),
        //             //         ),
        //             //         children: [
        //             //           Card(
        //             //             margin: EdgeInsets.all(2.0),
        //             //             shape: RoundedRectangleBorder(
        //             //               borderRadius: BorderRadius.circular(20.0),
        //             //             ),
        //             //             elevation: 2,
        //             //             child: Column(
        //             //               crossAxisAlignment: CrossAxisAlignment.stretch,
        //             //               children: [
        //             //                 Container(
        //             //                   padding: const EdgeInsets.all(10.0),
        //             //                   child: Column(
        //             //                     crossAxisAlignment: CrossAxisAlignment.start,
        //             //                     children: [
        //             //                       _buildDetailsRow('Owner Name', controller.reportList[index]['owner_name'].toString()),
        //             //                       _buildDetailsRow('Ward No', controller.reportList[index]['ward_no'].toString()),
        //             //                       _buildDetailsRow('Mobile No', controller.reportList[index]['mobile_no'].toString()),
        //             //                       _buildDetailsRow('Transaction Date', controller.reportList[index]['tran_date'].toString()),
        //             //                       _buildDetailsRow('Transaction Mode', controller.reportList[index]['transaction_mode'].toString()),
        //             //                       _buildDetailsRow('Amount', controller.reportList[index]['amount'].toString()),
        //             //                     ],
        //             //                   ),
        //             //                 ),
        //             //               ],
        //             //             ),
        //             //           ),
        //             //         ],
        //             //       ),
        //             //     );
        //             //   },
        //             // ),
        //           );
        //         }
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      }}),
    );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              label,
              style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontStyle:
                  FontStyle.normal),
            ),
          ),
        ),
        Flexible(
          child: Text(
            nullToNA(value),
          ),
        ),
      ],
    ),
  );
}

