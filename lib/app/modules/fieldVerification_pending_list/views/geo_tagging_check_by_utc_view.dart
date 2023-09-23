import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/tc_FieldVerification_controller.dart';

class GeoTaggingCheckByUtcView extends GetView<TcFieldVerificationController> {
  const GeoTaggingCheckByUtcView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF1F7FC),
          title: Center(
            child: Text("Site Verification",style:GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),),
          ),),
        body: Obx(() {
          if (controller.isDataProcessing.value == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(controller.getData == true){
            return  SingleChildScrollView(
              child: Form(
                key: controller.VerificationFormkey,
                child:  Column(
                  children: [
                    //DETAIL SECTION__!!!!!!!
                    Container(
                      margin: EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      child: Column(
                        children: [
                          _buildDetailsRow('Application No -',  (controller.safno.toString())),
                          _buildDetailsRow('Application Type -',  capitalizeFirstLetter(controller.assessment.toString())),
                          _buildDetailsRow('Apply Date -',  capitalizeFirstLetter(controller.applicationdate.toString())),
                          _buildDetailsRow('Owner Name -',  capitalizeFirstLetter(controller.ownername.toString())),
                          _buildDetailsRow('Mobile Name -',  capitalizeFirstLetter(controller.mobileno.toString())),
                        ],
                      ),
                    ),
                    if (GetStorage().read('isUtc') && controller.appliedBy == "TC")
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0,1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(width: 14),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, right: 4, bottom: 1),
                                            child: Icon(Icons.perm_device_info,
                                                color: Colors.red, size: 20),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          " Saf Applied  By Agency Tc  ",
                                          style: GoogleFonts.publicSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
// =============================================================================================================================
                    //GEOTAGGING -FRONT
                    if (GetStorage().read('isUtc'))
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.blue,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/check_2.png",
                                      height: 45,
                                      width: 45,
                                    ),
                                    Text(
                                      ' Geotagging Image ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.blue,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    if (GetStorage().read('isUtc'))
                      Container(
                        height: 370,
                        width: 357,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(142, 145, 147, 0.1),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                height: 340,
                                width: 357,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(63, 148, 213, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Front Image ",
                                            style: GoogleFonts.publicSans(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 3),
                                            height: 40,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/check_1.png"),)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //  ================================
                            //  second white card
                            //  ================================
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 330,
                                width: 357,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //=============================
                                      //self assessed -1
                                      //=============================
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Longitute  :  " + (controller.tcFrontLong.toString()),
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //AGENCY TC
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Latitude  :  " +
                                                ( controller.tcFrontLat.toString()),
                                                style: GoogleFonts
                                                    .publicSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      //============================
                                      //IMAGE
                                      //============================
                                      GestureDetector(
                                        onTap: ()   {
                                          showDialog(
                                            context: context,
                                            builder: (_) => Dialog(
                                              child: Image.network(
                                                // Strings.base_url + '/' + controller.tcFrontRelativeImage.toString() + '/' +
                                                controller.tcFrontImage.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                              child: Image.network (
                                                // Strings.base_url + '/' + controller.tcFrontRelativeImage.toString() + '/' +
                                                controller.tcFrontImage.toString(),
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                                                height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    // =============================================================================================================================
                    //GEOTAGGING -RIGHT
                    if (GetStorage().read('isUtc'))
                      SizedBox(height:40),
                    if (GetStorage().read('isUtc'))
                      Container(
                        height: 370,
                        width: 357,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(142, 145, 147, 0.1),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                height: 340,
                                width: 357,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(63, 148, 213, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Right Image  ",
                                            style: GoogleFonts.publicSans(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 3),
                                            height: 40,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/check_1.png"),)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //  ================================
                            //  second white card
                            //  ================================
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 330,
                                width: 357,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //=============================
                                      //self assessed -1
                                      //=============================
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Longitute  :  " + (controller.tcRightLong.toString()),
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //AGENCY TC
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Latitude  :  " +
                                                ( controller.tcRightLat.toString()),
                                                style: GoogleFonts
                                                    .publicSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      //============================
                                      //IMAGE
                                      //============================
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => Dialog(
                                              child: Image.network(
                                                // Strings.base_url + '/' + controller.tcRightRelativeImage.toString() + '/' +
                                                controller.tcRightImage.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                              child: Image.network(
                                                // Strings.base_url + '/'  + controller.tcRightRelativeImage.toString() + '/' +
                                                controller.tcRightImage.toString(),
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                                                height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    // =============================================================================================================================
                    //GEOTAGGING -LEFT
                    if (GetStorage().read('isUtc'))
                      SizedBox(height: 40),
                    if (GetStorage().read('isUtc'))
                      Container(
                        height: 370,
                        width: 357,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(142, 145, 147, 0.1),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                height: 340,
                                width: 357,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(63, 148, 213, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Left Image  ",
                                            style: GoogleFonts.publicSans(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(top: 3),
                                            height: 40,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/check_1.png"),)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //  ================================
                            //  second white card
                            //  ================================
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 330,
                                width: 357,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //=============================
                                      //self assessed -1
                                      //=============================
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Longitute  :  " + (controller.tcLeftLong.toString()),
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //AGENCY TC
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Latitude  :  " +
                                                ( controller.tcLeftLat.toString()),
                                                style: GoogleFonts
                                                    .publicSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      //============================
                                      //IMAGE
                                      //============================
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => Dialog(
                                              child: Image.network(
                                                // Strings.base_url + '/' + controller.tcLeftRelativeImage.toString() + '/' +
                                                controller.tcLeftImage.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                              child: Image.network(
                                                // Strings.base_url + '/'  + controller.tcLeftRelativeImage.toString() + '/' +
                                                controller.tcLeftImage.toString(),
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                                                height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),

                    // =============================================================================================================================
                    //BUTTONS________________________________________________________!!!!!!!
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          ElevatedButton(
                            onPressed: () {
                              if (controller.VerificationFormkey.currentState!.validate()) {
                                if (GetStorage().read('isUtc')) {
                                  controller.BackwardSafVerifyForm();
                                }
                              } else {
                                // Show snackbar if there are validation errors
                                Get.snackbar(
                                  'Validation Error',
                                  'Please fill the fields properly.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            },

                            child: Text('Backward'),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.VerificationFormkey.currentState!.validate()) {

                                controller.ForwardSafVerifyForm();

                            } else {
                              // Show snackbar if there are validation errors
                              Get.snackbar(
                                'Validation Error',
                                'Please fill the fields properly.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          child: Text('Forward'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            );
          }
          else {
            return
              AlertDialog(
                title: Text('Error'),
                content: Text('Something went wrong. Please try again.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
          }
        }),
      ),);
  }
}



Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
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
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(63, 148, 213, 1)),
            ),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
        ),
      ],
    ),
  );
}


String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;

  final List<String> words = text.split(' ');

  for (int i = 0; i < words.length; i++) {
    final String word = words[i];
    if (word.isNotEmpty) {
      final String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      words[i] = capitalizedWord;
    }
  }

  return words.join(' ');
}