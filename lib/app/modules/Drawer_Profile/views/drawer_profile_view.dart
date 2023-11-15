import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../controllers/drawer_profile_controller.dart';

/**
 * | Created By: ANSHI KUMARI
 */
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
              controller.isLoading.value = true;
              await controller.submit_UserPassword();
              controller.isLoading.value = false;
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


