import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset(
                  "assets/images/akola_logo.png"),
            ),
            Text("Government of Maharashtra",style:GoogleFonts.roboto(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),),
            SizedBox(height: 10,),
            SpinKitThreeBounce(
              color: Colors.red,
              size: 20.0,
            ),
          ],
        ),
      )
    );
  }
}
