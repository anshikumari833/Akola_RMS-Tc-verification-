import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_DemandDetail_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../widgets/Common_DateTimeField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/water_consumer_search_controller.dart';

class GenerateDemandView extends GetView<WaterConsumerSearchController> {
  const GenerateDemandView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Demand '),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(controller.searchedConsumerDataById[0]['meterDetails']['ConnectionTypeName'].toString() == 'Meter')
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
                      controller: controller.finalMeterReading,
                      headingText: "Final Meter Readng", hintText: "Enter value",validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return "";
                    },),
                    CustomDateTimeField(
                      headingText: 'Demand Upto Date',
                      controller: controller.demandDateUpto,
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
                                onPressed: () async {
                                  controller.isDataProcessing.value = true;
                                  await controller.generateDemand(controller.searchedConsumerDataById[0]['id'].toString());
                                  await controller.getConsumerDemandDetail(controller.searchedConsumerDataById[0]['id'].toString());
                                  Get.back();
                                  // Get.to(WaterDemandDetailView());
                                  controller.isDataProcessing.value = false;
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
            if(controller.searchedConsumerDataById[0]['meterDetails']['ConnectionTypeName'].toString() == 'Fixed')
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
                    SizedBox(height:10,),
                    Text('Generate Demand for fixed connection'),
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
                                onPressed: () async {
                                  controller.isDataProcessing.value = true;
                                  await controller.generateDemand(controller.searchedConsumerDataById[0]['id'].toString(), type: 'Fixed');
                                  await controller.getConsumerDemandDetail(controller.searchedConsumerDataById[0]['id'].toString());
                                  Get.back();
                                  controller.isDataProcessing.value = false; },
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
