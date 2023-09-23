import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/property_home_screen_controller.dart';

class PropertyHomeScreenView extends GetView<PropertyHomeScreenController> {
  const PropertyHomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.red,
      title:    Text('  Property  ',
        style: TextStyle(
            fontSize: 22,
            color: Colors.white),
      ),
      // automaticallyImplyLeading:false,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 15),
      //     child: IconButton(
      //         onPressed: () {
      //           Get.toNamed(Routes.HOME);
      //         },
      //         icon: Icon(Icons.arrow_forward_ios)),
      //   )
      // ],
        centerTitle: true,
      elevation: 0,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        SizedBox(height: 30,),
            Container(
              // color: Colors.indigoAccent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(260))),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    itemDashboard('SAF Verification', CupertinoIcons.doc_checkmark_fill, Colors.orange, Routes.FIELD_VERIFICATION_PENDING_LIST),
                    if(GetStorage().read('isTc'))
                    itemDashboard(' Apply Assessment', CupertinoIcons.doc_on_doc, Colors.indigo, Routes.PROPERTY_APPLY_FORM_HOME_SCREEN),
                    itemDashboard('RWH Harvesting \n    Verification', CupertinoIcons.drop, Colors.blue, Routes.PROPERTY_WATER_HARVESTING_FIELD_VERIFY),
                    if(GetStorage().read('isTc'))
                    itemDashboard('   Missing \nGeotagging', CupertinoIcons.location_solid, Colors.purple, Routes.PROPERTY_MISSING_GEOTAGGING),
                    if(GetStorage().read('isTc'))
                    itemDashboard('Search Holding', CupertinoIcons.search_circle, Colors.yellow, Routes.PROPERTY_PAY_PROPERTY_TAX),
                    itemDashboard('Search Assessment', CupertinoIcons.doc_text_search, Colors.green, Routes.PROPERTY_SEARCH_ASSESSMENT_DETAIL),
                    if(GetStorage().read('isTc'))
                    itemDashboard('Collection Reports', CupertinoIcons.doc_richtext, Colors.red, Routes.PROPERTY_REPORT),
                    // if(GetStorage().read('isTc'))
                    // itemDashboard('Cluster', CupertinoIcons.arrow_up_arrow_down_circle, Colors.cyan, Routes.PROPERTY_CLUSTER),
                    if(GetStorage().read('isTc'))
                    itemDashboard('Apply GBSAF', CupertinoIcons.doc_on_doc, Colors.lightGreen, Routes.PROPERTY_GB_SAF_APPLY),
                    itemDashboard('GBSAF Verification', CupertinoIcons.doc_checkmark_fill, Colors.brown, Routes.PROPERTY_GB_SAF_VERIFICATION),
                    // itemDashboard('Search Legacy', CupertinoIcons.search_circle, Colors.amberAccent, Routes.TRADE_HOME_SCREEN),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}



itemDashboard(String title, IconData iconData, Color background, String routeName) => GestureDetector(
  onTap: () {
    Get.toNamed(routeName);
    if (title == 'Search Holding') {
     // showPopupMessage();
      GetStorage().write('assessmentType', '');
    }
  },
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 2)
        ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white)),
        const SizedBox(height: 12),
        Center(
          child: Text(title,style: GoogleFonts.publicSans(
            fontSize:14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            // color: Color(0xFF8E9193),
          ),),
        )
      ],
    ),
  ),
);



void showMessageFromSide() {
  Get.snackbar(
    '',
    'You are applying',
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds:2),
    backgroundColor: Colors.white70,
    colorText: Colors.green,
    messageText: Row(
      children: [
        Image.asset(
          'assets/images/apply_form.png',
          width: 36,
          height: 36,
        ),
        SizedBox(width: 8),
        Text(
          'You are applying for New Assessment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

void showPopupMessage() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Color(0xFFF0F6F9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/images/apply_form1.png'),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are applying for\nNew Assessment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('OK'),
            ),
          ],
        ),
      ],
    ),
  );
}

