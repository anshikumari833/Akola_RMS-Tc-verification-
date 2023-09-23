
import 'package:amc_rms/app/modules/trade_NewApplication/views/trade_NA_LicenseDetail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/trade_new_application_controller.dart';

class TradeNAOwnerdetailView extends GetView<TradeNewApplicationController> {
  const TradeNAOwnerdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Text(
            "New Application",
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
        child: Form(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/basic_details.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      ' Owners Details',
                      style: GoogleFonts.roboto(
                          fontSize: 21,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo
                        // color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child:
                  Column(
                    children: [
                      SizedBox(height:2,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              //OWNER NAME
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text("Apply With",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //GUARDIAN NAME
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Notice No',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //MOBILE NO
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Firm Type',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              //EMAIL
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Other Firm Type',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:2,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Save & next'),
                    onPressed: () {
                       Get.to(TradeNALicenseDetailView());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
