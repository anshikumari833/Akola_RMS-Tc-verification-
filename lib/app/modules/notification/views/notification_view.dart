import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/notification_controller.dart';
class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title:Text('Notifications',style:GoogleFonts.publicSans(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
