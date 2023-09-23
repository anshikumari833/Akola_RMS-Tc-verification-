import 'package:amc_rms/app/modules/water_SiteVerification/views/water_SiteVerification(main)_view.dart';
import 'package:amc_rms/app/modules/water_SiteVerification/views/water_SiteVerification_Details_view.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/water_site_verification_controller.dart';

class WaterSiteVerificationDateView extends GetView<WaterSiteVerificationController> {
  const  WaterSiteVerificationDateView({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var applicationId = Get.arguments;
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
          key: controller.DateTimeFormKey,
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
                            // Icon(CupertinoIcons.search_circle),
                            Text(
                              '',
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
                                  'Date',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: DateTimeField(
                                    controller:controller.inspectionDateController,
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
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: DateTimeField(
                                    controller:controller.inspectionTimeController ,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      disabledBorder: InputBorder.none,
                                      suffixIcon: Icon(Icons.access_time),
                                      hintText: 'Select Time',
                                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a time';
                                      }
                                      return null;
                                    },
                                    format: DateFormat("HH:mm"), // Time format
                                    onShowPicker: (context, currentValue) async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                      );

                                      // Return the selected time as DateTime (with date set to 1st Jan 1970)
                                      if (time != null) {
                                        return DateTime(1970, 1, 1, time.hour, time.minute);
                                      }

                                      // If the user cancels the picker, return the current value
                                      return currentValue;
                                    },
                                  ),
                                ),
                              ],
                            ),
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
                            onPressed: () {},
                            child: Text("  cancel  "),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (controller.DateTimeFormKey.currentState!.validate()) {
                                await controller.setInspectionDetail(applicationId);
                                if (controller.canView == "true") {
                                  await controller.getInspectionDetail(applicationId);
                                  await controller.InspectionDetailById(applicationId);
                                  await Get.to(WaterSiteVerificationDetailsView());
                                } else {
                                  await Get.to(WaterSiteVerificationView());
                                }
                              }
                            },
                            child: Text("Submit"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigoAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
