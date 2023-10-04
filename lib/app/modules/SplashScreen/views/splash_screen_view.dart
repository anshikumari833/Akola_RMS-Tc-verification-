import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/Common_ThemeColor.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.lightTheme();
    return Scaffold(
      body: Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/akola_logo.png",
                width: 90.0,
                height: 90.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20,),
            Text("अकोला महानगरपालिका",style:GoogleFonts.roboto(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: theme.primaryColorDark
            ),), Text("Government of Maharashtra",style:GoogleFonts.roboto(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: theme.primaryColorDark
            ),),
            SizedBox(height: 10,),
            SpinKitThreeBounce(
              color: theme.primaryColorDark,
              size: 25.0,
            ),
          ],
        ),
      )
    );
  }
}
