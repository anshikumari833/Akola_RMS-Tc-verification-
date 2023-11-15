import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../controllers/property_DailyTcReport_controller.dart';

class PropertyDailyTcReportView
    extends GetView<PropertyDailyTcReportController> {
  const PropertyDailyTcReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   _showDialog(context, controller);
    // });
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F7FC),
        foregroundColor: Colors.black,
        title: Center(
          child: Text(
            "Daily Report",
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 6, bottom: 4, left: 6, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.search_circle),
                          Text(
                            '  Search Daily Report ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomDateTimeField(
                      controller: controller.dateFromController,
                      headingText: 'Select Date',
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
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
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a date and time';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDateTimeField(
                      controller: controller.dateUptoController,
                      headingText: 'Select Date',
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
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
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a date and time';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     int page = 1;
                    //     controller.getReportDetail(page);
                    //   },
                    //   child: Text("Search"),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        // Get the selected dates from the controllers
                        DateTime? fromDate = controller.dateFromController.text.isNotEmpty
                            ? DateTime.parse(controller.dateFromController.text)
                            : null;
                        DateTime? uptoDate = controller.dateUptoController.text.isNotEmpty
                            ? DateTime.parse(controller.dateUptoController.text)
                            : null;
                        // Check if both dates are selected and they are the same
                        if (fromDate != null && uptoDate != null && fromDate.isAtSameMomentAs(uptoDate)) {
                          // Dates are the same, proceed with the search
                          int page = 1;
                          controller.getReportDetail(page);
                        } else {
                          // Dates are not the same or at least one is null, error message
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Date Selection Error'),
                                content: Text('Please select the same date for both "From Date" and "To Date".'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('  OK  '),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text("    Search    "),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset(
                "assets/images/DailyReport_Img(2).png",),
            ),
          ],
        ),
      ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(
    BuildContext context, PropertyDailyTcReportController controller) {
  Get.defaultDialog(
    barrierDismissible: false,
    title: 'Search Report Data',
    titlePadding: EdgeInsets.all(20),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomDateTimeField(
          controller: controller.dateFromController,
          headingText: 'Select Date',
          decoration: InputDecoration(
            labelText: 'Date',
            border: OutlineInputBorder(),
          ),
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
              return 'Please select a date and time';
            }
            return null;
          },
        ),
        SizedBox(
          height: 5,
        ),
        CustomDateTimeField(
          controller: controller.dateUptoController,
          headingText: 'Select Date',
          decoration: InputDecoration(
            labelText: 'Date',
            border: OutlineInputBorder(),
          ),
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
              return 'Please select a date and time';
            }
            return null;
          },
        ),
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              int page = 1;
              controller.getReportDetail(page);
            },
            child: Text("Search"),
          ),
        ],
      ),
    ],
  );
}




