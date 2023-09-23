import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/water_home_screen_controller.dart';

class WaterHomeScreenView extends GetView<WaterHomeScreenController> {
  const WaterHomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.water_drop_outlined, color: Colors.white),
            Text('  Water  ',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white),
            ),

          ],
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
                    if(GetStorage().read('isTc'))
                    itemDashboard('Apply Connection', CupertinoIcons.doc_checkmark_fill, Colors.orange,Routes.WATER_APPLY_CONNECTION),
                    if(GetStorage().read('isTc'))
                    itemDashboard('Search Consumer', CupertinoIcons.doc_on_doc, Colors.indigo, Routes.WATER_CONSUMER_SEARCH),
                    if(GetStorage().read('isTc'))
                    itemDashboard('Application Search', CupertinoIcons.drop, Colors.blue, Routes.WATER_APPLICATION_SEARCH),
                    if(GetStorage().read('isJe'))
                    itemDashboard('Site Inspection', CupertinoIcons.doc_checkmark, Colors.green, Routes.WATER_SITE_VERIFICATION),
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
    Get.toNamed(routeName);},
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
        Text(title,style: GoogleFonts.publicSans(
          fontSize:14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          // color: Color(0xFF8E9193),
        ),)
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

