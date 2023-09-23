import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../controllers/property_DailyTcReport_controller.dart';

class PropertyDailyTcReportView
    extends GetView<PropertyDailyTcReportController> {
  const PropertyDailyTcReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showDialog(context, controller);
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Collection Summary", style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle:
                  FontStyle.normal),)],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Property", style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle:
                  FontStyle.normal),)],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Akola Municipal Corporation", style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle:
                  FontStyle.normal),)],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")],
            ),
            SizedBox(height:20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  buildRow('From Date :', controller.dateFromController.text),
                  SizedBox(height: 8.0),
                  buildRow('To Date :', controller.dateUptoController.text),
                  SizedBox(height: 8.0),
                  buildRow('Tc Name :', ""),
                  SizedBox(height: 8.0),
                  buildRow('Mobile No :', ""),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")],
            ),
            SizedBox(height: 10,),
            Text(
              controller.generateReceiptTable(),
              style: TextStyle(fontFamily: 'Monospace'), // Use a monospace font for even spacing
            ),

            SizedBox(height:10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  for (var footerItem in controller.report_footerData)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${footerItem['mode']}(${footerItem['count']})  >>  ${footerItem['amount']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")],
            ),
          ],
        ),
      ),

      // Obx(
      //         () {
      //       if (controller.isLoading.value) {
      //         return Container(
      //           child: Center(
      //             child: SpinKitFadingCircle(
      //               color: Colors.blue,
      //               size: 50.0,
      //             ), // Loader widget
      //           ),
      //         );
      //       } else if (controller.reportList.isEmpty) {
      //         return Container(
      //           child: Center(
      //             child: Text("No results found"),
      //           ),
      //         );
      //       } else {
      //         return  SingleChildScrollView(
      //           child: Container(
      //             child: Column(
      //               children: [
      //               ],
      //             ),
      //           ),
      //         );
      //       }}
      // ),
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



Row buildRow(String label, String value) {
  return Row(
    children: [
      Text(label),
      SizedBox(width:10.0),
      Flexible(
        child: Text(
          nullToNA(value),
        ),
      ),
    ],
  );
}
