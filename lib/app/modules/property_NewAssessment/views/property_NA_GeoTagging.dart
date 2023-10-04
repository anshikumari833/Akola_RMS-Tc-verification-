import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../../../widgets/location_widget.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyNAGeoTaggingView extends GetView<PropertyNewAssessmentController> {
  const PropertyNAGeoTaggingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              //HEADING
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/basic_details.png",
                        height: 45,
                        width: 45,
                      ),
                      Text(
                        ' Geotagging',
                        style: GoogleFonts.roboto(
                            fontSize: 21,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo
                          // color: Color.fromRGBO(69, 70, 70, 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //FRONT IMAGE
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(142, 145, 147, 0.1),
                        offset: Offset(0,1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        // FRONT IMAGE
                        SizedBox(height: 10,),
                        Text(
                          "Front Image ",
                          style: GoogleFonts.publicSans(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Longitude',
                            controller: controller.longitude0Controller,
                            isLatitude: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Latitude',
                            controller: controller.latitude0Controller,
                            isLatitude: true,
                          ),
                        ),
                        Obx(() => controller.selectedImage1Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Click image from camera / Select image from gallery',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              )),
                        )
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.file(
                                      File(controller.selectedImage1Path.value))),
                            ),
                            Obx(() => Center(
                                child: Text(
                                  controller.selectedImage1Size.value,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )))
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                                color: Colors.green,
                                child: Text(
                                  "Camera",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.getImage1(ImageSource.camera);
                                }),
                            MaterialButton(
                                color: Colors.deepOrange,
                                child: Text(
                                  "Device",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.getImage1(ImageSource.gallery);
                                })
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:10,
              ),
              //LEFT IMAGE
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(142, 145, 147, 0.1),
                        offset: Offset(0,1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          "Left Image ",
                          style: GoogleFonts.publicSans(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child:  LocationInputField(
                            title: 'Longitude',
                            controller: controller.longitude1Controller,
                            isLatitude: false,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Latitude',
                            controller: controller.latitude1Controller,
                            isLatitude: true,
                          ),
                        ),
                        Obx(() => controller.selectedImage2Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Click image from camera / Select image from gallery',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              )),
                        )
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.file(
                                      File(controller.selectedImage2Path.value))),
                            ),
                            Obx(() => Center(
                                child: Text(
                                  controller.selectedImage2Size.value,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )))
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                                color: Colors.green,
                                child: Text(
                                  "Camera",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.getImage2(ImageSource.camera);
                                }),
                            MaterialButton(
                                color: Colors.deepOrange,
                                child: Text(
                                  "Device",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.getImage2(ImageSource.gallery);
                                })
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(142, 145, 147, 0.1),
                        offset: Offset(0,1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          "Right Image ",
                          style: GoogleFonts.publicSans(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Longitude',
                            controller: controller.longitude2Controller,
                            isLatitude: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child:LocationInputField(
                            title: 'Latitude',
                            controller: controller.latitude2Controller,
                            isLatitude: true,
                          ),
                        ),
                        Obx(() => controller.selectedImage3Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Click image from camera / Select image from gallery',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              )),
                        )
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.file(
                                      File(controller.selectedImage3Path.value))),
                            ),
                            Obx(() => Center(
                                child: Text(
                                  controller.selectedImage3Size.value,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )))

                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                                color: Colors.green,
                                child: Text(
                                  "Camera",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.getImage3(ImageSource.camera);
                                }),
                            MaterialButton(
                                color: Colors.deepOrange,
                                child: Text(
                                  "Device",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.getImage3(ImageSource.gallery);
                                })
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // BUTTONS________________________________________________________!!!!!!!
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Are you sure to cancel ?"),
                          actions: [
                            TextButton(
                              child: Text("No"),
                              onPressed: () => Get.back(),
                            ),
                            TextButton(
                              child: Text("yes"),
                              onPressed: () {},
                              // Get.off();
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await controller.geotagging();
                        // await controller.PaymentDemand();
                        // await Get.to(PropertyPaymentView());
                      },

                      child: Row(
                        children: [
                          Text('Submit'),
                          // Icon(Icons.arrow_right),
                        ],
                      )),

                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

