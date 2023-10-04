import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_ElectricityDetail.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../../Property_SearchProperty/controllers/SearchHolding_controller.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyPropertyDetailView extends GetView<PropertyNewAssessmentController> {
   PropertyPropertyDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PropertyPayPropertyTaxController());
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        key: controller.propertyDetailsFormKey,
        child:Form(
          child: Column(
            children: [
              //PROPERTY ADDRESS & DETAIL
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/address_details.png",
                      height: 35,
                      width: 35,
                    ),
                    Text(
                      ' Property Address & Details',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo
                        // color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              //CARD-1 (KHATA NO - ROAD WIDTH)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
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
                  child:
                  Column(
                    children: [
                      SizedBox(height:2,),
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
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Khata No',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: GetStorage().read("assessmentType") != 'new'
                                  ? controller.searchedDataById.isNotEmpty
                                  ? controller.searchedDataById[0].khataNo.toString()
                                  : null
                                  : null,
                              enabled: GetStorage().read("assessmentType") == 'new',
                              controller: GetStorage().read("assessmentType") == 'new'
                                  ? controller.khataNoController
                                  : null,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[100],
                                disabledBorder: InputBorder.none,
                                hintText: 'Enter Khata No',
                                hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter khata no';
                                }
                                return null;
                              },
                            ),
                          ),
                          //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Plot No',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].plotNo.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.plotNoController
                                      : null,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Plot No',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter plot no';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Village/Mauja Name',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].villageMaujaName.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.villageNameController
                                      : null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Village/Mauja Name',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter village/mauja name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //AREA OF PLOT(in decimal)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Area of plot(in Decimal)',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].areaOfPlot.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ?  controller.areaOfPlotController
                                      : null,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Area of Plot',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter area of plot';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // ROAD WIDTH(in ft)
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         'Road Width(in ft)',
                              //         style: GoogleFonts.literata(
                              //             fontWeight: FontWeight.w600,
                              //             fontSize: 14,
                              //             fontStyle: FontStyle.normal),
                              //       ),
                              //       Text(" *", style: TextStyle(color: Colors.red),),
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: TextFormField(
                              //     initialValue: GetStorage().read("assessmentType") != 'new'
                              //         ? controller.searchedDataById.isNotEmpty
                              //         ? controller.searchedDataById[0].roadWidth.toString()
                              //         : null
                              //         : null,
                              //     enabled: GetStorage().read("assessmentType") == 'new',
                              //     controller: GetStorage().read("assessmentType") == 'new'
                              //         ?   controller.roadWidthController
                              //         : null,
                              //     keyboardType: TextInputType.number,
                              //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       filled: true,
                              //       fillColor: Colors.grey[100],
                              //       disabledBorder: InputBorder.none,
                              //       hintText: 'Road Width',
                              //       hintStyle: const TextStyle(
                              //           fontSize: 16, color: Colors.black),
                              //     ),
                              //     validator: (value) {
                              //       if (value!.isEmpty) {
                              //         return 'Please enter road width';
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              // ),
                              //CATEGORY
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Category',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: Color(0xff263238),
                                        width: 0.1,
                                      ),
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text('Select',
                                    style: TextStyle(fontSize: 14, color: Colors.grey),),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 40,
                                  buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                  buttonElevation: 2,
                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
                                  dropdownMaxHeight: 250,
                                  dropdownWidth: 320,
                                  dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                  dropdownElevation: 8,
                                  scrollbarRadius: Radius.circular(40),
                                  scrollbarThickness: 5,
                                  scrollbarAlwaysShow: true,
                                  items: controller.categoryList.map((zone) {
                                    return DropdownMenuItem(
                                      value: zone["id"].toString(),
                                      child:
                                      Text(zone["category"].toString()),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Zone';
                                    }
                                  },
                                  onChanged: (value) async{
                                    controller.categoryType.value = value.toString(); // Update the selected zone in your controller
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2,),
                    ],
                  ),
                ),
              ),

              //BASIC ADDRESS
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
                        child: Text(
                          'Basic Address',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue
                          ),
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
              //CARD-2 (CITY - PROPERTY ADDRESS)

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
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
                  child:
                  Column(
                    children: [
                      SizedBox(height:2,),
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
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'City',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].propCity.toString()
                                      : null
                                      : null,
                                   // enabled: GetStorage().read("assessmentType") == 'new',
                                  readOnly: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ?  controller.cityController
                                      : null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'City',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter city';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'District',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].propDist.toString()
                                      : null
                                      : null,
                                  // enabled: GetStorage().read("assessmentType") == 'new',
                                  readOnly: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ?  controller.districtController
                                      : null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'District',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter district';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'State',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].propState.toString()
                                      : null
                                      : null,
                                   enabled: GetStorage().read("assessmentType") == 'new',
                                  readOnly: GetStorage().read("assessmentType") != 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ?  controller.stateController
                                      : null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z\s!@#\$%\^&\*\(\)_\+-={}\[\]|\\:;"\'<>,.?/]+'))
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'State',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter state';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Pin',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].propPinCode.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.pinController
                                      : null,
                                  keyboardType: TextInputType.number,
                                  maxLength:6,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Pin',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter pin code';
                                    }
                                    if (value.length < 6) {
                                      return 'Please enter a valid pin code';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Street Name',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.streetNameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Street Name',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter street name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Location',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.locationController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Location',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter location';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Landmark',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.landmarkController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Landmark',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter landmark';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Property Address\n(enter full mailing address)',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].propAddress.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.propertyAddressController
                                      : null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Property address',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter property address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:2,),
                    ],
                  ),
                ),
              ),

              //CHECKBOX
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: controller.isCorrespondingAddressChecked.value,
                        onChanged: (value) {
                          controller.isCorrespondingAddressChecked.value = value ?? false;
                          if (value!) {
                            controller.corrCityController.text = controller.cityController.text;
                            controller.corrDistrictController.text = controller.districtController.text;
                            controller.corrStateController.text = controller.stateController.text;
                            controller.corrPinController.text = controller.pinController.text;
                            controller.corrPropertyAddressController.text = controller.propertyAddressController.text;
                          } else {
                            controller.corrCityController.text = '';
                            controller.corrDistrictController.text = '';
                            controller.corrStateController.text = '';
                            controller.corrPinController.text = '';
                            controller.corrPropertyAddressController.text = '';
                          }
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Note: If Corresponding Address is the same as Property Address (Please Tick)',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //CORRESPONDING ADDRESS
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
                        child: Text(
                          'Corresponding Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue
                          ),
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
              //CARD-3 (CITY - PROPERTY ADDRESS)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
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
                  child:
                  Column(
                    children: [
                      SizedBox(height:2,),
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
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'City',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].corrCity.toString()
                                      : null
                                      : null,
                                  // enabled: !controller.isCorrespondingAddressChecked.value,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.corrCityController
                                      : null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'City',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter city';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'District',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].corrDist.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.corrDistrictController
                                      : null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'District',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter district';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'State',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].corrState.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.corrStateController
                                      : null,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z\s!@#\$%\^&\*\(\)_\+-={}\[\]|\\:;"\'<>,.?/]+'))
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'State',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter state';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Pin',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].corrPinCode.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ?  controller.corrPinController
                                      : null,
                                  keyboardType: TextInputType.number,
                                  maxLength:6,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Pin',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter pin code';
                                    }
                                    if (value.length < 6) {
                                      return 'Please enter a valid pin code';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Property Address\n(enter full mailing address)',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById.isNotEmpty
                                      ? controller.searchedDataById[0].corrAddress.toString()
                                      : null
                                      : null,
                                  enabled: GetStorage().read("assessmentType") == 'new',
                                  controller: GetStorage().read("assessmentType") == 'new'
                                      ? controller.corrPropertyAddressController
                                      : null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Property address',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter property address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //  BUTTONS
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:2,),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ElevatedButton(
                    child: Text('Save & next'),
                    onPressed: () {
                   Get.to(PropertyElectricityDetailView());
                      // if (controller.propertyDetailsFormKey.currentState!.validate()) {
                      //   Get.to(PropertyElectricityDetailView());
                      // }
                    },
                  ),
                ],
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
