import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/water_site_verification_controller.dart';

class WaterSiteVerificationPreviewDetailView extends GetView<WaterSiteVerificationController> {
  const WaterSiteVerificationPreviewDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Row(
            children: [
              Text(
                'Site Inspection',
                style:  GoogleFonts.publicSans(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),),
            ],
          ),
        ), ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.SubmitFormKey,
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
