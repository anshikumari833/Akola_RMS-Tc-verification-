import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/Common_ThemeColor.dart';
import '../controllers/login_screen_controller.dart';

/**
 * | Created By: ANSHI KUMARI
 * | Description:
 *   - the login screen of the application,Displays a loading spinner when the `isLoading` state is true.
 *   - The UI consists of an image, a login container with username and password fields, a forgot password option, and a login button.The login button triggers the login functionality in the controller.
 */

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.lightTheme();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Container(
            child: Center(
              child: SpinKitThreeBounce(
                color: theme.primaryColorDark,
                size: 40.0,
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  //---------------------------------------IMAGE---------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/loginPage_img.png",
                        height: 200,
                        width: 200,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //---------------------------------------LOGIN CONTAINER---------------------------------------
                  Container(
                    margin: EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login ",
                          style: GoogleFonts.inter(
                              fontSize: 30,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: theme.primaryColorDark),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Login To Continue",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: theme.primaryColorDark),
                        ),
                        // SizedBox(height: size.height * 0.03),

                        //********EMAIL TEXTFIELD
                        SizedBox(
                          height: 35,
                        ),
                        Obx(
                          () => Container(
                            margin: EdgeInsets.symmetric(horizontal: 33),
                            child: TextFormField(
                              controller: controller.emailController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                labelText: "Username",
                                errorText: controller.invalidEmailError.value
                                    ? 'Invalid Email'
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //***********PASSWORD TEXTFIELD
                        SizedBox(height: size.height * 0.03),
                        Obx(
                          () => Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 33),
                            child: TextFormField(
                              controller: controller.passwordController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                labelText: "Password",
                                errorText:
                                    controller.incorrectPasswordError.value
                                        ? 'Invalid Password'
                                        : null,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.orange,
                                  ),
                                  onPressed: () {
                                    controller.isPasswordVisible.toggle();
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20,
                                  color: Colors.brown,
                                ),
                              ),
                              obscureText: !controller.isPasswordVisible.value,
                            ),
                          ),
                        ),

                        //*************FORGOT PASSWORD
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),

                        //******************LOGIN BUTTON
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColorDark,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 110, vertical: 14),
                            ),
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),

                  //*******************FOOTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "© 2023 : Akola",
                        style: TextStyle(
                            fontSize: 12, color: theme.primaryColorDark),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
