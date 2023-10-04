import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/water_consumer_search_controller.dart';

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
      body: SingleChildScrollView(
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
                //DEMAND DETAIL TABLE
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
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
                                borderRadius: BorderRadius.all(Radius.circular(1.0)),
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
                                DataColumn(label: buildDecoratedContainer( Text('Connection Type'))),
                                DataColumn(label: buildDecoratedContainer( Text('Meter No'))),
                                DataColumn(label: buildDecoratedContainer( Text('Last Meter Reading'))),
                                DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Connection Date'))),)),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(buildDecoratedContainer(Text(nullToNA(controller.meterDetails.value['ConnectionTypeName'].toString())))),
                                    DataCell(buildDecoratedContainer(Text(nullToNA(controller.meterDetails.value['meter_no'].toString())))),
                                    DataCell(buildDecoratedContainer(Text(nullToNA(controller.meterDetails.value['final_meter_reading'].toString())))),
                                    DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(nullToNA(controller.meterDetails.value['connection_date'].toString())))),)),
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
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Upload Meter Image',
                          style: GoogleFonts.publicSans(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() => controller.selectedImage1Path == ''
                      ? Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        'Select image from camera',
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
                  CustomTextField(
                    // controller: controller.bankNameController,
                    headingText: "Final Meter Readng", hintText: "Enter value",validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return "";
                  },),
                  CustomDateTimeField(
                    headingText: 'Demand Upto Dete',
                    // controller: controller.chequeDateController,
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
                  SizedBox(height:10,),
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
                                // controller.DemandTaxPayment();
                              },
                              child: Text(' Generate Demand '),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10,),
                ],
              ),
            ),
          ],
        ),
      ),
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