import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import '../../../widgets/location_widget.dart';
import '../controllers/property_missing_geotagging_controller.dart';

class PropertyMissingGeotaggingFormView extends GetView<PropertyMissingGeotaggingController> {
  const PropertyMissingGeotaggingFormView({Key? key}) : super(key: key);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/pin.png",
                height: 35,
                width: 35,
              ),
              Text(" Geotagging",style:GoogleFonts.publicSans(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),),
            ],
          ),
        ),),
      body:  SingleChildScrollView(
        child: Form(
          key: controller.MissingGeoFormkey,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 3),
            child: Column(
              children: [
                //DETAIL SECTION__!!!!!!!
                Container(
                  // margin: EdgeInsets.all(14.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      _buildDetailsRow('Application No -',capitalizeFirstLetter(controller.applicationNo.toString())),
                      _buildDetailsRow('Application Type -',capitalizeFirstLetter(controller.applicationType.toString())),
                      _buildDetailsRow('Property Type -',capitalizeFirstLetter(controller.propertyType.toString())),
                      _buildDetailsRow('Apply Date -',capitalizeFirstLetter(controller.applyDate.toString())),
                      _buildDetailsRow('Owner Name -',capitalizeFirstLetter(controller.ownerName.toString())),
                    ],
                  ),
                ),
                //DETAIL SECTION______________________________________________!!!!!!!
                SizedBox(
                  height: 30,
                ),
                //HEADING
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        // Expanded(
                        //   child: Divider(
                        //     color: Colors.blue,
                        //     thickness: 1,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/add-image.png",
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                ' Front Image',
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(142, 145, 147, 0.1),
                        offset: Offset(0,1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        //FRONT IMAGE
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Color.fromRGBO(63, 148, 213, 1),
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(20.0),
                        //       topRight: Radius.circular(20.0),
                        //     ),
                        //   ),
                        //   child:Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 30),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "Front Image ",
                        //               style: GoogleFonts.publicSans(
                        //                 fontStyle: FontStyle.normal,
                        //                 fontWeight: FontWeight.w700,
                        //                 fontSize: 18,
                        //                 color: Color(0xFFFFFFFF),
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: const EdgeInsets.only(top:3),
                        //               height: 40,
                        //               width: 50,
                        //               decoration: BoxDecoration(
                        //                   image: DecorationImage(
                        //                     image: AssetImage(
                        //                         "assets/images/check_1.png"),
                        //                   )),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Longitude',
                            controller: controller.longitude0Controller,
                            isLatitude: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Latitude',
                            controller: controller.latitude0Controller,
                            isLatitude: true,
                          ),
                        ),
                        Obx(() => controller.selectedImage1Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Select image from camera/gallery',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              )),
                        )
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.file(
                                      File(controller.selectedImage1Path.value))),
                            ),
                            Obx(() => Center(
                                child: Text(
                                  controller.selectedImage1Size.value,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )))
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                                color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Camera",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  controller.getImage1(ImageSource.camera);
                                }),
                            MaterialButton(
                                color: Colors.deepOrange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Device",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  controller.getImage1(ImageSource.gallery);
                                })
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //HEADING
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/add-image.png",
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                ' Left Image',
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
                SizedBox(
                  height:10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(142, 145, 147, 0.1),
                        offset: Offset(0,1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Color.fromRGBO(63, 148, 213, 1),
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(20.0),
                        //       topRight: Radius.circular(20.0),
                        //     ),
                        //   ),
                        //   child:Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 30),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "Left Image ",
                        //               style: GoogleFonts.publicSans(
                        //                 fontStyle: FontStyle.normal,
                        //                 fontWeight: FontWeight.w700,
                        //                 fontSize: 18,
                        //                 color: Color(0xFFFFFFFF),
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: const EdgeInsets.only(top:3),
                        //               height: 40,
                        //               width: 50,
                        //               decoration: BoxDecoration(
                        //                   image: DecorationImage(
                        //                     image: AssetImage(
                        //                         "assets/images/check_1.png"),
                        //                   )),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Longitude',
                            controller: controller.longitude1Controller,
                            isLatitude: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Latitude',
                            controller: controller.latitude1Controller,
                            isLatitude: true,
                          ),
                        ),
                        Obx(() => controller.selectedImage2Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Select image from camera/gallery',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              )),
                        )
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.file(
                                      File(controller.selectedImage2Path.value))),
                            ),
                            Obx(() => Center(
                                child: Text(
                                  controller.selectedImage2Size.value,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )))
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                                color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Camera",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  controller.getImage2(ImageSource.camera);
                                }),
                            MaterialButton(
                                color: Colors.deepOrange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Device",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  controller.getImage2(ImageSource.gallery);
                                })
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //HEADING
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/add-image.png",
                                height: 45,
                                width: 45,
                              ),
                              Text(
                                ' Right Image',
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
                SizedBox(
                  height:10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(142, 145, 147, 0.1),
                        offset: Offset(0,1),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        //FRONT IMAGE
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Color.fromRGBO(63, 148, 213, 1),
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(20.0),
                        //       topRight: Radius.circular(20.0),
                        //     ),
                        //   ),
                        //   child:Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 30),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               "Right Image ",
                        //               style: GoogleFonts.publicSans(
                        //                 fontStyle: FontStyle.normal,
                        //                 fontWeight: FontWeight.w700,
                        //                 fontSize: 18,
                        //                 color: Color(0xFFFFFFFF),
                        //               ),
                        //             ),
                        //             Container(
                        //               margin: const EdgeInsets.only(top:3),
                        //               height: 40,
                        //               width: 50,
                        //               decoration: BoxDecoration(
                        //                   image: DecorationImage(
                        //                     image: AssetImage(
                        //                         "assets/images/check_1.png"),
                        //                   )),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Longitude',
                            controller: controller.longitude2Controller,
                            isLatitude: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: LocationInputField(
                            title: 'Latitude',
                            controller: controller.latitude2Controller,
                            isLatitude: true,
                          ),
                        ),
                        Obx(() => controller.selectedImage3Path == ''
                            ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                              child: Text(
                                'Select image from camera/gallery',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              )),
                        )
                            : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Image.file(
                                      File(controller.selectedImage3Path.value))),
                            ),
                            Obx(() => Center(
                                child: Text(
                                  controller.selectedImage3Size.value,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )))
                          ],
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.green,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Camera",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                controller.getImage3(ImageSource.camera);
                              },
                            ),
                            MaterialButton(
                              color: Colors.deepOrange,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo_library,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Device",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                controller.getImage3(ImageSource.gallery);
                              },
                            )

                          ],
                        ),

                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                // BUTTONS________________________________________________________!!!!!!!
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: Text("Are you sure to cancel ?"),
                            actions: [
                              TextButton(
                                child: Text("No"),
                                onPressed: () => Get.back(),
                              ),
                              TextButton(
                                child: Text("yes"),
                                onPressed: () {},
                                // Perform the action here
                                // Get.off(PendingListView());
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      child: Text('Save & Next'),
                      onPressed: () => controller.MissinggeotaggingForm (),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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





//       SingleChildScrollView(
//         child: Form(
//           child: Padding(
//             padding:
//             const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 10),
//             child: Column(
//               children: [
//                 //DETAIL SECTION______________________________________________!!!!!!!
//                 SizedBox(height: 10),
//                 Container(
//                   color: Colors.blue[50],
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               'Application No -  ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             Text(controller.applicationNo.toString())
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               'Application Type - ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             Text(controller.applicationType.toString())
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               'Property Type - ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             Text(controller.PropertyType.toString())
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               'Applied Date - ',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             Text(controller.ApplyDate.toString())
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   color: Colors.blue[50],
//                   child: Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: Column(
//                       children: [
//                         ColoredBox(
//                           color: Colors.blue,
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   'Upload Image',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20,),
//                         //FRONT IMAGE
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Front Image - ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Obx(() => controller.selectedImage1Path == ''
//                         //     ? Padding(
//                         //   padding: const EdgeInsets.only(top: 20.0),
//                         //   child: Center(
//                         //       child: Text(
//                         //         'Select image from camera/gallery',
//                         //         style: TextStyle(fontSize: 10, color: Colors.black),
//                         //       )),
//                         // )
//                         //     : Column(
//                         //   children: [
//                         //     Padding(
//                         //       padding: const EdgeInsets.all(8.0),
//                         //       child: Center(
//                         //           child: Image.file(
//                         //               File(controller.selectedImage1Path.value))),
//                         //     ),
//                         //     Obx(() => Center(
//                         //         child: Text(
//                         //           controller.selectedImage1Size.value,
//                         //           style: TextStyle(
//                         //               fontSize: 12, color: Colors.black),
//                         //         )))
//                         //   ],
//                         // )),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             MaterialButton(
//                                 color: Colors.green,
//                                 child: Text(
//                                   "Camera",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   // controller.getImage1(ImageSource.camera);
//                                 }),
//                             MaterialButton(
//                                 color: Colors.deepOrange,
//                                 child: Text(
//                                   "Device",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   // controller.getImage1(ImageSource.gallery);
//                                 })
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Latitude : ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 ' ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Longitude : ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 ' ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Divider(color: Colors.blue,),
//                         SizedBox(height: 10,),
//
//                         //LEFT IMAGE
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Left Image - ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             MaterialButton(
//                                 color: Colors.green,
//                                 child: Text(
//                                   "Camera",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   // controller.getImage1(ImageSource.camera);
//                                 }),
//                             MaterialButton(
//                                 color: Colors.deepOrange,
//                                 child: Text(
//                                   "Device",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   // controller.getImage1(ImageSource.gallery);
//                                 })
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Latitude : ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 ' ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Longitude : ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 ' ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Divider(color: Colors.blue,),
//                         SizedBox(height: 10,),
//
//                         //RIGHT IMAGE
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Right Image - ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             MaterialButton(
//                                 color: Colors.green,
//                                 child: Text(
//                                   "Camera",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   // controller.getImage1(ImageSource.camera);
//                                 }),
//                             MaterialButton(
//                                 color: Colors.deepOrange,
//                                 child: Text(
//                                   "Device",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 onPressed: () {
//                                   // controller.getImage1(ImageSource.gallery);
//                                 })
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Latitude : ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 ' ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Longitude : ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 ' ',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         SizedBox(height: 20,)
//                       ],
//                     ),
//                   ),
//                 ),
//                 //BUTTONS________________________________________________________!!!!!!!
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Get.dialog(
//                           AlertDialog(
//                             title: Text("Are you sure to cancel ?"),
//                             actions: [
//                               TextButton(
//                                 child: Text("No"),
//                                 onPressed: () => Get.back(),
//                               ),
//                               TextButton(
//                                 child: Text("yes"),
//                                 onPressed: () {},
//                                 // Perform the action here
//                                 // Get.off(PendingListView());
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: Text("Cancel"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Text('Save & Next'),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

