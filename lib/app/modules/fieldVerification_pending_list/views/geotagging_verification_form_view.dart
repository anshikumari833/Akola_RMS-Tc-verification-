import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import '../../../widgets/location_widget.dart';
import '../controllers/tc_FieldVerification_controller.dart';

class GeotaggingVerificationFormView extends GetView<TcFieldVerificationController> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {return true;
    },
    child:Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Text("Site Verification",style:GoogleFonts.publicSans(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(69, 70, 70, 0.9),
          ),),
        ),),
      body: SingleChildScrollView(
        child: Form(
          key: controller.geotaggingFormkey,
          // key: controller.VerificationFormkey,
          child: Column(
            children: [
              //DETAIL SECTION______________________________________________!!!!!!!
              SizedBox(height: 10),
              //DETAIL SECTION__!!!!!!!
              Container(
                margin: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0,1),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Column(
                  children: [
                    _buildDetailsRow('Application No -',  (controller.safno.toString())),
                    _buildDetailsRow('Application Type -',  capitalizeFirstLetter(controller.assessment.toString())),
                    _buildDetailsRow('Apply Date -',  capitalizeFirstLetter(controller.applicationdate.toString())),
                    _buildDetailsRow('Owner Name -',  capitalizeFirstLetter(controller.ownername.toString())),
                    _buildDetailsRow('Mobile Name -',  capitalizeFirstLetter(controller.mobileno.toString())),
                  ],
                ),
              ),
              //HEADING
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.blue,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/add-image.png",
                              height: 45,
                              width: 45,
                            ),
                            Text(
                              '  Add Image ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.blue,
                          thickness: 1,
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 148, 213, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child:Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Front Image ",
                                      style: GoogleFonts.publicSans(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top:3),
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/check_1.png"),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: LocationInputField(
                                title: 'Longitude',
                                controller: controller.longitude0Controller,
                                isLatitude: false,
                              ),
                            ),
                            Obx(() => Text(controller.longitudeError.value, style: TextStyle(color: Colors.red))),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: LocationInputField(
                                title: 'Latitude',
                                controller: controller.latitude0Controller,
                                isLatitude: true,
                              ),
                            ),
                            Obx(() => Text(controller.latitudeError.value, style: TextStyle(color: Colors.red))),
                          ],
                        ),
                        Obx(() => controller.selectedImage1Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Select image from camera/gallery',
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 148, 213, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child:Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Left Image ",
                                      style: GoogleFonts.publicSans(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top:3),
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/check_1.png"),
                                          )),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child:  LocationInputField(
                                title: 'Longitude',
                                controller: controller.longitude1Controller,
                                isLatitude: false,
                              ),
                            ),
                            Obx(() => Text(controller.longitudeError.value, style: TextStyle(color: Colors.red))),
                          ],
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: LocationInputField(
                                title: 'Latitude',
                                controller: controller.latitude1Controller,
                                isLatitude: true,
                              ),
                            ),
                            Obx(() => Text(controller.latitudeError.value, style: TextStyle(color: Colors.red))),
                          ],
                        ),

                        Obx(() => controller.selectedImage2Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Select image from camera/gallery',
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
                                  style: TextStyle(fontSize: 12, color: Colors.black),)))
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 148, 213, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child:Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Right Image ",
                                      style: GoogleFonts.publicSans(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top:3),
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/check_1.png"),
                                          )),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: LocationInputField(
                                title: 'Longitude',
                                controller: controller.longitude2Controller,
                                isLatitude: false,
                              ),
                            ),
                            Obx(() => Text(controller.longitudeError.value, style: TextStyle(color: Colors.red))),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child:LocationInputField(
                                title: 'Latitude',
                                controller: controller.latitude2Controller,
                                isLatitude: true,
                              ),
                            ),
                            Obx(() => Text(controller.latitudeError.value, style: TextStyle(color: Colors.red))),
                          ],
                        ),
                        Obx(() => controller.selectedImage3Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Select image from camera/gallery',
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
                              // Get.off(PendingListView());
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text("Cancel"),
                  ),
                  // ElevatedButton(
                  //   child: Text('Forward'),
                  //   // onPressed: () => controller.geotaggingForm (),
                  //   // onPressed: () => controller.ForwardSafVerifyForm (context),
                  //   onPressed: () => controller.ForwardSafVerifyForm (),
                  // ),
                  //----------------------------------
                  // ElevatedButton(
                  //   child: Text('Forward'),
                  //   onPressed: () async {
                  //     // Validate the latitude and longitude fields
                  //     String? latitudeErrorText =
                  //     controller.validateLatitude(controller.latitude1Controller.text);
                  //     String? longitudeErrorText =
                  //     controller.validateLongitude(controller.longitude1Controller.text);
                  //
                  //     // Update the error messages
                  //     controller.latitudeError.value = latitudeErrorText ?? '';
                  //     controller.longitudeError.value = longitudeErrorText ?? '';
                  //
                  //     // Check if there are no errors before proceeding
                  //     if (latitudeErrorText == null && longitudeErrorText == null) {
                  //       await controller.ForwardSafVerifyForm();
                  //     }
                  //   },
                  // ),
                //---------------
                  ElevatedButton(
                    child: Text('Forward'),
                    onPressed: () async {
                      // Clear previous validation errors
                      controller.clearValidationErrors();

                      // Validate the latitude and longitude fields
                      String? latitudeErrorText = controller.validateLatitude(controller.latitude1Controller.text);
                      String? longitudeErrorText = controller.validateLongitude(controller.longitude1Controller.text);

                      // Update the error messages
                      controller.latitudeError.value = latitudeErrorText ?? '';
                      controller.longitudeError.value = longitudeErrorText ?? '';

                      // Check if there are no errors before proceeding
                      if (latitudeErrorText == null && longitudeErrorText == null) {
                        await controller.ForwardSafVerifyForm();
                      }
                    },
                  ),

                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ), );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
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
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(63, 148, 213, 1)),
            ),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
        ),
      ],
    ),

  );
}


String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;

  final List<String> words = text.split(' ');

  for (int i = 0; i < words.length; i++) {
    final String word = words[i];
    if (word.isNotEmpty) {
      final String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      words[i] = capitalizedWord;
    }
  }

  return words.join(' ');
}