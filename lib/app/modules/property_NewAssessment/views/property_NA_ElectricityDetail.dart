import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_OwnerDetail.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyElectricityDetailView extends GetView<PropertyNewAssessmentController> {
   PropertyElectricityDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Form(
          // key: controller.electricityDetailsFormKey,
          child: Column(
            children: [
              //ELECTRICITY & WATER DETAILS
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/hydroelectric.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      '  Electricity & Water Detail',
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
              //CARD-1(ELECTRICITY DETAILS)
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          // Update the checkbox state when it's clicked
                          controller.isCheckboxChecked.value = value ?? false;
                        },
                        value: controller.isCheckboxChecked
                            .value, // Assign the checkbox state to its value
                      ),
                      Expanded(
                        child: Text(
                          'Note: In case, there is no Electric Connection. You have to upload Affidavit Form-I. (Please Tick)',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => Visibility(
                    visible: controller.isCheckboxChecked.value,
                    child: Visibility(
                      visible: controller.isCheckboxChecked.value, // Show or hide the widget based on checkbox state
                      child:  Padding(
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
                                  padding: const EdgeInsets.only(top:20,bottom: 20,right: 10,left: 10),
                                  child: Column(
                                    children: [
                                      //
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Electricity K. No',
                                              style: GoogleFonts.literata(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          initialValue: GetStorage().read("assessmentType") != 'new'
                                              ? controller.searchedDataById.isNotEmpty
                                              ? controller.searchedDataById[0].electConsumerNo.toString()
                                              : null
                                              : null,
                                          enabled: GetStorage().read("assessmentType") == 'new',
                                          controller: GetStorage().read("assessmentType") == 'new'
                                              ? controller.ElectricitykNoController
                                              : null,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            disabledBorder: InputBorder.none,
                                            hintText: 'Electricity K. No',
                                            hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter';
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
                                              'ACC No - ',
                                              style: GoogleFonts.literata(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          initialValue: GetStorage().read("assessmentType") != 'new'
                                              ? controller.searchedDataById.isNotEmpty
                                              ? controller.searchedDataById[0].electAccNo.toString()
                                              : null
                                              : null,
                                          enabled: GetStorage().read("assessmentType") == 'new',
                                          controller: GetStorage().read("assessmentType") == 'new'
                                              ?  controller.accNoController
                                              : null,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            disabledBorder: InputBorder.none,
                                            hintText: 'ACC No',
                                            hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter';
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
                                              'Bind/Book No',
                                              style: GoogleFonts.literata(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          initialValue: GetStorage().read("assessmentType") != 'new'
                                              ? controller.searchedDataById.isNotEmpty
                                              ? controller.searchedDataById[0].electBindBookNo.toString()
                                              : null
                                              : null,
                                          enabled: GetStorage().read("assessmentType") == 'new',
                                          controller: GetStorage().read("assessmentType") == 'new'
                                              ?  controller.bindBookNoController
                                              : null,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            disabledBorder: InputBorder.none,
                                            hintText: 'Bind/Book No',
                                            hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter';
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
                                              'Electricity Consumer Category',
                                              style: GoogleFonts.literata(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal),
                                            ),
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
                                          hint: const Text(
                                            'Select',
                                            style: TextStyle(
                                                fontSize: 14, color: Colors.black45),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black45,
                                          ),
                                          iconSize: 30,
                                          buttonHeight: 40,
                                          buttonPadding: EdgeInsets.only(
                                              left: 20, right: 25, bottom: 10),
                                          buttonElevation: 2,
                                          itemPadding:
                                          EdgeInsets.only(left: 25, right: 25),
                                          dropdownMaxHeight: 250,
                                          dropdownWidth: 320,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarRadius: Radius.circular(40),
                                          scrollbarThickness: 5,
                                          scrollbarAlwaysShow: true,
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("DS I/II/III"),
                                              value: "1",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("NDS II/III"),
                                              value: "2",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("IS I/II"),
                                              value: "3",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("LST"),
                                              value: "4",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("HTS"),
                                              value: "5",
                                            ),
                                          ],
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select.';
                                            }
                                          },
                                          onChanged: (value) {
                                            controller.electricityConsumer.value =
                                                value.toString();
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
                    ),
                  )),

              //DIVIDER
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              //BUILDING DETAILS
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/checklist.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      '  Building Details',
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
              //CARD-2 (BUILDING DETAILS)
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
                          padding: const EdgeInsets.only(top:20,bottom: 20,right: 10,left: 10),
                          child: Column(
                            children: [
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Building Plan Approval No',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller:
                                  controller.buildingPlanApprovalNoController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Building Plan Approval No.',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
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
                                      'Building Plan Approval Date',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DateTimeField(
                              initialValue: GetStorage().read("assessmentType") != 'new'
                                  ? controller.searchedDataById.isNotEmpty
                                  ? controller.searchedDataById[0].buildingPlanApprovalDate
                                  : null
                                  : null,
                              enabled: GetStorage().read("assessmentType") == 'new',
                              controller: GetStorage().read("assessmentType") == 'new'
                                  ? controller.buildingPlanApprovalDateController
                                  : null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[100],
                                disabledBorder: InputBorder.none,
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                hintText: 'yyyy-mm-dd',
                                hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                              ),
                              format: DateFormat("yyyy-MM-dd"),
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                              },
                            ),
                          ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: DateTimeField(
                              //     initialValue: GetStorage().read("assessmentType") != 'new'
                              //         ? controller.searchedDataById.isNotEmpty
                              //         ? controller.searchedDataById[0].buildingPlanApprovalDate.toString()
                              //         : null
                              //         : null,
                              //     enabled: GetStorage().read("assessmentType") == 'new',
                              //     controller: GetStorage().read("assessmentType") == 'new'
                              //         ?  controller.buildingPlanApprovalDateController
                              //         : null,
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       filled: true,
                              //       fillColor: Colors.grey[100],
                              //       disabledBorder: InputBorder.none,
                              //       // icon: Icon(Icons.calendar_month_outlined),
                              //       suffixIcon: Icon(Icons.calendar_month_outlined),
                              //       hintText: 'yyyy-mm-dd',
                              //       hintStyle: const TextStyle(
                              //           fontSize: 16, color: Colors.black),
                              //     ),
                              //     format: DateFormat("yyyy-MM-dd"),
                              //     onShowPicker: (context, currentValue) {
                              //       return showDatePicker(
                              //           context: context,
                              //           firstDate: DateTime(1900),
                              //           initialDate: currentValue ?? DateTime.now(),
                              //           lastDate: DateTime(2100));
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:2,),
                    ],
                  ),
                ),
              ),

              //DIVIDER
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              //WATER DETAILS
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/bill.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      'Water Detail',
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
              //CARD-3(WATER DETAILS)

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
                          padding: const EdgeInsets.only(top:20,bottom: 20,right: 10,left: 10),
                          child: Column(
                            children: [
                              //
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Water Consumer No',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.waterConsumerNoController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Water Consumer No',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
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
                                      'Water Consumer Date',
                                      style: GoogleFonts.literata(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DateTimeField(
                                  controller: controller.waterConsumerDateController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    // icon: Icon(Icons.calendar_month_outlined),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: 'yyyy-mm-dd',
                                    hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
                                  ),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
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

              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(OwnerDetailView());
                      },
                      child: Text('Save & next'))
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
//  BUTTONS
