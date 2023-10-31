import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/Common_ThemeColor.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/Common_Containers.dart';
import '../../../widgets/drawer_home.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Initialize the HomeController
    final HomeController controller = Get.put(HomeController());
    final ThemeData theme = AppTheme.lightTheme();
    return Scaffold(
      drawer: NavigationHomeBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: theme.primaryColorDark,
          elevation: 0,
          title:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Text('Akola Municipal Corporation',style:GoogleFonts.poppins(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Text('Tax Collector',style:GoogleFonts.poppins(fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),),
              ),
            ],
          ),
          // centerTitle: true,
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.notifications,color: Colors.white,),
          //     onPressed: () {
          //       Get.toNamed(Routes.NOTIFICATION);
          //     },
          //   ),
          //   IconButton(
          //     icon: Icon(Icons.exit_to_app,color: Colors.white,),
          //     onPressed: () {
          //       Get.defaultDialog(
          //         title: "",
          //         middleText: "Are you sure you want to log out?",
          //         middleTextStyle: TextStyle(color: Colors.red),
          //         barrierDismissible: false,
          //         backgroundColor: Colors.white,
          //         radius: 10.0,
          //         confirm: ElevatedButton(
          //             onPressed: () {
          //               // GetStorage().remove('key');
          //               // GetStorage().remove('isTc');
          //               // GetStorage().remove('isUtc');
          //               // GetStorage().remove('userName');
          //               // Clear the entire storage
          //               GetStorage().erase();
          //               Get.offAllNamed(Routes.LOGIN_SCREEN);
          //               // Get.toNamed(Routes.LOGIN_SCREEN);
          //             },
          //             child: Text("Confirm"))
          //         ,
          //         cancel: ElevatedButton(
          //             onPressed: () {
          //               Get.back();
          //             },
          //             child: Text("Cancel")),
          //       );
          //     },
          //   ),
          // ],
        ),
      // bottomNavigationBar: FancyTabBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.0,right: 12,left: 10),
              // decoration: BoxDecoration(
              //     color: Color(0xFFf0f4c3),
              //     borderRadius: BorderRadius.circular(10),
              // ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.person_fill,size: 18,color:Color(0xFFef6c00),),
                    Text("  WELCOME!!!",style:GoogleFonts.poppins(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color:Color(0xFFef6c00),
                    ),),
                    Text( GetStorage().read('userName'),style:GoogleFonts.poppins(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color:Color(0xFFef6c00),
                    ),),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  // #fffde7
                   color: Colors.white,
                // color: Color(0xFFe0f7fa),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal:10,vertical: 10),
                          child: Text("Total Collection",style:GoogleFonts.poppins(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Obx(() => Text(
                            "Date : ${controller.currentDate.value}",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 2),
                        Obx(() => common_CollectionContainer(Color(0xFFb2ebf2), Icons.auto_mode, 'Total Count', controller.report_totalCount.value),),
                        SizedBox(width: 10),
                        Obx(() =>  common_CollectionContainer(Color(0xFFb2dfdb), Icons.currency_rupee, 'Total Amount',controller.report_totalCollection.value),),
                        SizedBox(width: 2),
                        // common_CollectionContainer(Color(0xFF7e0f2f1), 'Total Transaction', ''),
                      ],
                    ),
                    SizedBox(height: 10,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     SizedBox(width: 2),
                    //     common_CollectionContainer(Color(0xFFe6ee9c), Icons.star, 'Total Transaction', ''),
                    //     SizedBox(width: 10),
                    //     common_CollectionContainer(Color(0xFFa5d6a7), Icons.star, 'Total Transaction', ''),
                    //     SizedBox(width: 2),
                    //   ],
                    // ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
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
                        itemDashboard('Saf \n  Verification', Icons.grading_outlined, Color(0xFFe1f5fe), Routes.FIELD_VERIFICATION_PENDING_LIST),
                        itemDashboard('Apply \n Assessment', Icons.text_snippet_outlined, Color(0xFFe1f5fe), Routes.PROPERTY_APPLY_FORM_HOME_SCREEN),
                        if(GetStorage().read('isTc'))
                        itemDashboard('Search \n  Holding', Icons.person_search,  Color(0xFFe1f5fe), Routes.PROPERTY_PAY_PROPERTY_TAX),
                        if(GetStorage().read('isTc'))
                        itemDashboard('Search \n  Assessment', Icons.manage_search,  Color(0xFFe1f5fe), Routes.PROPERTY_SEARCH_ASSESSMENT_DETAIL),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        if(GetStorage().read('isUtc'))
                        itemDashboard('collection \n Report', CupertinoIcons.doc_append,  Color(0xFFe1f5fe), Routes.PROPERTY_REPORT),
                        if(GetStorage().read('isUtc'))
                        itemDashboard('Daily \n Report',Icons.assessment_outlined, Color(0xFFe1f5fe), Routes.PROPERTY_DAILY_TC_REPORT),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        SizedBox(width: 20,),
                        if(GetStorage().read('isTc'))
                        itemDashboard('Daily \n Report',Icons.assessment_outlined, Color(0xFFe1f5fe), Routes.PROPERTY_DAILY_TC_REPORT),
                         SizedBox(width: 30,),
                        if(GetStorage().read('isTc'))
                        itemDashboard('collection \n Report', CupertinoIcons.doc_append,  Color(0xFFe1f5fe), Routes.PROPERTY_REPORT),
                        // itemDashboard('Report', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_REPORT),
                        // SizedBox(width: 30,),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        // if(GetStorage().read('isTc'))
                        // itemDashboard('Apply \n Assessment', CupertinoIcons.doc_append, Colors.red.shade50, Routes.PROPERTY_APPLY_FORM_HOME_SCREEN),
                        // itemDashboard('Search \n  Holding', CupertinoIcons.search_circle, Colors.red.shade50, Routes.PROPERTY_PAY_PROPERTY_TAX),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              //CONTAINER OF WATER
            if(GetStorage().read('isTc'))
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
                        itemDashboard('Search \n Consumer', CupertinoIcons.search, Color(0xFFe1f5fe), Routes.WATER_CONSUMER_SEARCH),
                        // itemDashboard('Search \n  Application', CupertinoIcons.doc_text_search, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.WATER_HOME_SCREEN),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            if(GetStorage().read('isTc'))
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
                          child: Text("Trade",style:GoogleFonts.poppins(
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
                        itemDashboard('Track License', CupertinoIcons.search, Color(0xFFe1f5fe), Routes.TRADE_TRACK_LICENSE),
                        // itemDashboard('Search \n  Application', CupertinoIcons.doc_text_search, Colors.red.shade50, Routes.PROPERTY_HOME_SCREEN),
                        // itemDashboard('See All', CupertinoIcons.arrow_right, Colors.red.shade50, Routes.WATER_HOME_SCREEN),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            if(GetStorage().read('isTc'))
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
                            child: Text("Municipal Rental",style:GoogleFonts.poppins(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        itemDashboard('Add Toll', CupertinoIcons.viewfinder_circle, Color(0xFFe1f5fe), Routes.MUNICIPAL_RENTAL_ADD_TOLL),
                          itemDashboard('Pay Toll \n Rent', CupertinoIcons.search, Color(0xFFe1f5fe), Routes.MUNICIPAL_RENTAL_PAY_TOLL_RENT),
                           itemDashboard('Collection \n Report', CupertinoIcons.doc_text_search, Color(0xFFe1f5fe), Routes.MUNICIPAL_RENTAL_TOLL_DAILY_REPORT),
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
              child: Icon(iconData, color: Color(0xFF01579b))),
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



