import 'package:amc_rms/app/modules/trade_NewApplication/views/trade_NA_OwnerDetail_view.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/trade_new_application_controller.dart';

class TradeNAFirmDetailView extends GetView<TradeNewApplicationController> {
  const TradeNAFirmDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Text(
            "New Application",
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
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
                      ' Firm Details',
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
                              //HOLDING NO
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Holding No',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //WARD NO
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Ward No',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
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
                                    style: TextStyle(fontSize: 16, color: Colors.black),),
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
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Zone 1"),
                                      value: "1",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Zone 2"),
                                      value: "2",
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Zone';
                                    }
                                  },
                                  onChanged: (value) {
                                  },
                                ),
                              ),
                              //NEW WARD NO
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'New Ward No',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
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
                                    style: TextStyle(fontSize: 16, color: Colors.black),),
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
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Zone 1"),
                                      value: "1",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Zone 2"),
                                      value: "2",
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select Zone';
                                    }
                                  },
                                  onChanged: (value) {
                                  },
                                ),
                              ),
                              // TOTAL AREA(SQFT)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Total Area(sqft)',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //FIRM NAME
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Firm Name',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //FIRM ESTABLISHMENT DATE
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Firm Establishment Date',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DateTimeField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    // icon: Icon(Icons.calendar_month_outlined),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: 'dd-mm-yyyy',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
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
                              //BUSINESS ADDRESS
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Business Address',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //LANDMARK
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Landmark',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //PINCODE
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Pincode',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //OWNER BUSINESS PREMISES
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Owner of Business Premises',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //BUSINESS DESCRIPTION
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Business Description',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //NATURE OF BUSINESS
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Nature of Busines',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
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
                                  EdgeInsets.only(left: 20, right: 25, bottom:50),
                                  buttonElevation: 2,
                                  itemPadding: EdgeInsets.only(left: 25, right: 25,bottom: 20),
                                  dropdownMaxHeight: 300,
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
                                  ] : controller.natureOfBusiness.map((ward) {
                                    return DropdownMenuItem(
                                      value: ward["id"].toString(),
                                      child: Text(ward["trade_item"].toString()),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select.';
                                    }
                                  },
                                  onChanged: (value) {
                                  },
                                ),
                              ),),
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
                      Get.to(TradeNAOwnerdetailView());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

