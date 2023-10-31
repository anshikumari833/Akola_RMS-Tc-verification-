import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/municipal_rental_add_toll_controller.dart';

class MunicipalRentalAddTollView
    extends GetView<MunicipalRentalAddTollController> {
  const MunicipalRentalAddTollView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F6F9),
        foregroundColor: Colors.black,
        elevation: 0,
        title:  Text('Add Tolls',style: GoogleFonts.publicSans(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        centerTitle: true,
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key:controller.TollFormkey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0,bottom:3),
                child: Column(
                  children: [
                    Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.info_circle_fill , size: 18,color: Colors.black),
                                  Text("  Select Market to get Shop list ",
                                    style: GoogleFonts.publicSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ],
                              ),
                            ),
                            Obx(() => CustomDropdownFormField(
                              headingText: 'Circle',
                              items: controller.isPageLoading.value
                                  ? [
                                DropdownMenuItem(
                                  value: null,
                                  child:  Center(child:SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),),
                                ),
                              ]
                                  : controller.CircleList.map<DropdownMenuItem<String>>((circle) {
                                return DropdownMenuItem<String>(
                                  value: circle['id'].toString(),
                                  child: Text(circle['circle_name'].toString()),
                                );
                              }).toList(),
                              hintText: 'Select an option',
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select an option';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.circle.value = value.toString();
                                controller.selectedCircleId = value.toString();
                                controller.getMarketDetail();
                              },
                            ),),
                            //MARKET
                            Obx(() => CustomDropdownFormField(
                              headingText: 'Market',
                              items: controller.isPageLoading.value
                                  ? [
                                DropdownMenuItem(
                                  value: null,
                                  child:  Center(child:SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),),
                                ),
                              ]
                                  : controller.MarketListByCircle.map<DropdownMenuItem<String>>((circle) {
                                return DropdownMenuItem<String>(
                                  value: circle['id'].toString(),
                                  child: Text(circle['market_name'].toString()),
                                );
                              }).toList(),
                              hintText: 'Select an option',
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select an option';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.market.value = value.toString();
                              },
                            ),),
                            //VENDOR
                            CustomDropdownFormField(
                              headingText: 'Vendor Type',
                              items: [
                                DropdownMenuItem(
                                  child: Text("Select"),
                                  value: "",
                                ),
                                DropdownMenuItem(
                                  child: Text("Schedule"),
                                  value: "schedule",
                                ),
                                DropdownMenuItem(
                                  child: Text("Unscheduled"),
                                  value: "unscheduled",
                                ),
                              ],
                              hintText: 'Select an option',
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select an option';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.vendorType.value = value.toString();
                              },
                            ),
                            CustomTextField(
                              controller: controller.vendorNameController,
                              headingText: "Vendor Name",
                              hintText: "Enter vendor name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return "";
                              },),
                            SizedBox(height: 4,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Text(
                                      "Mobile No",
                                      style: GoogleFonts.publicSans(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                    child: TextFormField(
                                      controller:  controller.mobileNoController,
                                      keyboardType: TextInputType.number,
                                      maxLength:10,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        disabledBorder: InputBorder.none,
                                        hintText:  "Enter mobile no",
                                        hintStyle: GoogleFonts.publicSans(
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter mobile no';
                                        }
                                        if (value.length < 10) {
                                          return 'Please enter a valid mobile no';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CustomTextField(
                              controller: controller.landmarkController,
                              headingText: "Landmark",
                              hintText: "Enter landmark",validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return "";
                            },),
                            Obx(() => CustomDropdownFormField(
                              headingText: 'Rate',
                              items: controller.isPageLoading.value
                                  ? [
                                DropdownMenuItem(
                                  value: null,
                                  child:  Center(child:SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),),
                                ),
                              ]
                                  : controller.RateList.map<DropdownMenuItem<String>>((circle) {
                                return DropdownMenuItem<String>(
                                  value: circle['id'].toString(),
                                  child: Text(circle['rate'].toString()),
                                );
                              }).toList(),
                              hintText: 'Select an option',
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select an option';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.rate.value = value.toString();
                              },
                            ),),

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
                                    color: Colors.brown[200],
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.getImage1(ImageSource.camera);
                                    }),
                                MaterialButton(
                                    color: Colors.orange[300],
                                    child: Text(
                                      "Device",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.getImage1(ImageSource.gallery);
                                    })
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (controller.validateForm()) {
                                  controller.TollsApplicationForm();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                onPrimary: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                              ),
                              child: Text('Submit'),
                            ),

                            SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
