import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/cluster.dart';
import '../controllers/water_daily_collection_report_controller.dart';

class WaterDailyReportMainReportView extends GetView<WaterDailyCollectionReportController> {
  const WaterDailyReportMainReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Report'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Container(
            child: Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              ), // Loader widget
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Collection Summary",
                      style: GoogleFonts.publicSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Water",
                      style: GoogleFonts.publicSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Akola Municipal Corporation",
                      style: GoogleFonts.publicSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      buildRow(
                          'From Date :', controller.dateFromController.text),
                      SizedBox(height: 8.0),
                      buildRow('To Date :', controller.dateUptoController.text),
                      SizedBox(height: 8.0),
                      buildRow('Tc Name :',  controller.report_tcName),
                      SizedBox(height: 8.0),
                      buildRow('Mobile No :', controller.report_tcMobileNo),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  controller.generateReceiptTable(),
                  style: TextStyle(
                      fontFamily:
                      'Monospace'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      buildRow(
                          'No of Collection :', controller.report_totalCount),
                      SizedBox(height: 8.0),
                      buildRow('Total Amount :', controller.report_totalAmount),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.openPrintPOS();
                  },
                  child: Text(" Print Receipt "),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

Row buildRow(String label, String value) {
  return Row(
    children: [
      Text(label),
      SizedBox(width: 10.0),
      Flexible(
        child: Text(
          nullToNA(value),
        ),
      ),
    ],
  );
}
