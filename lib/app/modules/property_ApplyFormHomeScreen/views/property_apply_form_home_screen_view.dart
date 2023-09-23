import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/property_apply_form_home_screen_controller.dart';

class PropertyApplyFormHomeScreenView extends GetView<PropertyApplyFormHomeScreenController> {
  const PropertyApplyFormHomeScreenView({Key? key}) : super(key: key);
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
      centerTitle: true,
      elevation: 0,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing:35.0,
                mainAxisSpacing:35.0,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20.0),
                children: [
                  itemDashboard('  Apply New \nAssessment', 1, 'assets/images/application.png', Routes.PROPERTY_NEW_ASSESSMENT),
                  itemDashboard('          Apply \nRe-Assessment',2, 'assets/images/checklist.png', Routes.PROPERTY_PAY_PROPERTY_TAX),
                  itemDashboard('Apply Mutation',3, 'assets/images/gb_propertydetail.png', Routes.PROPERTY_PAY_PROPERTY_TAX),
                  itemDashboard('Apply Bifurcation',4, 'assets/images/archive.png', Routes.PROPERTY_PAY_PROPERTY_TAX),
                  // itemDashboard('Apply Concession',5, 'assets/images/verification.png',  Routes.PROPERTY_CONSESSION),
                  itemDashboard('Apply Harvesting',6, 'assets/images/check-list.png', Routes.PROPERTY_APPLY_HARVESTING),
                  // itemDashboard('Apply Objection',7, 'assets/images/verification.png', Routes.PROPERTY_PAY_PROPERTY_TAX),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


itemDashboard(String title,int id, String imagePath, String routeName ) => GestureDetector(
  onTap: () {
    Get.toNamed(routeName);
    if (id == 1) {
      // showPopupMessage();
      GetStorage().write('assessmentType', 'new');
      showMessageFromSide();
    }
    if (id == 2) {
      // showPopupMessage();
      GetStorage().write('assessmentType', 're');
    }
    if (id == 3) {
      // showPopupMessage();
      GetStorage().write('assessmentType', 'mu');
    }
    if (id == 4) {
      // showPopupMessage();
      GetStorage().write('assessmentType', 'bi');
    }
  },
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,1),
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius:1,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            // color: Colors.white,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(title,
            style: GoogleFonts.publicSans(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Colors.indigoAccent,
            ),),
        ),

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