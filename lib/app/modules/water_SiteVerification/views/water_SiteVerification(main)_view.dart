import 'package:amc_rms/app/modules/water_SiteVerification/views/water_SiteVerification_Date_view.dart';
import 'package:amc_rms/app/modules/water_SiteVerification/views/water_SiteVerification_Details_view.dart';
import 'package:amc_rms/app/modules/water_SiteVerification/views/water_SiteVerification_JeInspectedDetails_view.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/water_site_verification_controller.dart';

class WaterSiteVerificationView extends GetView<WaterSiteVerificationController> {
  const WaterSiteVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Row(
            children: [
              Text(
                'Site Inspection',
                style:  GoogleFonts.publicSans(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),),
            ],
          ),
        ), actions: [
        SizedBox(width: 10,),
        GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
        SizedBox(width: 14,),
      ],),
      body: SingleChildScrollView(
        child: Form(
          key: controller.SearchFormKey,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6, bottom: 10, left:0, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.search_circle),
                            Text(
                              '  Search Inspection List...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    'Search by',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                ),
                                Text(
                                  "*    ",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child:
                                  DropdownButtonFormField2(
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
                                    dropdownWidth: 220,
                                    dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                    dropdownElevation: 8,
                                    scrollbarRadius: Radius.circular(40),
                                    scrollbarThickness: 5,
                                    scrollbarAlwaysShow: true,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("Select"),
                                        value: "",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Date"),
                                        value: "byDate",
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Application No"),
                                        value: "byApplication",
                                      ),
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select a search criteria';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.searchBy.value = value.toString();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Obx(() {
                              return Visibility(
                                visible:controller.searchBy.value == "byDate".toString(),
                                child:  Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'From Date',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                        ),
                                        Text(
                                          "*    ",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: DateTimeField(
                                            controller: controller.fromDateController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: true,
                                              fillColor: Colors.grey[100],
                                              disabledBorder: InputBorder.none,
                                              suffixIcon: Icon(Icons.calendar_month_outlined),
                                              hintText: 'dd-mm-yyyy',
                                              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                            ),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select a date';
                                              }
                                              return null;
                                            },
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

                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'To Date',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                        ),
                                        Text(
                                          "*    ",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        SizedBox(width: 27),
                                        Expanded(
                                          child:DateTimeField(
                                          controller: controller.toDateController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: Colors.grey[100],
                                            disabledBorder: InputBorder.none,
                                            suffixIcon: Icon(Icons.calendar_month_outlined),
                                            hintText: 'dd-mm-yyyy',
                                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                          ),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select a date';
                                            }
                                            return null;
                                          },
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
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                            Obx(() {
                              return Visibility(
                                visible:controller.searchBy.value == "byApplication".toString(),
                                child:  Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Application\n        No',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                        ),
                                        SizedBox(width:22),
                                        Expanded(
                                          child: TextFormField(
                                            controller: controller.applicationNoController,
                                            validator: (value) {
                                              if (controller.searchBy.value == "byApplication") {
                                                return 'Please enter an application number';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: 30, right: 10, bottom: 12,top: 10),
                                              filled: true,
                                              focusColor: Colors.grey[100],
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                              ),

                                              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                              hintText: "",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (controller.SearchFormKey.currentState!.validate()) {
                                controller.searchInspectionDetail();
                              }
                            },
                            child: Row(
                              children: [
                                Text(' Search '),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //DIVIDER
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, bottom:10, left: 22, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'List of Site Inspection',
                          style:  GoogleFonts.publicSans(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                          ),),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.isPageLoading.value == true) {
                    return Container(
                      height: 450,
                      width: 390,
                      child:  Center(
                        child:  SpinKitSpinningLines(
                          color: Colors.blue,
                          size: 70.0,
                        ),
                      ),
                    );
                  }  else if (controller.SearchListData.isEmpty) {
                    return Container(
                      height: 440,
                      width: 390,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/images/water_SiteInspection.png",),
                          ),
                        ],
                      ),
                    );
                  }else {
                    return SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.SearchListData.length,
                        itemBuilder: (context, index) {
                          return  GestureDetector(
                            onTap: () async {
                              if (controller.SearchListData[index]['SiteInspectionDate'].isEmpty){
                                Get.to(WaterSiteVerificationDateView(),
                                  arguments: controller.SearchListData[index]["id"].toString());
                              }  else {
                                 try {
                                 controller.isPageLoading.value = true;
                                 await controller.getInspectionDetail(controller.SearchListData[index]['id'].toString());
                                 if(controller.canOpen.toString() == 'false'){
                                   await controller.InspectionDetailById(controller.SearchListData[index]['id'].toString());
                                   await controller.getJeDetailById(controller.SearchListData[index]['id'].toString());
                                   await Get.to(WaterSiteVerificationJeinspectedView());
                                 } else {
                                   await controller.InspectionDetailById(controller.SearchListData[index]['id'].toString());
                                   await Get.to(WaterSiteVerificationDetailsView());}
                                 } finally {
                                 controller.isPageLoading.value = false;
                                 }
                                 }
                                 },


                            child: Card(
                              margin: EdgeInsets.all(14.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                    child: Column(
                                      children: [
                                        _buildDetailsRow('Ward No', controller.SearchListData[index]['ward_name'].toString()),
                                        _buildDetailsRow('ULB Name', controller.SearchListData[index]['ulb_name'].toString()),
                                        _buildDetailsRow('Application No', controller.SearchListData[index]['application_no'].toString()),
                                        _buildDetailsRow('Holding No', controller.SearchListData[index]['holding_no'].toString()),
                                        _buildDetailsRow('Apply Date', controller.SearchListData[index]['apply_date'].toString()),
                                        _buildDetailsRow('Address', capitalizeFirstLetter(controller.SearchListData[index]['address'].toString())),
                                        // _buildDetailsRow('Inspection Status', controller.SearchListData[index]['SiteInspectionDate']['site_verify_status'].toString()),
                                        _buildData(
                                          'Inspection Status',
                                          controller.SearchListData[index]['SiteInspectionDate'].isEmpty
                                              ? false
                                              : controller.SearchListData[index]['SiteInspectionDate']['site_verify_status'],),
                                        _buildDetailsRow('Schedule Date', controller.SearchListData[index]['SiteInspectionDate'].isEmpty ? "NA" : controller.SearchListData[index]['SiteInspectionDate']['inspection_date'].toString()),
                                        // _buildDetailsRow('Schedule Date', controller.SearchListData[index]['SiteInspectionDate']['inspection_date'].toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
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
                  fontSize: 14,
                  fontStyle:
                  FontStyle.normal),
            ),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
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


Widget _buildData(String label, bool siteVerifyStatus) {
  String statusText = siteVerifyStatus ? "Done" : "Not Done";
  Color statusColor = siteVerifyStatus ? Colors.green : Colors.red;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style:GoogleFonts.publicSans(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontStyle:
                FontStyle.normal),
          ),
        ),
        Text(
          statusText,
          style:GoogleFonts.publicSans(
            color: statusColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontStyle:
              FontStyle.normal
          ),
        ),
      ],
    ),
  );
}
