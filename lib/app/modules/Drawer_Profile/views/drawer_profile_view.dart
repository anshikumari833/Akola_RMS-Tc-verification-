import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/drawer_profile_controller.dart';

class DrawerProfileView extends GetView<DrawerProfileController> {
  const DrawerProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //IMAGE-NAME-BUTTON(EDIT PROFILE)
            SizedBox(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 340,
            //       height: 200,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(20),
            //           topRight: Radius.circular(25),
            //           bottomLeft: Radius.circular(20),
            //           bottomRight: Radius.circular(20),
            //         ),
            //         color: Colors.white,
            //       ),
            //       child:Column(
            //         children: [SizedBox(height: 20),
            //           // Container  (
            //           //   width: 90,
            //           //   height: 90,
            //           //   decoration: BoxDecoration(
            //           //     shape: BoxShape.circle,
            //           //     image: DecorationImage(
            //           //       image: AssetImage('assets/images/profile_img.png'),
            //           //       fit: BoxFit.cover,
            //           //     ),
            //           //   ),
            //           // ),
            //           Container(
            //             decoration: BoxDecoration(
            //               // shape: BoxShape.circle,
            //               // color: Colors.white
            //               // border: Border.all(color: Colors.indigoAccent, width: 1.0),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(0),
            //               child:  Image.asset(
            //                 'assets/images/profile_img.png',
            //                 height:100,
            //                 width:100,
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 15),
            //           Text(
            //             'Anshi Kumari',
            //             style: TextStyle(
            //               color: Color(0xFF0E100F),
            //               fontSize: 16,
            //               fontFamily: 'Plus Jakarta Sans',
            //               fontWeight: FontWeight.w600,
            //               height: 1.25,
            //               letterSpacing: -0.28,
            //             ),
            //           ),
            //           SizedBox(height:8),
            //           Text(
            //             'Welcome To Your Profile',
            //             style: TextStyle(
            //               color: Color(0xFF7E8491),
            //               fontSize: 12,
            //               fontFamily: 'Plus Jakarta Sans',
            //               fontWeight: FontWeight.w500,
            //               height: 1.25,
            //             ),
            //           ),
            //
            //
            //
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20,),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return  Card(
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            _buildDetailsRow('Description', controller.name.value.toString()),
                            SizedBox(height: 10,),
                            _buildDetailsRow('User Name',controller.user_name.value.toString()),
                            SizedBox(height:10,),
                            _buildDetailsRow('Mobile No', controller.mobile.value.toString()),
                            SizedBox(height: 10,),
                            _buildDetailsRow('Email',controller.email.value.toString()),
                            SizedBox(height: 10,),
                            _buildDetailsRow('Ulb', controller.ulb_name.value.toString()),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     controller.submit_UserDetailData();
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     backgroundColor: Color(0xFF7E49FF),
                  //     padding: EdgeInsets.symmetric(horizontal: 20),
                  //   ),
                  //   child: Text('Edit Profile',style: TextStyle(
                  //     fontSize: 14,
                  //     fontFamily: 'Plus Jakarta Sans',
                  //     fontWeight: FontWeight.w600,
                  //   )),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      _showChangePasswordDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xFF7E49FF),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text('Change Password',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              label,
              style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontStyle:
                  FontStyle.normal),
            ),
          ),
        ),
        Flexible(
          child: Text(
            // value.isNotEmpty ? value : 'N/A',
            nullToNA(value),
          ),
        ),
      ],
    ),
  );
}

void _showChangePasswordDialog(BuildContext context) {
  DrawerProfileController controller = Get.find<DrawerProfileController>();

  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Change Password'),
        content: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller.oldPasswordController,
                  decoration: InputDecoration(labelText: 'Current Password'),
                ),
                TextField(
                  controller: controller.newPasswordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                ),
                SizedBox(height: 16.0),

                // Show the loader when isLoading is true
                controller.isLoading.value
                    ? Center(
                  child: SpinKitThreeBounce(
                    color: Colors.indigo,
                    size: 40.0,
                  ),
                )
                    : Container(),

                SizedBox(height: 16.0),
              ],
            );
          },
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              // Set isLoading to true to show the loader
              controller.isLoading.value = true;

              // Call the submit_UserPassword function
              await controller.submit_UserPassword();

              // Set isLoading to false to hide the loader
              controller.isLoading.value = false;

              // Close the dialog
              Navigator.of(context).pop();
            },
            child: Text('Change'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog without making any changes
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}


