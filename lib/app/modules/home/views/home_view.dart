import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/HomeScreen_carsoul.dart';
import '../../../widgets/drawer_home.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationHomeBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
          elevation: 0,
          title:
          Text(
            'AMC',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications,color: Colors.white,),
              onPressed: () {
                Get.toNamed(Routes.NOTIFICATION);
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app,color: Colors.white,),
              onPressed: () {
                Get.defaultDialog(
                  title: "",
                  middleText: "Are you sure you want to log out?",
                  middleTextStyle: TextStyle(color: Colors.red),
                  barrierDismissible: false,
                  backgroundColor: Colors.white,
                  radius: 10.0,
                  confirm: ElevatedButton(
                      onPressed: () {
                        // GetStorage().remove('key');
                        // GetStorage().remove('isTc');
                        // GetStorage().remove('isUtc');
                        // GetStorage().remove('userName');
                        // Clear the entire storage
                        GetStorage().erase();
                        Get.offAllNamed(Routes.LOGIN_SCREEN);
                        // Get.toNamed(Routes.LOGIN_SCREEN);
                      },
                      child: Text("Confirm"))
                  ,
                  cancel: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel")),
                );
              },
            ),
          ],
        ),
      // bottomNavigationBar: FancyTabBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //CARSOUL IMAGE
            // HomeCarsoul(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Divider(thickness: 1),
            // ),
            //CATEGORIES
            // Row(
            //   children: [
            //     Padding(
            //       padding:
            //       EdgeInsets.symmetric(horizontal:26),
            //       child: Text("Categories",style:GoogleFonts.poppins(
            //         fontSize: 16,
            //         fontStyle: FontStyle.normal,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.black,
            //       ),),
            //     ),
            //   ],
            // ),

            //CONTAINER OF PROPERTY
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1)
                      ]),
                  width: 340,
                  height: 185,

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal:20,vertical: 5),
                            child: Text("Collection",style:GoogleFonts.poppins(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child:  Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(220, 220, 224, 0.4),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.more_horiz ,
                                          color: Colors.blueGrey,
                                        ),
                                        Text(
                                          '00',
                                          style: GoogleFonts.poppins(
                                            fontSize:40,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Color(0xFFFB10C0C),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Poperty',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xFFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {},
                              child:  Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(220, 220, 224, 0.4),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.blueGrey,
                                        ),
                                        Text(
                                          '00',
                                          style: GoogleFonts.poppins(
                                            fontSize:40,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Color(0xFFF190CB1),
                                            // shadows:Color.fromRGBO(0, 0, 0, 0.25),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Water',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xFFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {},
                              child:  Column(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(220, 220, 224, 0.4),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.more_horiz ,
                                          color: Colors.blueGrey,
                                        ),
                                        Text(
                                          '00',
                                          style: GoogleFonts.poppins(
                                            fontSize:40,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Color(0xFFFB10C0C),

                                            // shadows:Color.fromRGBO(0, 0, 0, 0.25),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Trade',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xFFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal:15,vertical: 15),
                          child: Text("Property",style:GoogleFonts.poppins(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        itemDashboard('Saf \n  Verification', CupertinoIcons.viewfinder_circle, Colors.red.shade50, Routes.FIELD_VERIFICATION_PENDING_LIST),
                        if(GetStorage().read('isTc'))
                        itemDashboard('Apply \n Assessment', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_APPLY_FORM_HOME_SCREEN),
                        itemDashboard('Search \n  Holding', CupertinoIcons.search_circle, Colors.red.shade50, Routes.PROPERTY_PAY_PROPERTY_TAX),
                        itemDashboard('Search \n  Assessment', CupertinoIcons.search_circle, Colors.red.shade50, Routes.PROPERTY_SEARCH_ASSESSMENT_DETAIL),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 20,),
                        itemDashboard('Daily \n Report', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_DAILY_TC_REPORT),
                         SizedBox(width: 30,),
                        itemDashboard('collection \n Report', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_REPORT),
                        // itemDashboard('Report', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_REPORT),
                        // SizedBox(width: 30,),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        // if(GetStorage().read('isTc'))
                        //   itemDashboard('Apply \n Assessment', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_APPLY_FORM_HOME_SCREEN),
                        // itemDashboard('Search \n  Holding', CupertinoIcons.search_circle, Colors.red.shade50, Routes.PROPERTY_PAY_PROPERTY_TAX),

                      ],
                    ),
                  ],
                ),
              ),
            ),
              //CONTAINER OF WATER
            Container(
              margin: EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal:10,vertical: 10),
                          child: Text("Water",style:GoogleFonts.poppins(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 20,),
                        // itemDashboard('Apply \n  Connection', CupertinoIcons.viewfinder_circle, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        itemDashboard('Search \n Consumer', CupertinoIcons.search, Colors.red.shade50, Routes.WATER_CONSUMER_SEARCH),
                        // itemDashboard('Search \n  Application', CupertinoIcons.doc_text_search, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.WATER_HOME_SCREEN),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            // //CONTAINER OF TRADE
            // Container(
            //   margin: EdgeInsets.all(14.0),
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       boxShadow: [
            //         BoxShadow(
            //             offset: Offset(1, 1),
            //             color: Colors.grey.shade300,
            //             spreadRadius: 1,
            //             blurRadius: 1)
            //       ]),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Padding(
            //               padding:
            //               EdgeInsets.symmetric(horizontal:10,vertical: 10),
            //               child: Text("Trade",style:GoogleFonts.poppins(
            //                 fontSize: 14,
            //                 fontStyle: FontStyle.normal,
            //                 fontWeight: FontWeight.w600,
            //                 color: Colors.black,
            //               ),),
            //             ),
            //           ],
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             itemDashboard('Apply \n Application', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
            //             itemDashboard('Apply \n Renewal', CupertinoIcons.doc_plaintext, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
            //             itemDashboard('Track \n License', CupertinoIcons.doc_text_search, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
            //             itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.TRADE_HOME_SCREEN),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
       ],
        ),
      )
    );
  }

  itemDashboard(String title, IconData iconData, Color background, String routeName) => GestureDetector(
    onTap: () {
      Get.toNamed(routeName);
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding:  EdgeInsets.all(14),
              decoration: BoxDecoration(
                 color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.red)),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style:GoogleFonts.inter(
          fontSize: 12,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),),
          const SizedBox(height: 5),
        ],
      ),
    ),
  );
}



