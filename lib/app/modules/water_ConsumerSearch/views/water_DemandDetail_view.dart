import 'package:amc_rms/app/modules/water_ConsumerSearch/views/part_payment_view.dart';
import 'package:amc_rms/app/modules/water_ConsumerSearch/views/rate_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/water_consumer_search_controller.dart';
import 'demand_Payment_view.dart';
import 'generate_demand_view.dart';

class WaterDemandDetailView extends GetView<WaterConsumerSearchController> {
  const WaterDemandDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demand Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  Obx(() {
        if (controller.isDataProcessing.value == true) {
          return  SpinKitSpinningLines(
            color: Colors.blue,
            size: 70.0,
          );
        }
        if(controller.demandStatus.value == '0'){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // width: 150,
                child: Lottie.asset('assets/lottie/WaterConsumer_NoDemand.json'),
              ),
              Container(
                // width: 150,
                child: Text(' Demand Not Found ',style: GoogleFonts.publicSans(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrangeAccent),
                  ),
              ),
            ],
          );
        } else{
          return SingleChildScrollView(
            child: Column(
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
                      _buildDetailsRow('Consumer No',controller.searchedConsumerDataById[0]['consumer_no'].toString()),
                      _buildDetailsRow('Property No',controller.searchedConsumerDataById[0]['property_no'].toString()),
                      _buildDetailsRow('Holding No',controller.searchedConsumerDataById[0]['holding_no'].toString()),
                      _buildDetailsRow('Applicant Name',controller.searchedConsumerDataById[0]['applicant_name'].toString()),
                      _buildDetailsRow('Property Address',controller.searchedConsumerDataById[0]['address'].toString()),
                    ],
                  ),
                ),

                //DEMAND DETAIL
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
                                        DataColumn(label: buildDecoratedContainer(Text(' # '))),
                                        DataColumn(label: buildDecoratedContainer(Text('Demand From'))),
                                        DataColumn(label: buildDecoratedContainer(Text('Demand Upto'))),
                                        DataColumn(label: buildDecoratedContainer(Text('Demand Amount'))),
                                        DataColumn(label: buildDecoratedContainer(Text('Penalty'))),
                                        DataColumn(label: buildDecoratedContainer(Text('Connection Type'))),
                                        DataColumn(
                                          label: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(child: Text('Payable Amount')),
                                          ),
                                        ),
                                      ],
                                      rows: List.generate(
                                        controller.consumerDemands.value.length,
                                            (index) {
                                          final fyearWiseTax = controller.consumerDemands.value[index];
                                          return DataRow(
                                            cells: [
                                              DataCell(buildDecoratedContainer(Text((index + 1).toString()))),
                                              DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['demand_from'])))),
                                              DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['demand_upto'])))),
                                              DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['amount'])))),
                                              DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['penalty'])))),
                                              DataCell(buildDecoratedContainer(Text(nullToNA(fyearWiseTax['connection_type'])))),
                                              DataCell(
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Center(child: Text(nullToNA(fyearWiseTax['balance_amount']))),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.printDemandTablePOS();
                      },
                      icon: Icon(
                        Icons.print,
                        size: 30,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),

                //METER CONNECTION DETAIL
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' Meter/Fixed Connection Detail ',
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
                                    DataColumn(label: buildDecoratedContainer( Text('Connection Type'))),
                                    DataColumn(label: buildDecoratedContainer( Text('   Meter No   '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Last Meter Reading'))),
                                    DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Connection Date'))),)),
                                  ],
                                  rows: [
                                    DataRow(
                                      cells: [
                                        DataCell(buildDecoratedContainer(Text(nullToNA(controller.searchedConsumerDataById[0]['meterDetails']['ConnectionTypeName'].toString())))),
                                        DataCell(buildDecoratedContainer(Text(nullToNA(controller.searchedConsumerDataById[0]['meterDetails']['meter_no'].toString())))),
                                        DataCell(buildDecoratedContainer(Text(nullToNA(controller.searchedConsumerDataById[0]['finalReading'].toString())))),
                                        DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(nullToNA(controller.searchedConsumerDataById[0]['meterDetails']['connection_date'].toString())))),)),
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height:5,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text( " 🔸 Total Dues - ",
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  SizedBox(width: 14),
                                  Text(controller.totalSumDemand.value.toString(),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text( " 🔸 Due From  - ",
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  SizedBox(width: 14),
                                  Text(controller. consumerDemands.value[0]['demand_from'].toString(),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text( " 🔸 Due Upto - ",
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  SizedBox(width: 14),
                                  Text(controller. consumerDemands.value[0]['demand_upto'].toString(),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text( " 🔸 Total Due Demand - ",
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  SizedBox(width: 14),
                                  Text(controller.consumerDemands.value.length.toString(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        controller.isDataProcessing.value = true;
                        controller.resetFullPaymentFields();
                        await controller.getConsumerDemandDetail(controller.consumer_id_pay);
                        Get.to(DemandPymentView());
                        controller.isDataProcessing.value = false; },
                      child: Text('  Full Payment '),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        controller.isDataProcessing.value = true;
                        controller.resetPartPaymentFields();
                        await controller.getConsumerDemandDetail(controller.consumer_id_pay);
                        Get.to(PartPaymentView());
                        controller.isDataProcessing.value = false; },
                      child: Text(' Part Payment '),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        controller.isDataProcessing.value = true;
                        controller.resetImageFields();
                        Get.to(GenerateDemandView());
                        // await controller.generateDemand(controller.searchedConsumerDataById[0]['id'].toString(), type: 'Fixed');
                        // await controller.getConsumerDemandDetail(controller.searchedConsumerDataById[0]['id'].toString());
                        controller.isDataProcessing.value = false; },
                      child: Text(' Generate Demand '),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        controller.isDataProcessing.value = true;
                        Get.to(RateChartView());
                        controller.isDataProcessing.value = false; },
                      child: Text(' Rate Chart '),
                    ),
                  ],
                ),
                SizedBox(height:80,),
                // //GENERATE DEMAND
                // if(controller.searchedConsumerDataById[0]['meterDetails']['ConnectionTypeName'].toString() == 'Meter')
                // Container(
                //   margin: EdgeInsets.all(14.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(15.0),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.1),
                //         spreadRadius: 2,
                //         blurRadius: 1,
                //         offset: Offset(0, 1),
                //       ),
                //     ],
                //   ),
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       SizedBox(height: 10),
                //       Row(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Text(
                //               'Upload Meter Image',
                //               style: GoogleFonts.publicSans(
                //                 fontSize: 14,
                //                 fontStyle: FontStyle.normal,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.black,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Obx(() => controller.selectedImage1Path == ''
                //           ? Padding(
                //         padding: const EdgeInsets.only(top: 20.0),
                //         child: Center(
                //           child: Text(
                //             'Select image from camera',
                //             style: TextStyle(fontSize: 10, color: Colors.black),
                //           ),
                //         ),
                //       )
                //           : Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Center(
                //               child: Image.file(
                //                 File(controller.selectedImage1Path.value),
                //               ),
                //             ),
                //           ),
                //           Obx(() => Center(
                //             child: Text(
                //               controller.selectedImage1Size.value,
                //               style: TextStyle(fontSize: 12, color: Colors.black),
                //             ),
                //           )),
                //         ],
                //       )),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: <Widget>[
                //           MaterialButton(
                //             color: Colors.blueGrey.shade300,
                //             child: Text(
                //               "Camera",
                //               style: TextStyle(color: Colors.white),
                //             ),
                //             onPressed: () {
                //               controller.getImage1(ImageSource.camera);
                //             },
                //           ),
                //           MaterialButton(
                //             color: Colors.teal.shade300,
                //             child: Text(
                //               "Device",
                //               style: TextStyle(color: Colors.white),
                //             ),
                //             onPressed: () {
                //               controller.getImage1(ImageSource.gallery);
                //             },
                //           ),
                //         ],
                //       ),
                //       CustomTextField(
                //          controller: controller.finalMeterReading,
                //         headingText: "Final Meter Readng", hintText: "Enter value",validator: (value) {
                //         if (value == null || value.isEmpty) {
                //           return 'This field is required';
                //         }
                //         return "";
                //       },),
                //       CustomDateTimeField(
                //         headingText: 'Demand Upto Date',
                //          controller: controller.demandDateUpto,
                //         decoration: InputDecoration(
                //           labelText: 'Date',
                //           border: OutlineInputBorder(),
                //         ),
                //         format: DateFormat("yyyy-MM-dd"),
                //         onShowPicker: (context, currentValue) {
                //           return showDatePicker(
                //               context: context,
                //               firstDate: DateTime(1900),
                //               initialDate: currentValue ?? DateTime.now(),
                //               lastDate: DateTime(2100));
                //         },
                //         validator: (value) {
                //           if (value == null) {
                //             return 'Please select a date and time';
                //           }
                //           // Add more validation if needed
                //           return null;
                //         },
                //       ),
                //       SizedBox(height:10,),
                //       Container(
                //         padding: const EdgeInsets.all(6),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 ElevatedButton(
                //                   onPressed: () async {
                //                     controller.isDataProcessing.value = true;
                //                    await controller.generateDemand(controller.searchedConsumerDataById[0]['id'].toString());
                //                    await controller.getConsumerDemandDetail(controller.searchedConsumerDataById[0]['id'].toString());
                //                     controller.isDataProcessing.value = false;
                //                    },
                //                   child: Text(' Generate Demand '),
                //                 )
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(height:10,),
                //     ],
                //   ),
                // ),
                // if(controller.searchedConsumerDataById[0]['meterDetails']['ConnectionTypeName'].toString() == 'Fixed')
                // Container(
                //   margin: EdgeInsets.all(14.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(15.0),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.1),
                //         spreadRadius: 2,
                //         blurRadius: 1,
                //         offset: Offset(0, 1),
                //       ),
                //     ],
                //   ),
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       SizedBox(height:10,),
                //       Text('Generate Demand for fixed connection'),
                //       SizedBox(height:10,),
                //       Container(
                //         padding: const EdgeInsets.all(6),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 ElevatedButton(
                //                   onPressed: () async {
                //                     controller.isDataProcessing.value = true;
                //                     await controller.generateDemand(controller.searchedConsumerDataById[0]['id'].toString(), type: 'Fixed');
                //                    await controller.getConsumerDemandDetail(controller.searchedConsumerDataById[0]['id'].toString());
                //                     controller.isDataProcessing.value = false; },
                //                   child: Text(' Generate Demand '),
                //                 )
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(height:10,),
                //     ],
                //   ),
                // ),

                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Divider(
                //             color: Colors.indigo,
                //             thickness: 1,
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8),
                //           child: Row(
                //             children: [
                //               Icon(Icons.monetization_on, color: Colors.indigo),
                //               Text(
                //                 ' Payment',
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.indigo
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Divider(
                //             color: Colors.indigo,
                //             thickness: 1,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Divider(
                //             color: Colors.indigo,
                //             thickness: 1,
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 8),
                //           child: Row(
                //             children: [
                //               Icon(Icons.add_chart_outlined, color: Colors.indigo),
                //               Text(
                //                 ' Generate Demand',
                //                 style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.indigo
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         Expanded(
                //           child: Divider(
                //             color: Colors.indigo,
                //             thickness: 1,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        }

      }),
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

Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0 ,horizontal: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 145,
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        Flexible(
          child: Text(
            nullToNA(value),
            style: GoogleFonts.publicSans(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent),
          ),
        ),
      ],
    ),

  );
}