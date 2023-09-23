import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class NavigationHomeBar extends StatelessWidget {
  const NavigationHomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildDrawerHeader(),
          SizedBox(height: 5),
          buildDrawerItem(
            icon: Icons.dashboard_customize_outlined,
            text: "Report",
            onTap: () => navigate(0),
            tileColor:
            Get.currentRoute == Routes.HOME ? Colors.blue[100] : null,
            textIconColor: Get.currentRoute == Routes.HOME
                ? Colors.black
                : Colors.black,
          ),
          buildDrawerItem(
            icon: Icons.menu_open_outlined,
            text: "Collection",
            onTap: () => navigate(1),
            tileColor: Get.currentRoute == Routes
                ? Colors.blue
                : null,
            textIconColor: Get.currentRoute == Routes
                ? Colors.white
                : Colors.black,
          ),
          buildDrawerItem(
              icon: Icons.payment_outlined,
              text: "Payment History",
              onTap: () => navigate(2),
              tileColor: Get.currentRoute == Routes
                  ? Colors.blue
                  : null,
              textIconColor: Get.currentRoute == Routes
                  ? Colors.white
                  : Colors.black),
          buildDrawerItem(
            icon: Icons.privacy_tip_outlined,
            text: "About",
            onTap: () => navigate(3),
            tileColor: Get.currentRoute == Routes ? Colors.blue : null,
            textIconColor:
            Get.currentRoute == Routes ? Colors.white : Colors.black,
          ),
          // buildDrawerItem(
          //   icon: Icons.logout_outlined,
          //   text: "Log Out",
          //   onTap: () => navigate(7),
          //   tileColor:
          //   Get.currentRoute == Routes ? Colors.blue : null,
          //   textIconColor: Get.currentRoute == Routes
          //       ? Colors.white
          //       : Colors.black,
          // ),
        ],
      ),
    );
  }


  //
  // Widget confirmBtn() {
  //   return ElevatedButton(
  //       onPressed: () {
  //         GetStorage().remove('key');
  //         GetStorage().remove('isTc');
  //         GetStorage().remove('isUtc');
  //         GetStorage().remove('userName');
  //         // Get.offAllNamed(Routes.LOGIN_SCREEN);
  //         Get.toNamed(Routes.LOGIN_SCREEN);
  //       },
  //       child: Text("Confirm"));
  // }
  //
  // Widget cancelBtn() {
  //   return ElevatedButton(
  //       onPressed: () {
  //         Get.back();
  //       },
  //       child: Text("Cancel"));
  // }

  Widget buildDrawerHeader() {
    return Container(
      // color: Colors.indigoAccent,
      // width: double.infinity,
      // height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Image.asset(
                "assets/images/akola_logo.png",
            height: 150,
            width: 150,),
          ),
        //   Text(
        // GetStorage().read('userName'),
        //     style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        //   ),
          Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }


  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      // Get.toNamed(Routes.VIEW_CATEGORIES);
    } else if (index == 2) {
      // Get.toNamed(Routes.PAYMENT_HISTORY);
    } else if (index == 3) {
      Get.toNamed(Routes.HOME_ABOUT);
    } else if (index == 4) {
      // Get.toNamed(Routes.HELP);
    }else if (index == 5) {
      // Get.toNamed(Routes.SEND_FEEDBACK);
    }else if (index == 6) {
      // Get.toNamed(Routes.);
    }
    // if (index == 7) {
    //   Get.defaultDialog(
    //     title: "e-Gov",
    //     middleText: "Press Confirm to Logout...",
    //     // content: getContent(),
    //     middleTextStyle: TextStyle(color: Colors.white70),
    //     barrierDismissible: false,
    //     backgroundColor: Colors.black12,
    //     radius: 10.0,
    //     // confirm: confirmBtn(),
    //     // cancel: cancelBtn(),
    //   );
    // }
  }
}