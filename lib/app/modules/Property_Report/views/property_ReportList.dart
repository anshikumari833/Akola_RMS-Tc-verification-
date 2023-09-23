
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/custom_appbar.dart';
import '../controllers/property_report_controller.dart';

class ReportListView extends GetView<PropertyReportController> {
  const ReportListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(
        () {
      if (controller.isLoading.value) {
        return Container(
          color: const Color(0xFFF0F6F9),
          child: Center(
            child: SpinKitFadingCircle(
              color: Colors.blue,
              size: 50.0,
            ), // Loader widget
          ),
        );
      } else if (controller.reportList.isEmpty) {
        return Container(
          color: const Color(0xFFF0F6F9),
          child: Center(
            child: Text("No results found"),
          ),
        );
      } else {
        return  SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF0F6F9),
            child: Column(
              children: [
                //SITE VERIFICATION
                Container(
                  margin: EdgeInsets.only(top: 20, bottom:0, left: 30, right: 0),
                  child: Row(
                    children: [
                      Text(
                        'Tc Collection Report',
                        style:  GoogleFonts.publicSans(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(69, 70, 70, 0.9),
                        ),),
                    ],
                  ),
                ),
                //DIVIDER
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom:0, left: 30, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total Amount : ",
                              style: GoogleFonts.publicSans(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF454646),
                              ),
                            ),
                            SizedBox(
                              height: 5.3,
                            ),
                            Text(
                              controller.totalAmount,
                              style: GoogleFonts.publicSans(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF454646),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.keyboard_double_arrow_left),
                              onPressed: controller.previousPage,
                              disabledColor: Colors.grey,
                            ),
                            Obx(() => Text(
                              ' ${controller.currentPage.value}' ' to ${controller.totalPages.value}',
                              style: TextStyle(fontSize: 16.0),
                            )),

                            // SizedBox(width: 5.0),
                            IconButton(
                              icon: Icon(Icons.keyboard_double_arrow_right),
                              onPressed: controller.nextPage,
                              disabledColor: Colors.grey,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Container(
                      height:400,
                      child: Center(
                        child: SpinKitFadingCircle(
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  if (controller.reportList.isEmpty) {
                    return
                      Container(
                        height:400,
                        child: Center(
                          child: Text("No results found"),
                        ),
                      );
                  }
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.reportList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (controller.reportList.isEmpty || index >= controller.reportList.length) {
                          return SizedBox.shrink();
                        }
                        return GestureDetector(
                          onTap: () async {
                          },
                          child:  Container(
                            margin: EdgeInsets.all(15.0),
                            // height: 790,
                            // width: 390,
                            color: const Color(0xFFF0F6F9),
                            child: Column(
                              children: [
                                // const SizedBox(height: 360.59,),
                                Container(
                                  height: 225.13,
                                  child: Stack(
                                    children: [
                                      //==============================
                                      //View Full details button
                                      //==============================
                                      Positioned(
                                        top: 59.59,
                                        child: Container(
                                          padding: const EdgeInsets.all(13.24),
                                          width: size.width * 0.92,
                                          height: 165.53,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFEEF4F6),
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.06),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 4,
                                                  spreadRadius: 0,
                                                ),
                                              ]),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              'View full details',
                                              style: GoogleFonts.publicSans(
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF8E9193),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //  ===============================
                                      //  card details
                                      //  ===============================

                                      Positioned(
                                        bottom: 40.35,
                                        child: Container(
                                          height: 178.78,
                                          width: size.width * 0.92,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0.02),
                                                  offset: Offset(0, 4),
                                                  blurRadius: 4,
                                                  spreadRadius: 0,
                                                )
                                              ]
                                            // color: Colors.red
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(0),
                                                      child: Image.asset(
                                                          "assets/images/report image.png"),
                                                    ),
                                                    SizedBox(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            "SAF NO.",
                                                            style: GoogleFonts.publicSans(
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                                fontStyle:
                                                                FontStyle.normal),
                                                          ),
                                                          SizedBox(
                                                            height: 5.3,
                                                          ),
                                                          Text(
                                                            controller.reportList[index]['holding_no'],
                                                            style: GoogleFonts.publicSans(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 11,
                                                              fontStyle: FontStyle.normal,
                                                              color: Color.fromRGBO(
                                                                  69, 70, 70, 0.7),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 19.27),
                                                child: VerticalDivider(
                                                  width: 10,
                                                  color: Color.fromRGBO(69, 70, 70, 0.2),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10, vertical: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Ward No. - ${controller.reportList[index]['ward_no']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),Text(
                                                        "Holding No - ${controller.reportList[index]['new_holding_no']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Owner Name - ${controller.reportList[index]['owner_name']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Payment \n(From/Upto) - ${controller.reportList[index]['from_upto_fy_qtr']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Tran No - ${controller.reportList[index]['tran_no']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Tran Date - ${controller.reportList[index]['tran_date']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Mode - ${controller.reportList[index]['transaction_mode']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Amount - ${controller.reportList[index]['amount']}",
                                                        style: GoogleFonts.publicSans(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                ),
              ],
            ),
          ),
        ); }}),




    );
  }
}

