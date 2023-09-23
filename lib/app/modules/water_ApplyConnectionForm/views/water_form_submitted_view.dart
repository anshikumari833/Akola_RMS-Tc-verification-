import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/views/home_view.dart';
import '../controllers/water_apply_connection_controller.dart';

class WaterFormSubmittedView extends GetView<WaterApplyConnectionController> {
  const WaterFormSubmittedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async => false,
    child: Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Text(
            "Water Connection",
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the image horizontally
              children: [
                Image.asset('assets/images/water-success.png', width: 150, height: 150),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Application Successfully Submitted ',
              style: GoogleFonts.roboto(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Colors.indigoAccent
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Application No - ',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),
                Text(
                  controller.applicationNo.toString(),
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.indigoAccent
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
            Text(
              'Click home button to return to home page or\nclick payment button to make payment ',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Get.to(HomeView());
                    },
                    child: Text(" Home ",style: GoogleFonts.publicSans(
                        fontWeight: FontWeight.w500,
                        color: Colors.indigoAccent,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async {
                      await controller.PaymentDemandDetail();

                    },
                    child: Text(" Make Payment ",style: GoogleFonts.publicSans(
                    fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),),
                  ),
                ],
              ),
            ),
          ],
        ),
      )

    ),   );
  }
}



// Padding(
// padding: EdgeInsets.all(15.0),
// child: Container(
// height: 300,
// width: 350,
// decoration: BoxDecoration(
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.2),
// spreadRadius: 2,
// blurRadius: 5,
// offset: Offset(0, 1),
// ),
// ],
// border: Border.all(
// color: Colors.indigo,
// width: 2.0,
// ),
// ),
// child:
// Column(
// children: [
// SizedBox(height:20,),
// Text('Your Application Has Been Submitted Successfully',
// style: GoogleFonts.publicSans(
// fontWeight: FontWeight.w700,
// fontSize: 17,
// fontStyle: FontStyle.normal,
// color: Colors.black,
// ),),
// SizedBox(height:20,),
// Row(
// children: [
// Text('Application No',
// style: GoogleFonts.publicSans(
// fontWeight: FontWeight.w700,
// fontSize: 17,
// fontStyle: FontStyle.normal,
// color: Colors.black,
// ),),
// Text(controller.applicationNo.toString(),
// style: GoogleFonts.publicSans(
// fontWeight: FontWeight.w700,
// fontSize: 17,
// fontStyle: FontStyle.normal,
// color: Colors.black,
// ),),
// ],
// ),
// ],
// ),
// ),
// ),