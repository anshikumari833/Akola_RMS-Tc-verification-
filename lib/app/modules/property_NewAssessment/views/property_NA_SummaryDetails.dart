import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/Common_ThemeColor.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyDetailsView extends GetView<PropertyNewAssessmentController> {
  const PropertyDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.lightTheme();
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body:  Obx(() {
        if (controller.isLoading.value == true) {
          return Container(
            child:  Center(
              child:SpinKitThreeBounce(
                color: theme.primaryColorDark,
                size: 40.0,
              ),
            ),
          );
        } else {
          return   SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.info_circle_fill,size: 12,color: Colors.red,),
                      Flexible(
                        child: Text(' Check the filled details. If any detail is get back and correct it make sure that the every feild is properly filled.Once you click save you can not edit the form   ',
                          style: GoogleFonts.literata(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                //BASIC DETAIL

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
                  margin:
                  EdgeInsets.only(top: 10.0, bottom: 10, right: 18, left: 18),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_open_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                'BASIC DETAILS',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(2), // Static text column width
                            1: FlexColumnWidth(3), // Response column width
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Land Purchase Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(controller.latePurchaseDateController.value.text,
                                      // controller.wardList.firstWhere(
                                      //       (item) => item['id'].toString() == controller.oldWardNo.toString(),
                                      //   orElse: () => {'ward_name': 'NA'},
                                      // )['ward_name'].toString(),

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Zone',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.zoneType != ''
                                          ? controller.zoneType.toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Ward No',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.newWardData
                                          .firstWhere(
                                            (item) =>
                                        item['id'].toString() ==
                                            controller.newWardNo.toString(),
                                        orElse: () => {'ward_name': 'NA'},
                                      )['ward_name']
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Ownership Type',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.ownershipList
                                          .firstWhere(
                                            (item) =>
                                        item['id'].toString() ==
                                            controller.ownershipType.toString(),
                                        orElse: () => {'ownership_type': 'NA'},
                                      )['ownership_type']
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Property Type',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.propertyList
                                          .firstWhere(
                                            (item) =>
                                        item['id'].toString() ==
                                            controller.propertyType.toString(),
                                        orElse: () => {'property_type': 'NA'},
                                      )['property_type']
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Category',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.categoryList
                                          .firstWhere(
                                            (item) =>
                                        item['id'].toString() ==
                                            controller.categoryList.toString(),
                                        orElse: () => {'property_type': 'NA'},
                                      )['property_type']
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
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
                SizedBox(
                  height: 10,
                ),
                //PROPERTY ADDRESS DETAIL
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
                  margin:
                  EdgeInsets.only(top: 10.0, bottom: 10, right: 18, left: 18),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
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
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.file_open_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '    PROPERTY ADDRESS & DETAILS',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(3), // Static text column width
                            1: FlexColumnWidth(4), // Response column width
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Khata No',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.khataNoController.text != ''
                                          ? controller.khataNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Plot No',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.plotNoController.text != ''
                                          ? controller.plotNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Village/Mauja Name',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.villageNameController.text != ''
                                          ? controller.villageNameController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Area of plot\n(in Decimal)',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.areaOfPlotController.text != ''
                                          ? controller.areaOfPlotController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'City',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.cityController.text != ''
                                          ? controller.cityController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'District',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.districtController.text != ''
                                          ? controller.districtController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'State',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.stateController.text != ''
                                          ? controller.stateController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Pin',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.pinController.text != ''
                                          ? controller.pinController.text.toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Property Address',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.propertyAddressController.text !=
                                          ''
                                          ? controller
                                          .propertyAddressController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
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
                SizedBox(
                  height: 10,
                ),
                // ELECTRICITY & WATER DETAILS
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
                  margin:
                  EdgeInsets.only(top: 10.0, bottom: 10, right: 18, left: 18),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
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
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.file_open_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '    ELECTRICITY & WATER DETAILS',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(2), // Static text column width
                            1: FlexColumnWidth(3), // Response column width
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Electricity K. No',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.ElectricitykNoController.text != ''
                                          ? controller.ElectricitykNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'ACC No.',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.accNoController.text != ''
                                          ? controller.accNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'BIND/BOOK No',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.bindBookNoController.text != ''
                                          ? controller.bindBookNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Electricity Consumer Category',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.electricityConsumer != ''
                                          ? controller.electricityConsumer
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Building Plan Approval No.',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.buildingPlanApprovalNoController
                                          .text !=
                                          ''
                                          ? controller
                                          .buildingPlanApprovalNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Building Plan Approval Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.buildingPlanApprovalDateController
                                          .text !=
                                          ''
                                          ? controller
                                          .buildingPlanApprovalNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Water Consumer No.',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.waterConsumerNoController.text !=
                                          ''
                                          ? controller
                                          .waterConsumerNoController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Water Consumer Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.waterConsumerDateController.text !=
                                          ''
                                          ? controller
                                          .waterConsumerDateController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
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
                SizedBox(
                  height: 10,
                ),
                //OWNER DETAIL
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.2),
                //         spreadRadius: 2,
                //         blurRadius: 5,
                //         offset: Offset(0, 1),
                //       ),
                //     ],
                //   ),
                //   margin:
                //       EdgeInsets.only(top: 10.0, bottom: 10, right: 18, left: 18),
                //   child: Column(
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //           color: Colors.indigo,
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(20),
                //             topRight: Radius.circular(20),
                //           ),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.2),
                //               spreadRadius: 2,
                //               blurRadius: 5,
                //               offset: Offset(0, 1),
                //             ),
                //           ],
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Icon(
                //                 Icons.file_open_outlined,
                //                 color: Colors.white,
                //               ),
                //               Text(
                //                 '  OWNER DETAILS',
                //                 style: GoogleFonts.poppins(
                //                   fontWeight: FontWeight.w700,
                //                   fontSize: 16,
                //                   fontStyle: FontStyle.normal,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 15.0, horizontal: 15),
                //         child: Table(
                //           columnWidths: {
                //             0: FlexColumnWidth(2), // Static text column width
                //             1: FlexColumnWidth(3), // Response column width
                //           },
                //           children: [
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Owner Name',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.ownerNameController.text != ''
                //                           ? controller.ownerNameController.text
                //                               .toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Gender',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.gender != ''
                //                           ? controller.gender.toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'DOB',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.dobController.text != ''
                //                           ? controller.dobController.text.toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Guardian Name',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.guardianNameController.text != ''
                //                           ? controller.guardianNameController.text
                //                               .toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Relation',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.relation != ''
                //                           ? controller.relation.toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Mobile No',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.mobileNoController.text != ''
                //                           ? controller.mobileNoController.text
                //                               .toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Aadhar No',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.aadharNoController.text != ''
                //                           ? controller.aadharNoController.text
                //                               .toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Pan No',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.panNoController.text != ''
                //                           ? controller.panNoController.text
                //                               .toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'E- Mail',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.emailController.text != ''
                //                           ? controller.emailController.text
                //                               .toString()
                //                           : 'NA',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Armed Force',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.isArmedForce.toString() == '1'
                //                           ? 'Yes'
                //                           : 'No',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             TableRow(
                //               children: [
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       'Specially Abled',
                //                     ),
                //                   ),
                //                 ),
                //                 TableCell(
                //                   child: Padding(
                //                     padding:
                //                         const EdgeInsets.symmetric(vertical: 5.0),
                //                     child: Text(
                //                       controller.isSpeciallyAbled.toString() == '1'
                //                           ? 'Yes'
                //                           : 'No',
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                //EXTRA DETAIL
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
                  margin:
                  EdgeInsets.only(top: 10.0, bottom: 10, right: 18, left: 18),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_open_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                '  EXTRA DETAILS',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(4),
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Mobile Tower',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.mobileTower.toString() == '1' ? 'Yes' : 'No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Mobile Tower Area',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.totalAreaOfMobileTowerController.text != ''
                                          ? controller.totalAreaOfMobileTowerController.text.toString() : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Installation Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.installationOfMobileTowerController.text != ''
                                          ? controller.installationOfMobileTowerController.text.toString() : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Hoarding Board',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.hoardingBoard.toString() == '1' ? 'Yes' : 'No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Hoarding Board Area',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.totalAreaOfHoardingBoardController.text != ''
                                          ? controller.totalAreaOfHoardingBoardController.text.toString() : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Installation Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.installationOfHoardingBoardController.text != ''
                                          ? controller.installationOfHoardingBoardController.text.toString() : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Petrop Pump',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.petrolPump.toString() == '1' ? 'Yes' : 'No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Petrol Pump Area',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.totalAreaOfPetrolPumpController.text != ''
                                          ? controller.totalAreaOfPetrolPumpController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Completion Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.installationOfPetrolPumpController.text != ''
                                          ? controller.installationOfPetrolPumpController.text
                                          .toString()
                                          : 'NA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Water Harvesting ',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.isArmedForce.toString() == '1'
                                          ? 'Yes'
                                          : 'No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      'Completion Date',
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Text(
                                      controller.isSpeciallyAbled.toString() == '1'
                                          ? 'Yes'
                                          : 'No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
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
                SizedBox(
                  height: 10,
                ),
                //FLOOR
                // Obx(() {
                //   final selectedPropertyType = controller.propertyType.toString();
                //   final propertyList = controller.propertyList;
                //   final selectedItem = propertyList.firstWhere(
                //           (item) => item['id'].toString() == selectedPropertyType,
                //       orElse: () => {'id': 'NA'});
                //
                //   if (selectedItem['id'] != "4") {
                //     return Container(
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.2),
                //             spreadRadius: 2,
                //             blurRadius: 5,
                //             offset: Offset(0, 1),
                //           ),
                //         ],
                //       ),
                //       margin: EdgeInsets.only(
                //           top: 10.0, bottom: 10, right: 18, left: 18),
                //       child: Column(
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //               color: Colors.indigo,
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(20),
                //                 topRight: Radius.circular(20),
                //               ),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Colors.grey.withOpacity(0.2),
                //                   spreadRadius: 2,
                //                   blurRadius: 5,
                //                   offset: Offset(0, 1),
                //                 ),
                //               ],
                //             ),
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Icon(
                //                     Icons.file_open_outlined,
                //                     color: Colors.white,
                //                   ),
                //                   Text(
                //                     '  FLOOR DETAILS',
                //                     style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.w700,
                //                       fontSize: 16,
                //                       fontStyle: FontStyle.normal,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           // Padding(
                //           //   padding: const EdgeInsets.symmetric(
                //           //       vertical: 15.0, horizontal: 15),
                //           //   child: Table(
                //           //     columnWidths: {
                //           //       0: FlexColumnWidth(2), // Static text column width
                //           //       1: FlexColumnWidth(3), // Response column width
                //           //     },
                //           //     children: [
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Floor',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.floorList
                //           //                     .firstWhere(
                //           //                       (item) =>
                //           //                           item['id'].toString() ==
                //           //                           controller.floor.toString(),
                //           //                       orElse: () => {'floor_name': 'NA'},
                //           //                     )['floor_name']
                //           //                     .toString(),
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Usage Type',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.usageList
                //           //                     .firstWhere(
                //           //                       (item) =>
                //           //                           item['id'].toString() ==
                //           //                           controller.useType.toString(),
                //           //                       orElse: () => {'usage_type': 'NA'},
                //           //                     )['usage_type']
                //           //                     .toString(),
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Occupancy Type',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.occuppancyList
                //           //                     .firstWhere(
                //           //                       (item) =>
                //           //                           item['id'].toString() ==
                //           //                           controller.occupancyType
                //           //                               .toString(),
                //           //                       orElse: () =>
                //           //                           {'occupancy_type': 'NA'},
                //           //                     )['occupancy_type']
                //           //                     .toString(),
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Construction Type',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.constructionList
                //           //                     .firstWhere(
                //           //                       (item) =>
                //           //                           item['id'].toString() ==
                //           //                           controller.constructionType
                //           //                               .toString(),
                //           //                       orElse: () =>
                //           //                           {'construction_type': 'NA'},
                //           //                     )['construction_type']
                //           //                     .toString(),
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Build Up Area',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.buildupAreaController[0].text.isNotEmpty
                //           //                     ? controller.buildupAreaController[0].text.toString()
                //           //                     : 'NA',
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Date From ',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.dateFromController[0].text.isNotEmpty
                //           //                     ? controller.dateFromController[0].text.toString()
                //           //                     : 'NA',
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //       TableRow(
                //           //         children: [
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 'Date Upto',
                //           //               ),
                //           //             ),
                //           //           ),
                //           //           TableCell(
                //           //             child: Padding(
                //           //               padding: const EdgeInsets.symmetric(
                //           //                   vertical: 5.0),
                //           //               child: Text(
                //           //                 controller.dateUptoController[0].text.isNotEmpty
                //           //                     ? controller.dateUptoController[0].text.toString()
                //           //                     : "NA",
                //           //                 style: TextStyle(
                //           //                   fontWeight: FontWeight.bold,
                //           //                   color: Colors.black,
                //           //                 ),
                //           //               ),
                //           //             ),
                //           //           ),
                //           //         ],
                //           //       ),
                //           //     ],
                //           //   ),
                //           // ),
                //         ],
                //       ),
                //     );
                //   } else {
                //     return Container();
                //   }
                // }),
                // //  BUTTONS
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 200.0,
                      height: 35,
                      color: Colors.blue,
                      child: new Text('Save & Next',
                          style:
                          new TextStyle(fontSize: 16.0, color: Colors.white)),
                      onPressed: () async {
                        await controller.TaxDescriptionForm();
                        // await Get.to(PropertyNATaxDescriptionDetailView());
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40,),
              ],
            ),
          );
        }
      }),
    );
  }
}
