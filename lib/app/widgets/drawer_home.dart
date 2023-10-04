import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/app_pages.dart';

class NavigationHomeBar extends StatelessWidget {
  const NavigationHomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildDrawerHeader(),
          Divider(),
          buildDrawerItem(
            icon: Icons.person_outline_outlined,
            text: "Profile",
            onTap: () => navigate(0),
          ),
          buildDrawerItem(
            icon: Icons.question_answer,
            text: "FAQs",
            onTap: () => navigate(1),
          ),
          buildDrawerItem(
            icon: Icons.info,
            text: "About Us",
            onTap: () => navigate(2),
          ),
          buildDrawerItem(
            icon: Icons.policy,
            text: "Terms Of Use",
            onTap: () => navigate(3),
          ),
          // Expanded(child: SizedBox()),
          buildDrawerItem(
            icon: Icons.logout,
            text: "Log Out",
            onTap: () => navigate(4),
          ),
        ],
      ),
    );
  }
  Widget buildDrawerHeader() {
    return Container(
      color:Color(0xFFe0f7fa),
      width: double.infinity,
      //height: 200,
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
              child: Image.asset(
                  "assets/images/akola_logo.png",
              height: 120,
              width: 120,),
            ),
          ),
          SizedBox(height: 8,),
          Text(
        GetStorage().read('userName'),
            style: TextStyle(color:Color(0xFF303f9f), fontSize: 16, fontWeight: FontWeight.bold),
          ),
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
  //
  // Widget buildDrawerHeader() {
  //   return UserAccountsDrawerHeader(
  //     currentAccountPicture: CircleAvatar(
  //       backgroundImage: AssetImage("assets/images/akola_logo.png"),
  //       radius: 50,
  //     ),
  //     accountName: Text(
  //       GetStorage().read('userName') ?? "",
  //       style: TextStyle(fontWeight: FontWeight.bold),
  //     ),
  //     accountEmail: Text(
  //       "Your Email",
  //       style: TextStyle(fontSize: 14),
  //     ),
  //   );
  // }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  navigate(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.DRAWER_PROFILE);
        break;
      case 1:
        Get.toNamed(Routes.DRAWER_FAQ);
        break;
      case 2:
        Get.toNamed(Routes.DRAWER_ABOUT_US);
        break;
      case 3:
        Get.toNamed(Routes.DRAWER_TERMS_OF_USE);
        break;
      case 4:
        // Get.defaultDialog(
        //   title: "Log Out",
        //   middleText: "Are you sure you want to log out?",
        //   middleTextStyle: TextStyle(color: Colors.red),
        //   barrierDismissible: false,
        //   backgroundColor: Colors.white,
        //   radius: 10.0,
        //   confirm: ElevatedButton(
        //     onPressed: () {
        //       GetStorage().erase();
        //       Get.offAllNamed(Routes.LOGIN_SCREEN);
        //     },
        //     child: Text("Confirm"),
        //   ),
        //   cancel: ElevatedButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     child: Text("Cancel"),
        //   ),
        // );
        Get.defaultDialog(
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Color(0xFF303f9f),
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Are you sure you want to log out?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetStorage().erase();
                        Get.offAllNamed(Routes.LOGIN_SCREEN);
                      },
                      child: Text("Confirm"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

        break;
      default:
        break;
    }
  }
}








// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../routes/app_pages.dart';
//
// class NavigationHomeBar extends StatelessWidget {const NavigationHomeBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           buildDrawerHeader(),
//           SizedBox(height: 20),
//           buildDrawerItem(
//             icon: Icons.person_outline_outlined,
//             text: "Profile",
//             onTap: () => navigate(0),
//             tileColor:
//             Get.currentRoute == Routes.HOME ? Colors.blue[100] : null,
//             textIconColor: Get.currentRoute == Routes.HOME
//                 ? Colors.black
//                 : Colors.black,
//           ),
//           buildDrawerItem(
//             icon: Icons.question_mark,
//             text: "FaQs",
//             onTap: () => navigate(1),
//             tileColor:
//             Get.currentRoute == Routes.HOME ? Colors.blue[100] : null,
//             textIconColor: Get.currentRoute == Routes.HOME
//                 ? Colors.black
//                 : Colors.black,
//           ),
//           buildDrawerItem(
//             icon: Icons.edit_note,
//             text: "About Us",
//             onTap: () => navigate(2),
//             tileColor: Get.currentRoute == Routes
//                 ? Colors.blue
//                 : null,
//             textIconColor: Get.currentRoute == Routes
//                 ? Colors.white
//                 : Colors.black,
//           ),
//           buildDrawerItem(
//               icon: Icons.verified_user_outlined,
//               text: "Terms Of Use",
//               onTap: () => navigate(3),
//               tileColor: Get.currentRoute == Routes
//                   ? Colors.blue
//                   : null,
//               textIconColor: Get.currentRoute == Routes
//                   ? Colors.white
//                   : Colors.black),
//           buildDrawerItem(
//             icon: Icons.logout,
//             text: "Log Out",
//             onTap: () => navigate(4),
//             tileColor: Get.currentRoute == Routes ? Colors.blue : null,
//             textIconColor:
//             Get.currentRoute == Routes ? Colors.white : Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget buildDrawerHeader() {
//     return Container(
//       // color: Color(0xFF303f9f),
//       // width: double.infinity,
//       // height: 200,
//       padding: EdgeInsets.only(top: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(0),
//             child: Container(
//               decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
//               child: Image.asset(
//                   "assets/images/akola_logo.png",
//               height: 150,
//               width: 150,),
//             ),
//           ),
//         //   Text(
//         // GetStorage().read('userName'),
//         //     style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//         //   ),
//           Text(
//             "",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget buildDrawerItem({
//     required String text,
//     required IconData icon,
//     required Color textIconColor,
//     required Color? tileColor,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: textIconColor),
//       title: Text(
//         text,
//         style: TextStyle(color: textIconColor),
//       ),
//       tileColor: tileColor,
//       onTap: onTap,
//     );
//   }
//
//   navigate(int index) {
//     if (index == 0) {
//       Get.toNamed(Routes.DRAWER_PROFILE);
//     } else if (index == 1) {
//        Get.toNamed(Routes.DRAWER_FAQ);
//     } else if (index == 2) {
//        Get.toNamed(Routes.DRAWER_ABOUT_US);
//     } else if (index == 3) {
//     Get.toNamed(Routes.DRAWER_TERMS_OF_USE);
//     } else if (index == 4) {
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
//     }
//   }
// }