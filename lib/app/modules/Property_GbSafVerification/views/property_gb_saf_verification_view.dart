import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/custom_appbar.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_gb_saf_verification_controller.dart';

class PropertyGbSafVerificationView extends GetView<PropertyGbSafVerificationController> {
  const PropertyGbSafVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF0F6F9),
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF1F7FC),
          title: Center(
            child: Text("Site Verification",style:GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),),
          ), actions: [
          SizedBox(width: 10,),
          GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
          SizedBox(width: 14,),
        ],),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF0F6F9),
            child: Column(
              children: [
                //SEARCH APPLICATION BOX
                SizedBox(height: 10,),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 6, bottom: 4, left:6, right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.search_circle),
                            Text(
                              '  Search GB SAF Applications',
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
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70),
                                    borderSide: BorderSide.none),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Select',
                                style:
                                TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 40,
                              buttonPadding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 15),
                              buttonElevation: 2,
                              itemHeight: 50,
                              itemPadding: EdgeInsets.only(
                                  left: 10, right: 25, bottom: 10),
                              dropdownMaxHeight: 150,
                              // dropdownWidth:250,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              dropdownElevation: 1,
                              scrollbarRadius: Radius.circular(40),
                              scrollbarThickness: 5,
                              scrollbarAlwaysShow: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Application No"),
                                  value: "0",
                                ),
                                DropdownMenuItem(
                                  child: Text("Name"),
                                  value: "1",
                                ),
                                DropdownMenuItem(
                                  child: Text("Mobile No"),
                                  value: "2",
                                ),
                              ],
                              onChanged: (value) {
                                // controller.selectedFilterBy.value =
                                //     value.toString();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            child: TextField(
                              // onChanged: (value) => controller.searchQuery.text = value.toString(),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                contentPadding: EdgeInsets.only(
                                    left: 35, right: 10),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70),
                                    borderSide: BorderSide.none),
                                suffixIcon:
                                Icon(Icons.search, color: Colors.grey),
                                hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey),
                                hintText: "Search...",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // controller.getBysearch();
                              },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the value to change the button's roundness
                              ),
                            ),
                            child: Text('Search'),
                          ),
                        ],
                      ),
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
                        Text(
                          'Application List',
                          style:  GoogleFonts.publicSans(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                          ),),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.keyboard_double_arrow_left),
                              onPressed: controller.previousPage,
                              disabledColor: Colors.grey,
                            ),
                            Obx(() => Text(
                              ' ${controller.currentPage.value}' ' to ${controller.totalPages.value}',
                              style:  GoogleFonts.publicSans(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                              ),
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
                  final filteredList = controller.verifyUser;
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
                  if (controller.verifyUser.isEmpty) {
                    return
                      Container(
                        height:400,
                        child: Center(
                          child: Text("No results found"),
                        ),
                      );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.verifyUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (controller.verifyUser.isEmpty || index >= controller.verifyUser.length) {
                        return SizedBox.shrink();
                      }
                      return GestureDetector(
                        onTap: () async {
                          // await controller.verificationByUserID(controller.verifyuser[index]['vId']);
                          // Get.to(PendVerificationFormView(),
                          //   arguments: [{"applicationId": 290176},],
                          //   preventDuplicates: true,
                          // );
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
                                              color: Colors.blue,
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
                                              flex: 1,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(0),
                                                    child: Image.asset(
                                                        "assets/images/gbsaf image.png"),
                                                  ),
                                                  // SizedBox(
                                                  //   child: Column(
                                                  //     children: [
                                                  //       Text(
                                                  //         "GBSAF NO.",
                                                  //         style: GoogleFonts.publicSans(
                                                  //             fontWeight: FontWeight.w700,
                                                  //             fontSize: 12,
                                                  //             fontStyle:
                                                  //             FontStyle.normal),
                                                  //       ),
                                                  //       SizedBox(
                                                  //         height: 5.3,
                                                  //       ),
                                                  //       Text(
                                                  //         // controller.vSafno,
                                                  //         (controller.verifyUser[index]['vSafno'] == null ? '' : controller.verifyUser[index]['vSafno'].toString()),
                                                  //         style: GoogleFonts.publicSans(
                                                  //           fontWeight: FontWeight.w700,
                                                  //           fontSize: 11,
                                                  //           fontStyle: FontStyle.normal,
                                                  //           color: Color.fromRGBO(
                                                  //               69, 70, 70, 0.7),
                                                  //         ),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 19.27),
                                              child: VerticalDivider(
                                                width: 16,
                                                color: Color.fromRGBO(69, 70, 70, 0.2),
                                              ),
                                            ),
                                            // Expanded(
                                            //   flex: 3,
                                            //   child: Padding(
                                            //     padding: const EdgeInsets.symmetric(
                                            //         horizontal: 10, vertical: 20),
                                            //     child: Column(
                                            //       mainAxisAlignment:
                                            //       MainAxisAlignment.spaceEvenly,
                                            //       crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //       children: [
                                            //         Text(
                                            //           "Applicant Name  - " + ( controller.verifyUser[index]['vOwnerName']),
                                            //           style: GoogleFonts.publicSans(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w600,
                                            //             fontStyle: FontStyle.normal,
                                            //           ),
                                            //         ),
                                            //         Text(
                                            //           "Ward No.  -  "+                   ( controller.verifyUser[index]['vwardNo']),
                                            //           style: GoogleFonts.publicSans(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w600,
                                            //             fontStyle: FontStyle.normal,
                                            //           ),
                                            //         ),
                                            //         Text(
                                            //           "Property Type  -" +       (controller.verifyUser[index]['vPropertyType']),
                                            //           style: GoogleFonts.publicSans(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w600,
                                            //             fontStyle: FontStyle.normal,
                                            //           ),
                                            //         ),
                                            //         Text(
                                            //           "Assessment Type  -"+    (controller.verifyUser[index]['vAssessmentType']),
                                            //           style: GoogleFonts.publicSans(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w600,
                                            //             fontStyle: FontStyle.normal,
                                            //           ),
                                            //         ),
                                            //         Text(
                                            //           "Mobile No.  -   " +            (controller.verifyUser[index]['vMobileNo']),
                                            //           style: GoogleFonts.publicSans(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w600,
                                            //             fontStyle: FontStyle.normal,
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical:4),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    _buildDetailsRow('SAF No -',  capitalizeFirstLetter(controller.verifyUser[index]['vSafno'] == null ? '' : controller.verifyUser[index]['vSafno'].toString())),
                                                    _buildDetailsRow('Name -', capitalizeFirstLetter(controller.verifyUser[index]['vOwnerName'])),
                                                    _buildDetailsRow('Ward No. -', capitalizeFirstLetter(controller.verifyUser[index]['vwardNo'])),
                                                    _buildDetailsRow('Assessment Type -', capitalizeFirstLetter(controller.verifyUser[index]['vAssessmentType'])),
                                                    _buildDetailsRow('Mobile No -', capitalizeFirstLetter(controller.verifyUser[index]['vMobileNo'])),
                                                    _buildDetailsRow('Property Type -', capitalizeFirstLetter(controller.verifyUser[index]['vPropertyType'])),
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
                  );
                }
                ),
              ],
            ),
          ),
        )
    );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:0,horizontal:0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:3),
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                fontStyle:
                FontStyle.normal),
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