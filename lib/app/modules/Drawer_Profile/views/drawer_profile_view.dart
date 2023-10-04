import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child:Column(
                    children: [SizedBox(height: 20),
                      CustomTextField(
                     controller: controller.userNameController,
                        headingText: "Name",
                        hintText: "Enter Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return "";
                        },
                      ),
                      CustomTextField(
                        controller: controller.mobileNoController,
                        headingText: "Mobile No",
                        hintText: "Enter Mobile No",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return "";
                        },
                      ),
                      CustomTextField(
                    controller: controller.emailController,
                        headingText: "Email",
                        hintText: "Enter Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return "";
                        },
                      ),
                      CustomTextField(
                 controller: controller.dobController,
                        headingText: "Date Of Birth",
                        hintText: "Enter Date Of Birth",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return "";
                        },
                      ),
                      CustomTextField(
                       controller: controller.genderController,
                        headingText: "Gender",
                        hintText: "Enter Gender",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return "";
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.submit_UserDetailData();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xFF7E49FF),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text('Edit Profile',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                    )),
                  ),
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



// Function to show the change password dialog
void _showChangePasswordDialog(BuildContext context) {
  DrawerProfileController controller = Get.find<DrawerProfileController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Change Password'),
        content: Column(
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
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              controller.submit_UserPassword();
            },
            child: Text('Change'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}