import 'package:amc_rms/app/modules/Property_SearchAssessmentDetail/views/SearchAssessment_SafDetails_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_search_assessment_detail_controller.dart';
import '../property_search_assessment_detail_model.dart';
import 'SearchAssessment_DemandDetails_view.dart';
import 'SearchAssessment_ViewAllDocument_view_document_view.dart';

class SearchAssessmentDetailView
    extends GetView<SearchAssessmentDetailController> {
  const SearchAssessmentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Row(
          children: [
            Text(
              '  Search Assessment',
              style: GoogleFonts.publicSans(
                fontSize: 21,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                Get.to(HomeView());
              },
              child: Icon(
                Icons.home,
                color: Colors.black,
              )),
          SizedBox(
            width: 14,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF0F6F9),
          child: Column(
            children: [
              //DROPDOWN AND TEXT BOX
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 6, bottom: 4, left: 6, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.search_circle),
                            Text(
                              '  Search Applications...',
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
                      CustomDropdownFormField(
                        headingText: 'Application Type',
                        items: [
                          DropdownMenuItem(
                            child: Text("Select"),
                            value: "",
                          ),
                          DropdownMenuItem(
                            child: Text("SAF"),
                            value: "saf",
                          ),
                          // DropdownMenuItem(
                          //   child: Text("GB SAF"),
                          //   value: "gbsaf",
                          // ),
                          // DropdownMenuItem(
                          //   child: Text("Concession"),
                          //   value: "concession",
                          // ),
                          // DropdownMenuItem(
                          //   child: Text("Objection"),
                          //   value: "objection",
                          // ),
                          // DropdownMenuItem(
                          //   child: Text("Rainwater Harvesting"),
                          //   value: "harvesting",
                          // ),
                          // DropdownMenuItem(
                          //   child: Text("Holding Deactivation"),
                          //   value: "holdingDeactivation",
                          // ),
                        ],
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        onChanged: (Value) {
                          controller.filteredBy.value = Value.toString();
                        },
                      ),
                      CustomDropdownFormField(
                        headingText: 'Search By',
                        items: [
                          DropdownMenuItem(
                            child: Text("Select"),
                            value: "",
                          ),
                          DropdownMenuItem(
                            child: Text("Application No"),
                            value: "applicationNo",
                          ),
                          DropdownMenuItem(
                            child: Text("Name"),
                            value: "name",
                          ),
                          DropdownMenuItem(
                            child: Text("Mobile No"),
                            value: "mobileNo",
                          ),
                          DropdownMenuItem(
                            child: Text("Holding No"),
                            value: "holding",
                          ),
                          DropdownMenuItem(
                            child: Text("PTN"),
                            value: "ptn",
                          ),
                        ],
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          controller.searchBy.value = value.toString();
                        },
                      ),
                      CustomTextField(
                        controller: controller.searchValueController,
                        headingText: "Value",
                        hintText: "Enter value",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return "";
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // Set isDataProcessing flag to true to show loader
                              controller.isDataProcessing.value = true;
                              var page = 1;
                              await controller.getSearchData(page);
                              // Set isDataProcessing flag to false to hide loader
                              controller.isDataProcessing.value = false;
                            },
                            child: Text('Search Record'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //DIVIDER
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 0, left: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Application List',
                        style: GoogleFonts.publicSans(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF454646),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.keyboard_double_arrow_left),
                            onPressed: controller.previousPage,
                            disabledColor: Colors.grey,
                          ),
                          Obx(() => Text(
                                ' ${controller.currentPage.value}'
                                ' to ${controller.totalPages.value}',
                                style: TextStyle(fontSize: 16.0),
                              )),
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
                if (controller.isDataProcessing.value == true) {
                  return Container(
                    height: 450,
                    width: 390,
                    child: Center(
                      child: SpinKitSpinningLines(
                        color: Colors.blue,
                        size: 70.0,
                      ),
                    ),
                  );
                } else {
                  if (controller.searchDetailList.isEmpty) {
                    return Container(
                      height: 440,
                      width: 390,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset("assets/images/search_img2.png"),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.searchDetailList.isEmpty) {
                    return Container(
                      // color: Colors.white,
                      height: 440,
                      width: 390,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Image.asset("assets/images/search_img3.png"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    final startIndex =
                        (controller.currentPage.value - 1) * controller.perPage;
                    final endIndex = startIndex + controller.perPage;
                    final displayedData =
                        startIndex < controller.searchDetailList.length
                            ? controller.searchDetailList.sublist(
                                startIndex,
                                endIndex < controller.searchDetailList.length
                                    ? endIndex
                                    : controller.searchDetailList.length,
                              )
                            : [];
                    return SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.searchDetailList.length,
                        itemBuilder: (context, index) {
                          var searchedData = controller.searchDetailList[index];
                          if (searchedData is SearchSafData) {
                            return GestureDetector(
                              onTap: () async {
                                // await controller.searchAssessmentById(controller.searchDetailList[index].id.toString());
                                // await controller.searchDocumentById(controller.searchDetailList[index].id.toString());
                                // await controller.IndiVerificationsListById(controller.searchDetailList[index].id.toString());
                                // Get.to(SafDetailsView());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Details',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Card(
                                        margin: EdgeInsets.all(2.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),),
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  _buildDetailsRow('Ward No', searchedData.oldWardNo.toString()),
                                                  _buildDetailsRow('Application No', searchedData.safNo ?? ''),
                                                  _buildDetailsRow('Assessment Type', searchedData.assessmentType ?? ''),
                                                  _buildDetailsRow('First Owner', searchedData.ownerName ?? ''),
                                                  _buildDetailsRow('Mobile No', searchedData.mobileNo ?? ''),
                                                  _buildDetailsRow('Applied By', searchedData.appliedby ?? ''),
                                                  _buildDetailsRow('Current Level', searchedData.status ?? ''),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //BASIC DETAILS
                                                TextButton(
                                                    onPressed: () async {
                                                      await controller.searchAssessmentById(controller.searchDetailList[index].id.toString());
                                                      // await controller.IndiVerificationsListById(controller.searchDetailList[index].id.toString());
                                                      // await controller.searchDocumentById(controller.searchDetailList[index].id.toString());
                                                      await Get.to(
                                                          SafDetailsView());
                                                    },
                                                    child:
                                                        Text('Basic Detail')),
                                                //DEMAND DETAILS
                                                TextButton(
                                                    onPressed: () async {
                                                      await controller.getDemandDetailById(controller.searchDetailList[index].id.toString());
                                                      await Get.to(
                                                          DemandDetailsView());
                                                    },
                                                    child:
                                                        Text('Demand Detail')),
// VIEW DOCUMENT
                                                TextButton(
                                                    onPressed: () async {
                                                      await controller.IndiVerificationsListById(controller.searchDetailList[index].id.toString());
                                                      await controller.searchDocumentById(controller.searchDetailList[index].id.toString());
                                                      await Get.to(
                                                          SearchAssessmentViewDocumentView());
                                                    },
                                                    child:
                                                        Text('View Document')),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (searchedData is SearchGbSafData) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(SafDetailsView());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Details',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Card(
                                        margin: EdgeInsets.all(2.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _buildDetailsRow(
                                                      'Ward No',
                                                      searchedData.oldWardNo
                                                          .toString()),
                                                  _buildDetailsRow(
                                                      'Application No',
                                                      searchedData.safNo ?? ''),
                                                  _buildDetailsRow(
                                                      'Assessment Type',
                                                      searchedData
                                                              .officerName ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'First Owner',
                                                      searchedData
                                                              .assessmentType ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'Mobile No',
                                                      searchedData.mobileNo ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'Applied By',
                                                      searchedData.updtedAt ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'Current Level',
                                                      searchedData
                                                              .currentRole ??
                                                          ''),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //BASIC DETAILS
                                                TextButton(
                                                    onPressed: () async {},
                                                    child:
                                                        Text('Basic Detail')),
                                                //DEMAND DETAILS
                                                TextButton(
                                                    onPressed: () async {},
                                                    child:
                                                        Text('Demand Detail')),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (searchedData is SearchOtherData) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(SafDetailsView());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Details',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Card(
                                        margin: EdgeInsets.all(2.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        elevation: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _buildDetailsRow(
                                                      'Ward No',
                                                      searchedData.status
                                                          .toString()),
                                                  _buildDetailsRow(
                                                      'Application No',
                                                      searchedData.applicationNo
                                                              .toString() ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'Assessment Type',
                                                      searchedData.currentRole
                                                              .toString() ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'First Owner',
                                                      searchedData.currentRolee
                                                              .toString() ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'Mobile No',
                                                      searchedData.wardName
                                                              .toString() ??
                                                          ''),
                                                  _buildDetailsRow(
                                                      'Current Level',
                                                      searchedData.propAddress
                                                              .toString() ??
                                                          ''),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //BASIC DETAILS
                                                TextButton(
                                                    onPressed: () async {},
                                                    child:
                                                        Text('Basic Detail')),
                                                //DEMAND DETAILS
                                                TextButton(
                                                    onPressed: () async {},
                                                    child:
                                                        Text('Demand Detail')),

                                                TextButton(
                                                    onPressed: () async {},
                                                    child:
                                                        Text('View Document')),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://tse2.mm.bing.net/th?id=OIP.9ewR6tKhjZChMqy3uhxG9wAAAA&pid=Api&P=0",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// View:
Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    ),
  );
}
