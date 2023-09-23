import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/water_site_verification_controller.dart';

class WaterSiteVerificationJeinspectedView extends GetView<WaterSiteVerificationController> {
  const WaterSiteVerificationJeinspectedView({Key? key}) : super(key: key);
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
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("# Site Inspection Details....",
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),),
                    GestureDetector(onTap: (){
                      controller.CancelInspectionScheduling(controller.byId_id);
                    },
                        child: Icon(Icons.cancel_rounded,color: Colors.red,)),
                  ],),
              ),
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
                    _buildDetailsRow('Inspection Done on', capitalizeFirstLetter(controller.je_InspectedDate.toString())),
                    _buildDetailsRow('Inspection Time',capitalizeFirstLetter(controller.je_InspectionTime.toString())),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text("# Basic Details",
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),),],),
              ),
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
                    _buildDetailsRow('ULB Name', capitalizeFirstLetter(controller.byId_ulbName.toString())),
                    _buildDetailsRow('Ward No',  capitalizeFirstLetter(controller.byId_wardNo.toString())),
                    _buildDetailsRow('Application No',  (controller.byId_applicationNo.toString())),
                    _buildDetailsRow('Ownership Type',  capitalizeFirstLetter(controller.byId_ownershipType.toString())),
                    _buildDetailsRow('Property Type',  capitalizeFirstLetter(controller.byId_propertyType.toString())),
                    _buildDetailsRow('Pipeline Type', capitalizeFirstLetter(controller.byId_pipelineType.toString())),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text("#  Property Address & Details",
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),),],),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
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
                    _buildDetailsRow('Connection Through', capitalizeFirstLetter(controller.byId_connectionThrough.toString())),
                    _buildDetailsRow('Holding No',   capitalizeFirstLetter(controller.byId_holdingNo.toString())),
                    _buildDetailsRow('Connection Type',   capitalizeFirstLetter(controller.byId_connectionType.toString())),
                    _buildDetailsRow('Area (Sqft.)',   capitalizeFirstLetter(controller.byId_area.toString())),
                    _buildDetailsRow('Category',   capitalizeFirstLetter(controller.byId_category.toString())),
                    _buildDetailsRow('Property Address',  capitalizeFirstLetter(controller.byId_propertyAddress.toString())),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text("#  Selected TS Map",
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),),],),
              ),

              Obx(() => Row(
                children: [
                  if (controller.je_tsMap == "0")
                  Container(
                    height: 170,
                    width: 170,
                    margin: EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: controller.tsMap.value == "0" ? Colors.blueAccent : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                          Image.asset(
                            "assets/images/Map_North_new-0c3c7d28.png",
                            height: 150,
                            width: 170,
                          ),
                        Text(
                          "Map Without Road Cutting",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (controller.je_tsMap == "1")
                  Container(
                    height: 170,
                    width: 170,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: controller.tsMap.value == "1" ? Colors.blueAccent : Colors.grey,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                          Image.asset(
                            "assets/images/Map_South_new-9e678356.png",
                            height: 150,
                            width: 170,
                          ),
                        Text(
                          "Map With Road Cutting",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),



              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text("# Verification Report",
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(69, 70, 70, 0.9),
                      ),),],),
              ),
              //Property Type
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Property Type",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ (controller.byId_propertyType != null ? controller.byId_propertyType.toString() : 'N/A'),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      (controller.je_propertyType != null ? controller.je_propertyType.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Total Area in Sq.Ft.
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Area in Sq.Ft.",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ (controller.byId_area != "" ? controller.byId_area.toString() : 'N/A'),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                       (controller.je_Totalarea != null ? controller.je_Totalarea.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Distribution Pipeline Report
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Distribution Pipeline Report",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ (controller.byId_pipelineType != "" ? controller.byId_pipelineType.toString() : 'N/A'),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                     (controller.je_PipelineReport != null ? controller.je_PipelineReport.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Distribution Pipeline Size (In MM)
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Distribution Pipeline Size (In MM)",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ 'N/A',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                     (controller.je_PipelineSize != null ? controller.je_PipelineSize.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Distribution Pipeline Size Type
              SizedBox(height: 20,) ,
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "	Distribution Pipeline Size Type",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ 'N/A',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                  (controller.je_PipelineSizeType != null ? controller.je_PipelineSizeType.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Is Application Comes Under Regularization
              SizedBox(height: 20,),
              Container(
                height: 190,
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
                        height: 120,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Is Application Comes Under \n Regularization",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ (controller.byId_connectionType != "" ? controller.byId_connectionType.toString() : 'N/A'),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                      (controller.je_UnderRegularization != null ? controller.je_UnderRegularization.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Permissible Pipe Diameter
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Permissible Pipe Diameter",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ 'N/A',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                  (controller.je_PipeDiameter != null ? controller.je_PipeDiameter.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Permissible Pipe Quality
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Permissible Pipe Quality",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ 'N/A',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                 (controller.je_PipeQuality != null ? controller.je_PipeQuality.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Permissible Ferrule Size
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Permissible Ferrule Size",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ 'N/A',
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                 (controller.je_FerruleSize != null ? controller.je_FerruleSize.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Road Type
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Road Type",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ (controller.byId_roadType != "" ? controller.byId_roadType.toString() : 'N/A'),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                   (controller.je_RoadType != null ? controller.je_RoadType.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Applicant Category
              SizedBox(height: 20,),
              Container(
                height: 180,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Applicant Category",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 140,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Applicant Data : "+ (controller.byId_category != "" ? controller.byId_category.toString() : 'N/A'),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Inspection Report  : ",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                      (controller.je_category != null ? controller.je_category.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Longitude
              SizedBox(height: 20,),
              Container(
                height: 160,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Longitude",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 118,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [

                                    Text(
                                      " Inspection Report : "+ (controller.je_Longitude != null ? controller.je_Longitude.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              //Latitude
              SizedBox(height: 20,),
              Container(
                height: 160,
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
                        height: 100,
                        width: 357,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:0),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Latitude",
                                    style: GoogleFonts.publicSans(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 35,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/water_SiteVerifyImg.png"),
                                        )),
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
                        height: 118,
                        width: 357,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      " Inspection Report : "+ (controller.je_Latitude != null ? controller.je_Latitude.toString() : 'N/A'),
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
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Container(
                  child:  Row(
                    children: [

                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text:
                            "I, .............................. being a Municipal PLI/JE, inspected the site for the provision of water supply system indicate above. "
                                "I certify that this inspection was done within the guidelines established by RMC and was completed in a through and completed manner."
                                " I recommend this for technical approval.",
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Text("Date of Inspection : "+ (controller.je_InspectedDate != null ? controller.je_InspectedDate.toString() : 'N/A')),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      Text("Signature : ")
                    ],
                  ),
                ),
              ),
              SizedBox(height:30,),
            ],
          ),
        ),
      ),
    );
  }
}



Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontStyle: FontStyle.normal,
                color: Color.fromRGBO(63, 148, 213, 1)),
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