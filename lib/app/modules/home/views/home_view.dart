import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../common/Common_ThemeColor.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/Common_Containers.dart';
import '../../../widgets/drawer_home.dart';
import '../controllers/home_controller.dart';

/**
 * | Created By: ANSHI KUMARI
 * | Description:
 *   - "HomeView" main screen of the application, displaying a Container with all all module.
 *   - The view includes sections for and routes for total collection, property , water , trade , and daily license.
 */

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
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Akola Municipal Corporation',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Tax Collector',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: FancyTabBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 12.0, right: 12, left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_fill,
                        size: 18,
                        color: Color(0xFFef6c00),
                      ),
                      Text(
                        "  WELCOME!!!",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFef6c00),
                        ),
                      ),
                      Text(
                        GetStorage().read('userName'),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFef6c00),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //CONTAINER OF COLLECTION
              /**
             * | Description: This container reflect total count and total amount of property collected by the tc on after every payment.
             */
              Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    // #fffde7
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "Total Collection",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Obx(() => Text(
                                  "Date : ${controller.currentDate.value}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              child: Lottie.asset(
                                  'assets/lottie/Money_dashboard.json'),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 2),
                                      Obx(
                                        () => common_CollectionContainer(
                                            Color(0xFFb2ebf2),
                                            Icons.auto_mode,
                                            'Total Count',
                                            controller.report_totalCount.value),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 2),
                                      Obx(
                                        () => common_CollectionContainer(
                                            Color(0xFFb2dfdb),
                                            Icons.currency_rupee,
                                            'Total Amount',
                                            controller
                                                .report_totalCollection.value),
                                      ),
                                    ],
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
              ),
              //------------------CONTAINER OF PROPERTY------------------
              Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 1),
                  ],
                  // border: Border.all(
                  //   color: Colors.blue,
                  //   width: 1.0,
                  // ),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  // ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Text(
                              "Property",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          itemDashboard(
                              'Saf \n  Verification',
                              Icons.grading_outlined,
                              Color(0xFFe1f5fe),
                              Routes.FIELD_VERIFICATION_PENDING_LIST),
                          itemDashboard(
                              'Apply \n Assessment',
                              Icons.text_snippet_outlined,
                              Color(0xFFe1f5fe),
                              Routes.PROPERTY_APPLY_FORM_HOME_SCREEN),
                          if (GetStorage().read('isTc'))
                            itemDashboard(
                                'Search \n  Holding',
                                Icons.person_search,
                                Color(0xFFe1f5fe),
                                Routes.PROPERTY_PAY_PROPERTY_TAX),
                          if (GetStorage().read('isTc'))
                            itemDashboard(
                                'Search \n  Assessment',
                                Icons.manage_search,
                                Color(0xFFe1f5fe),
                                Routes.PROPERTY_SEARCH_ASSESSMENT_DETAIL),
                          if (GetStorage().read('isUtc'))
                            itemDashboard(
                                'collection \n Report',
                                CupertinoIcons.doc_append,
                                Color(0xFFe1f5fe),
                                Routes.PROPERTY_REPORT),
                          if (GetStorage().read('isUtc'))
                            itemDashboard(
                                'Daily \n Report',
                                Icons.assessment_outlined,
                                Color(0xFFe1f5fe),
                                Routes.PROPERTY_DAILY_TC_REPORT),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          if (GetStorage().read('isTc'))
                            itemDashboard(
                                'Daily \n Report',
                                Icons.assessment_outlined,
                                Color(0xFFe1f5fe),
                                Routes.PROPERTY_DAILY_TC_REPORT),
                          SizedBox(
                            width: 30,
                          ),
                          if (GetStorage().read('isTc'))
                            itemDashboard(
                                'collection \n Report',
                                CupertinoIcons.doc_append,
                                Color(0xFFe1f5fe),
                                Routes.PROPERTY_REPORT),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //------------------CONTAINER OF WATER------------------
              if (GetStorage().read('isTc'))
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
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 70.0, top: 10),
                                    child: Text(
                                      "Water",
                                      style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 13),
                                  Flexible(
                                    flex: 1,
                                    child: itemDashboard(
                                        'Search\nConsumer',
                                        CupertinoIcons.search,
                                        Color(0xFFe1f5fe),
                                        Routes.WATER_CONSUMER_SEARCH),
                                  ),
                                  SizedBox(width: 11),
                                  Flexible(
                                    flex: 1,
                                    child: itemDashboard(
                                        'Collection\nReport',
                                        Icons.assessment_outlined,
                                        Color(0xFFe1f5fe),
                                        Routes.WATER_DAILY_COLLECTION_REPORT),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Lottie.asset(
                              'assets/lottie/HomeScreen_WaterContainer.json',
                              width: 170),
                        ),
                      ),
                    ],
                  ),
                ),
              //------------------CONTAINER OF TRADE------------------
              if (GetStorage().read('isTc'))
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
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "Trade",
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            itemDashboard(
                                'Track License',
                                CupertinoIcons.search,
                                Color(0xFFe1f5fe),
                                Routes.TRADE_TRACK_LICENSE),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Lottie.asset(
                            'assets/lottie/HomeScreen_TradeContainer.json',
                            width: 200),
                      ),
                    ],
                  ),
                ),
              //------------------CONTAINER OF DAILY LICENCE------------------
              if (GetStorage().read('isTc'))
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "Daily Licence",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            itemDashboard(
                                'Add Toll',
                                CupertinoIcons.viewfinder_circle,
                                Color(0xFFe1f5fe),
                                Routes.MUNICIPAL_RENTAL_ADD_TOLL),
                            itemDashboard(
                                'Pay Toll \n Rent',
                                CupertinoIcons.search,
                                Color(0xFFe1f5fe),
                                Routes.MUNICIPAL_RENTAL_PAY_TOLL_RENT),
                            itemDashboard(
                                'Collection \n Report',
                                CupertinoIcons.doc_text_search,
                                Color(0xFFe1f5fe),
                                Routes.MUNICIPAL_RENTAL_TOLL_DAILY_REPORT),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: Lottie.asset(
                    'assets/lottie/HomeScreen_LastAnimation.json',
                    width: 180),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }

  itemDashboard(String title, IconData iconData, Color background,
          String routeName) =>
      GestureDetector(
        onTap: () {
          Get.toNamed(routeName);
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Color(0xFF01579b))),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      );
}
