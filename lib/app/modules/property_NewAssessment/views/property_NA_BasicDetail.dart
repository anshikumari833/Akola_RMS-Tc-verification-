import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_PropertyDetail.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../../Property_SearchProperty/controllers/SearchHolding_controller.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyNewAssessmentView extends GetView<PropertyNewAssessmentController> {
   PropertyNewAssessmentView({Key? key}) : super(key: key);
  var title = '';

  @override
  Widget build(BuildContext context) {
    Get.put(PropertyPayPropertyTaxController());
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Form(
          key: controller.newAssessmentFormKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/basic_details.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      ' Basic Details',
                      style: GoogleFonts.roboto(
                          fontSize: 21,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
            padding: EdgeInsets.all(15.0),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.info_circle_fill,size: 15,),
                                Text(
                                  ' Land Purchase Date',
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
                            child: DateTimeField(
                              controller: controller.latePurchaseDateController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[100],
                                disabledBorder: InputBorder.none,
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                hintText: 'yyyy-mm-dd',
                                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),),
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
                                  return 'Please Select Purchase Date';
                                }
                              },
                            ),
                          ),
                          // ZONE TYPE
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Zone',
                                  style: GoogleFonts.literata(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          ),
                          Obx(() =>   Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField2(
                              // Dropdown field code
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
                              hint: const Text(
                                'Select',
                                style: TextStyle(fontSize: 14, color: Colors.black45),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 40,
                              buttonPadding:
                              EdgeInsets.only(left: 20, right: 25, bottom: 10),
                              buttonElevation: 2,
                              itemPadding: EdgeInsets.only(left: 25, right: 25),
                              dropdownMaxHeight: 250,
                              dropdownWidth: 325,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              dropdownElevation: 1,
                              scrollbarRadius: Radius.circular(40),
                              scrollbarThickness: 5,
                              scrollbarAlwaysShow: true,
                              items: controller.isDataProcessing.value
                                  ? [
                                DropdownMenuItem(
                                  value: null,
                                  child:  Center(child:SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),),
                                ),
                              ]
                                  : controller.zoneList.map((ward) {
                                return DropdownMenuItem(
                                  value: ward["id"].toString(),
                                  child: Text(ward["zone_name"].toString()),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select.';
                                }
                              },
                              onChanged: (value) async{
                                await controller.getWardByZone(zoneId: value.toString());
                                controller.zoneType.value = value.toString();
                                controller.newWardNo.value = '';
                              },
                            ),
                          ),),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: DropdownButtonFormField2(
                          //     decoration: InputDecoration(
                          //       filled: true,
                          //       fillColor: Colors.grey[100],
                          //       contentPadding: EdgeInsets.zero,
                          //       enabledBorder: UnderlineInputBorder(
                          //         borderRadius: BorderRadius.circular(5),
                          //         borderSide: BorderSide(
                          //           color: Color(0xff263238),
                          //           width: 0.1,
                          //         ),
                          //       ),
                          //     ),
                          //     isExpanded: true,
                          //     hint: const Text('Select',
                          //       style: TextStyle(fontSize: 14, color: Colors.grey),),
                          //     icon: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: Colors.black45,
                          //     ),
                          //     iconSize: 30,
                          //     buttonHeight: 40,
                          //     buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                          //     buttonElevation: 2,
                          //     itemPadding: EdgeInsets.only(left: 25, right: 25),
                          //     dropdownMaxHeight: 250,
                          //     dropdownWidth: 320,
                          //     dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                          //     dropdownElevation: 8,
                          //     scrollbarRadius: Radius.circular(40),
                          //     scrollbarThickness: 5,
                          //     scrollbarAlwaysShow: true,
                          //     items: controller.zoneList.map((zone) {
                          //       return DropdownMenuItem(
                          //         value: zone["id"].toString(),
                          //         child:
                          //         Text(zone["zone_name"].toString()),
                          //       );
                          //     }).toList(),
                          //     validator: (value) {
                          //       if (value == null) {
                          //         return 'Please Select Zone';
                          //       }
                          //     },
                          //     onChanged: (value) async{
                          //       await controller.getWardByZone(zoneId: value.toString());
                          //       controller.zoneType.value = value.toString(); // Update the selected zone in your controller
                          //     },
                          //   ),
                          // ),
                          //NEW WARD
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.info_circle_fill,size: 15,),
                                Text(' New Ward No',
                                  style: GoogleFonts.literata(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          ),
                          Obx(() =>   Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField2(
                              // Dropdown field code
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
                              hint: const Text(
                                'Select',
                                style: TextStyle(fontSize: 14, color: Colors.black45),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 40,
                              buttonPadding:
                              EdgeInsets.only(left: 20, right: 25, bottom: 10),
                              buttonElevation: 2,
                              itemPadding: EdgeInsets.only(left: 25, right: 25),
                              dropdownMaxHeight: 250,
                              dropdownWidth: 325,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              dropdownElevation: 1,
                              scrollbarRadius: Radius.circular(40),
                              scrollbarThickness: 5,
                              scrollbarAlwaysShow: true,
                              items: controller.isDataProcessing.value
                                  ? [
                                DropdownMenuItem(
                                  value: null,
                                  child:  Center(child:SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 20.0,
                                  ),),
                                ),
                              ]
                                  : controller.WardListByZone.map((ward) {
                                return DropdownMenuItem(
                                  value: ward["id"].toString(),
                                  child: Text(ward["ward_name"].toString()),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select.';
                                }
                              },
                              onChanged: (value) {
                                controller.newWardNo.value = '';
                                controller.newWardNo.value = value.toString();
                              },
                            ),
                          ),),
                          // Obx(() {
                          //   if (controller.isDataProcessing == true) {
                          //     return Center(
                          //       child: CircularProgressIndicator(),
                          //     );
                          //   } else {
                          //     return Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: DropdownButtonFormField2(
                          //         decoration: InputDecoration(
                          //           filled: true,
                          //           fillColor: Colors.grey[100],
                          //           contentPadding: EdgeInsets.zero,
                          //           enabledBorder: UnderlineInputBorder(
                          //             borderRadius: BorderRadius.circular(5),
                          //             borderSide: BorderSide(
                          //               color: Color(0xff263238),
                          //               width: 0.1,
                          //             ),
                          //           ),
                          //         ),
                          //         isExpanded: true,
                          //         hint: const Text('Select',
                          //           style: TextStyle(fontSize: 14, color: Colors.grey),),
                          //         icon: const Icon(
                          //           Icons.arrow_drop_down,
                          //           color: Colors.black45,
                          //         ),
                          //         iconSize: 30,
                          //         buttonHeight: 40,
                          //         buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                          //         buttonElevation: 2,
                          //         itemPadding: EdgeInsets.only(left: 25, right: 25),
                          //         dropdownMaxHeight: 250,
                          //         dropdownWidth: 330,
                          //         dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                          //         dropdownElevation: 1,
                          //         scrollbarRadius: Radius.circular(40),
                          //         scrollbarThickness: 5,
                          //         scrollbarAlwaysShow: true,
                          //         items: controller.WardListByZone.map((ward) {
                          //           return DropdownMenuItem(
                          //             value: ward["id"].toString(),
                          //             child: Text(ward["ward_name"].toString()),);}).toList(),
                          //         validator: (value) {
                          //           if (value == null) {
                          //             return 'Please Select New Ward No';
                          //           }
                          //         },
                          //         onChanged: (value) {
                          //           controller.newWardNo.value = '';
                          //           controller.newWardNo.value = value.toString();
                          //         },
                          //       ),
                          //     );
                          //   }
                          // }),
                          //OWNERSHIP TYPE

                          // value: GetStorage().read("assessmentType") != 'new' ? "" : null,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Ownership Type',
                                  style: GoogleFonts.literata(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          ),
                          Obx(() {
                            if (controller.isDataProcessing == true) {
                              return Center(
                                child: Center(child:SpinKitThreeBounce(
                                  color: Colors.blue,
                                  size: 20.0,
                                ),),
                              );
                            } else {
                              return Padding(
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
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
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
                                  dropdownWidth: 330,
                                  dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                  dropdownElevation: 1,
                                  scrollbarRadius: Radius.circular(40),
                                  scrollbarThickness: 5,
                                  scrollbarAlwaysShow: true,
                                  value: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById[0].ownershipTypeMstrId.toString()
                                      : null,
                                  items: controller.ownershipList.map((ward) {
                                    return DropdownMenuItem(
                                      value: ward["id"].toString(),
                                      child: Text(ward["ownership_type"]),);}).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Ownership Type';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.ownershipType.value = value.toString();
                                  },
                                ),
                              );
                            }
                          }),
                          // PROPERTY TYPE
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Property Type',
                                  style: GoogleFonts.literata(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal),
                                ),
                                Text(" *", style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          ),
                          Obx(() {
                            if (controller.isDataProcessing == true) {
                              return Center(
                                child: Center(child:SpinKitThreeBounce(
                                  color: Colors.blue,
                                  size: 20.0,
                                ),),
                              );
                            } else {
                              return Padding(
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
                                  dropdownWidth: 330,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),),
                                  dropdownElevation: 1,
                                  scrollbarRadius: Radius.circular(40),
                                  scrollbarThickness: 5,
                                  scrollbarAlwaysShow: true,
                                  value: GetStorage().read("assessmentType") != 'new'
                                      ? controller.searchedDataById[0].propTypeMstrId.toString()
                                      : null,
                                  items: controller.propertyList.map((ward) {
                                    return DropdownMenuItem(
                                      value: ward["id"].toString(),
                                      child:
                                      Text(ward["property_type"].toString()),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Property Type';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.propertyType.value = value.toString();
                                  },
                                ),
                              );
                            }
                          }),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Save & next'),
                    onPressed: () {
                    Get.to(PropertyPropertyDetailView());
                      // Get.to(PropertyNATaxCalculationFormView());
                      // if (controller.newAssessmentFormKey.currentState!.validate()) {
                      //   // Form is valid, navigate to the next screen
                      //   Get.to(PropertyPropertyDetailView());
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


