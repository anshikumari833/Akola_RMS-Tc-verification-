import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_SummaryDetails.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyExtraDetailView extends GetView<PropertyNewAssessmentController> {
   PropertyExtraDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Form(
         // key:controller.extraDetailsFormKey,
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
                      ' Extra Details',
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
                  child:Column(
                    children: [
                      SizedBox(height: 2,),
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
                              //MOBILE TOWER
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Property Have Mobile Tower(s)? - ',
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
                                  buttonPadding: EdgeInsets.only(
                                      left: 20, right: 25, bottom: 10),
                                  buttonElevation: 2,
                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
                                  dropdownMaxHeight: 250,
                                  dropdownWidth: 320,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  dropdownElevation: 1,
                                  scrollbarRadius: Radius.circular(40),
                                  scrollbarThickness: 5,
                                  scrollbarAlwaysShow: true,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("No "),
                                      value: "0",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Yes"),
                                      value: "1",
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select.';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.mobileTower.value = value.toString();
                                  },
                                ),
                              ),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Visibility(
                                    visible: (controller.mobileTower.value == "1"),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          //TOTAL AREA COVERED
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Total Area Covered ',
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
                                              controller:
                                              controller.totalAreaOfMobileTowerController,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Total Area',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          //INSTALLATION DATE
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Installation Date ',
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
                                              controller:
                                              controller.installationOfMobileTowerController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                // icon: Icon(Icons.calendar_month_outlined),
                                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                                hintText: 'dd-mm-yyyy',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
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
                                  );
                                }
                              }),
                              //HOARDING BOARD
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Property Have Hoarding Board(s)? - ',
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
                                  hint: const Text(
                                    'Select',
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.black45),
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
                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
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
                                      child: Text("No "),
                                      value: "0",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Yes"),
                                      value: "1",
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select.';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.hoardingBoard.value = value.toString();
                                  },
                                ),
                              ),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Visibility(
                                    visible: (controller.hoardingBoard.value == "1"),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Total Area ',
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
                                              controller: controller.totalAreaOfHoardingBoardController,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Total Area',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Installation Date',
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
                                              controller: controller
                                                  .installationOfHoardingBoardController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                // icon: Icon(Icons.calendar_month_outlined),
                                                suffixIcon: Icon(
                                                    Icons.calendar_month_outlined),
                                                hintText: 'dd-mm-yyyy',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
                                              ),
                                              format: DateFormat("yyyy-MM-dd"),
                                              onShowPicker: (context, currentValue) {
                                                return showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime(1900),
                                                    initialDate: currentValue ??
                                                        DateTime.now(),
                                                    lastDate: DateTime(2100));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }),
                              //PETROL PUMP
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Is Property a Petrol Pump? - ',
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
                                  hint: const Text(
                                    'Select',
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.black45),
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
                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
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
                                      child: Text("No "),
                                      value: "0",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Yes"),
                                      value: "1",
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select.';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.petrolPump.value = value.toString();
                                  },
                                ),
                              ),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Visibility(
                                    visible: (controller.petrolPump.value == "1"),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          //TOTAL AREA
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Total Area ',
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
                                              controller:
                                              controller.totalAreaOfPetrolPumpController,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Total Area',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          //INSTALLATION DATE
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Completion Date',
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
                                              controller:
                                              controller.installationOfPetrolPumpController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                                hintText: 'dd-mm-yyyy',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
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
                                  );
                                }
                              }),
                              //Rainwater Harvestion
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Rainwater Harvesting Provision? - ',
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
                                  hint: const Text(
                                    'Select',
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.black45),
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
                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
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
                                      child: Text("No "),
                                      value: "0",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Yes"),
                                      value: "1",
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select.';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.rainwaterHarvesting.value =
                                        value.toString();
                                  },
                                ),
                              ),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Visibility(
                                    visible: (controller.rainwaterHarvesting.value == "1"),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          //INSTALLATION DATE
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Completion Date',
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
                                              controller:
                                              controller.completeRainWaterHarvController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                // icon: Icon(Icons.calendar_month_outlined),
                                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                                hintText: 'dd-mm-yyyy',
                                                hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
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
                                  );
                                }
                              }),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (controller.floorUseType.value == '42') {
                                    return Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Is it a trust - ',
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
                                          hint: const Text(
                                            'Select',
                                            style:
                                            TextStyle(fontSize: 14, color: Colors.black45),
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
                                          itemPadding: EdgeInsets.only(left: 25, right: 25),
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
                                              child: Text("Educational Institution Run By Trust"),
                                              value: "1",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Other Organisational Trust"),
                                              value: "2",
                                            ),
                                          ],
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select.';
                                            }
                                          },
                                          onChanged: (value) {
                                            controller.TrustType.value = value.toString();
                                          },
                                        ),
                                      ),
                                    ]);
                                  } else {
                                    return Container();
                                  }
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:2,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(PropertyDetailsView());
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
