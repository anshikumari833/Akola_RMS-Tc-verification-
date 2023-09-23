import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/tc_FieldVerification_controller.dart';
import 'field_verification_pending_list_view.dart';

class PendVerificationFormView extends GetView<TcFieldVerificationController> {
  const PendVerificationFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child:  Scaffold(
        backgroundColor: Color(0xFFF0F6F9),
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
                    //BASIC DETAILS
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
                                    ' Basic Details',
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

                    SizedBox(height: 15),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
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
                                          "Zone",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
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
                              height: 230,
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
                                            "Self Assessed  :  "+( controller.data_zone.toString()),
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
                                    if (GetStorage().read('isUtc') && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(  controller.tczone.toString()),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      final verificationStatus = controller.zoneCheckStatus.value;
                                      final isWrong = verificationStatus == '1';
                                      final isEnabled = isWrong;
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller.zoneCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.zoneCheckStatus.value = value!;
                                                    if (value == '0') {
                                                      controller.zone.value = controller.data_zone.toString();
                                                      controller.iszoneEnable.value = false;
                                                    } else {
                                                      controller.zone.value = '';
                                                      controller.iszoneEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue:
                                                  controller.zoneCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.zoneCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.zone.value = '';
                                                      controller.iszoneEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 25),
                                            child: controller.iszoneEnable.value
                                                ? DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.circular(70),
                                                  borderSide: BorderSide(
                                                    color: Color(0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(left: 20, right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 30,
                                              itemPadding:
                                              EdgeInsets.only(left: 25, right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              items: controller.zoneList.map((ward) {
                                                return DropdownMenuItem(
                                                  value: ward["id"].toString(),
                                                  child: Text(
                                                      ward["zone_name"].toString()),
                                                );
                                              }).toList(),
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged:
                                              controller.iszoneEnable.value
                                                  ? (value) {
                                                controller.zone.value = value.toString();
                                                controller.selectedZoneId = value.toString();
                                                controller.getWardByZone();
                                              }
                                                  : (value) {
                                                controller.zone.value = value.toString();
                                                controller.selectedZoneId = value.toString();
                                                controller.getWardByZone();
                                              },
                                            )
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.data_zone.toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    // NEW WARD NO
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(63, 148, 213, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " Ward No",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                            "Self Assessed  :  "+(controller.newwardno.toString()),
                                            style: GoogleFonts.publicSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(controller.tcNewWard.toString()),
                                              style: GoogleFonts.publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      final verificationStatus =
                                          controller.NewWardCheckStatus.value;
                                      final isWrong = verificationStatus == '1';
                                      final isEnabled = isWrong;
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue:
                                                  controller.NewWardCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.NewWardCheckStatus.value =
                                                    value!;
                                                    if (value == '0') {
                                                      controller.newWardNo.value = controller.newwardno.toString();
                                                      controller.isNewWardEnable.value =
                                                      false;
                                                    } else {
                                                      controller.newWardNo.value = '';
                                                      controller.isNewWardEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  selected: controller.iszoneEnable.value,
                                                  groupValue: controller.NewWardCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.NewWardCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.newWardNo.value = '';
                                                      controller.isNewWardEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.isNewWardEnable.value
                                                ?   Obx(() => DropdownButtonFormField2<String>(
                                      decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      contentPadding: EdgeInsets.zero,
                                      enabledBorder: UnderlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(70),
                                      borderSide: BorderSide(
                                      color: Color(0xff263238),
                                      width: 0.1,
                                      ),
                                      ),
                                      ),
                                      isExpanded: true,
                                      hint: const Text(
                                      'Select',
                                      style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      ),
                                      ),
                                      icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                      ),
                                      iconSize: 35,
                                      buttonHeight: 50,
                                      buttonPadding:
                                      EdgeInsets.only(left: 20, right: 25),
                                      buttonElevation: 2,
                                      itemHeight: 30,
                                      itemPadding:
                                      EdgeInsets.only(left: 25, right: 25),
                                      dropdownMaxHeight: 250,
                                      dropdownWidth: 310,
                                      dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      ),

                                      items: controller.isDropdownLoading.value
                                      ? [
                                      DropdownMenuItem(
                                      value: null,
                                      child:  Center(child:SpinKitThreeBounce(
                                      color: Colors.blue,
                                      size: 20.0,
                                      ),),
                                      ),
                                      ]
                                          : controller.WardListByZone.map<DropdownMenuItem<String>>((ward) {
                                      return DropdownMenuItem<String>(
                                      value: ward['id'].toString(),
                                      child: Text(ward['ward_name'].toString()),
                                      );
                                      }).toList(),

                                      validator: (value) {
                                      if (value == null) {
                                      return 'Please select.';
                                      }
                                      },
                                      onChanged:
                                      controller.isNewWardEnable.value
                                      ? (value) {
                                      controller.newWardNo.value = value.toString();
                                      }
                                          : (value) {
                                      controller.newWardNo.value = value.toString();
                                      },
                                      ),)
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.newwardno.toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    //PROPERTY TYPE
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(63, 148, 213, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                          Flexible(
                                            child: Text(
                                              "Self Assessed  :  "+capitalizeFirstLetter(controller.propertytype.toString()),
                                              style: GoogleFonts.publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Agency Tc  :  "+capitalizeFirstLetter(controller.tcPropertyType.toString()),
                                                style: GoogleFonts.publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      final verificationStatus =
                                          controller.NewWardCheckStatus.value;
                                      final isWrong = verificationStatus == '1';
                                      final isEnabled = isWrong;
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller
                                                      .propertyTypeCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.propertyTypeCheckStatus.value =
                                                    value!;
                                                    if (value == '0') {
                                                      controller.propertyType.value =
                                                          controller.propertytype.toString();
                                                      controller.ispropertyTypeEnable.value =
                                                      false;
                                                    } else {
                                                      controller.propertyType.value = '';
                                                      controller.ispropertyTypeEnable.value =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue: controller
                                                      .propertyTypeCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.propertyTypeCheckStatus.value =
                                                    value!;
                                                    if (value == '1') {
                                                      controller.propertyType.value = '';
                                                      controller.ispropertyTypeEnable.value =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.ispropertyTypeEnable.value
                                                ? DropdownButtonFormField2(
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.grey[100],
                                                  contentPadding: EdgeInsets.zero,
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(70),
                                                    borderSide: BorderSide(
                                                      color: Color(0xff263238),
                                                      width: 0.1,
                                                    ),
                                                  ),
                                                ),
                                                isExpanded: true,
                                                hint: const Text(
                                                  'Select',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black45,
                                                ),
                                                iconSize: 35,
                                                buttonHeight: 50,
                                                buttonPadding:
                                                EdgeInsets.only(left: 20, right: 25),
                                                buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                EdgeInsets.only(left: 25, right: 25),
                                                dropdownMaxHeight: 250,
                                                dropdownWidth: 310,
                                                dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                items:
                                                controller.propertyList.map((ward) {
                                                  return DropdownMenuItem(
                                                    value: ward["id"].toString(),
                                                    child: Text(
                                                        ward["property_type"].toString()),
                                                  );
                                                }).toList(),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'Please select.';
                                                  }
                                                },
                                                onChanged: controller
                                                    .ispropertyTypeEnable.value
                                                    ? (value) {
                                                  controller.propertyType.value =
                                                      value.toString();
                                                }
                                                    : (value) {
                                                  controller.propertyType.value =
                                                      value.toString();
                                                })
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText:
                                                controller.propertytype.toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    //AREA OF PLOT
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(63, 148, 213, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Area Of Plot(in decimal) ",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                          Flexible(
                                            child: Text(
                                              "Self Assessed  :  "+(controller.areaofplot.toString()),
                                              style: GoogleFonts.publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Agency Tc  :  "+(controller.tcAreaOfPlot.toString()),
                                                style: GoogleFonts.publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      final verificationStatus =
                                          controller.areaofplotCheckStatus.value;
                                      final isWrong = verificationStatus == '1';
                                      final isEnabled = isWrong;
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue:
                                                  controller.areaofplotCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.areaofplotCheckStatus.value =
                                                    value!;
                                                    if (value == '0') {
                                                      // Set the controller's text value to the correct value
                                                      controller.areaOfPlotController.text = controller.areaofplot.toString();
                                                      controller.isareaofplotEnable.value = false;
                                                    } else {
                                                      controller.areaOfPlotController.text = '';
                                                      controller.isareaofplotEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue:
                                                  controller.areaofplotCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.areaofplotCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.areaOfPlotController.text = ''; // Clear the text field
                                                      controller.isareaofplotEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.isareaofplotEnable.value
                                                ? TextFormField(
                                              controller: controller.areaOfPlotController,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 30, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: ('Area of plot'),
                                                hintStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),

                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter';
                                                }
                                                return null;
                                              },
                                            )
                                                : Container(
                                              width: 500,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius: BorderRadius.circular(70),

                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 15,right: 10,left: 25,),
                                                child: Text(
                                                  controller.areaOfPlotController.text.isEmpty
                                                      ? controller.areaofplot : controller.areaOfPlotController.text,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    //ROAD WIDTH
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
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
                                          "Category",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                            "Self Assessed  :  "+(  controller.data_category.toString()),
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
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(  controller.tccategory.toString()),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      final verificationStatus = controller.categoryTypeCheckStatus.value;
                                      final isWrong = verificationStatus == '1';
                                      final isEnabled = isWrong;
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller.categoryTypeCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.categoryTypeCheckStatus.value = value!;
                                                    if (value == '0') {
                                                      controller.categoryType.value = controller.data_category.toString();
                                                      controller.isCategoryEnable.value =
                                                      false;
                                                    } else {
                                                      controller.categoryType.value = '';
                                                      controller.isCategoryEnable.value =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue: controller.categoryTypeCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.categoryTypeCheckStatus.value =
                                                    value!;
                                                    if (value == '1') {
                                                      controller.categoryType.value = '';
                                                      controller.isCategoryEnable.value =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Expanded(
                                          //       child: RadioListTile(
                                          //         title: Text('Correct'),
                                          //         value: '0',
                                          //         groupValue:
                                          //         controller.categoryTypeCheckStatus.value,
                                          //         onChanged: (value) {
                                          //           controller.categoryTypeCheckStatus.value = value!;
                                          //           if (value == '0') {
                                          //             controller.roadWidthController.text = controller.data_category.toString();
                                          //             controller.isroadtypeEnable.value = false;
                                          //           } else {
                                          //             controller.roadWidthController.text = '';
                                          //             controller.isroadtypeEnable.value = true;
                                          //           }
                                          //         },
                                          //       ),
                                          //     ),
                                          //     Expanded(
                                          //       child: RadioListTile(
                                          //         title: Text('Wrong'),
                                          //         value: '1',
                                          //         groupValue:
                                          //         controller.categoryTypeCheckStatus.value,
                                          //         onChanged: (value) {
                                          //           controller.roadtypeCheckStatus.value = value!;
                                          //           if (value == '1') {
                                          //             controller.roadWidthController.text = '';
                                          //             controller.isroadtypeEnable.value = true;
                                          //           }
                                          //         },
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child:controller.isCategoryEnable.value
                                                ? DropdownButtonFormField2(
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.grey[100],
                                                  contentPadding: EdgeInsets.zero,
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(70),
                                                    borderSide: BorderSide(
                                                      color: Color(0xff263238),
                                                      width: 0.1,
                                                    ),
                                                  ),
                                                ),
                                                isExpanded: true,
                                                hint: const Text(
                                                  'Select',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black45,
                                                ),
                                                iconSize: 35,
                                                buttonHeight: 50,
                                                buttonPadding:
                                                EdgeInsets.only(left: 20, right: 25),
                                                buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                EdgeInsets.only(left: 25, right: 25),
                                                dropdownMaxHeight: 250,
                                                dropdownWidth: 310,
                                                dropdownDecoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                items:
                                                controller.categoryList.map((ward) {
                                                  return DropdownMenuItem(
                                                    value: ward["id"].toString(),
                                                    child: Text(
                                                        ward["category"].toString()),
                                                  );
                                                }).toList(),
                                                validator: (value) {
                                                  if (value == null) {
                                                    return 'Please select.';
                                                  }
                                                },
                                                onChanged: controller.isCategoryEnable.value
                                                    ? (value) {
                                                  controller.categoryType.value = value.toString();
                                                }
                                                    : (value) {
                                                  controller.categoryType.value = value.toString();
                                                })
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.data_category.toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    // =============================================================================================================================
                    //EXTRA DETAILS
                    SizedBox(height: 15),
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
                                    ' Extra Details',
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
                    //HOARDING BOARD
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
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
                                          "Hoarding Board(s) ?",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                            "Self Assessed  :  "+( controller.ishoardingboard.toString() == 'true' ? 'Yes' : 'No'),
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
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(controller.tcHoardingBoard.toString() == 'true' ? 'Yes' : 'No'),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller.hoardingboardCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.hoardingboardCheckStatus.value = value!;
                                                    if (value == '0') {
                                                      controller.hoardingBoard.value = controller.ishoardingboard.toString();
                                                      controller.ishoardingboardEnable.value = false;
                                                      controller.tHoardingBoardController.text = controller.hoardingarea.toString();
                                                      controller.sHoardingBoardController.text = controller.hoardinginstallationdate.toString();
                                                    } else {
                                                      controller.hoardingBoard.value = '';
                                                      controller.tHoardingBoardController.text = '';
                                                      controller.sHoardingBoardController.text = '';
                                                      controller.ishoardingboardEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue: controller.hoardingboardCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.hoardingboardCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.hoardingBoard.value = '';
                                                      controller.tHoardingBoardController.text = '';
                                                      controller.sHoardingBoardController.text = '';
                                                      controller.ishoardingboardEnable.value = true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.ishoardingboardEnable.value
                                                ? DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(70),
                                                  borderSide: BorderSide(
                                                    color: Color(0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(left: 20, right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              EdgeInsets.only(left: 25, right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("No"),
                                                  value: "0",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Yes"),
                                                  value: "1",
                                                ),
                                              ],
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: controller.ishoardingboardEnable.value
                                                  ? (value) {controller.hoardingBoard.value = value.toString();}
                                                  : (value) {controller.hoardingBoard.value = value.toString();
                                              },
                                            )
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.ishoardingboard.toString() == 'true' ? 'Yes' : 'No',
                                                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (
                          controller.hoardingboardCheckStatus.value == '0' && controller.ishoardingboard == 'true'),
                      child:  Obx(() {
                        return    Container(
                          height: 200,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child:  Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:35,),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Area (in Sq. Ft.)  :  "+(controller.hoardingarea.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25,vertical: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.hoardingboardCheckStatus.value == '1' || controller.ishoardingboard == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.hoardingarea.toString(),
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+(controller.hoardinginstallationdate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.hoardingboardCheckStatus.value == '1' || controller.ishoardingboard == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.hoardinginstallationdate,
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Visibility(
                      visible: (
                          controller.hoardingBoard.value == "1"
                          // || (controller.hoardingboardCheckStatus.value == '0' && controller.ishoardingboard == 'true')
                      ),
                      child: Obx(() {
                        return   Container(
                          height: 200,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Area (in Sq. Ft.)  :  "+(controller.hoardingarea.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25,vertical: 10),
                                child: TextFormField(
                                  controller: controller.tHoardingBoardController,
                                  keyboardType:
                                  TextInputType.number,
                                  enabled: (controller.hoardingboardCheckStatus.value == '1' || controller.ishoardingboard == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: ('Total area'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+( controller.hoardinginstallationdate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: DateTimeField(
                                  controller: controller.sHoardingBoardController,
                                  enabled: (controller.hoardingboardCheckStatus.value == '1' || controller.ishoardingboard == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: ('dd-mm-yyyy'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onShowPicker:
                                      (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ??
                                            DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    //MOBILE TOWER
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
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
                                          "Mobile Tower ?",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                            "Self Assessed  :  "+( controller.ismobiletower.toString() == 'true' ? 'Yes' : 'No'),
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
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(controller.tcMobileTower.toString() == 'true' ? 'Yes' : 'No'),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller.mobiletowerCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.mobiletowerCheckStatus.value = value!;
                                                    if (value == '0') {
                                                      controller.mobileTower.value = controller.ismobiletower.toString();
                                                      controller.ismobiletowerEnable.value = false;
                                                      controller.tMobileTowerController.text = controller.towerarea.toString();
                                                      controller.sMobileTowerController.text =  controller.towerinstallationdate.toString();
                                                    } else {
                                                      controller.mobileTower.value = '';
                                                      controller.ismobiletowerEnable.value = true;
                                                      controller.tMobileTowerController.text = '';
                                                      controller.sMobileTowerController.text = '';
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue:
                                                  controller.mobiletowerCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.mobiletowerCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.mobileTower.value = '';
                                                      controller.ismobiletowerEnable.value = true;
                                                      controller.tMobileTowerController.text = '';
                                                      controller.sMobileTowerController.text = '';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.ismobiletowerEnable.value
                                                ? DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(70),
                                                  borderSide: BorderSide(
                                                    color: Color(0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(left: 20, right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              EdgeInsets.only(left: 25, right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("No"),
                                                  value: "0",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Yes"),
                                                  value: "1",
                                                ),
                                              ],
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: controller.ismobiletowerEnable.value
                                                  ? (value) {
                                                controller.mobileTower.value = value.toString();}
                                                  : (value) {controller.mobileTower.value = value.toString();
                                              },
                                            )
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.ismobiletower.toString() == 'true' ? 'Yes' : 'No',
                                                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (controller.mobiletowerCheckStatus.value == '0' && controller.ismobiletower == 'true'),
                      child:  Obx(() {
                        return    Container(
                          height: 200,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child:  Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:35,),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Area (in Sq. Ft.)  :  "+(controller.towerarea.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25,vertical: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.mobiletowerCheckStatus.value == '1' || controller.ismobiletower == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.towerarea.toString(),
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+(controller.towerinstallationdate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.mobiletowerCheckStatus.value == '1' || controller.ismobiletower == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.towerinstallationdate.toString(),
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Visibility(
                      visible: (controller.mobileTower.value == "1" ),
                      child: Obx(() {
                        return   Container(
                          height: 200,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 35),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Area (in Sq. Ft.)  :  "+(controller.towerarea.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25,vertical: 10),
                                child: TextFormField(
                                  controller: controller.tMobileTowerController,
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.mobiletowerCheckStatus.value == '1' || controller.ismobiletower == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: ('Total area'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+(controller.towerinstallationdate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: DateTimeField(
                                  controller: controller.sMobileTowerController,
                                  enabled: (controller.mobiletowerCheckStatus.value == '1' || controller.ismobiletower == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: ('dd-mm-yyyy'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onShowPicker:
                                      (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ??
                                            DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    //PETROL PUMP
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
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
                                          "Petrol Pump ?",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                            "Self Assessed  :  "+(controller.ispetrolpump.toString() == 'true' ? 'Yes' : 'No'),
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
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(controller.tcPetrolPump.toString() == 'true' ? 'Yes' : 'No'),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller.petrolpumpCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.petrolpumpCheckStatus.value = value!;
                                                    if (value == '0') {
                                                      controller.petrolPump.value = controller.ispetrolpump.toString();
                                                      controller.ispetrolpumpEnable.value = false;
                                                      controller.tPetrolPumpController.text = controller.undergroundarea.toString();
                                                      controller.sPetrolPumpController.text = controller.petrolpumpcompletiondate.toString();
                                                    } else {
                                                      controller.petrolPump.value = '';
                                                      controller.ispetrolpumpEnable.value = true;
                                                      controller.tPetrolPumpController.text = '';
                                                      controller.sPetrolPumpController.text = '';
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue:
                                                  controller.petrolpumpCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.petrolpumpCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.petrolPump.value = '';
                                                      controller.ispetrolpumpEnable.value = true;
                                                      controller.tPetrolPumpController.text = '';
                                                      controller.sPetrolPumpController.text = '';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.ispetrolpumpEnable.value
                                                ? DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(70),
                                                  borderSide: BorderSide(
                                                    color: Color(0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(left: 20, right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              EdgeInsets.only(left: 25, right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("No"),
                                                  value: "0",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Yes"),
                                                  value: "1",
                                                ),
                                              ],
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged:
                                              controller.ispetrolpumpEnable.value ? (value) {
                                                controller.petrolPump.value = value.toString();}
                                                  : (value) {controller.petrolPump.value = value.toString();
                                              },
                                            )
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.ispetrolpump.toString() == 'true' ? 'Yes' : 'No',
                                                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),],
                                      );
                                    }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (controller.petrolpumpCheckStatus.value == '0' && controller.ispetrolpump == 'true'),
                      child:  Obx(() {
                        return    Container(
                          height: 200,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child:  Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal:35,),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Area (in Sq. Ft.) :  "+(controller.undergroundarea.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25,vertical: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.petrolpumpCheckStatus.value == '1' || controller.ispetrolpump == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.undergroundarea.toString(),
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+(controller.petrolpumpcompletiondate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.petrolpumpCheckStatus.value == '1' || controller.ispetrolpump == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.petrolpumpcompletiondate,
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Visibility(
                      visible: (controller.petrolPump.value == "1"),
                      child: Obx(() {
                        return   Container(
                          height: 200,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Area (in Sq. Ft.) :  "+(controller.undergroundarea.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25,vertical: 10),
                                child: TextFormField(
                                  controller: controller.tPetrolPumpController,
                                  keyboardType:
                                  TextInputType.number,
                                  enabled: (controller.petrolpumpCheckStatus.value == '1' || controller.ispetrolpump == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: ('Total Area'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+(controller.petrolpumpcompletiondate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: DateTimeField(
                                  controller: controller.sPetrolPumpController,
                                  enabled: (controller.petrolpumpCheckStatus.value == '1' || controller.ispetrolpump == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: ('dd-mm-yyyy'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onShowPicker:
                                      (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ??
                                            DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    //RAINWATER HARVESTING
                    SizedBox(height: 20),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 140,
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
                                          "Rainwater Harvesting  ?",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
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
                                            "Self Assessed  :  "+(controller.iswaterharvesting.toString() == 'true' ? 'Yes' : 'No'),
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
                                    if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  "+(controller.tcRainwaterHarv.toString() == 'true' ? 'Yes' : 'No'),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller.waterharvestingCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.waterharvestingCheckStatus.value = value!;
                                                    if (value == '0') {
                                                      controller.rainwaterHarvesting.value = controller.iswaterharvesting.toString();
                                                      controller.iswaterharvestingEnable.value = false;
                                                      controller.sRainWaterHarvesting.text = controller.waterharvestinginstallationdate.toString();
                                                    } else {
                                                      controller.rainwaterHarvesting.value = '';
                                                      controller.iswaterharvestingEnable.value = true; controller.petrolPump.value = '';
                                                      controller.sRainWaterHarvesting.text = '';
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue: controller.waterharvestingCheckStatus.value,
                                                  onChanged: (value) {
                                                    controller.waterharvestingCheckStatus.value = value!;
                                                    if (value == '1') {
                                                      controller.rainwaterHarvesting.value = '';
                                                      controller.iswaterharvestingEnable.value = true;
                                                      controller.sRainWaterHarvesting.text = '';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller.iswaterharvestingEnable.value
                                                ? DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(70),
                                                  borderSide: BorderSide(
                                                    color: Color(0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(left: 20, right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              EdgeInsets.only(left: 25, right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("No"),
                                                  value: "0",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Yes"),
                                                  value: "1",
                                                ),
                                              ],
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: controller.iswaterharvestingEnable.value
                                                  ? (value) {
                                                controller.rainwaterHarvesting.value = value.toString();}
                                                  : (value) {
                                                controller.rainwaterHarvesting.value = value.toString();
                                              },
                                            )
                                                : TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(70),
                                                    borderSide: BorderSide.none),
                                                hintText: controller.iswaterharvesting.toString() == 'true' ? 'Yes' : 'No',
                                                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                                              ),
                                              enabled: false,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: (
                          controller.waterharvestingCheckStatus.value == '0' && controller.iswaterharvesting == 'true'),
                      child:  Obx(() {
                        return    Container(
                          height: 140,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child:  Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+(controller.waterharvestinginstallationdate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  enabled: (controller.waterharvestingCheckStatus.value == '1' || controller.waterharvestinginstallationdate == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    hintText: controller.waterharvestinginstallationdate,
                                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Visibility(
                      visible: (
                          controller.rainwaterHarvesting.value == "1"
                          // || (controller.hoardingboardCheckStatus.value == '0' && controller.ishoardingboard == 'true')
                      ),
                      child: Obx(() {
                        return   Container(
                          height: 140,
                          width: 357,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35,vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Installation Date  :  "+( controller.waterharvestinginstallationdate.toString()),
                                        style: GoogleFonts.publicSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25),
                                child: DateTimeField(
                                  controller: controller.sRainWaterHarvesting,
                                  enabled: (controller.waterharvestingCheckStatus.value == '1' || controller.iswaterharvesting == 'false'),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: EdgeInsets.only(
                                        left: 35, right: 10),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(70),
                                        borderSide: BorderSide.none),
                                    suffixIcon: Icon(Icons.calendar_month_outlined),
                                    hintText: ('dd-mm-yyyy'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                  format: DateFormat("yyyy-MM-dd"),
                                  onShowPicker:
                                      (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ??
                                            DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    // =============================================================================================================================
                    //FLOOR DETAILS
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
                                    ' Floor Details',
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
                    // CITIZEN FLOOR DETAIL
                    // if(controller.propertyType.value == '4' || controller.propertyType.value == 4 )
                    Obx(() {
               if (controller.propertyType.value == '4' || controller
                   .propertyType.value == 4 || controller.propertytype == "VACANT LAND" || controller.tcPropertyType == "VACANT LAND") {
               return Padding(
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
               offset: Offset(0, 1),
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
               top: 3,
               right: 4,
               bottom: 1),
               child: Icon(Icons.info_outlined,
               color: Colors.red,
               size: 20),
               ),
               ),
               TextSpan(
               text:
               "There is no floor as it is vacant land ",
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
               );
               } else {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.floorsList.value.length,
            itemBuilder: (BuildContext context, int index) {
              String floorId = controller.floorsList
                  .value[index]['id'];
              controller.totalFloors.value =
                  controller.floorsList.value.length;
              return Container(
                child: Column(
                  children: [
                    // Floor Number Container
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Floor ${index + 1}.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                    ),
                    // FLOOR TYPE
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Floor",
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
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),)),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(0),),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Self Assessed  :  " +
                                                capitalizeFirstLetter(
                                                    controller.floorsList
                                                        .value[index]['floor_name']
                                                        .toString()),
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
                                    if (GetStorage().read('isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  " +
                                                  capitalizeFirstLetter(
                                                      controller.tcVerifyFloor
                                                          .value[index]['floor_name']
                                                          ?.toString() ??
                                                          'N/A'),
                                              style: GoogleFonts
                                                  .publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              //======Radio Start==========
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  // groupValue:controller.floorCheckStatus[index],
                                                  groupValue: controller
                                                      .floorCheckStatus
                                                      .elementAt(index),
                                                  onChanged: (value) {
                                                    controller
                                                        .floorCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isfloorEnable[index] =
                                                    true;
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  // groupValue: controller.floorCheckStatus[index],
                                                  groupValue: controller
                                                      .floorCheckStatus
                                                      .elementAt(index),
                                                  onChanged: (value) {
                                                    controller
                                                        .floorCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isfloorEnable[index] =
                                                    false;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          //=======Radio End here=======
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 25),
                                            child: controller.floorCheckStatus
                                                .elementAt(index) == '0'
                                                ? TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35,
                                                    right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(70),
                                                    borderSide: BorderSide
                                                        .none),
                                                hintText: controller.floorsList
                                                    .value[index]['floor_name']
                                                    .toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              enabled: false,
                                            )
                                                : DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding:
                                                EdgeInsets.zero,
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(70),
                                                  borderSide: BorderSide(
                                                    color: Color(0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(
                                                  left: 20,
                                                  right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding: EdgeInsets.only(
                                                  left: 25,
                                                  right: 25),
                                              dropdownMaxHeight: 300,
                                              dropdownWidth: 310,
                                              dropdownDecoration:
                                              BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(5),
                                              ),
                                              items: controller.floorList
                                                  ?.isNotEmpty ?? false
                                                  ? controller.floorList!
                                                  .map((items) {
                                                return DropdownMenuItem(
                                                  value: items["id"].toString(),
                                                  child: Text(
                                                      items["floor_name"]
                                                          .toString()),
                                                );
                                              }).toList()
                                                  : [],
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: (value) {
                                                controller.floorNo[index] =
                                                    value.toString();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //USAGE TYPE
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Usage Type ",
                                          style: GoogleFonts
                                              .publicSans(
                                            fontStyle: FontStyle
                                                .normal,
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 18,
                                            color: Color(
                                                0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .only(top: 3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius
                                    .circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Self Assessed  :  " +
                                                  capitalizeFirstLetter(
                                                      controller
                                                          .floorsList
                                                          .value[index]['usage_type']
                                                          .toString()),
                                              style: GoogleFonts
                                                  .publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  color: Colors
                                                      .black
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read(
                                        'isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Agency Tc  :  " +
                                                    capitalizeFirstLetter(
                                                        controller
                                                            .tcVerifyFloor
                                                            .value[index]['usage_type']
                                                            .toString() ??
                                                            'N/A'),
                                                style: GoogleFonts
                                                    .publicSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w600,
                                                    fontStyle: FontStyle
                                                        .normal,
                                                    color: Colors
                                                        .black
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              //======Radio Start==========
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Correct'),
                                                  value: '0',
                                                  // groupValue:controller.floorCheckStatus[index],
                                                  groupValue: controller
                                                      .usagetypeCheckStatus
                                                      .elementAt(
                                                      index),
                                                  onChanged: (value) {
                                                    controller
                                                        .usagetypeCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isusagetypeEnable[index] =
                                                    true;
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Wrong'),
                                                  value: '1',
                                                  // groupValue: controller.floorCheckStatus[index],
                                                  groupValue: controller
                                                      .usagetypeCheckStatus
                                                      .elementAt(
                                                      index),
                                                  onChanged: (value) {
                                                    controller
                                                        .usagetypeCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isusagetypeEnable[index] =
                                                    false;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          //=======Radio End here=======
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 25),
                                            // child: controller.floorCheckStatus[index] == '0'
                                            child: controller
                                                .usagetypeCheckStatus
                                                .elementAt(
                                                index) == '0'
                                                ? TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .only(
                                                    left: 35,
                                                    right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        70),
                                                    borderSide: BorderSide
                                                        .none),
                                                hintText: controller
                                                    .floorsList
                                                    .value[index]['usage_type']
                                                    .toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors
                                                        .black),),
                                              enabled: false,
                                            )
                                                : DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding:
                                                EdgeInsets.zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      70),
                                                  borderSide: BorderSide(
                                                    color: Color(
                                                        0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors
                                                      .black,),
                                              ),
                                              icon: const Icon(
                                                Icons
                                                    .arrow_drop_down,
                                                color: Colors
                                                    .black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(
                                                  left: 20,
                                                  right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 70,
                                              itemPadding: EdgeInsets
                                                  .only(
                                                  left: 25,
                                                  right: 25,
                                                  bottom: 10),
                                              dropdownMaxHeight: 300,
                                              dropdownWidth: 310,
                                              dropdownDecoration:
                                              BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    5),),
                                              items: controller
                                                  .usageList
                                                  ?.isNotEmpty ??
                                                  false
                                                  ? controller
                                                  .usageList!
                                                  .map((items) {
                                                return DropdownMenuItem(
                                                  value: items["id"]
                                                      .toString(),
                                                  child: Text(
                                                      items["usage_type"]
                                                          .toString()),
                                                );
                                              }).toList()
                                                  : [],
                                              validator: (value) {
                                                if (value ==
                                                    null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: (value) {
                                                controller
                                                    .useType[index] =
                                                    value
                                                        .toString();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // OCCUPANCY TYPE
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Occupancy Type",
                                          style: GoogleFonts
                                              .publicSans(
                                            fontStyle: FontStyle
                                                .normal,
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 18,
                                            color: Color(
                                                0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .only(top: 3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius
                                    .circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Self Assessed  :  " +
                                                capitalizeFirstLetter(
                                                    controller
                                                        .floorsList
                                                        .value[index]['occupancy_type']
                                                        .toString()),
                                            style: GoogleFonts
                                                .publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight
                                                    .w600,
                                                fontStyle: FontStyle
                                                    .normal,
                                                color: Colors
                                                    .black
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read(
                                        'isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  " +
                                                  capitalizeFirstLetter(
                                                      controller
                                                          .tcVerifyFloor
                                                          .value[index]['occupancy_type']
                                                          .toString() ??
                                                          'N/A'),
                                              style: GoogleFonts
                                                  .publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  color: Colors
                                                      .black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              //======Radio Start==========
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Correct'),
                                                  value: '0',
                                                  // groupValue:controller.floorCheckStatus[index],
                                                  groupValue: controller
                                                      .occupancytypeCheckStatus
                                                      .elementAt(
                                                      index),
                                                  onChanged: (value) {
                                                    controller
                                                        .occupancytypeCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isoccupancytypeEnable[index] =
                                                    true;
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Wrong'),
                                                  value: '1',
                                                  // groupValue: controller.floorCheckStatus[index],
                                                  groupValue: controller
                                                      .occupancytypeCheckStatus
                                                      .elementAt(
                                                      index),
                                                  onChanged: (value) {
                                                    controller
                                                        .occupancytypeCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isoccupancytypeEnable[index] =
                                                    false;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          //=======Radio End here=======
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 25),
                                            // child: controller.floorCheckStatus[index] == '0'
                                            child: controller
                                                .occupancytypeCheckStatus
                                                .elementAt(
                                                index) == '0'
                                                ? TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .only(
                                                    left: 35,
                                                    right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        70),
                                                    borderSide: BorderSide
                                                        .none),
                                                hintText: controller
                                                    .floorsList
                                                    .value[index]['occupancy_type']
                                                    .toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors
                                                        .black),
                                              ),
                                              enabled: false,
                                            )
                                                : DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      70),
                                                  borderSide: BorderSide(
                                                    color: Color(
                                                        0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors
                                                      .black,),
                                              ),
                                              icon: const Icon(
                                                Icons
                                                    .arrow_drop_down,
                                                color: Colors
                                                    .black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(
                                                  left: 20,
                                                  right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              EdgeInsets.only(
                                                  left: 25,
                                                  right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    5),
                                              ),
                                              items: controller
                                                  .occuppancyList
                                                  ?.isNotEmpty ??
                                                  false
                                                  ? controller
                                                  .occuppancyList!
                                                  .map((items) {
                                                return DropdownMenuItem(
                                                  value: items["id"]
                                                      .toString(),
                                                  child: Text(
                                                      items["occupancy_type"]
                                                          .toString()),
                                                );
                                              }).toList() : [],
                                              validator: (value) {
                                                if (value ==
                                                    null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: (value) {
                                                controller
                                                    .occupancyType[index] =
                                                    value
                                                        .toString();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //CONSTRUCTION TYPE
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Construction Type",
                                          style: GoogleFonts
                                              .publicSans(
                                            fontStyle: FontStyle
                                                .normal,
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 18,
                                            color: Color(
                                                0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .only(top: 3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius
                                    .circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "Self Assessed  :  " +
                                                  capitalizeFirstLetter(
                                                      controller
                                                          .floorsList
                                                          .value[index]['construction_type']
                                                          .toString()),
                                              style: GoogleFonts
                                                  .publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  color: Colors
                                                      .black
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read(
                                        'isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Agency Tc  :  " +
                                                    capitalizeFirstLetter(
                                                        controller
                                                            .tcVerifyFloor
                                                            .value[index]['construction_type']
                                                            .toString() ??
                                                            'N/A'),
                                                style: GoogleFonts
                                                    .publicSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w600,
                                                    fontStyle: FontStyle
                                                        .normal,
                                                    color: Colors
                                                        .black
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              //======Radio Start==========
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Correct'),
                                                  value: '0',
                                                  groupValue: controller
                                                      .constructiontypeCheckStatus
                                                      .elementAt(
                                                      index),
                                                  onChanged: (value) {
                                                    controller
                                                        .constructiontypeCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isconstructiontypeEnable[index] =
                                                    true;
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Wrong'),
                                                  value: '1',
                                                  groupValue: controller
                                                      .constructiontypeCheckStatus
                                                      .elementAt(
                                                      index),
                                                  onChanged: (value) {
                                                    controller
                                                        .constructiontypeCheckStatus[index] =
                                                    value!;
                                                    controller
                                                        .isconstructiontypeEnable[index] =
                                                    false;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          //=======Radio End here=======
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 25),
                                            // child: controller.floorCheckStatus[index] == '0'
                                            child: controller
                                                .constructiontypeCheckStatus
                                                .elementAt(
                                                index) == '0'
                                                ? TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .only(
                                                    left: 35,
                                                    right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        70),
                                                    borderSide: BorderSide
                                                        .none),
                                                hintText: controller
                                                    .floorsList
                                                    .value[index]['construction_type']
                                                    .toString(),
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors
                                                        .black),),
                                              enabled: false,
                                            )
                                                : DropdownButtonFormField2(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .zero,
                                                enabledBorder: UnderlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      70),
                                                  borderSide: BorderSide(
                                                    color: Color(
                                                        0xff263238),
                                                    width: 0.1,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              hint: const Text(
                                                'Select',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors
                                                      .black,),
                                              ),
                                              icon: const Icon(
                                                Icons
                                                    .arrow_drop_down,
                                                color: Colors
                                                    .black45,
                                              ),
                                              iconSize: 35,
                                              buttonHeight: 50,
                                              buttonPadding:
                                              EdgeInsets.only(
                                                  left: 20,
                                                  right: 25),
                                              buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              EdgeInsets.only(
                                                  left: 25,
                                                  right: 25),
                                              dropdownMaxHeight: 250,
                                              dropdownWidth: 310,
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    5),
                                              ),
                                              items: controller
                                                  .constructionList
                                                  ?.isNotEmpty ??
                                                  false
                                                  ? controller
                                                  .constructionList!
                                                  .map((items) {
                                                return DropdownMenuItem(
                                                  value: items["id"]
                                                      .toString(),
                                                  child: Text(
                                                      items["construction_type"]
                                                          .toString()),
                                                );
                                              }).toList() : [],
                                              validator: (value) {
                                                if (value ==
                                                    null) {
                                                  return 'Please select.';
                                                }
                                              },
                                              onChanged: (value) {
                                                controller
                                                    .constructionType[index] =
                                                    value
                                                        .toString();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // BUILD UP AREA
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Build Up Area(in Sq. ft)",
                                          style: GoogleFonts
                                              .publicSans(
                                            fontStyle: FontStyle
                                                .normal,
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 18,
                                            color: Color(
                                                0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .only(top: 3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius
                                    .circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Self Assessed  :  " +
                                                (controller
                                                    .floorsList[index]['builtup_area']
                                                    .toString()),
                                            style: GoogleFonts
                                                .publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight
                                                    .w600,
                                                fontStyle: FontStyle
                                                    .normal,
                                                color: Colors
                                                    .black
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read(
                                        'isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  " +
                                                  (controller
                                                      .tcVerifyFloor
                                                      .value[index]['builtup_area']
                                                      .toString() ??
                                                      'N/A'),
                                              style: GoogleFonts
                                                  .publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  color: Colors
                                                      .black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Correct'),
                                                  value: '0',
                                                  groupValue: controller
                                                      .builtupareaCheckStatus[
                                                  index],
                                                  onChanged: (value) {
                                                    controller
                                                        .builtupareaCheckStatus[
                                                    index] =
                                                    value!;
                                                    if (value ==
                                                        '0') {
                                                      controller
                                                          .isbuiltupareaEnable[index] =
                                                      false;
                                                      controller
                                                          .builtUpAreaControllers[index]
                                                          .text =
                                                      controller
                                                          .floorsList[index]['builtup_area'];
                                                      // TextEditingValue(text: controller.floorsList[index]['builtup_area']);
                                                      // controller.builtUpAreaControllers[index] =
                                                      //     // controller.floorsList[index]['builtup_area'].toString();
                                                      //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['builtup_area'].toString()));
                                                    } else {
                                                      controller
                                                          .builtUpAreaControllers[index]
                                                          .text =
                                                      ''; // Clear the text when switching to "Wrong"
                                                      controller
                                                          .isbuiltupareaEnable[index] =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Wrong'),
                                                  value: '1',
                                                  groupValue: controller.builtupareaCheckStatus[index],
                                                  onChanged: (value) {
                                                    controller.builtupareaCheckStatus[index] = value!;
                                                    if (value == '0') {
                                                      controller.isbuiltupareaEnable[index] = false;
                                                      // controller.builtUpAreaControllers[index].value = TextEditingValue(text: controller.floorsList[index]['builtup_area']);
                                                    } else {
                                                      controller.isbuiltupareaEnable[index] = true;
                                                      controller.builtUpAreaControllers[index].text =''; // Clear the text when switching to "Wrong"

                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 25),
                                            child: controller
                                                .isbuiltupareaEnable[index]
                                                ? TextFormField(
                                              controller: controller
                                                  .builtUpAreaControllers[index],
                                              keyboardType:
                                              TextInputType
                                                  .number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .only(
                                                    left: 35,
                                                    right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        70),
                                                    borderSide: BorderSide
                                                        .none),
                                                hintText: ('Built up area'),
                                                hintStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!
                                                    .isEmpty) {
                                                  return 'Please enter';
                                                }
                                                return null;
                                              },
                                            )
                                                : Container(
                                              width: 500,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .grey[100],
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    70),),
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 32,
                                                    vertical: 13),
                                                child: Text(
                                                  controller
                                                      .builtUpAreaControllers[index]
                                                      .text
                                                      .isEmpty
                                                      ? controller
                                                      .floorsList[index]
                                                  ['builtup_area']
                                                      : controller
                                                      .builtUpAreaControllers[index]
                                                      .text,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w400,
                                                    color: Colors
                                                        .black,),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // DATE FROM
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Date From",
                                          style: GoogleFonts
                                              .publicSans(
                                            fontStyle: FontStyle
                                                .normal,
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 18,
                                            color: Color(
                                                0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .only(top: 3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius
                                    .circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Self Assessed  :  " +
                                                (controller
                                                    .floorsList[index]['date_from']
                                                    .toString()),
                                            style: GoogleFonts
                                                .publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight
                                                    .w600,
                                                fontStyle: FontStyle
                                                    .normal,
                                                color: Colors
                                                    .black
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read(
                                        'isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  " +
                                                  (controller
                                                      .tcVerifyFloor
                                                      .value[index]['date_from']
                                                      .toString() ??
                                                      'N/A'),
                                              style: GoogleFonts
                                                  .publicSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight
                                                      .w600,
                                                  fontStyle: FontStyle
                                                      .normal,
                                                  color: Colors
                                                      .black
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Correct'),
                                                  value: '0',
                                                  groupValue: controller
                                                      .datefromCheckStatus[index],
                                                  onChanged: (value) {
                                                    controller
                                                        .datefromCheckStatus[index] =
                                                    value!;
                                                    if (value ==
                                                        '0') {
                                                      controller
                                                          .isdatefromEnable[index] =
                                                      false;
                                                      controller
                                                          .dateFromController[index]
                                                          .value =
                                                          TextEditingValue(
                                                              text: controller
                                                                  .floorsList[index]['date_from']);
                                                      // controller.dateFromController[index].text =controller.floorsList[index]['date_from'].toString();
                                                      //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_from'].toString()));
                                                    } else {
                                                      controller
                                                          .dateFromController[index]
                                                          .text =
                                                      ''; // Clear the text when switching to "Wrong"
                                                      controller
                                                          .isdatefromEnable[index] =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text(
                                                      'Wrong'),
                                                  value: '1',
                                                  groupValue: controller
                                                      .datefromCheckStatus[index],
                                                  onChanged: (value) {
                                                    controller
                                                        .datefromCheckStatus[index] =
                                                    value!;
                                                    if (value ==
                                                        '0') {
                                                      controller
                                                          .isdatefromEnable[index] =
                                                      false;
                                                      // controller.dateFromController[index].value =
                                                      //     TextEditingValue(text: controller.floorsList[index]['date_from']);
                                                    } else {
                                                      controller
                                                          .dateFromController[index]
                                                          .text =
                                                      ''; // Clear the text when switching to "Wrong"
                                                      controller
                                                          .isdatefromEnable[index] =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 25),
                                            child: controller
                                                .isdatefromEnable[index]
                                                ? DateTimeField(
                                              controller: controller
                                                  .dateFromController[index],
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors
                                                    .grey[100],
                                                contentPadding: EdgeInsets
                                                    .only(
                                                    left: 35,
                                                    right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        70),
                                                    borderSide: BorderSide
                                                        .none),
                                                suffixIcon: Icon(
                                                    Icons
                                                        .calendar_month_outlined),
                                                hintText: ('dd-mm-yyyy'),
                                                hintStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),),
                                              format: DateFormat(
                                                  "yyyy-MM-dd"),
                                              onShowPicker: (context,
                                                  currentValue) {
                                                return showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime(
                                                        1900),
                                                    initialDate: currentValue ??
                                                        DateTime
                                                            .now(),
                                                    lastDate: DateTime(
                                                        2100));
                                              },
                                            )
                                                : Container(
                                              width: 500,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .grey[100],
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    70),),
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 32,
                                                    vertical: 13),
                                                child: Text(
                                                  controller
                                                      .dateFromController[index]
                                                      .text
                                                      .isEmpty
                                                      ? controller
                                                      .floorsList[index]['date_from']
                                                      .toString()
                                                      : controller
                                                      .dateFromController[index]
                                                      .text,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w400,
                                                    color: Colors
                                                        .black,),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // DATE UPTO
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                142, 145, 147, 0.1),
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
                              height: 140,
                              width: 357,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                    63, 148, 213, 1),
                                borderRadius: BorderRadius
                                    .circular(20),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Date Upto ",
                                          style: GoogleFonts
                                              .publicSans(
                                            fontStyle: FontStyle
                                                .normal,
                                            fontWeight: FontWeight
                                                .w700,
                                            fontSize: 18,
                                            color: Color(
                                                0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets
                                              .only(top: 3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/check_1.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius
                                    .circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    //=============================
                                    //self assessed -1
                                    //=============================
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Self Assessed  :  " +
                                                (controller
                                                    .floorsList[index]['date_upto']
                                                    .toString() == '' ? 'N/A'
                                                    : controller
                                                    .floorsList[index]['date_upto']
                                                    .toString()),
                                            style: GoogleFonts
                                                .publicSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight
                                                    .w600,
                                                fontStyle: FontStyle
                                                    .normal,
                                                color: Colors
                                                    .black
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    //AGENCY TC
                                    if (GetStorage().read('isUtc') &&
                                        controller.appliedBy != "TC")
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              "Agency Tc  :  " +
                                                  (controller.tcVerifyFloor
                                                      .value[index]['date_upto']
                                                      .toString() == '' ? 'N/A'
                                                      : controller.tcVerifyFloor
                                                      .value[index]['date_upto']
                                                      .toString()),
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
                                    //============================
                                    //radio button
                                    //============================
                                    Obx(() {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Correct'),
                                                  value: '0',
                                                  groupValue: controller
                                                      .dateUptoCheckStatus[index],
                                                  onChanged: (value) {
                                                    controller
                                                        .dateUptoCheckStatus[index] =
                                                    value!;
                                                    if (value == '0') {
                                                      controller
                                                          .isdateUptoEnable[index] =
                                                      false;
                                                      controller
                                                          .dateUptoController[index]
                                                          .value =
                                                          TextEditingValue(
                                                              text: controller
                                                                  .floorsList[index]['date_upto']);

                                                      // controller.dateUptoController[index] =
                                                      //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_upto'].toString()));

                                                    } else {
                                                      controller
                                                          .dateUptoController[index]
                                                          .text =
                                                      ''; // Clear the text when switching to "Wrong"
                                                      controller
                                                          .isdateUptoEnable[index] =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: RadioListTile(
                                                  title: Text('Wrong'),
                                                  value: '1',
                                                  groupValue: controller
                                                      .dateUptoCheckStatus[index],
                                                  onChanged: (value) {
                                                    controller
                                                        .dateUptoCheckStatus[index] =
                                                    value!;
                                                    if (value == '0') {
                                                      controller
                                                          .isdateUptoEnable[index] =
                                                      false;
                                                      controller
                                                          .dateUptoController[index]
                                                          .value =
                                                          TextEditingValue(
                                                              text: controller
                                                                  .floorsList[index]['date_upto']);
                                                    } else {
                                                      controller
                                                          .isdateUptoEnable[index] =
                                                      true;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: controller
                                                .isdateUptoEnable[index]
                                                ? DateTimeField(
                                              controller: controller
                                                  .dateUptoController[index],
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                contentPadding: EdgeInsets.only(
                                                    left: 35, right: 10),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(70),
                                                    borderSide: BorderSide
                                                        .none),
                                                suffixIcon: Icon(
                                                    Icons
                                                        .calendar_month_outlined),
                                                hintText: ('dd-mm-yyyy'),
                                                hintStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),),
                                              format: DateFormat("yyyy-MM-dd"),
                                              onShowPicker: (context,
                                                  currentValue) {
                                                return showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime(1900),
                                                    initialDate: currentValue ??
                                                        DateTime.now(),
                                                    lastDate: DateTime(2100));
                                              },
                                            )
                                                : Container(
                                              width: 500,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius: BorderRadius
                                                    .circular(70),),
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(horizontal: 32,
                                                    vertical: 13),
                                                child: Text(
                                                  controller
                                                      .dateUptoController[index]
                                                      .text.isEmpty
                                                      ? controller
                                                      .floorsList[index]['date_upto']
                                                      .toString()
                                                      : controller
                                                      .dateUptoController[index]
                                                      .text,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );

    } }),


// =============================================================================================================================
                    // TC FLOOR DETAIL
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
                                      ' Tc Floor Details',
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
                    if (GetStorage().read('isUtc') && controller.tcNewFloor.value.length > 0)
                      Obx(() {
                        if (controller.newverifyuser.value == null ||
                            controller.tcNewFloor.value.length == 0 ||
                            controller.floorList.length == 0 ||
                            controller.usageList.length == 0 ||
                            controller.occuppancyList.length == 0 ||
                            controller.constructionList.length == 0) {
                          return const CircularProgressIndicator();
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.tcNewFloor.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            String floorId = controller.tcNewFloor.value[index]['id'];
                            return Container(
                              child: Column(
                                children: [
                                  // FLOOR TYPE
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Floor",
                                                        style: GoogleFonts
                                                            .publicSans(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 40,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/check_1.png"),
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius
                                                  .circular(0),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  //=============================
                                                  //self assessed -1
                                                  //=============================
                                                  //AGENCY TC
                                                  if (GetStorage().read(
                                                      'isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Agency Tc  :  " + capitalizeFirstLetter(controller.tcNewFloor.value[index]['floor_name'].toString(),),
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
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            //======Radio Start==========
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                // groupValue:controller.floorCheckStatus[index],
                                                                groupValue: controller.floorCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.floorCheckStatus[index] = value!;
                                                                  controller.isfloorEnable[index] = true;
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                // groupValue: controller.floorCheckStatus[index],
                                                                groupValue: controller.floorCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.floorCheckStatus[index] = value!;
                                                                  controller.isfloorEnable[index] = false;
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        //=======Radio End here=======
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                                          child: controller.floorCheckStatus.elementAt(index) == '0'
                                                              ? TextFormField(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              hintText: controller.tcNewFloor.value[index]['floor_name'].toString(),
                                                              hintStyle: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black),
                                                            ),
                                                            enabled: false,
                                                          )
                                                              : DropdownButtonFormField2(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding:
                                                              EdgeInsets.zero,
                                                              enabledBorder:
                                                              UnderlineInputBorder(
                                                                borderRadius: BorderRadius.circular(70),
                                                                borderSide: BorderSide(
                                                                  color: Color(0xff263238), width: 0.1,
                                                                ),
                                                              ),
                                                            ),
                                                            isExpanded: true,
                                                            hint: const Text('Select',
                                                              style: TextStyle(fontSize: 16, color: Colors.black,),
                                                            ),
                                                            icon: const Icon(
                                                              Icons.arrow_drop_down, color: Colors.black45,),
                                                            iconSize: 35,
                                                            buttonHeight: 50,
                                                            buttonPadding:
                                                            EdgeInsets.only(left: 20, right: 25),
                                                            buttonElevation: 2,
                                                            itemHeight: 50,
                                                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                            dropdownMaxHeight: 300,
                                                            dropdownWidth: 310,
                                                            dropdownDecoration:
                                                            BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                            ),
                                                            items: controller.floorList?.isNotEmpty ?? false ? controller.floorList!.map((items) {
                                                              return DropdownMenuItem(
                                                                value: items["id"].toString(),
                                                                child: Text(items["floor_name"].toString()),
                                                              );
                                                            }).toList() : [],
                                                            validator: (value) {
                                                              if (value == null) {return 'Please select.';
                                                              }
                                                            },
                                                            onChanged: (value) {
                                                              controller.floorNo[index] = value.toString();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //USAGE TYPE
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Usage Type ",
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius.circular(0),),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  //=============================
                                                  //self assessed -1
                                                  //=============================
                                                  //AGENCY TC
                                                  if (GetStorage().read(
                                                      'isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              "Agency Tc  :  " + capitalizeFirstLetter(controller.tcNewFloor.value[index]['usage_type'].toString(),),
                                                              style: GoogleFonts.publicSans(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle: FontStyle.normal,
                                                                  color: Colors.black
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            //======Radio Start==========
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                // groupValue:controller.floorCheckStatus[index],
                                                                groupValue: controller.usagetypeCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.usagetypeCheckStatus[index] = value!;
                                                                  controller.isusagetypeEnable[index] = true;
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                // groupValue: controller.floorCheckStatus[index],
                                                                groupValue: controller.usagetypeCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.usagetypeCheckStatus[index] = value!;
                                                                  controller.isusagetypeEnable[index] = false;
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        //=======Radio End here=======
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                                          child: controller.usagetypeCheckStatus.elementAt(index) == '0'
                                                              ? TextFormField(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              hintText: controller.tcNewFloor.value[index]['usage_type'].toString(),
                                                              hintStyle: const TextStyle(fontSize: 16, color: Colors.black),),
                                                            enabled: false,
                                                          )
                                                              : DropdownButtonFormField2(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding:
                                                              EdgeInsets.zero,
                                                              enabledBorder: UnderlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(70),
                                                                borderSide: BorderSide(
                                                                  color: Color(0xff263238),
                                                                  width: 0.1,
                                                                ),
                                                              ),
                                                            ),
                                                            isExpanded: true,
                                                            hint: const Text('Select',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black,),
                                                            ),
                                                            icon: const Icon(
                                                              Icons.arrow_drop_down,
                                                              color: Colors.black45,
                                                            ),
                                                            iconSize: 35,
                                                            buttonHeight: 50,
                                                            buttonPadding:
                                                            EdgeInsets.only(left: 20, right: 25),
                                                            buttonElevation: 2,
                                                            itemHeight: 70,
                                                            itemPadding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                                                            dropdownMaxHeight: 300,
                                                            dropdownWidth: 310,
                                                            dropdownDecoration:
                                                            BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),),
                                                            items: controller.usageList
                                                                ?.isNotEmpty ?? false
                                                                ? controller.usageList!.map((items) {
                                                              return DropdownMenuItem(
                                                                value: items["id"].toString(),
                                                                child: Text(
                                                                    items["usage_type"].toString()),
                                                              );
                                                            }).toList() : [],
                                                            validator: (value) {
                                                              if (value == null) {
                                                                return 'Please select.';
                                                              }
                                                            },
                                                            onChanged: (value) {
                                                              controller.useType[index] = value.toString();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // OCCUPANCY TYPE
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Occupancy Type",
                                                        style: GoogleFonts
                                                            .publicSans(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 40,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/check_1.png"),
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius
                                                  .circular(0),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  //=============================
                                                  //AGENCY TC
                                                  if (GetStorage().read(
                                                      'isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Agency Tc  :  " +
                                                                capitalizeFirstLetter(
                                                                  controller.tcNewFloor.value[index]['occupancy_type'].toString(),),
                                                            style: GoogleFonts
                                                                .publicSans(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle: FontStyle.normal,
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            //======Radio Start==========
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                // groupValue:controller.floorCheckStatus[index],
                                                                groupValue: controller.occupancytypeCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.occupancytypeCheckStatus[index] = value!;
                                                                  controller.isoccupancytypeEnable[index] = true;
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                // groupValue: controller.floorCheckStatus[index],
                                                                groupValue: controller.occupancytypeCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.occupancytypeCheckStatus[index] = value!;
                                                                  controller.isoccupancytypeEnable[index] = false;
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        //=======Radio End here=======
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 25),
                                                          // child: controller.floorCheckStatus[index] == '0'
                                                          child: controller.occupancytypeCheckStatus.elementAt(index) == '0'
                                                              ? TextFormField(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              hintText: controller.floorsList.value[index]['occupancy_type'].toString(),
                                                              hintStyle: const TextStyle(fontSize: 16,
                                                                  color: Colors.black),
                                                            ),
                                                            enabled: false,
                                                          )
                                                              : DropdownButtonFormField2(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.zero,
                                                              enabledBorder: UnderlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(70),
                                                                borderSide: BorderSide(
                                                                  color: Color(0xff263238),
                                                                  width: 0.1,
                                                                ),
                                                              ),
                                                            ),
                                                            isExpanded: true,
                                                            hint: const Text(
                                                              'Select',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,),
                                                            ),
                                                            icon: const Icon(
                                                              Icons.arrow_drop_down,
                                                              color: Colors.black45,
                                                            ),
                                                            iconSize: 35,
                                                            buttonHeight: 50,
                                                            buttonPadding:
                                                            EdgeInsets.only(left: 20, right: 25),
                                                            buttonElevation: 2,
                                                            itemHeight: 50,
                                                            itemPadding:
                                                            EdgeInsets.only(left: 25, right: 25),
                                                            dropdownMaxHeight: 250,
                                                            dropdownWidth: 310,
                                                            dropdownDecoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                            ),
                                                            items: controller.occuppancyList
                                                                ?.isNotEmpty ?? false
                                                                ? controller.occuppancyList!
                                                                .map((items) {
                                                              return DropdownMenuItem(
                                                                value: items["id"].toString(),
                                                                child: Text(
                                                                    items["occupancy_type"].toString()),
                                                              );
                                                            }).toList() : [],
                                                            validator: (value) {
                                                              if (value == null) {return 'Please select.';
                                                              }
                                                            },
                                                            onChanged: (value) {
                                                              controller.occupancyType[index] = value.toString();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //CONSTRUCTION TYPE
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Construction Type",
                                                        style: GoogleFonts
                                                            .publicSans(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 40,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/check_1.png"),
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius
                                                  .circular(0),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [

                                                  //AGENCY TC
                                                  if (GetStorage().read(
                                                      'isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              "Agency Tc  :  " +
                                                                  capitalizeFirstLetter(
                                                                    controller.tcNewFloor.value[index]['construction_type'].toString(),),
                                                              style: GoogleFonts
                                                                  .publicSans(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight
                                                                      .w600,
                                                                  fontStyle: FontStyle
                                                                      .normal,
                                                                  color: Colors
                                                                      .black
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            //======Radio Start==========
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                // groupValue:controller.floorCheckStatus[index],
                                                                groupValue: controller.constructiontypeCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.constructiontypeCheckStatus[index] = value!;
                                                                  controller.isconstructiontypeEnable[index] = true;
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                // groupValue: controller.floorCheckStatus[index],
                                                                groupValue: controller.constructiontypeCheckStatus.elementAt(index),
                                                                onChanged: (value) {
                                                                  controller.constructiontypeCheckStatus[index] = value!;
                                                                  controller.isconstructiontypeEnable[index] = false;
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        //=======Radio End here=======
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                                          child: controller.constructiontypeCheckStatus.elementAt(index) == '0'
                                                              ? TextFormField(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              hintText: controller.floorsList.value[index]['construction_type'].toString(),
                                                              hintStyle: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black),),
                                                            enabled: false,
                                                          )
                                                              : DropdownButtonFormField2(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.zero,
                                                              enabledBorder: UnderlineInputBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(70),
                                                                borderSide: BorderSide(
                                                                  color: Color(0xff263238),
                                                                  width: 0.1,
                                                                ),
                                                              ),
                                                            ),
                                                            isExpanded: true,
                                                            hint: const Text(
                                                              'Select',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black,),
                                                            ),
                                                            icon: const Icon(
                                                              Icons.arrow_drop_down,
                                                              color: Colors.black45,
                                                            ),
                                                            iconSize: 35,
                                                            buttonHeight: 50,
                                                            buttonPadding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                right: 25),
                                                            buttonElevation: 2,
                                                            itemHeight: 50,
                                                            itemPadding:
                                                            EdgeInsets.only(left: 25, right: 25),
                                                            dropdownMaxHeight: 250,
                                                            dropdownWidth: 310,
                                                            dropdownDecoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                            ),
                                                            items: controller.constructionList?.isNotEmpty ?? false ?
                                                            controller.constructionList!.map((items) {
                                                              return DropdownMenuItem(
                                                                value: items["id"].toString(),
                                                                child: Text(
                                                                    items["construction_type"].toString()),
                                                              );
                                                            }).toList() : [],
                                                            validator: (value) {
                                                              if (value == null) {
                                                                return 'Please select.';
                                                              }
                                                            },
                                                            onChanged: (value) {
                                                              controller.constructionType[index] = value.toString();
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // BUILD UP AREA
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Build Up Area(in Sq. ft)",
                                                        style: GoogleFonts
                                                            .publicSans(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 40,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/check_1.png"),
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius
                                                  .circular(0),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  //=============================
                                                  //AGENCY TC
                                                  //=============================
                                                  if (GetStorage().read('isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Agency Tc  :  " +
                                                                (controller.tcNewFloor[index]['builtup_area'].toString()),
                                                            style: GoogleFonts
                                                                .publicSans(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle: FontStyle.normal,
                                                                color: Colors.black
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                groupValue: controller.builtupareaCheckStatus[index],
                                                                onChanged: (value) {
                                                                  controller.builtupareaCheckStatus[index] = value!;
                                                                  if (value == '0') {
                                                                    controller.isbuiltupareaEnable[index] = false;
                                                                    controller.builtUpAreaControllers[index].text = controller.tcNewFloor[index]['builtup_area'].toString();
                                                                    // TextEditingValue(text: controller.floorsList[index]['builtup_area']);
                                                                    // controller.builtUpAreaControllers[index] =
                                                                    //     // controller.floorsList[index]['builtup_area'].toString();
                                                                    //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['builtup_area'].toString()));
                                                                  } else {
                                                                    controller.builtUpAreaControllers[index].text = ''; // Clear the text when switching to "Wrong"
                                                                    controller.isbuiltupareaEnable[index] = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                groupValue: controller.builtupareaCheckStatus[index],
                                                                onChanged: (value) {
                                                                  controller.builtupareaCheckStatus[index] = value!;
                                                                  if (value == '0') {
                                                                    controller.isbuiltupareaEnable[index] = false;
                                                                    // controller.builtUpAreaControllers[index].value = TextEditingValue(text: controller.floorsList[index]['builtup_area']);
                                                                  } else {
                                                                    controller.builtUpAreaControllers[index].text = '';
                                                                    controller.isbuiltupareaEnable[index] = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                                          child: controller.isbuiltupareaEnable[index]
                                                              ? TextFormField(
                                                            controller: controller.builtUpAreaControllers[index],
                                                            keyboardType: TextInputType.number,
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter.digitsOnly
                                                            ],
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              hintStyle: const TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black,),
                                                            ),
                                                            validator: (value) {
                                                              if (value!.isEmpty) {
                                                                return 'Please enter';
                                                              }
                                                              return null;
                                                            },
                                                          )
                                                              : Container(
                                                            width: 500,
                                                            height: 45,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[100],
                                                              borderRadius: BorderRadius.circular(70),),
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  horizontal: 32,
                                                                  vertical: 13),
                                                              child: Text(
                                                                controller.builtUpAreaControllers[index].text.isEmpty
                                                                    ? controller.tcNewFloor[index]['builtup_area'].toString()
                                                                    : controller.builtUpAreaControllers[index].text,
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight
                                                                      .w400,
                                                                  color: Colors
                                                                      .black,),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // DATE FROM
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Date From",
                                                        style: GoogleFonts
                                                            .publicSans(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 40,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/check_1.png"),
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius
                                                  .circular(0),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  //=============================
                                                  //AGENCY TC
                                                  //=============================
                                                  if (GetStorage().read('isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Agency Tc  :  " + controller.tcNewFloor[index]['date_from'].toString(),
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
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                groupValue: controller.datefromCheckStatus[index],
                                                                onChanged: (value) {
                                                                  controller.datefromCheckStatus[index] = value!;
                                                                  if (value == '0') {
                                                                    controller.isdatefromEnable[index] = false;
                                                                    controller.dateFromController[index].value = TextEditingValue(text:  controller.tcNewFloor[index]['date_from'].toString());
                                                                    // controller.dateFromController[index].text =controller.floorsList[index]['date_from'].toString();
                                                                    //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_from'].toString()));
                                                                  } else {
                                                                    controller.dateFromController[index].text = ''; // Clear the text when switching to "Wrong"
                                                                    controller.isdatefromEnable[index] = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                groupValue: controller.datefromCheckStatus[index],
                                                                onChanged: (value) {
                                                                  controller.datefromCheckStatus[index] = value!;
                                                                  if (value == '0') {
                                                                    controller.isdatefromEnable[index] = false;
                                                                    // controller.dateFromController[index].value =
                                                                    //     TextEditingValue(text: controller.floorsList[index]['date_from']);
                                                                  } else {
                                                                    controller.dateFromController[index].text = '';
                                                                    controller.isdatefromEnable[index] = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                                          child: controller.isdatefromEnable[index]
                                                              ? DateTimeField(
                                                            controller: controller.dateFromController[index],
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              suffixIcon: Icon(
                                                                  Icons.calendar_month_outlined),
                                                              hintText: 'yyyy-mm-dd',
                                                              hintStyle: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black),),
                                                            format: DateFormat("yyyy-MM-dd"),
                                                            onShowPicker: (
                                                                context,
                                                                currentValue) {
                                                              return showDatePicker(
                                                                  context: context,
                                                                  firstDate: DateTime(1900),
                                                                  initialDate: currentValue ?? DateTime.now(),
                                                                  lastDate: DateTime(2100));
                                                            },
                                                          )
                                                              : Container(
                                                            width: 500,
                                                            height: 45,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[100],
                                                              borderRadius: BorderRadius.circular(70),),
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  horizontal: 32,
                                                                  vertical: 13),
                                                              child: Text(
                                                                controller.dateFromController[index].text.isEmpty
                                                                    ?   controller.tcNewFloor[index]['date_from'].toString()
                                                                    : controller.dateFromController[index].text,
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.black,),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // DATE UPTO
                                  Container(
                                    height: 275,
                                    width: 357,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              142, 145, 147, 0.1),
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
                                            height: 140,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  63, 148, 213, 1),
                                              borderRadius: BorderRadius
                                                  .circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Date Upto ",
                                                        style: GoogleFonts
                                                            .publicSans(
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xFFFFFFFF),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 40,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/check_1.png"),
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
                                            height: 230,
                                            width: 357,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius: BorderRadius
                                                  .circular(0),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  //=============================
                                                  //AGENCY TC
                                                  //=============================
                                                  if (GetStorage().read(
                                                      'isUtc'))
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Agency Tc  :  " +
                                                                ( controller.tcNewFloor[index]['date_upto'].toString() == '' ? 'N/A'
                                                                    : controller.tcNewFloor[index]['date_upto'].toString()),
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
                                                  //============================
                                                  //radio button
                                                  //============================
                                                  Obx(() {
                                                    return Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Correct'),
                                                                value: '0',
                                                                groupValue: controller.dateUptoCheckStatus[index],
                                                                onChanged: (value) {
                                                                  controller.dateUptoCheckStatus[index] = value!;
                                                                  if (value == '0') {
                                                                    controller.isdateUptoEnable[index] = false;
                                                                    controller.dateUptoController[index].value =  TextEditingValue(text: controller.tcNewFloor[index]['date_upto'].toString());

                                                                    // controller.dateUptoController[index] =
                                                                    //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_upto'].toString()));

                                                                  } else {
                                                                    controller.dateUptoController[index].text = ''; // Clear the text when switching to "Wrong"
                                                                    controller.isdateUptoEnable[index] = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: RadioListTile(
                                                                title: Text('Wrong'),
                                                                value: '1',
                                                                groupValue: controller.dateUptoCheckStatus[index],
                                                                onChanged: (value) {
                                                                  controller.dateUptoCheckStatus[index] = value!;
                                                                  if (value == '0') {
                                                                    controller.isdateUptoEnable[index] = false;
                                                                    controller.dateUptoController[index].value = TextEditingValue(text:controller.tcNewFloor[index]['date_upto'].toString());
                                                                  } else {
                                                                    controller.dateUptoController[index].text = '';
                                                                    controller.isdateUptoEnable[index] = true;
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                                          child: controller.isdateUptoEnable[index]
                                                              ? DateTimeField(
                                                            controller: controller.dateUptoController[index],
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
                                                              contentPadding: EdgeInsets.only(left: 35, right: 10),
                                                              border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(70),
                                                                  borderSide: BorderSide.none),
                                                              suffixIcon: Icon(
                                                                  Icons.calendar_month_outlined),
                                                              hintText: 'yyyy-mm-dd',
                                                              hintStyle: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black),),
                                                            format: DateFormat("yyyy-MM-dd"),
                                                            onShowPicker: (context, currentValue) {
                                                              return showDatePicker(
                                                                  context: context,
                                                                  firstDate: DateTime(1900),
                                                                  initialDate: currentValue ?? DateTime.now(),
                                                                  lastDate: DateTime(2100));
                                                            },
                                                          )
                                                              : Container(
                                                            width: 500,
                                                            height: 45,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[100],
                                                              borderRadius: BorderRadius.circular(70),),
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                                                              child: Text(
                                                                controller.dateUptoController[index].text.isEmpty
                                                                    ? controller.tcNewFloor[index]['date_upto'].toString()
                                                                    : controller.dateUptoController[index].text,
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: Colors.black,),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
// =============================================================================================================================
                    //NO NEW FLOOR ADDED BY TC
                    if (GetStorage().read('isUtc') && controller.tcNewFloor.value.length == 0)
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
                            Text(
                              'No New Floor Added by tc ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                    "assets/images/plus.png",
                                    height: 45,
                                    width: 45,
                                  ),
                                  Text(
                                    ' Add Floors',
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
                    Obx(() {
                      //IF VACANT LAND -CONTAINER
                      if(controller.propertyType.value == '4' || controller.propertyType.value == 4 ) {
                        return Padding(
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
                                              child: Icon(Icons.info_outlined,
                                                  color: Colors.red, size: 20),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            " No floors can be added  as it is vacant  land .",
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
                        );
                      } else {
                        return  Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top:0, bottom: 5, left: 20, right: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Floor Details',
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

                                        TextButton(
                                          onPressed: () {
                                            controller.addFloor();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                int currentIndex = controller.remarkControllers.length - 1;
                                                return StatefulBuilder(
                                                  builder: (BuildContext context, StateSetter setState)
                                                  {
                                                    return AlertDialog(
                                                      backgroundColor: Color(0xFFF0F6F9),
                                                      content: SingleChildScrollView(
                                                        child:  Container(
                                                          decoration: BoxDecoration(
                                                              color:Colors.white,
                                                              borderRadius: BorderRadius.circular(15),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Color.fromRGBO(0, 0, 0, 0.06),
                                                                  offset: Offset(0, 4),
                                                                  blurRadius: 4,
                                                                  spreadRadius: 0,
                                                                ),
                                                              ]),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:  EdgeInsets.only(top:5, bottom: 3, left:20, right:20),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Text(
                                                                      "Floor Details  ",
                                                                      style: TextStyle( fontSize:15,
                                                                        fontWeight: FontWeight  .w700,
                                                                        color: Colors .indigo,
                                                                      ),
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        controller.removeFloor(currentIndex);
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      icon: Icon(Icons.delete,color: Colors.indigo,),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(top:0, bottom: 5, left:10, right:10),
                                                                child: Divider(
                                                                  color: Colors.blue,
                                                                  thickness: 1,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Floor",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),),
                                                                        Text(" *",
                                                                          style: TextStyle(color: Colors.red),),
                                                                      ],
                                                                    ),
                                                                    DropdownButtonFormField2(
                                                                      decoration: InputDecoration(
                                                                        contentPadding: EdgeInsets.zero,
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          borderSide:
                                                                          BorderSide(
                                                                            color: Colors.black,
                                                                            width: 0.7,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      isExpanded: true,
                                                                      hint: const Text('Select',
                                                                        style: TextStyle(fontSize: 16,
                                                                          color: Colors.black,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                      const Icon(
                                                                        Icons.arrow_drop_down,
                                                                        color: Colors.black45,
                                                                      ),
                                                                      iconSize: 30,
                                                                      buttonHeight: 60,
                                                                      buttonPadding:
                                                                      EdgeInsets.only(left: 20, right: 25),
                                                                      buttonElevation: 2,
                                                                      itemHeight: 60,
                                                                      itemPadding:
                                                                      EdgeInsets.only(left: 25, right: 25),
                                                                      dropdownMaxHeight: 350,
                                                                      dropdownWidth: 240,
                                                                      dropdownDecoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(5),
                                                                      ),
                                                                      items: controller.floorList?.isNotEmpty ?? false
                                                                          ? controller.floorList!.map((items) {
                                                                        return DropdownMenuItem(
                                                                          value: items["id"].toString(), child:
                                                                        Text(items["floor_name"].toString()),
                                                                        );
                                                                      }).toList() : [],
                                                                      validator: (value) {
                                                                        if (value == null) {
                                                                          return 'Please select floor ';
                                                                        }
                                                                      },
                                                                      onChanged: (value) {
                                                                        controller.floorType.value = value.toString();
                                                                      },
                                                                    ),

                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Usage Type",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                        Text(
                                                                          " *",
                                                                          style: TextStyle(
                                                                              color:
                                                                              Colors.red),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    DropdownButtonFormField2(
                                                                      decoration:
                                                                      InputDecoration(
                                                                        contentPadding:
                                                                        EdgeInsets.zero,
                                                                        enabledBorder:
                                                                        UnderlineInputBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(5),
                                                                          borderSide: BorderSide(
                                                                            color:Colors.black,
                                                                            width: 0.7,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      isExpanded: true,
                                                                      hint: const Text('Select',
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          color: Colors.black,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                      const Icon(Icons.arrow_drop_down,
                                                                        color: Colors.black45,
                                                                      ),
                                                                      iconSize: 30,
                                                                      buttonHeight: 60,
                                                                      buttonPadding: EdgeInsets.only(left: 20, right: 25),
                                                                      buttonElevation: 2,
                                                                      itemHeight: 80,
                                                                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                      dropdownMaxHeight: 350,
                                                                      dropdownWidth: 240,
                                                                      dropdownDecoration:
                                                                      BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      ),
                                                                      items: controller.usageList
                                                                          ?.isNotEmpty ?? false ? controller.usageList!
                                                                          .map((items) {
                                                                        return DropdownMenuItem(
                                                                          value: items["id"].toString(),
                                                                          child: Text(items["usage_type"].toString()),
                                                                        );
                                                                      }).toList() : [],
                                                                      validator: (value) {
                                                                        if (value == null) {
                                                                          return 'Please select usage type';
                                                                        }
                                                                      },
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.floorUseType.value = value.toString();
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Occupancy Type",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                        Text(
                                                                          " *",
                                                                          style: TextStyle(
                                                                              color:
                                                                              Colors.red),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    DropdownButtonFormField2(
                                                                      // value:controller.pNewWard,
                                                                      decoration:
                                                                      InputDecoration(
                                                                        contentPadding:
                                                                        EdgeInsets.zero,
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          borderSide: BorderSide(color:Colors.black,
                                                                            width: 0.7,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      isExpanded:
                                                                      true,
                                                                      hint:
                                                                      const Text('Select', style:
                                                                      TextStyle(fontSize: 16,
                                                                        color: Colors.black,
                                                                      ),
                                                                      ),
                                                                      icon:
                                                                      const Icon(
                                                                        Icons.arrow_drop_down,
                                                                        color: Colors.black45,
                                                                      ),
                                                                      iconSize: 30,
                                                                      buttonHeight: 60,
                                                                      buttonPadding:
                                                                      EdgeInsets.only(left: 20, right: 25),
                                                                      buttonElevation: 2,
                                                                      itemHeight: 50,
                                                                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                      dropdownMaxHeight: 250,
                                                                      dropdownWidth: 240,
                                                                      dropdownDecoration:
                                                                      BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                                                      items: controller.occuppancyList?.isNotEmpty ?? false
                                                                          ? controller.occuppancyList!.map(
                                                                              (items) {return DropdownMenuItem(
                                                                            value: items["id"].toString(),
                                                                            child:
                                                                            Text(items["occupancy_type"].toString()),
                                                                          );
                                                                          }).toList() : [],
                                                                      validator: (value) {
                                                                        if (value == null) {
                                                                          return 'Please select occupancy type';
                                                                        }
                                                                      },
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.floorOccupancyType.value = value.toString();
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Construction Type",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                        Text(
                                                                          " *",
                                                                          style: TextStyle(
                                                                              color:
                                                                              Colors.red),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    DropdownButtonFormField2(
                                                                      // value:controller.pNewWard,
                                                                      decoration: InputDecoration(
                                                                        contentPadding: EdgeInsets.zero,
                                                                        enabledBorder: UnderlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          borderSide: BorderSide(
                                                                            color: Colors.black,
                                                                            width: 0.7,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      isExpanded: true,
                                                                      hint: const Text(
                                                                        'Select',
                                                                        style:
                                                                        TextStyle(fontSize: 16,
                                                                          color: Colors.black,
                                                                        ),
                                                                      ),
                                                                      icon:
                                                                      const Icon(
                                                                        Icons.arrow_drop_down,
                                                                        color: Colors.black45,
                                                                      ),
                                                                      iconSize: 30,
                                                                      buttonHeight: 60,
                                                                      buttonPadding:
                                                                      EdgeInsets.only(left: 20,
                                                                          right: 25),
                                                                      buttonElevation: 2,
                                                                      itemHeight: 60,
                                                                      itemPadding:
                                                                      EdgeInsets.only(left: 25,
                                                                          right: 25),
                                                                      dropdownMaxHeight: 250,
                                                                      dropdownWidth: 240,
                                                                      dropdownDecoration:
                                                                      BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      ),
                                                                      items: controller
                                                                          .constructionList?.isNotEmpty ?? false
                                                                          ? controller.constructionList!.map(
                                                                              (items) {
                                                                            return DropdownMenuItem(
                                                                              value: items["id"].toString(),
                                                                              child: Text(items["construction_type"].toString()),
                                                                            );
                                                                          }).toList() : [],
                                                                      validator: (value) {
                                                                        if (value == null) {
                                                                          return 'Please select construction type';
                                                                        }
                                                                      },
                                                                      onChanged:
                                                                          (value) {
                                                                        controller.floorConstructionType.value = value.toString();
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Built Up Area",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                        Text(
                                                                          " *",
                                                                          style: TextStyle(
                                                                              color:
                                                                              Colors.red),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    TextField(
                                                                      controller: controller.floorBuiltUpController[currentIndex],
                                                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],),

                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(
                                                                    15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Date From",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                        Text(
                                                                          " *",
                                                                          style: TextStyle(
                                                                              color:
                                                                              Colors.red),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    DateTimeField(
                                                                      controller: controller.floorDateFromController[
                                                                      currentIndex],
                                                                      decoration:
                                                                      InputDecoration(
                                                                        suffixIcon:
                                                                        Icon(Icons.calendar_month_outlined),
                                                                        hintText:
                                                                        'yyyy-mm-dd',
                                                                        hintStyle: const TextStyle(
                                                                            fontSize: 16,
                                                                            color: Colors.black),
                                                                      ),
                                                                      format: DateFormat("yyyy-MM-dd"),
                                                                      onShowPicker:
                                                                          (context,
                                                                          currentValue) {
                                                                        return showDatePicker(
                                                                            context: context,
                                                                            firstDate: DateTime(1900),
                                                                            initialDate: currentValue ?? DateTime.now(),
                                                                            lastDate: DateTime(2100));
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding:
                                                                EdgeInsets.all(15),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Date Upto",
                                                                          style: GoogleFonts.publicSans(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                        Text(
                                                                          " *",
                                                                          style: TextStyle(
                                                                              color:
                                                                              Colors.red),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    DateTimeField(
                                                                      controller: controller.floordateUptoController[
                                                                      currentIndex],
                                                                      decoration:
                                                                      InputDecoration(
                                                                        suffixIcon:
                                                                        Icon(Icons.calendar_month_outlined),
                                                                        hintText: 'yyyy-mm-dd',
                                                                        hintStyle: const TextStyle(
                                                                            fontSize: 16, color: Colors.black),
                                                                      ),
                                                                      format: DateFormat("yyyy-MM-dd"),
                                                                      onShowPicker: (context, currentValue) {
                                                                        return showDatePicker(
                                                                            context: context,
                                                                            firstDate: DateTime(1900),
                                                                            initialDate: currentValue ?? DateTime.now(),
                                                                            lastDate: DateTime(2100));
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                child: Text('Add'),
                                                                onPressed: () {
                                                                  Map<String, dynamic>
                                                                  floorData = {
                                                                    'floorNo': controller.floorList.firstWhere((item) => item['id'].toString() == controller.floorType.value)['floor_name'],
                                                                    'userType': controller.usageList.firstWhere((item) => item['id'].toString() == controller.floorUseType.value)['usage_type'],
                                                                    'occupancyType': controller.occuppancyList.firstWhere((item) => item['id'].toString() == controller.floorOccupancyType.value)['occupancy_type'],
                                                                    'constructionType': controller.constructionList.firstWhere((item) => item['id'].toString() == controller.floorConstructionType.value)['construction_type'],
                                                                    'builtUpArea': controller.floorBuiltUpController[currentIndex].text,
                                                                    'fromDate': controller.floorDateFromController[currentIndex].text,
                                                                    'uptoDate': controller.floordateUptoController[currentIndex].text,
                                                                  };
                                                                  setState(() {
                                                                    controller.floorDataList.add(floorData);
                                                                  });
                                                                  Navigator.of(context).pop();
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: Text("Add Floor"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //INFO
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
                                                    child: Icon(Icons.info_outlined,
                                                        color: Colors.red, size: 20),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                  "  Click Add floor button to add floor of the property in case any floor is missing.  "
                                                      " You can add multiple floors by repeating the same method.",
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
                              //  Table
                              Obx(() {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(
                                                  0, 1),
                                            ),
                                          ],
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            columnSpacing: 30,
                                            columns: [
                                              DataColumn(label: Center(child: Text('#'))),
                                              DataColumn(label: Center(child: Text('Floor no'))),
                                              DataColumn(label: Center(child: Text('User Type'))),
                                              DataColumn(label: Center(child: Text('Occupancy Type'))),
                                              DataColumn(label: Center(child: Text('Construction Type'))),
                                              DataColumn(label: Center(child: Text('Built up Area'))),
                                              DataColumn(label: Center(child: Text('From Date'))),
                                              DataColumn(label: Center(child: Text('Upto Date'))),
                                              DataColumn(label: Center(child: Text('Actions'))),
                                            ],
                                            rows: List<DataRow>.generate(
                                              controller.floorDataList.length,
                                                  (index) {
                                                final floorData = controller.floorDataList[index];
                                                return DataRow(
                                                  cells: [
                                                    DataCell(Center(child: Text((index + 1).toString()))),
                                                    DataCell(Center(child: Text(floorData['floorNo']))),
                                                    DataCell(Center(child: Text(floorData['userType']))),
                                                    DataCell(Center(child: Text(floorData['occupancyType']))),
                                                    DataCell(Center(child: Text(floorData['constructionType']))),
                                                    DataCell(Center(child: Text(floorData['builtUpArea']))),
                                                    DataCell(Center(child: Text(floorData['fromDate']))),
                                                    DataCell(Center(child: Text(floorData['uptoDate']))),
                                                    DataCell(
                                                      Center(
                                                        child: Row(
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(Icons.edit),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                            IconButton(
                                                              icon: Icon(Icons.delete),
                                                              onPressed: () {
                                                                controller.deleteFloorData(index);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        );
                      }
                    }),
                    // =============================================================================================================================
                    //REMARKS
                    SizedBox(height: 15),
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
                                    "assets/images/resume.png",
                                    height: 45,
                                    width: 45,
                                  ),
                                  Text(
                                    ' Remarks',
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
                    //REMARK TEXTFIELD
                    SizedBox(height: 15),
                    Container(
                      height: 275,
                      width: 357,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(142, 145, 147, 0.1),
                            offset: Offset(0,1),
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
                              height: 275,
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
                                          "Remarks",
                                          style: GoogleFonts.publicSans(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top:3),
                                          height: 40,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/review.png"),
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
                              height: 230,
                              width: 357,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[100],
                                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Enter Remarks . . . . .',
                                          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                                        ),
                                        style: TextStyle(fontSize: 16, color: Colors.black),
                                        maxLines: null,
                                        minLines:7,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
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
                            Get.dialog(
                              AlertDialog(
                                title: Text("Are you sure to cancel ?"),
                                actions: [
                                  TextButton(
                                    child: Text("No"),
                                    onPressed: () => Get.back(),
                                  ),
                                  TextButton(
                                    child: Text("Yes"),
                                    onPressed: () {
                                      // controller.clearAll();
                                      // controller.resetValues();
                                      Get.off(FieldVerificationPendingListView());
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text("Cancel"),
                        ),



                        ElevatedButton(
                          onPressed: () {
                            if (controller.VerificationFormkey.currentState!.validate()) {

                              controller.tcVerificationForm();

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
                          child: Text('Submit'),
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





// if (
// (
//     controller.floorsList.length == 0
//     )
// ) {
//   return const CircularProgressIndicator();
// } else {
//   if ( controller.floorsList.length == 0 || controller.propertyType.value == '4' || controller
//       .propertyType.value == 4 || controller.propertytype == "VACANT LAND" || controller.tcPropertyType == "VACANT LAND") {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.red[100],
//           borderRadius: BorderRadius.circular(15.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 1,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               SizedBox(width: 14),
//               Expanded(
//                 child: RichText(
//                   text: TextSpan(
//                     children: [
//                       WidgetSpan(
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               top: 3,
//                               right: 4,
//                               bottom: 1),
//                           child: Icon(Icons.info_outlined,
//                               color: Colors.red,
//                               size: 20),
//                         ),
//                       ),
//                       TextSpan(
//                         text:
//                         "There is no floor as it is vacant land ",
//                         style: GoogleFonts.publicSans(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15,
//                           fontStyle: FontStyle.normal,
//                           color: Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   } else {
//     return Column(
//       children: [
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: controller.floorsList.value.length,
//           itemBuilder: (BuildContext context, int index) {
//             String floorId = controller.floorsList
//                 .value[index]['id'];
//             controller.totalFloors.value =
//                 controller.floorsList.value.length;
//             return Container(
//               child: Column(
//                 children: [
//                   // Floor Number Container
//                   Container(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         'Floor ${index + 1}.',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       )
//                   ),
//                   // FLOOR TYPE
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Floor",
//                                         style: GoogleFonts.publicSans(
//                                           fontStyle: FontStyle.normal,
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 18,
//                                           color: Color(0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets.only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage("assets/images/check_1.png"),)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius.circular(0),),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Self Assessed  :  " + capitalizeFirstLetter(controller.floorsList.value[index]['floor_name'].toString()),
//                                           style: GoogleFonts.publicSans(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               fontStyle: FontStyle.normal,
//                                               color: Colors.black
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Agency Tc  :  " +
//                                                 capitalizeFirstLetter(controller.tcVerifyFloor.value[index]['floor_name']?.toString() ?? 'N/A'),
//                                             style: GoogleFonts
//                                                 .publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w600,
//                                                 fontStyle: FontStyle.normal,
//                                                 color: Colors.black
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             //======Radio Start==========
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text('Correct'),
//                                                 value: '0',
//                                                 // groupValue:controller.floorCheckStatus[index],
//                                                 groupValue: controller.floorCheckStatus.elementAt(index),
//                                                 onChanged: (value) {
//                                                   controller.floorCheckStatus[index] = value!;
//                                                   controller.isfloorEnable[index] = true;
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text('Wrong'),
//                                                 value: '1',
//                                                 // groupValue: controller.floorCheckStatus[index],
//                                                 groupValue: controller.floorCheckStatus.elementAt(index),
//                                                 onChanged: (value) {
//                                                   controller.floorCheckStatus[index] = value!;
//                                                   controller.isfloorEnable[index] = false;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         //=======Radio End here=======
//                                         Padding(
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 25),
//                                           child: controller.floorCheckStatus.elementAt(index) == '0'
//                                               ? TextFormField(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors.grey[100],
//                                               contentPadding: EdgeInsets.only(
//                                                   left: 35,
//                                                   right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius.circular(70),
//                                                   borderSide: BorderSide.none),
//                                               hintText: controller.floorsList.value[index]['floor_name'].toString(),
//                                               hintStyle: const TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors.black),
//                                             ),
//                                             enabled: false,
//                                           )
//                                               : DropdownButtonFormField2(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding:
//                                               EdgeInsets.zero,
//                                               enabledBorder:
//                                               UnderlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(70),
//                                                 borderSide: BorderSide(
//                                                   color: Color(0xff263238),
//                                                   width: 0.1,
//                                                 ),
//                                               ),
//                                             ),
//                                             isExpanded: true,
//                                             hint: const Text(
//                                               'Select',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                             icon: const Icon(
//                                               Icons.arrow_drop_down,
//                                               color: Colors.black45,
//                                             ),
//                                             iconSize: 35,
//                                             buttonHeight: 50,
//                                             buttonPadding:
//                                             EdgeInsets.only(
//                                                 left: 20,
//                                                 right: 25),
//                                             buttonElevation: 2,
//                                             itemHeight: 50,
//                                             itemPadding: EdgeInsets.only(
//                                                 left: 25,
//                                                 right: 25),
//                                             dropdownMaxHeight: 300,
//                                             dropdownWidth: 310,
//                                             dropdownDecoration:
//                                             BoxDecoration(
//                                               borderRadius: BorderRadius.circular(5),
//                                             ),
//                                             items: controller.floorList?.isNotEmpty ?? false ? controller.floorList!
//                                                 .map((items) {
//                                               return DropdownMenuItem(
//                                                 value: items["id"].toString(),
//                                                 child: Text(items["floor_name"].toString()),
//                                               );
//                                             }).toList() : [],
//                                             validator: (value) {
//                                               if (value == null) {
//                                                 return 'Please select.';
//                                               }
//                                             },
//                                             onChanged: (value) {
//                                               controller.floorNo[index] =
//                                                   value.toString();
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   //USAGE TYPE
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Usage Type ",
//                                         style: GoogleFonts
//                                             .publicSans(
//                                           fontStyle: FontStyle
//                                               .normal,
//                                           fontWeight: FontWeight
//                                               .w700,
//                                           fontSize: 18,
//                                           color: Color(
//                                               0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets
//                                             .only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/check_1.png"),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius
//                                   .circular(0),
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets
//                                         .symmetric(
//                                         horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Text(
//                                             "Self Assessed  :  " +
//                                                 capitalizeFirstLetter(
//                                                     controller
//                                                         .floorsList
//                                                         .value[index]['usage_type']
//                                                         .toString()),
//                                             style: GoogleFonts
//                                                 .publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight
//                                                     .w600,
//                                                 fontStyle: FontStyle
//                                                     .normal,
//                                                 color: Colors
//                                                     .black
//                                             ),
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read(
//                                       'isUtc') && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets
//                                           .symmetric(
//                                           horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         children: [
//                                           Flexible(
//                                             child: Text(
//                                               "Agency Tc  :  " +
//                                                   capitalizeFirstLetter(
//                                                       controller
//                                                           .tcVerifyFloor
//                                                           .value[index]['usage_type']
//                                                           .toString() ??
//                                                           'N/A'),
//                                               style: GoogleFonts
//                                                   .publicSans(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight
//                                                       .w600,
//                                                   fontStyle: FontStyle
//                                                       .normal,
//                                                   color: Colors
//                                                       .black
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           children: [
//                                             //======Radio Start==========
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Correct'),
//                                                 value: '0',
//                                                 // groupValue:controller.floorCheckStatus[index],
//                                                 groupValue: controller
//                                                     .usagetypeCheckStatus
//                                                     .elementAt(
//                                                     index),
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .usagetypeCheckStatus[index] =
//                                                   value!;
//                                                   controller
//                                                       .isusagetypeEnable[index] =
//                                                   true;
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Wrong'),
//                                                 value: '1',
//                                                 // groupValue: controller.floorCheckStatus[index],
//                                                 groupValue: controller
//                                                     .usagetypeCheckStatus
//                                                     .elementAt(
//                                                     index),
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .usagetypeCheckStatus[index] =
//                                                   value!;
//                                                   controller
//                                                       .isusagetypeEnable[index] =
//                                                   false;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         //=======Radio End here=======
//                                         Padding(
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 25),
//                                           // child: controller.floorCheckStatus[index] == '0'
//                                           child: controller
//                                               .usagetypeCheckStatus
//                                               .elementAt(
//                                               index) == '0'
//                                               ? TextFormField(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .only(
//                                                   left: 35,
//                                                   right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius
//                                                       .circular(
//                                                       70),
//                                                   borderSide: BorderSide
//                                                       .none),
//                                               hintText: controller
//                                                   .floorsList
//                                                   .value[index]['usage_type']
//                                                   .toString(),
//                                               hintStyle: const TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors
//                                                       .black),),
//                                             enabled: false,
//                                           )
//                                               : DropdownButtonFormField2(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding:
//                                               EdgeInsets.zero,
//                                               enabledBorder: UnderlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     70),
//                                                 borderSide: BorderSide(
//                                                   color: Color(
//                                                       0xff263238),
//                                                   width: 0.1,
//                                                 ),
//                                               ),
//                                             ),
//                                             isExpanded: true,
//                                             hint: const Text(
//                                               'Select',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors
//                                                     .black,),
//                                             ),
//                                             icon: const Icon(
//                                               Icons
//                                                   .arrow_drop_down,
//                                               color: Colors
//                                                   .black45,
//                                             ),
//                                             iconSize: 35,
//                                             buttonHeight: 50,
//                                             buttonPadding:
//                                             EdgeInsets.only(
//                                                 left: 20,
//                                                 right: 25),
//                                             buttonElevation: 2,
//                                             itemHeight: 70,
//                                             itemPadding: EdgeInsets
//                                                 .only(
//                                                 left: 25,
//                                                 right: 25,
//                                                 bottom: 10),
//                                             dropdownMaxHeight: 300,
//                                             dropdownWidth: 310,
//                                             dropdownDecoration:
//                                             BoxDecoration(
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   5),),
//                                             items: controller
//                                                 .usageList
//                                                 ?.isNotEmpty ??
//                                                 false
//                                                 ? controller
//                                                 .usageList!
//                                                 .map((items) {
//                                               return DropdownMenuItem(
//                                                 value: items["id"]
//                                                     .toString(),
//                                                 child: Text(
//                                                     items["usage_type"]
//                                                         .toString()),
//                                               );
//                                             }).toList()
//                                                 : [],
//                                             validator: (
//                                                 value) {
//                                               if (value ==
//                                                   null) {
//                                                 return 'Please select.';
//                                               }
//                                             },
//                                             onChanged: (
//                                                 value) {
//                                               controller
//                                                   .useType[index] =
//                                                   value
//                                                       .toString();
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // OCCUPANCY TYPE
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Occupancy Type",
//                                         style: GoogleFonts
//                                             .publicSans(
//                                           fontStyle: FontStyle
//                                               .normal,
//                                           fontWeight: FontWeight
//                                               .w700,
//                                           fontSize: 18,
//                                           color: Color(
//                                               0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets
//                                             .only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/check_1.png"),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius
//                                   .circular(0),
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets
//                                         .symmetric(
//                                         horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Self Assessed  :  " +
//                                               capitalizeFirstLetter(
//                                                   controller
//                                                       .floorsList
//                                                       .value[index]['occupancy_type']
//                                                       .toString()),
//                                           style: GoogleFonts
//                                               .publicSans(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight
//                                                   .w600,
//                                               fontStyle: FontStyle
//                                                   .normal,
//                                               color: Colors
//                                                   .black
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read(
//                                       'isUtc') && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets
//                                           .symmetric(
//                                           horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Agency Tc  :  " +
//                                                 capitalizeFirstLetter(
//                                                     controller
//                                                         .tcVerifyFloor
//                                                         .value[index]['occupancy_type']
//                                                         .toString() ??
//                                                         'N/A'),
//                                             style: GoogleFonts
//                                                 .publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight
//                                                     .w600,
//                                                 fontStyle: FontStyle
//                                                     .normal,
//                                                 color: Colors
//                                                     .black
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           children: [
//                                             //======Radio Start==========
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Correct'),
//                                                 value: '0',
//                                                 // groupValue:controller.floorCheckStatus[index],
//                                                 groupValue: controller
//                                                     .occupancytypeCheckStatus
//                                                     .elementAt(
//                                                     index),
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .occupancytypeCheckStatus[index] =
//                                                   value!;
//                                                   controller
//                                                       .isoccupancytypeEnable[index] =
//                                                   true;
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Wrong'),
//                                                 value: '1',
//                                                 // groupValue: controller.floorCheckStatus[index],
//                                                 groupValue: controller
//                                                     .occupancytypeCheckStatus
//                                                     .elementAt(
//                                                     index),
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .occupancytypeCheckStatus[index] =
//                                                   value!;
//                                                   controller
//                                                       .isoccupancytypeEnable[index] =
//                                                   false;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         //=======Radio End here=======
//                                         Padding(
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 25),
//                                           // child: controller.floorCheckStatus[index] == '0'
//                                           child: controller
//                                               .occupancytypeCheckStatus
//                                               .elementAt(
//                                               index) == '0'
//                                               ? TextFormField(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .only(
//                                                   left: 35,
//                                                   right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius
//                                                       .circular(
//                                                       70),
//                                                   borderSide: BorderSide
//                                                       .none),
//                                               hintText: controller
//                                                   .floorsList
//                                                   .value[index]['occupancy_type']
//                                                   .toString(),
//                                               hintStyle: const TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors
//                                                       .black),
//                                             ),
//                                             enabled: false,
//                                           )
//                                               : DropdownButtonFormField2(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .zero,
//                                               enabledBorder: UnderlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     70),
//                                                 borderSide: BorderSide(
//                                                   color: Color(
//                                                       0xff263238),
//                                                   width: 0.1,
//                                                 ),
//                                               ),
//                                             ),
//                                             isExpanded: true,
//                                             hint: const Text(
//                                               'Select',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors
//                                                     .black,),
//                                             ),
//                                             icon: const Icon(
//                                               Icons
//                                                   .arrow_drop_down,
//                                               color: Colors
//                                                   .black45,
//                                             ),
//                                             iconSize: 35,
//                                             buttonHeight: 50,
//                                             buttonPadding:
//                                             EdgeInsets.only(
//                                                 left: 20,
//                                                 right: 25),
//                                             buttonElevation: 2,
//                                             itemHeight: 50,
//                                             itemPadding:
//                                             EdgeInsets.only(
//                                                 left: 25,
//                                                 right: 25),
//                                             dropdownMaxHeight: 250,
//                                             dropdownWidth: 310,
//                                             dropdownDecoration: BoxDecoration(
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   5),
//                                             ),
//                                             items: controller
//                                                 .occuppancyList
//                                                 ?.isNotEmpty ??
//                                                 false
//                                                 ? controller
//                                                 .occuppancyList!
//                                                 .map((items) {
//                                               return DropdownMenuItem(
//                                                 value: items["id"]
//                                                     .toString(),
//                                                 child: Text(
//                                                     items["occupancy_type"]
//                                                         .toString()),
//                                               );
//                                             }).toList() : [],
//                                             validator: (
//                                                 value) {
//                                               if (value ==
//                                                   null) {
//                                                 return 'Please select.';
//                                               }
//                                             },
//                                             onChanged: (
//                                                 value) {
//                                               controller
//                                                   .occupancyType[index] =
//                                                   value
//                                                       .toString();
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   //CONSTRUCTION TYPE
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Construction Type",
//                                         style: GoogleFonts
//                                             .publicSans(
//                                           fontStyle: FontStyle
//                                               .normal,
//                                           fontWeight: FontWeight
//                                               .w700,
//                                           fontSize: 18,
//                                           color: Color(
//                                               0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets
//                                             .only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/check_1.png"),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius
//                                   .circular(0),
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets
//                                         .symmetric(
//                                         horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Text(
//                                             "Self Assessed  :  " +
//                                                 capitalizeFirstLetter(
//                                                     controller
//                                                         .floorsList
//                                                         .value[index]['construction_type']
//                                                         .toString()),
//                                             style: GoogleFonts
//                                                 .publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight
//                                                     .w600,
//                                                 fontStyle: FontStyle
//                                                     .normal,
//                                                 color: Colors
//                                                     .black
//                                             ),
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read(
//                                       'isUtc') && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets
//                                           .symmetric(
//                                           horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         children: [
//                                           Flexible(
//                                             child: Text(
//                                               "Agency Tc  :  " +
//                                                   capitalizeFirstLetter(
//                                                       controller
//                                                           .tcVerifyFloor
//                                                           .value[index]['construction_type']
//                                                           .toString() ??
//                                                           'N/A'),
//                                               style: GoogleFonts
//                                                   .publicSans(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight
//                                                       .w600,
//                                                   fontStyle: FontStyle
//                                                       .normal,
//                                                   color: Colors
//                                                       .black
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           children: [
//                                             //======Radio Start==========
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Correct'),
//                                                 value: '0',
//                                                 groupValue: controller
//                                                     .constructiontypeCheckStatus
//                                                     .elementAt(
//                                                     index),
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .constructiontypeCheckStatus[index] =
//                                                   value!;
//                                                   controller
//                                                       .isconstructiontypeEnable[index] =
//                                                   true;
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Wrong'),
//                                                 value: '1',
//                                                 groupValue: controller
//                                                     .constructiontypeCheckStatus
//                                                     .elementAt(
//                                                     index),
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .constructiontypeCheckStatus[index] =
//                                                   value!;
//                                                   controller
//                                                       .isconstructiontypeEnable[index] =
//                                                   false;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         //=======Radio End here=======
//                                         Padding(
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 25),
//                                           // child: controller.floorCheckStatus[index] == '0'
//                                           child: controller
//                                               .constructiontypeCheckStatus
//                                               .elementAt(
//                                               index) == '0'
//                                               ? TextFormField(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .only(
//                                                   left: 35,
//                                                   right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius
//                                                       .circular(
//                                                       70),
//                                                   borderSide: BorderSide
//                                                       .none),
//                                               hintText: controller
//                                                   .floorsList
//                                                   .value[index]['construction_type']
//                                                   .toString(),
//                                               hintStyle: const TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors
//                                                       .black),),
//                                             enabled: false,
//                                           )
//                                               : DropdownButtonFormField2(
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .zero,
//                                               enabledBorder: UnderlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     70),
//                                                 borderSide: BorderSide(
//                                                   color: Color(
//                                                       0xff263238),
//                                                   width: 0.1,
//                                                 ),
//                                               ),
//                                             ),
//                                             isExpanded: true,
//                                             hint: const Text(
//                                               'Select',
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors
//                                                     .black,),
//                                             ),
//                                             icon: const Icon(
//                                               Icons
//                                                   .arrow_drop_down,
//                                               color: Colors
//                                                   .black45,
//                                             ),
//                                             iconSize: 35,
//                                             buttonHeight: 50,
//                                             buttonPadding:
//                                             EdgeInsets.only(
//                                                 left: 20,
//                                                 right: 25),
//                                             buttonElevation: 2,
//                                             itemHeight: 50,
//                                             itemPadding:
//                                             EdgeInsets.only(
//                                                 left: 25,
//                                                 right: 25),
//                                             dropdownMaxHeight: 250,
//                                             dropdownWidth: 310,
//                                             dropdownDecoration: BoxDecoration(
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   5),
//                                             ),
//                                             items: controller
//                                                 .constructionList
//                                                 ?.isNotEmpty ??
//                                                 false
//                                                 ? controller
//                                                 .constructionList!
//                                                 .map((items) {
//                                               return DropdownMenuItem(
//                                                 value: items["id"]
//                                                     .toString(),
//                                                 child: Text(
//                                                     items["construction_type"]
//                                                         .toString()),
//                                               );
//                                             }).toList() : [],
//                                             validator: (
//                                                 value) {
//                                               if (value ==
//                                                   null) {
//                                                 return 'Please select.';
//                                               }
//                                             },
//                                             onChanged: (
//                                                 value) {
//                                               controller
//                                                   .constructionType[index] =
//                                                   value
//                                                       .toString();
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // BUILD UP AREA
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Build Up Area(in Sq. ft)",
//                                         style: GoogleFonts
//                                             .publicSans(
//                                           fontStyle: FontStyle
//                                               .normal,
//                                           fontWeight: FontWeight
//                                               .w700,
//                                           fontSize: 18,
//                                           color: Color(
//                                               0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets
//                                             .only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/check_1.png"),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius
//                                   .circular(0),
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets
//                                         .symmetric(
//                                         horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Self Assessed  :  " +
//                                               (controller
//                                                   .floorsList[index]['builtup_area']
//                                                   .toString()),
//                                           style: GoogleFonts
//                                               .publicSans(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight
//                                                   .w600,
//                                               fontStyle: FontStyle
//                                                   .normal,
//                                               color: Colors
//                                                   .black
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read(
//                                       'isUtc') && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets
//                                           .symmetric(
//                                           horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Agency Tc  :  " +
//                                                 (controller
//                                                     .tcVerifyFloor
//                                                     .value[index]['builtup_area']
//                                                     .toString() ??
//                                                     'N/A'),
//                                             style: GoogleFonts
//                                                 .publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight
//                                                     .w600,
//                                                 fontStyle: FontStyle
//                                                     .normal,
//                                                 color: Colors
//                                                     .black
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           children: [
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Correct'),
//                                                 value: '0',
//                                                 groupValue: controller
//                                                     .builtupareaCheckStatus[
//                                                 index],
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .builtupareaCheckStatus[
//                                                   index] =
//                                                   value!;
//                                                   if (value ==
//                                                       '0') {
//                                                     controller
//                                                         .isbuiltupareaEnable[index] =
//                                                     false;
//                                                     controller
//                                                         .builtUpAreaControllers[index]
//                                                         .text =
//                                                     controller
//                                                         .floorsList[index]['builtup_area'];
//                                                     // TextEditingValue(text: controller.floorsList[index]['builtup_area']);
//                                                     // controller.builtUpAreaControllers[index] =
//                                                     //     // controller.floorsList[index]['builtup_area'].toString();
//                                                     //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['builtup_area'].toString()));
//                                                   } else {
//                                                     controller
//                                                         .builtUpAreaControllers[index]
//                                                         .text =
//                                                     ''; // Clear the text when switching to "Wrong"
//                                                     controller
//                                                         .isbuiltupareaEnable[index] =
//                                                     true;
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Wrong'),
//                                                 value: '1',
//                                                 groupValue: controller
//                                                     .builtupareaCheckStatus[index],
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .builtupareaCheckStatus[index] =
//                                                   value!;
//                                                   if (value ==
//                                                       '0') {
//                                                     controller
//                                                         .isbuiltupareaEnable[index] =
//                                                     false;
//                                                     // controller.builtUpAreaControllers[index].value = TextEditingValue(text: controller.floorsList[index]['builtup_area']);
//                                                   } else {
//                                                     controller
//                                                         .isbuiltupareaEnable[index] =
//                                                     true;
//                                                     controller
//                                                         .builtUpAreaControllers[index]
//                                                         .text =
//                                                     ''; // Clear the text when switching to "Wrong"
//
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 25),
//                                           child: controller
//                                               .isbuiltupareaEnable[index]
//                                               ? TextFormField(
//                                             controller: controller
//                                                 .builtUpAreaControllers[index],
//                                             keyboardType:
//                                             TextInputType
//                                                 .number,
//                                             inputFormatters: [
//                                               FilteringTextInputFormatter
//                                                   .digitsOnly
//                                             ],
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .only(
//                                                   left: 35,
//                                                   right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius
//                                                       .circular(
//                                                       70),
//                                                   borderSide: BorderSide
//                                                       .none),
//                                               hintText: ('Built up area'),
//                                               hintStyle: const TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.grey,
//                                               ),
//                                             ),
//                                             validator: (
//                                                 value) {
//                                               if (value!
//                                                   .isEmpty) {
//                                                 return 'Please enter';
//                                               }
//                                               return null;
//                                             },
//                                           )
//                                               : Container(
//                                             width: 500,
//                                             height: 45,
//                                             decoration: BoxDecoration(
//                                               color: Colors
//                                                   .grey[100],
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   70),),
//                                             child: Padding(
//                                               padding: const EdgeInsets
//                                                   .symmetric(
//                                                   horizontal: 32,
//                                                   vertical: 13),
//                                               child: Text(
//                                                 controller
//                                                     .builtUpAreaControllers[index]
//                                                     .text
//                                                     .isEmpty
//                                                     ? controller
//                                                     .floorsList[index]
//                                                 ['builtup_area']
//                                                     : controller
//                                                     .builtUpAreaControllers[index]
//                                                     .text,
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight
//                                                       .w400,
//                                                   color: Colors
//                                                       .black,),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // DATE FROM
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Date From",
//                                         style: GoogleFonts
//                                             .publicSans(
//                                           fontStyle: FontStyle
//                                               .normal,
//                                           fontWeight: FontWeight
//                                               .w700,
//                                           fontSize: 18,
//                                           color: Color(
//                                               0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets
//                                             .only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/check_1.png"),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius
//                                   .circular(0),
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets
//                                         .symmetric(
//                                         horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Self Assessed  :  " +
//                                               (controller
//                                                   .floorsList[index]['date_from']
//                                                   .toString()),
//                                           style: GoogleFonts
//                                               .publicSans(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight
//                                                   .w600,
//                                               fontStyle: FontStyle
//                                                   .normal,
//                                               color: Colors
//                                                   .black
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read(
//                                       'isUtc') && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets
//                                           .symmetric(
//                                           horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Agency Tc  :  " +
//                                                 (controller
//                                                     .tcVerifyFloor
//                                                     .value[index]['date_from']
//                                                     .toString() ??
//                                                     'N/A'),
//                                             style: GoogleFonts
//                                                 .publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight
//                                                     .w600,
//                                                 fontStyle: FontStyle
//                                                     .normal,
//                                                 color: Colors
//                                                     .black
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           children: [
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Correct'),
//                                                 value: '0',
//                                                 groupValue: controller
//                                                     .datefromCheckStatus[index],
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .datefromCheckStatus[index] =
//                                                   value!;
//                                                   if (value ==
//                                                       '0') {
//                                                     controller
//                                                         .isdatefromEnable[index] =
//                                                     false;
//                                                     controller
//                                                         .dateFromController[index]
//                                                         .value =
//                                                         TextEditingValue(
//                                                             text: controller
//                                                                 .floorsList[index]['date_from']);
//                                                     // controller.dateFromController[index].text =controller.floorsList[index]['date_from'].toString();
//                                                     //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_from'].toString()));
//                                                   } else {
//                                                     controller
//                                                         .dateFromController[index]
//                                                         .text =
//                                                     ''; // Clear the text when switching to "Wrong"
//                                                     controller
//                                                         .isdatefromEnable[index] =
//                                                     true;
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text(
//                                                     'Wrong'),
//                                                 value: '1',
//                                                 groupValue: controller
//                                                     .datefromCheckStatus[index],
//                                                 onChanged: (
//                                                     value) {
//                                                   controller
//                                                       .datefromCheckStatus[index] =
//                                                   value!;
//                                                   if (value ==
//                                                       '0') {
//                                                     controller
//                                                         .isdatefromEnable[index] =
//                                                     false;
//                                                     // controller.dateFromController[index].value =
//                                                     //     TextEditingValue(text: controller.floorsList[index]['date_from']);
//                                                   } else {
//                                                     controller
//                                                         .dateFromController[index]
//                                                         .text =
//                                                     ''; // Clear the text when switching to "Wrong"
//                                                     controller
//                                                         .isdatefromEnable[index] =
//                                                     true;
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 25),
//                                           child: controller
//                                               .isdatefromEnable[index]
//                                               ? DateTimeField(
//                                             controller: controller
//                                                 .dateFromController[index],
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors
//                                                   .grey[100],
//                                               contentPadding: EdgeInsets
//                                                   .only(
//                                                   left: 35,
//                                                   right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius
//                                                       .circular(
//                                                       70),
//                                                   borderSide: BorderSide
//                                                       .none),
//                                               suffixIcon: Icon(
//                                                   Icons
//                                                       .calendar_month_outlined),
//                                               hintText: ('dd-mm-yyyy'),
//                                               hintStyle: const TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.grey,
//                                               ),),
//                                             format: DateFormat(
//                                                 "yyyy-MM-dd"),
//                                             onShowPicker: (
//                                                 context,
//                                                 currentValue) {
//                                               return showDatePicker(
//                                                   context: context,
//                                                   firstDate: DateTime(
//                                                       1900),
//                                                   initialDate: currentValue ??
//                                                       DateTime
//                                                           .now(),
//                                                   lastDate: DateTime(
//                                                       2100));
//                                             },
//                                           )
//                                               : Container(
//                                             width: 500,
//                                             height: 45,
//                                             decoration: BoxDecoration(
//                                               color: Colors
//                                                   .grey[100],
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   70),),
//                                             child: Padding(
//                                               padding: const EdgeInsets
//                                                   .symmetric(
//                                                   horizontal: 32,
//                                                   vertical: 13),
//                                               child: Text(
//                                                 controller
//                                                     .dateFromController[index]
//                                                     .text
//                                                     .isEmpty
//                                                     ? controller
//                                                     .floorsList[index]['date_from']
//                                                     .toString()
//                                                     : controller
//                                                     .dateFromController[index]
//                                                     .text,
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight
//                                                       .w400,
//                                                   color: Colors
//                                                       .black,),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // DATE UPTO
//                   Container(
//                     height: 275,
//                     width: 357,
//                     decoration: const BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(
//                               142, 145, 147, 0.1),
//                           offset: Offset(0, 1),
//                           blurRadius: 1,
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           child: Container(
//                             height: 140,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   63, 148, 213, 1),
//                               borderRadius: BorderRadius
//                                   .circular(20),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets
//                                       .symmetric(
//                                       horizontal: 30),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Date Upto ",
//                                         style: GoogleFonts
//                                             .publicSans(
//                                           fontStyle: FontStyle
//                                               .normal,
//                                           fontWeight: FontWeight
//                                               .w700,
//                                           fontSize: 18,
//                                           color: Color(
//                                               0xFFFFFFFF),
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: const EdgeInsets
//                                             .only(top: 3),
//                                         height: 40,
//                                         width: 50,
//                                         decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/check_1.png"),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         //  ================================
//                         //  second white card
//                         //  ================================
//                         Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 230,
//                             width: 357,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFFFFF),
//                               borderRadius: BorderRadius
//                                   .circular(0),
//                             ),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceEvenly,
//                                 children: [
//                                   //=============================
//                                   //self assessed -1
//                                   //=============================
//                                   Padding(
//                                     padding: const EdgeInsets
//                                         .symmetric(
//                                         horizontal: 30),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Self Assessed  :  " +
//                                               (controller.floorsList[index]['date_upto'].toString() == '' ? 'N/A'
//                                                   : controller.floorsList[index]['date_upto'].toString()),
//                                           style: GoogleFonts
//                                               .publicSans(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight
//                                                   .w600,
//                                               fontStyle: FontStyle
//                                                   .normal,
//                                               color: Colors
//                                                   .black
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                   //AGENCY TC
//                                   if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Agency Tc  :  " +
//                                                 (controller.tcVerifyFloor.value[index]['date_upto'].toString() == '' ? 'N/A'
//                                                     : controller.tcVerifyFloor.value[index]['date_upto'].toString()),
//                                             style: GoogleFonts.publicSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w600,
//                                                 fontStyle: FontStyle.normal,
//                                                 color: Colors.black
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   //============================
//                                   //radio button
//                                   //============================
//                                   Obx(() {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text('Correct'),
//                                                 value: '0',
//                                                 groupValue: controller.dateUptoCheckStatus[index],
//                                                 onChanged: (value) {
//                                                   controller.dateUptoCheckStatus[index] = value!;
//                                                   if (value == '0') {
//                                                     controller.isdateUptoEnable[index] = false;
//                                                     controller.dateUptoController[index].value =
//                                                         TextEditingValue(
//                                                             text: controller.floorsList[index]['date_upto']);
//
//                                                     // controller.dateUptoController[index] =
//                                                     //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_upto'].toString()));
//
//                                                   } else {
//                                                     controller.dateUptoController[index].text = ''; // Clear the text when switching to "Wrong"
//                                                     controller.isdateUptoEnable[index] = true;
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: RadioListTile(
//                                                 title: Text('Wrong'),
//                                                 value: '1',
//                                                 groupValue: controller.dateUptoCheckStatus[index],
//                                                 onChanged: (value) {
//                                                   controller.dateUptoCheckStatus[index] = value!;
//                                                   if (value == '0') {
//                                                     controller.isdateUptoEnable[index] =
//                                                     false;
//                                                     controller.dateUptoController[index].value =
//                                                         TextEditingValue(
//                                                             text: controller.floorsList[index]['date_upto']);
//                                                   } else {
//                                                     controller.isdateUptoEnable[index] = true;
//                                                   }
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(horizontal: 25),
//                                           child: controller.isdateUptoEnable[index]
//                                               ? DateTimeField(
//                                             controller: controller.dateUptoController[index],
//                                             decoration: InputDecoration(
//                                               filled: true,
//                                               fillColor: Colors.grey[100],
//                                               contentPadding: EdgeInsets.only(left: 35, right: 10),
//                                               border: OutlineInputBorder(
//                                                   borderRadius: BorderRadius.circular(70),
//                                                   borderSide: BorderSide.none),
//                                               suffixIcon: Icon(
//                                                   Icons.calendar_month_outlined),
//                                               hintText: ('dd-mm-yyyy'),
//                                               hintStyle: const TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.grey,
//                                               ),),
//                                             format: DateFormat("yyyy-MM-dd"),
//                                             onShowPicker: (context, currentValue) {
//                                               return showDatePicker(
//                                                   context: context,
//                                                   firstDate: DateTime(1900),
//                                                   initialDate: currentValue ?? DateTime.now(),
//                                                   lastDate: DateTime(2100));
//                                             },
//                                           )
//                                               : Container(
//                                             width: 500,
//                                             height: 45,
//                                             decoration: BoxDecoration(
//                                               color: Colors.grey[100],
//                                               borderRadius: BorderRadius.circular(70),),
//                                             child: Padding(
//                                               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
//                                               child: Text(
//                                                 controller.dateUptoController[index].text.isEmpty
//                                                     ? controller.floorsList[index]['date_upto'].toString()
//                                                     : controller.dateUptoController[index].text,
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w400,
//                                                   color: Colors.black,),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ]),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// } // if (
//       // (
//       //     controller.floorsList.length == 0
//       //     )
//       // ) {
//       //   return const CircularProgressIndicator();
//       // } else {
//       //   if ( controller.floorsList.length == 0 || controller.propertyType.value == '4' || controller
//       //       .propertyType.value == 4 || controller.propertytype == "VACANT LAND" || controller.tcPropertyType == "VACANT LAND") {
//       //     return Padding(
//       //       padding: const EdgeInsets.all(12.0),
//       //       child: Container(
//       //         decoration: BoxDecoration(
//       //           color: Colors.red[100],
//       //           borderRadius: BorderRadius.circular(15.0),
//       //           boxShadow: [
//       //             BoxShadow(
//       //               color: Colors.grey.withOpacity(0.5),
//       //               spreadRadius: 1,
//       //               blurRadius: 1,
//       //               offset: Offset(0, 1),
//       //             ),
//       //           ],
//       //         ),
//       //         child: Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Row(
//       //             children: [
//       //               SizedBox(width: 14),
//       //               Expanded(
//       //                 child: RichText(
//       //                   text: TextSpan(
//       //                     children: [
//       //                       WidgetSpan(
//       //                         child: Padding(
//       //                           padding: EdgeInsets.only(
//       //                               top: 3,
//       //                               right: 4,
//       //                               bottom: 1),
//       //                           child: Icon(Icons.info_outlined,
//       //                               color: Colors.red,
//       //                               size: 20),
//       //                         ),
//       //                       ),
//       //                       TextSpan(
//       //                         text:
//       //                         "There is no floor as it is vacant land ",
//       //                         style: GoogleFonts.publicSans(
//       //                           fontWeight: FontWeight.w500,
//       //                           fontSize: 15,
//       //                           fontStyle: FontStyle.normal,
//       //                           color: Colors.red,
//       //                         ),
//       //                       ),
//       //                     ],
//       //                   ),
//       //                 ),
//       //               ),
//       //             ],
//       //           ),
//       //         ),
//       //       ),
//       //     );
//       //   } else {
//       //     return Column(
//       //       children: [
//       //         ListView.builder(
//       //           shrinkWrap: true,
//       //           physics: NeverScrollableScrollPhysics(),
//       //           itemCount: controller.floorsList.value.length,
//       //           itemBuilder: (BuildContext context, int index) {
//       //             String floorId = controller.floorsList
//       //                 .value[index]['id'];
//       //             controller.totalFloors.value =
//       //                 controller.floorsList.value.length;
//       //             return Container(
//       //               child: Column(
//       //                 children: [
//       //                   // Floor Number Container
//       //                   Container(
//       //                       padding: const EdgeInsets.all(10),
//       //                       child: Text(
//       //                         'Floor ${index + 1}.',
//       //                         style: TextStyle(
//       //                           fontWeight: FontWeight.bold,
//       //                           fontSize: 20,
//       //                         ),
//       //                       )
//       //                   ),
//       //                   // FLOOR TYPE
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Floor",
//       //                                         style: GoogleFonts.publicSans(
//       //                                           fontStyle: FontStyle.normal,
//       //                                           fontWeight: FontWeight.w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets.only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage("assets/images/check_1.png"),)),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius.circular(0),),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets.symmetric(horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment.spaceBetween,
//       //                                       children: [
//       //                                         Text(
//       //                                           "Self Assessed  :  " + capitalizeFirstLetter(controller.floorsList.value[index]['floor_name'].toString()),
//       //                                           style: GoogleFonts.publicSans(
//       //                                               fontSize: 16,
//       //                                               fontWeight: FontWeight.w600,
//       //                                               fontStyle: FontStyle.normal,
//       //                                               color: Colors.black
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets.symmetric(horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment:
//       //                                         MainAxisAlignment.spaceBetween,
//       //                                         children: [
//       //                                           Text(
//       //                                             "Agency Tc  :  " +
//       //                                                 capitalizeFirstLetter(controller.tcVerifyFloor.value[index]['floor_name']?.toString() ?? 'N/A'),
//       //                                             style: GoogleFonts
//       //                                                 .publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight.w600,
//       //                                                 fontStyle: FontStyle.normal,
//       //                                                 color: Colors.black
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment.spaceBetween,
//       //                                           children: [
//       //                                             //======Radio Start==========
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text('Correct'),
//       //                                                 value: '0',
//       //                                                 // groupValue:controller.floorCheckStatus[index],
//       //                                                 groupValue: controller.floorCheckStatus.elementAt(index),
//       //                                                 onChanged: (value) {
//       //                                                   controller.floorCheckStatus[index] = value!;
//       //                                                   controller.isfloorEnable[index] = true;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text('Wrong'),
//       //                                                 value: '1',
//       //                                                 // groupValue: controller.floorCheckStatus[index],
//       //                                                 groupValue: controller.floorCheckStatus.elementAt(index),
//       //                                                 onChanged: (value) {
//       //                                                   controller.floorCheckStatus[index] = value!;
//       //                                                   controller.isfloorEnable[index] = false;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         //=======Radio End here=======
//       //                                         Padding(
//       //                                           padding: const EdgeInsets
//       //                                               .symmetric(
//       //                                               horizontal: 25),
//       //                                           child: controller.floorCheckStatus.elementAt(index) == '0'
//       //                                               ? TextFormField(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors.grey[100],
//       //                                               contentPadding: EdgeInsets.only(
//       //                                                   left: 35,
//       //                                                   right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius.circular(70),
//       //                                                   borderSide: BorderSide.none),
//       //                                               hintText: controller.floorsList.value[index]['floor_name'].toString(),
//       //                                               hintStyle: const TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   color: Colors.black),
//       //                                             ),
//       //                                             enabled: false,
//       //                                           )
//       //                                               : DropdownButtonFormField2(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding:
//       //                                               EdgeInsets.zero,
//       //                                               enabledBorder:
//       //                                               UnderlineInputBorder(
//       //                                                 borderRadius:
//       //                                                 BorderRadius.circular(70),
//       //                                                 borderSide: BorderSide(
//       //                                                   color: Color(0xff263238),
//       //                                                   width: 0.1,
//       //                                                 ),
//       //                                               ),
//       //                                             ),
//       //                                             isExpanded: true,
//       //                                             hint: const Text(
//       //                                               'Select',
//       //                                               style: TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors.black,
//       //                                               ),
//       //                                             ),
//       //                                             icon: const Icon(
//       //                                               Icons.arrow_drop_down,
//       //                                               color: Colors.black45,
//       //                                             ),
//       //                                             iconSize: 35,
//       //                                             buttonHeight: 50,
//       //                                             buttonPadding:
//       //                                             EdgeInsets.only(
//       //                                                 left: 20,
//       //                                                 right: 25),
//       //                                             buttonElevation: 2,
//       //                                             itemHeight: 50,
//       //                                             itemPadding: EdgeInsets.only(
//       //                                                 left: 25,
//       //                                                 right: 25),
//       //                                             dropdownMaxHeight: 300,
//       //                                             dropdownWidth: 310,
//       //                                             dropdownDecoration:
//       //                                             BoxDecoration(
//       //                                               borderRadius: BorderRadius.circular(5),
//       //                                             ),
//       //                                             items: controller.floorList?.isNotEmpty ?? false ? controller.floorList!
//       //                                                 .map((items) {
//       //                                               return DropdownMenuItem(
//       //                                                 value: items["id"].toString(),
//       //                                                 child: Text(items["floor_name"].toString()),
//       //                                               );
//       //                                             }).toList() : [],
//       //                                             validator: (value) {
//       //                                               if (value == null) {
//       //                                                 return 'Please select.';
//       //                                               }
//       //                                             },
//       //                                             onChanged: (value) {
//       //                                               controller.floorNo[index] =
//       //                                                   value.toString();
//       //                                             },
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                   //USAGE TYPE
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Usage Type ",
//       //                                         style: GoogleFonts
//       //                                             .publicSans(
//       //                                           fontStyle: FontStyle
//       //                                               .normal,
//       //                                           fontWeight: FontWeight
//       //                                               .w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(
//       //                                               0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets
//       //                                             .only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage(
//       //                                                   "assets/images/check_1.png"),
//       //                                             )),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(0),
//       //                             ),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment
//       //                                     .spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets
//       //                                         .symmetric(
//       //                                         horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment
//       //                                           .spaceBetween,
//       //                                       children: [
//       //                                         Flexible(
//       //                                           child: Text(
//       //                                             "Self Assessed  :  " +
//       //                                                 capitalizeFirstLetter(
//       //                                                     controller
//       //                                                         .floorsList
//       //                                                         .value[index]['usage_type']
//       //                                                         .toString()),
//       //                                             style: GoogleFonts
//       //                                                 .publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight
//       //                                                     .w600,
//       //                                                 fontStyle: FontStyle
//       //                                                     .normal,
//       //                                                 color: Colors
//       //                                                     .black
//       //                                             ),
//       //                                           ),
//       //                                         ),
//       //
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read(
//       //                                       'isUtc') && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets
//       //                                           .symmetric(
//       //                                           horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment:
//       //                                         MainAxisAlignment
//       //                                             .spaceBetween,
//       //                                         children: [
//       //                                           Flexible(
//       //                                             child: Text(
//       //                                               "Agency Tc  :  " +
//       //                                                   capitalizeFirstLetter(
//       //                                                       controller
//       //                                                           .tcVerifyFloor
//       //                                                           .value[index]['usage_type']
//       //                                                           .toString() ??
//       //                                                           'N/A'),
//       //                                               style: GoogleFonts
//       //                                                   .publicSans(
//       //                                                   fontSize: 16,
//       //                                                   fontWeight: FontWeight
//       //                                                       .w600,
//       //                                                   fontStyle: FontStyle
//       //                                                       .normal,
//       //                                                   color: Colors
//       //                                                       .black
//       //                                               ),
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment
//       //                                               .spaceBetween,
//       //                                           children: [
//       //                                             //======Radio Start==========
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Correct'),
//       //                                                 value: '0',
//       //                                                 // groupValue:controller.floorCheckStatus[index],
//       //                                                 groupValue: controller
//       //                                                     .usagetypeCheckStatus
//       //                                                     .elementAt(
//       //                                                     index),
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .usagetypeCheckStatus[index] =
//       //                                                   value!;
//       //                                                   controller
//       //                                                       .isusagetypeEnable[index] =
//       //                                                   true;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Wrong'),
//       //                                                 value: '1',
//       //                                                 // groupValue: controller.floorCheckStatus[index],
//       //                                                 groupValue: controller
//       //                                                     .usagetypeCheckStatus
//       //                                                     .elementAt(
//       //                                                     index),
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .usagetypeCheckStatus[index] =
//       //                                                   value!;
//       //                                                   controller
//       //                                                       .isusagetypeEnable[index] =
//       //                                                   false;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         //=======Radio End here=======
//       //                                         Padding(
//       //                                           padding: const EdgeInsets
//       //                                               .symmetric(
//       //                                               horizontal: 25),
//       //                                           // child: controller.floorCheckStatus[index] == '0'
//       //                                           child: controller
//       //                                               .usagetypeCheckStatus
//       //                                               .elementAt(
//       //                                               index) == '0'
//       //                                               ? TextFormField(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .only(
//       //                                                   left: 35,
//       //                                                   right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius
//       //                                                       .circular(
//       //                                                       70),
//       //                                                   borderSide: BorderSide
//       //                                                       .none),
//       //                                               hintText: controller
//       //                                                   .floorsList
//       //                                                   .value[index]['usage_type']
//       //                                                   .toString(),
//       //                                               hintStyle: const TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   color: Colors
//       //                                                       .black),),
//       //                                             enabled: false,
//       //                                           )
//       //                                               : DropdownButtonFormField2(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding:
//       //                                               EdgeInsets.zero,
//       //                                               enabledBorder: UnderlineInputBorder(
//       //                                                 borderRadius:
//       //                                                 BorderRadius
//       //                                                     .circular(
//       //                                                     70),
//       //                                                 borderSide: BorderSide(
//       //                                                   color: Color(
//       //                                                       0xff263238),
//       //                                                   width: 0.1,
//       //                                                 ),
//       //                                               ),
//       //                                             ),
//       //                                             isExpanded: true,
//       //                                             hint: const Text(
//       //                                               'Select',
//       //                                               style: TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors
//       //                                                     .black,),
//       //                                             ),
//       //                                             icon: const Icon(
//       //                                               Icons
//       //                                                   .arrow_drop_down,
//       //                                               color: Colors
//       //                                                   .black45,
//       //                                             ),
//       //                                             iconSize: 35,
//       //                                             buttonHeight: 50,
//       //                                             buttonPadding:
//       //                                             EdgeInsets.only(
//       //                                                 left: 20,
//       //                                                 right: 25),
//       //                                             buttonElevation: 2,
//       //                                             itemHeight: 70,
//       //                                             itemPadding: EdgeInsets
//       //                                                 .only(
//       //                                                 left: 25,
//       //                                                 right: 25,
//       //                                                 bottom: 10),
//       //                                             dropdownMaxHeight: 300,
//       //                                             dropdownWidth: 310,
//       //                                             dropdownDecoration:
//       //                                             BoxDecoration(
//       //                                               borderRadius: BorderRadius
//       //                                                   .circular(
//       //                                                   5),),
//       //                                             items: controller
//       //                                                 .usageList
//       //                                                 ?.isNotEmpty ??
//       //                                                 false
//       //                                                 ? controller
//       //                                                 .usageList!
//       //                                                 .map((items) {
//       //                                               return DropdownMenuItem(
//       //                                                 value: items["id"]
//       //                                                     .toString(),
//       //                                                 child: Text(
//       //                                                     items["usage_type"]
//       //                                                         .toString()),
//       //                                               );
//       //                                             }).toList()
//       //                                                 : [],
//       //                                             validator: (
//       //                                                 value) {
//       //                                               if (value ==
//       //                                                   null) {
//       //                                                 return 'Please select.';
//       //                                               }
//       //                                             },
//       //                                             onChanged: (
//       //                                                 value) {
//       //                                               controller
//       //                                                   .useType[index] =
//       //                                                   value
//       //                                                       .toString();
//       //                                             },
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                   // OCCUPANCY TYPE
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Occupancy Type",
//       //                                         style: GoogleFonts
//       //                                             .publicSans(
//       //                                           fontStyle: FontStyle
//       //                                               .normal,
//       //                                           fontWeight: FontWeight
//       //                                               .w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(
//       //                                               0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets
//       //                                             .only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage(
//       //                                                   "assets/images/check_1.png"),
//       //                                             )),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(0),
//       //                             ),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment
//       //                                     .spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets
//       //                                         .symmetric(
//       //                                         horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment
//       //                                           .spaceBetween,
//       //                                       children: [
//       //                                         Text(
//       //                                           "Self Assessed  :  " +
//       //                                               capitalizeFirstLetter(
//       //                                                   controller
//       //                                                       .floorsList
//       //                                                       .value[index]['occupancy_type']
//       //                                                       .toString()),
//       //                                           style: GoogleFonts
//       //                                               .publicSans(
//       //                                               fontSize: 16,
//       //                                               fontWeight: FontWeight
//       //                                                   .w600,
//       //                                               fontStyle: FontStyle
//       //                                                   .normal,
//       //                                               color: Colors
//       //                                                   .black
//       //                                           ),
//       //                                         ),
//       //
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read(
//       //                                       'isUtc') && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets
//       //                                           .symmetric(
//       //                                           horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment:
//       //                                         MainAxisAlignment
//       //                                             .spaceBetween,
//       //                                         children: [
//       //                                           Text(
//       //                                             "Agency Tc  :  " +
//       //                                                 capitalizeFirstLetter(
//       //                                                     controller
//       //                                                         .tcVerifyFloor
//       //                                                         .value[index]['occupancy_type']
//       //                                                         .toString() ??
//       //                                                         'N/A'),
//       //                                             style: GoogleFonts
//       //                                                 .publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight
//       //                                                     .w600,
//       //                                                 fontStyle: FontStyle
//       //                                                     .normal,
//       //                                                 color: Colors
//       //                                                     .black
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment
//       //                                               .spaceBetween,
//       //                                           children: [
//       //                                             //======Radio Start==========
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Correct'),
//       //                                                 value: '0',
//       //                                                 // groupValue:controller.floorCheckStatus[index],
//       //                                                 groupValue: controller
//       //                                                     .occupancytypeCheckStatus
//       //                                                     .elementAt(
//       //                                                     index),
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .occupancytypeCheckStatus[index] =
//       //                                                   value!;
//       //                                                   controller
//       //                                                       .isoccupancytypeEnable[index] =
//       //                                                   true;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Wrong'),
//       //                                                 value: '1',
//       //                                                 // groupValue: controller.floorCheckStatus[index],
//       //                                                 groupValue: controller
//       //                                                     .occupancytypeCheckStatus
//       //                                                     .elementAt(
//       //                                                     index),
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .occupancytypeCheckStatus[index] =
//       //                                                   value!;
//       //                                                   controller
//       //                                                       .isoccupancytypeEnable[index] =
//       //                                                   false;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         //=======Radio End here=======
//       //                                         Padding(
//       //                                           padding: const EdgeInsets
//       //                                               .symmetric(
//       //                                               horizontal: 25),
//       //                                           // child: controller.floorCheckStatus[index] == '0'
//       //                                           child: controller
//       //                                               .occupancytypeCheckStatus
//       //                                               .elementAt(
//       //                                               index) == '0'
//       //                                               ? TextFormField(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .only(
//       //                                                   left: 35,
//       //                                                   right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius
//       //                                                       .circular(
//       //                                                       70),
//       //                                                   borderSide: BorderSide
//       //                                                       .none),
//       //                                               hintText: controller
//       //                                                   .floorsList
//       //                                                   .value[index]['occupancy_type']
//       //                                                   .toString(),
//       //                                               hintStyle: const TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   color: Colors
//       //                                                       .black),
//       //                                             ),
//       //                                             enabled: false,
//       //                                           )
//       //                                               : DropdownButtonFormField2(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .zero,
//       //                                               enabledBorder: UnderlineInputBorder(
//       //                                                 borderRadius:
//       //                                                 BorderRadius
//       //                                                     .circular(
//       //                                                     70),
//       //                                                 borderSide: BorderSide(
//       //                                                   color: Color(
//       //                                                       0xff263238),
//       //                                                   width: 0.1,
//       //                                                 ),
//       //                                               ),
//       //                                             ),
//       //                                             isExpanded: true,
//       //                                             hint: const Text(
//       //                                               'Select',
//       //                                               style: TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors
//       //                                                     .black,),
//       //                                             ),
//       //                                             icon: const Icon(
//       //                                               Icons
//       //                                                   .arrow_drop_down,
//       //                                               color: Colors
//       //                                                   .black45,
//       //                                             ),
//       //                                             iconSize: 35,
//       //                                             buttonHeight: 50,
//       //                                             buttonPadding:
//       //                                             EdgeInsets.only(
//       //                                                 left: 20,
//       //                                                 right: 25),
//       //                                             buttonElevation: 2,
//       //                                             itemHeight: 50,
//       //                                             itemPadding:
//       //                                             EdgeInsets.only(
//       //                                                 left: 25,
//       //                                                 right: 25),
//       //                                             dropdownMaxHeight: 250,
//       //                                             dropdownWidth: 310,
//       //                                             dropdownDecoration: BoxDecoration(
//       //                                               borderRadius: BorderRadius
//       //                                                   .circular(
//       //                                                   5),
//       //                                             ),
//       //                                             items: controller
//       //                                                 .occuppancyList
//       //                                                 ?.isNotEmpty ??
//       //                                                 false
//       //                                                 ? controller
//       //                                                 .occuppancyList!
//       //                                                 .map((items) {
//       //                                               return DropdownMenuItem(
//       //                                                 value: items["id"]
//       //                                                     .toString(),
//       //                                                 child: Text(
//       //                                                     items["occupancy_type"]
//       //                                                         .toString()),
//       //                                               );
//       //                                             }).toList() : [],
//       //                                             validator: (
//       //                                                 value) {
//       //                                               if (value ==
//       //                                                   null) {
//       //                                                 return 'Please select.';
//       //                                               }
//       //                                             },
//       //                                             onChanged: (
//       //                                                 value) {
//       //                                               controller
//       //                                                   .occupancyType[index] =
//       //                                                   value
//       //                                                       .toString();
//       //                                             },
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                   //CONSTRUCTION TYPE
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Construction Type",
//       //                                         style: GoogleFonts
//       //                                             .publicSans(
//       //                                           fontStyle: FontStyle
//       //                                               .normal,
//       //                                           fontWeight: FontWeight
//       //                                               .w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(
//       //                                               0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets
//       //                                             .only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage(
//       //                                                   "assets/images/check_1.png"),
//       //                                             )),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(0),
//       //                             ),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment
//       //                                     .spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets
//       //                                         .symmetric(
//       //                                         horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment
//       //                                           .spaceBetween,
//       //                                       children: [
//       //                                         Flexible(
//       //                                           child: Text(
//       //                                             "Self Assessed  :  " +
//       //                                                 capitalizeFirstLetter(
//       //                                                     controller
//       //                                                         .floorsList
//       //                                                         .value[index]['construction_type']
//       //                                                         .toString()),
//       //                                             style: GoogleFonts
//       //                                                 .publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight
//       //                                                     .w600,
//       //                                                 fontStyle: FontStyle
//       //                                                     .normal,
//       //                                                 color: Colors
//       //                                                     .black
//       //                                             ),
//       //                                           ),
//       //                                         ),
//       //
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read(
//       //                                       'isUtc') && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets
//       //                                           .symmetric(
//       //                                           horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment:
//       //                                         MainAxisAlignment
//       //                                             .spaceBetween,
//       //                                         children: [
//       //                                           Flexible(
//       //                                             child: Text(
//       //                                               "Agency Tc  :  " +
//       //                                                   capitalizeFirstLetter(
//       //                                                       controller
//       //                                                           .tcVerifyFloor
//       //                                                           .value[index]['construction_type']
//       //                                                           .toString() ??
//       //                                                           'N/A'),
//       //                                               style: GoogleFonts
//       //                                                   .publicSans(
//       //                                                   fontSize: 16,
//       //                                                   fontWeight: FontWeight
//       //                                                       .w600,
//       //                                                   fontStyle: FontStyle
//       //                                                       .normal,
//       //                                                   color: Colors
//       //                                                       .black
//       //                                               ),
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment
//       //                                               .spaceBetween,
//       //                                           children: [
//       //                                             //======Radio Start==========
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Correct'),
//       //                                                 value: '0',
//       //                                                 groupValue: controller
//       //                                                     .constructiontypeCheckStatus
//       //                                                     .elementAt(
//       //                                                     index),
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .constructiontypeCheckStatus[index] =
//       //                                                   value!;
//       //                                                   controller
//       //                                                       .isconstructiontypeEnable[index] =
//       //                                                   true;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Wrong'),
//       //                                                 value: '1',
//       //                                                 groupValue: controller
//       //                                                     .constructiontypeCheckStatus
//       //                                                     .elementAt(
//       //                                                     index),
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .constructiontypeCheckStatus[index] =
//       //                                                   value!;
//       //                                                   controller
//       //                                                       .isconstructiontypeEnable[index] =
//       //                                                   false;
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         //=======Radio End here=======
//       //                                         Padding(
//       //                                           padding: const EdgeInsets
//       //                                               .symmetric(
//       //                                               horizontal: 25),
//       //                                           // child: controller.floorCheckStatus[index] == '0'
//       //                                           child: controller
//       //                                               .constructiontypeCheckStatus
//       //                                               .elementAt(
//       //                                               index) == '0'
//       //                                               ? TextFormField(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .only(
//       //                                                   left: 35,
//       //                                                   right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius
//       //                                                       .circular(
//       //                                                       70),
//       //                                                   borderSide: BorderSide
//       //                                                       .none),
//       //                                               hintText: controller
//       //                                                   .floorsList
//       //                                                   .value[index]['construction_type']
//       //                                                   .toString(),
//       //                                               hintStyle: const TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   color: Colors
//       //                                                       .black),),
//       //                                             enabled: false,
//       //                                           )
//       //                                               : DropdownButtonFormField2(
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .zero,
//       //                                               enabledBorder: UnderlineInputBorder(
//       //                                                 borderRadius:
//       //                                                 BorderRadius
//       //                                                     .circular(
//       //                                                     70),
//       //                                                 borderSide: BorderSide(
//       //                                                   color: Color(
//       //                                                       0xff263238),
//       //                                                   width: 0.1,
//       //                                                 ),
//       //                                               ),
//       //                                             ),
//       //                                             isExpanded: true,
//       //                                             hint: const Text(
//       //                                               'Select',
//       //                                               style: TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors
//       //                                                     .black,),
//       //                                             ),
//       //                                             icon: const Icon(
//       //                                               Icons
//       //                                                   .arrow_drop_down,
//       //                                               color: Colors
//       //                                                   .black45,
//       //                                             ),
//       //                                             iconSize: 35,
//       //                                             buttonHeight: 50,
//       //                                             buttonPadding:
//       //                                             EdgeInsets.only(
//       //                                                 left: 20,
//       //                                                 right: 25),
//       //                                             buttonElevation: 2,
//       //                                             itemHeight: 50,
//       //                                             itemPadding:
//       //                                             EdgeInsets.only(
//       //                                                 left: 25,
//       //                                                 right: 25),
//       //                                             dropdownMaxHeight: 250,
//       //                                             dropdownWidth: 310,
//       //                                             dropdownDecoration: BoxDecoration(
//       //                                               borderRadius: BorderRadius
//       //                                                   .circular(
//       //                                                   5),
//       //                                             ),
//       //                                             items: controller
//       //                                                 .constructionList
//       //                                                 ?.isNotEmpty ??
//       //                                                 false
//       //                                                 ? controller
//       //                                                 .constructionList!
//       //                                                 .map((items) {
//       //                                               return DropdownMenuItem(
//       //                                                 value: items["id"]
//       //                                                     .toString(),
//       //                                                 child: Text(
//       //                                                     items["construction_type"]
//       //                                                         .toString()),
//       //                                               );
//       //                                             }).toList() : [],
//       //                                             validator: (
//       //                                                 value) {
//       //                                               if (value ==
//       //                                                   null) {
//       //                                                 return 'Please select.';
//       //                                               }
//       //                                             },
//       //                                             onChanged: (
//       //                                                 value) {
//       //                                               controller
//       //                                                   .constructionType[index] =
//       //                                                   value
//       //                                                       .toString();
//       //                                             },
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                   // BUILD UP AREA
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Build Up Area(in Sq. ft)",
//       //                                         style: GoogleFonts
//       //                                             .publicSans(
//       //                                           fontStyle: FontStyle
//       //                                               .normal,
//       //                                           fontWeight: FontWeight
//       //                                               .w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(
//       //                                               0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets
//       //                                             .only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage(
//       //                                                   "assets/images/check_1.png"),
//       //                                             )),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(0),
//       //                             ),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment
//       //                                     .spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets
//       //                                         .symmetric(
//       //                                         horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment
//       //                                           .spaceBetween,
//       //                                       children: [
//       //                                         Text(
//       //                                           "Self Assessed  :  " +
//       //                                               (controller
//       //                                                   .floorsList[index]['builtup_area']
//       //                                                   .toString()),
//       //                                           style: GoogleFonts
//       //                                               .publicSans(
//       //                                               fontSize: 16,
//       //                                               fontWeight: FontWeight
//       //                                                   .w600,
//       //                                               fontStyle: FontStyle
//       //                                                   .normal,
//       //                                               color: Colors
//       //                                                   .black
//       //                                           ),
//       //                                         ),
//       //
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read(
//       //                                       'isUtc') && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets
//       //                                           .symmetric(
//       //                                           horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment:
//       //                                         MainAxisAlignment
//       //                                             .spaceBetween,
//       //                                         children: [
//       //                                           Text(
//       //                                             "Agency Tc  :  " +
//       //                                                 (controller
//       //                                                     .tcVerifyFloor
//       //                                                     .value[index]['builtup_area']
//       //                                                     .toString() ??
//       //                                                     'N/A'),
//       //                                             style: GoogleFonts
//       //                                                 .publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight
//       //                                                     .w600,
//       //                                                 fontStyle: FontStyle
//       //                                                     .normal,
//       //                                                 color: Colors
//       //                                                     .black
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment
//       //                                               .spaceBetween,
//       //                                           children: [
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Correct'),
//       //                                                 value: '0',
//       //                                                 groupValue: controller
//       //                                                     .builtupareaCheckStatus[
//       //                                                 index],
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .builtupareaCheckStatus[
//       //                                                   index] =
//       //                                                   value!;
//       //                                                   if (value ==
//       //                                                       '0') {
//       //                                                     controller
//       //                                                         .isbuiltupareaEnable[index] =
//       //                                                     false;
//       //                                                     controller
//       //                                                         .builtUpAreaControllers[index]
//       //                                                         .text =
//       //                                                     controller
//       //                                                         .floorsList[index]['builtup_area'];
//       //                                                     // TextEditingValue(text: controller.floorsList[index]['builtup_area']);
//       //                                                     // controller.builtUpAreaControllers[index] =
//       //                                                     //     // controller.floorsList[index]['builtup_area'].toString();
//       //                                                     //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['builtup_area'].toString()));
//       //                                                   } else {
//       //                                                     controller
//       //                                                         .builtUpAreaControllers[index]
//       //                                                         .text =
//       //                                                     ''; // Clear the text when switching to "Wrong"
//       //                                                     controller
//       //                                                         .isbuiltupareaEnable[index] =
//       //                                                     true;
//       //                                                   }
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Wrong'),
//       //                                                 value: '1',
//       //                                                 groupValue: controller
//       //                                                     .builtupareaCheckStatus[index],
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .builtupareaCheckStatus[index] =
//       //                                                   value!;
//       //                                                   if (value ==
//       //                                                       '0') {
//       //                                                     controller
//       //                                                         .isbuiltupareaEnable[index] =
//       //                                                     false;
//       //                                                     // controller.builtUpAreaControllers[index].value = TextEditingValue(text: controller.floorsList[index]['builtup_area']);
//       //                                                   } else {
//       //                                                     controller
//       //                                                         .isbuiltupareaEnable[index] =
//       //                                                     true;
//       //                                                     controller
//       //                                                         .builtUpAreaControllers[index]
//       //                                                         .text =
//       //                                                     ''; // Clear the text when switching to "Wrong"
//       //
//       //                                                   }
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         Padding(
//       //                                           padding: const EdgeInsets
//       //                                               .symmetric(
//       //                                               horizontal: 25),
//       //                                           child: controller
//       //                                               .isbuiltupareaEnable[index]
//       //                                               ? TextFormField(
//       //                                             controller: controller
//       //                                                 .builtUpAreaControllers[index],
//       //                                             keyboardType:
//       //                                             TextInputType
//       //                                                 .number,
//       //                                             inputFormatters: [
//       //                                               FilteringTextInputFormatter
//       //                                                   .digitsOnly
//       //                                             ],
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .only(
//       //                                                   left: 35,
//       //                                                   right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius
//       //                                                       .circular(
//       //                                                       70),
//       //                                                   borderSide: BorderSide
//       //                                                       .none),
//       //                                               hintText: ('Built up area'),
//       //                                               hintStyle: const TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors.grey,
//       //                                               ),
//       //                                             ),
//       //                                             validator: (
//       //                                                 value) {
//       //                                               if (value!
//       //                                                   .isEmpty) {
//       //                                                 return 'Please enter';
//       //                                               }
//       //                                               return null;
//       //                                             },
//       //                                           )
//       //                                               : Container(
//       //                                             width: 500,
//       //                                             height: 45,
//       //                                             decoration: BoxDecoration(
//       //                                               color: Colors
//       //                                                   .grey[100],
//       //                                               borderRadius: BorderRadius
//       //                                                   .circular(
//       //                                                   70),),
//       //                                             child: Padding(
//       //                                               padding: const EdgeInsets
//       //                                                   .symmetric(
//       //                                                   horizontal: 32,
//       //                                                   vertical: 13),
//       //                                               child: Text(
//       //                                                 controller
//       //                                                     .builtUpAreaControllers[index]
//       //                                                     .text
//       //                                                     .isEmpty
//       //                                                     ? controller
//       //                                                     .floorsList[index]
//       //                                                 ['builtup_area']
//       //                                                     : controller
//       //                                                     .builtUpAreaControllers[index]
//       //                                                     .text,
//       //                                                 style: TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   fontWeight: FontWeight
//       //                                                       .w400,
//       //                                                   color: Colors
//       //                                                       .black,),
//       //                                               ),
//       //                                             ),
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                   // DATE FROM
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Date From",
//       //                                         style: GoogleFonts
//       //                                             .publicSans(
//       //                                           fontStyle: FontStyle
//       //                                               .normal,
//       //                                           fontWeight: FontWeight
//       //                                               .w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(
//       //                                               0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets
//       //                                             .only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage(
//       //                                                   "assets/images/check_1.png"),
//       //                                             )),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(0),
//       //                             ),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment
//       //                                     .spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets
//       //                                         .symmetric(
//       //                                         horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment
//       //                                           .spaceBetween,
//       //                                       children: [
//       //                                         Text(
//       //                                           "Self Assessed  :  " +
//       //                                               (controller
//       //                                                   .floorsList[index]['date_from']
//       //                                                   .toString()),
//       //                                           style: GoogleFonts
//       //                                               .publicSans(
//       //                                               fontSize: 16,
//       //                                               fontWeight: FontWeight
//       //                                                   .w600,
//       //                                               fontStyle: FontStyle
//       //                                                   .normal,
//       //                                               color: Colors
//       //                                                   .black
//       //                                           ),
//       //                                         ),
//       //
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read(
//       //                                       'isUtc') && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets
//       //                                           .symmetric(
//       //                                           horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment:
//       //                                         MainAxisAlignment
//       //                                             .spaceBetween,
//       //                                         children: [
//       //                                           Text(
//       //                                             "Agency Tc  :  " +
//       //                                                 (controller
//       //                                                     .tcVerifyFloor
//       //                                                     .value[index]['date_from']
//       //                                                     .toString() ??
//       //                                                     'N/A'),
//       //                                             style: GoogleFonts
//       //                                                 .publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight
//       //                                                     .w600,
//       //                                                 fontStyle: FontStyle
//       //                                                     .normal,
//       //                                                 color: Colors
//       //                                                     .black
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment
//       //                                               .spaceBetween,
//       //                                           children: [
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Correct'),
//       //                                                 value: '0',
//       //                                                 groupValue: controller
//       //                                                     .datefromCheckStatus[index],
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .datefromCheckStatus[index] =
//       //                                                   value!;
//       //                                                   if (value ==
//       //                                                       '0') {
//       //                                                     controller
//       //                                                         .isdatefromEnable[index] =
//       //                                                     false;
//       //                                                     controller
//       //                                                         .dateFromController[index]
//       //                                                         .value =
//       //                                                         TextEditingValue(
//       //                                                             text: controller
//       //                                                                 .floorsList[index]['date_from']);
//       //                                                     // controller.dateFromController[index].text =controller.floorsList[index]['date_from'].toString();
//       //                                                     //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_from'].toString()));
//       //                                                   } else {
//       //                                                     controller
//       //                                                         .dateFromController[index]
//       //                                                         .text =
//       //                                                     ''; // Clear the text when switching to "Wrong"
//       //                                                     controller
//       //                                                         .isdatefromEnable[index] =
//       //                                                     true;
//       //                                                   }
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text(
//       //                                                     'Wrong'),
//       //                                                 value: '1',
//       //                                                 groupValue: controller
//       //                                                     .datefromCheckStatus[index],
//       //                                                 onChanged: (
//       //                                                     value) {
//       //                                                   controller
//       //                                                       .datefromCheckStatus[index] =
//       //                                                   value!;
//       //                                                   if (value ==
//       //                                                       '0') {
//       //                                                     controller
//       //                                                         .isdatefromEnable[index] =
//       //                                                     false;
//       //                                                     // controller.dateFromController[index].value =
//       //                                                     //     TextEditingValue(text: controller.floorsList[index]['date_from']);
//       //                                                   } else {
//       //                                                     controller
//       //                                                         .dateFromController[index]
//       //                                                         .text =
//       //                                                     ''; // Clear the text when switching to "Wrong"
//       //                                                     controller
//       //                                                         .isdatefromEnable[index] =
//       //                                                     true;
//       //                                                   }
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         Padding(
//       //                                           padding: const EdgeInsets
//       //                                               .symmetric(
//       //                                               horizontal: 25),
//       //                                           child: controller
//       //                                               .isdatefromEnable[index]
//       //                                               ? DateTimeField(
//       //                                             controller: controller
//       //                                                 .dateFromController[index],
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors
//       //                                                   .grey[100],
//       //                                               contentPadding: EdgeInsets
//       //                                                   .only(
//       //                                                   left: 35,
//       //                                                   right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius
//       //                                                       .circular(
//       //                                                       70),
//       //                                                   borderSide: BorderSide
//       //                                                       .none),
//       //                                               suffixIcon: Icon(
//       //                                                   Icons
//       //                                                       .calendar_month_outlined),
//       //                                               hintText: ('dd-mm-yyyy'),
//       //                                               hintStyle: const TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors.grey,
//       //                                               ),),
//       //                                             format: DateFormat(
//       //                                                 "yyyy-MM-dd"),
//       //                                             onShowPicker: (
//       //                                                 context,
//       //                                                 currentValue) {
//       //                                               return showDatePicker(
//       //                                                   context: context,
//       //                                                   firstDate: DateTime(
//       //                                                       1900),
//       //                                                   initialDate: currentValue ??
//       //                                                       DateTime
//       //                                                           .now(),
//       //                                                   lastDate: DateTime(
//       //                                                       2100));
//       //                                             },
//       //                                           )
//       //                                               : Container(
//       //                                             width: 500,
//       //                                             height: 45,
//       //                                             decoration: BoxDecoration(
//       //                                               color: Colors
//       //                                                   .grey[100],
//       //                                               borderRadius: BorderRadius
//       //                                                   .circular(
//       //                                                   70),),
//       //                                             child: Padding(
//       //                                               padding: const EdgeInsets
//       //                                                   .symmetric(
//       //                                                   horizontal: 32,
//       //                                                   vertical: 13),
//       //                                               child: Text(
//       //                                                 controller
//       //                                                     .dateFromController[index]
//       //                                                     .text
//       //                                                     .isEmpty
//       //                                                     ? controller
//       //                                                     .floorsList[index]['date_from']
//       //                                                     .toString()
//       //                                                     : controller
//       //                                                     .dateFromController[index]
//       //                                                     .text,
//       //                                                 style: TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   fontWeight: FontWeight
//       //                                                       .w400,
//       //                                                   color: Colors
//       //                                                       .black,),
//       //                                               ),
//       //                                             ),
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                   // DATE UPTO
//       //                   Container(
//       //                     height: 275,
//       //                     width: 357,
//       //                     decoration: const BoxDecoration(
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                           color: Color.fromRGBO(
//       //                               142, 145, 147, 0.1),
//       //                           offset: Offset(0, 1),
//       //                           blurRadius: 1,
//       //                           spreadRadius: 1,
//       //                         ),
//       //                       ],
//       //                     ),
//       //                     child: Stack(
//       //                       children: [
//       //                         Positioned(
//       //                           top: 0,
//       //                           child: Container(
//       //                             height: 140,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: Color.fromRGBO(
//       //                                   63, 148, 213, 1),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(20),
//       //                             ),
//       //                             child: Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets
//       //                                       .symmetric(
//       //                                       horizontal: 30),
//       //                                   child: Row(
//       //                                     mainAxisAlignment:
//       //                                     MainAxisAlignment
//       //                                         .spaceBetween,
//       //                                     children: [
//       //                                       Text(
//       //                                         "Date Upto ",
//       //                                         style: GoogleFonts
//       //                                             .publicSans(
//       //                                           fontStyle: FontStyle
//       //                                               .normal,
//       //                                           fontWeight: FontWeight
//       //                                               .w700,
//       //                                           fontSize: 18,
//       //                                           color: Color(
//       //                                               0xFFFFFFFF),
//       //                                         ),
//       //                                       ),
//       //                                       Container(
//       //                                         margin: const EdgeInsets
//       //                                             .only(top: 3),
//       //                                         height: 40,
//       //                                         width: 50,
//       //                                         decoration: BoxDecoration(
//       //                                             image: DecorationImage(
//       //                                               image: AssetImage(
//       //                                                   "assets/images/check_1.png"),
//       //                                             )),
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //
//       //                               ],
//       //                             ),
//       //                           ),
//       //                         ),
//       //
//       //                         //  ================================
//       //                         //  second white card
//       //                         //  ================================
//       //                         Positioned(
//       //                           bottom: 0,
//       //                           child: Container(
//       //                             height: 230,
//       //                             width: 357,
//       //                             decoration: BoxDecoration(
//       //                               color: const Color(0xFFFFFFFF),
//       //                               borderRadius: BorderRadius
//       //                                   .circular(0),
//       //                             ),
//       //                             child: Column(
//       //                                 mainAxisAlignment: MainAxisAlignment
//       //                                     .spaceEvenly,
//       //                                 children: [
//       //                                   //=============================
//       //                                   //self assessed -1
//       //                                   //=============================
//       //                                   Padding(
//       //                                     padding: const EdgeInsets
//       //                                         .symmetric(
//       //                                         horizontal: 30),
//       //                                     child: Row(
//       //                                       mainAxisAlignment:
//       //                                       MainAxisAlignment
//       //                                           .spaceBetween,
//       //                                       children: [
//       //                                         Text(
//       //                                           "Self Assessed  :  " +
//       //                                               (controller.floorsList[index]['date_upto'].toString() == '' ? 'N/A'
//       //                                                   : controller.floorsList[index]['date_upto'].toString()),
//       //                                           style: GoogleFonts
//       //                                               .publicSans(
//       //                                               fontSize: 16,
//       //                                               fontWeight: FontWeight
//       //                                                   .w600,
//       //                                               fontStyle: FontStyle
//       //                                                   .normal,
//       //                                               color: Colors
//       //                                                   .black
//       //                                           ),
//       //                                         ),
//       //
//       //                                       ],
//       //                                     ),
//       //                                   ),
//       //                                   //AGENCY TC
//       //                                   if (GetStorage().read('isUtc')  && controller.appliedBy != "TC")
//       //                                     Padding(
//       //                                       padding: const EdgeInsets.symmetric(horizontal: 30),
//       //                                       child: Row(
//       //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //                                         children: [
//       //                                           Text(
//       //                                             "Agency Tc  :  " +
//       //                                                 (controller.tcVerifyFloor.value[index]['date_upto'].toString() == '' ? 'N/A'
//       //                                                     : controller.tcVerifyFloor.value[index]['date_upto'].toString()),
//       //                                             style: GoogleFonts.publicSans(
//       //                                                 fontSize: 16,
//       //                                                 fontWeight: FontWeight.w600,
//       //                                                 fontStyle: FontStyle.normal,
//       //                                                 color: Colors.black
//       //                                             ),
//       //                                           ),
//       //                                         ],
//       //                                       ),
//       //                                     ),
//       //                                   //============================
//       //                                   //radio button
//       //                                   //============================
//       //                                   Obx(() {
//       //                                     return Column(
//       //                                       children: [
//       //                                         Row(
//       //                                           mainAxisAlignment:
//       //                                           MainAxisAlignment.spaceBetween,
//       //                                           children: [
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text('Correct'),
//       //                                                 value: '0',
//       //                                                 groupValue: controller.dateUptoCheckStatus[index],
//       //                                                 onChanged: (value) {
//       //                                                   controller.dateUptoCheckStatus[index] = value!;
//       //                                                   if (value == '0') {
//       //                                                     controller.isdateUptoEnable[index] = false;
//       //                                                     controller.dateUptoController[index].value =
//       //                                                         TextEditingValue(
//       //                                                             text: controller.floorsList[index]['date_upto']);
//       //
//       //                                                     // controller.dateUptoController[index] =
//       //                                                     //     TextEditingController.fromValue(TextEditingValue(text: controller.floorsList[index]['date_upto'].toString()));
//       //
//       //                                                   } else {
//       //                                                     controller.dateUptoController[index].text = ''; // Clear the text when switching to "Wrong"
//       //                                                     controller.isdateUptoEnable[index] = true;
//       //                                                   }
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                             Expanded(
//       //                                               child: RadioListTile(
//       //                                                 title: Text('Wrong'),
//       //                                                 value: '1',
//       //                                                 groupValue: controller.dateUptoCheckStatus[index],
//       //                                                 onChanged: (value) {
//       //                                                   controller.dateUptoCheckStatus[index] = value!;
//       //                                                   if (value == '0') {
//       //                                                     controller.isdateUptoEnable[index] =
//       //                                                     false;
//       //                                                     controller.dateUptoController[index].value =
//       //                                                         TextEditingValue(
//       //                                                             text: controller.floorsList[index]['date_upto']);
//       //                                                   } else {
//       //                                                     controller.isdateUptoEnable[index] = true;
//       //                                                   }
//       //                                                 },
//       //                                               ),
//       //                                             ),
//       //                                           ],
//       //                                         ),
//       //                                         Padding(
//       //                                           padding: const EdgeInsets.symmetric(horizontal: 25),
//       //                                           child: controller.isdateUptoEnable[index]
//       //                                               ? DateTimeField(
//       //                                             controller: controller.dateUptoController[index],
//       //                                             decoration: InputDecoration(
//       //                                               filled: true,
//       //                                               fillColor: Colors.grey[100],
//       //                                               contentPadding: EdgeInsets.only(left: 35, right: 10),
//       //                                               border: OutlineInputBorder(
//       //                                                   borderRadius: BorderRadius.circular(70),
//       //                                                   borderSide: BorderSide.none),
//       //                                               suffixIcon: Icon(
//       //                                                   Icons.calendar_month_outlined),
//       //                                               hintText: ('dd-mm-yyyy'),
//       //                                               hintStyle: const TextStyle(
//       //                                                 fontSize: 16,
//       //                                                 color: Colors.grey,
//       //                                               ),),
//       //                                             format: DateFormat("yyyy-MM-dd"),
//       //                                             onShowPicker: (context, currentValue) {
//       //                                               return showDatePicker(
//       //                                                   context: context,
//       //                                                   firstDate: DateTime(1900),
//       //                                                   initialDate: currentValue ?? DateTime.now(),
//       //                                                   lastDate: DateTime(2100));
//       //                                             },
//       //                                           )
//       //                                               : Container(
//       //                                             width: 500,
//       //                                             height: 45,
//       //                                             decoration: BoxDecoration(
//       //                                               color: Colors.grey[100],
//       //                                               borderRadius: BorderRadius.circular(70),),
//       //                                             child: Padding(
//       //                                               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
//       //                                               child: Text(
//       //                                                 controller.dateUptoController[index].text.isEmpty
//       //                                                     ? controller.floorsList[index]['date_upto'].toString()
//       //                                                     : controller.dateUptoController[index].text,
//       //                                                 style: TextStyle(
//       //                                                   fontSize: 16,
//       //                                                   fontWeight: FontWeight.w400,
//       //                                                   color: Colors.black,),
//       //                                               ),
//       //                                             ),
//       //                                           ),
//       //                                         ),
//       //                                       ],
//       //                                     );
//       //                                   }),
//       //                                 ]),
//       //                           ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                   ),
//       //                   SizedBox(
//       //                     height: 10,
//       //                   ),
//       //                 ],
//       //               ),
//       //             );
//       //           },
//       //         ),
//       //       ],
//       //     );
//       //   }
//       // }


// =============================================================================================================================
//GEOTAGGING -FRONT
// if (GetStorage().read('isUtc'))
//   Container(
//     child: Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Divider(
//               color: Colors.blue,
//               thickness: 1,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 Image.asset(
//                   "assets/images/check_2.png",
//                   height: 45,
//                   width: 45,
//                 ),
//                 Text(
//                   ' Geotagging Image ',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.blue
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Divider(
//               color: Colors.blue,
//               thickness: 1,
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// SizedBox(height: 20),
// if (GetStorage().read('isUtc'))
//   Container(
//     height: 370,
//     width: 357,
//     decoration: const BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromRGBO(142, 145, 147, 0.1),
//           offset: Offset(0, 1),
//           blurRadius: 1,
//           spreadRadius: 1,
//         ),
//       ],
//     ),
//     child: Stack(
//       children: [
//         Positioned(
//           top: 0,
//           child: Container(
//             height: 340,
//             width: 357,
//             decoration: BoxDecoration(
//               color: Color.fromRGBO(63, 148, 213, 1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Front Image ",
//                         style: GoogleFonts.publicSans(
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18,
//                           color: Color(0xFFFFFFFF),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 3),
//                         height: 40,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/images/check_1.png"),)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         //  ================================
//         //  second white card
//         //  ================================
//         Positioned(
//           bottom: 0,
//           child: Container(
//             height: 330,
//             width: 357,
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(0),
//             ),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   //=============================
//                   //self assessed -1
//                   //=============================
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Longitute  :  " + (controller.tcFrontLong.toString()),
//                           style: GoogleFonts.publicSans(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal,
//                               color: Colors.black
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //AGENCY TC
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Latitude  :  " +
//                             ( controller.tcFrontLat.toString()),
//                             style: GoogleFonts
//                                 .publicSans(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 fontStyle: FontStyle.normal,
//                                 color: Colors.black
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                   //============================
//                   //IMAGE
//                   //============================
//                   GestureDetector(
//                     onTap: ()   {
//                       showDialog(
//                         context: context,
//                         builder: (_) => Dialog(
//                           child: Image.network(
//                             // Strings.base_url + '/' + controller.tcFrontRelativeImage.toString() + '/' +
//                             controller.tcFrontImage.toString(),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Flexible(
//                           child: Image.network (
//                             // Strings.base_url + '/' + controller.tcFrontRelativeImage.toString() + '/' +
//                             controller.tcFrontImage.toString(),
//                             fit: BoxFit.cover,
//                             width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
//                             height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]),
//           ),
//         )
//       ],
//     ),
//   ),
// //GEOTAGGING -RIGHT
// if (GetStorage().read('isUtc'))
//   SizedBox(height:40),
// if (GetStorage().read('isUtc'))
//   Container(
//     height: 370,
//     width: 357,
//     decoration: const BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromRGBO(142, 145, 147, 0.1),
//           offset: Offset(0, 1),
//           blurRadius: 1,
//           spreadRadius: 1,
//         ),
//       ],
//     ),
//     child: Stack(
//       children: [
//         Positioned(
//           top: 0,
//           child: Container(
//             height: 340,
//             width: 357,
//             decoration: BoxDecoration(
//               color: Color.fromRGBO(63, 148, 213, 1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Right Image  ",
//                         style: GoogleFonts.publicSans(
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18,
//                           color: Color(0xFFFFFFFF),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 3),
//                         height: 40,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/images/check_1.png"),)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         //  ================================
//         //  second white card
//         //  ================================
//         Positioned(
//           bottom: 0,
//           child: Container(
//             height: 330,
//             width: 357,
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(0),
//             ),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   //=============================
//                   //self assessed -1
//                   //=============================
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Longitute  :  " + (controller.tcRightLong.toString()),
//                           style: GoogleFonts.publicSans(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal,
//                               color: Colors.black
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //AGENCY TC
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Latitude  :  " +
//                             ( controller.tcRightLat.toString()),
//                             style: GoogleFonts
//                                 .publicSans(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 fontStyle: FontStyle.normal,
//                                 color: Colors.black
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                   //============================
//                   //IMAGE
//                   //============================
//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (_) => Dialog(
//                           child: Image.network(
//                             // Strings.base_url + '/' + controller.tcRightRelativeImage.toString() + '/' +
//                             controller.tcRightImage.toString(),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Flexible(
//                           child: Image.network(
//                             // Strings.base_url + '/'  + controller.tcRightRelativeImage.toString() + '/' +
//                             controller.tcRightImage.toString(),
//                             fit: BoxFit.cover,
//                             width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
//                             height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]),
//           ),
//         )
//       ],
//     ),
//   ),
// //GEOTAGGING -LEFT
// if (GetStorage().read('isUtc'))
//   SizedBox(height: 40),
// if (GetStorage().read('isUtc'))
//   Container(
//     height: 370,
//     width: 357,
//     decoration: const BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromRGBO(142, 145, 147, 0.1),
//           offset: Offset(0, 1),
//           blurRadius: 1,
//           spreadRadius: 1,
//         ),
//       ],
//     ),
//     child: Stack(
//       children: [
//         Positioned(
//           top: 0,
//           child: Container(
//             height: 340,
//             width: 357,
//             decoration: BoxDecoration(
//               color: Color.fromRGBO(63, 148, 213, 1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Left Image  ",
//                         style: GoogleFonts.publicSans(
//                           fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18,
//                           color: Color(0xFFFFFFFF),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 3),
//                         height: 40,
//                         width: 50,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage("assets/images/check_1.png"),)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//         //  ================================
//         //  second white card
//         //  ================================
//         Positioned(
//           bottom: 0,
//           child: Container(
//             height: 330,
//             width: 357,
//             decoration: BoxDecoration(
//               color: const Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(0),
//             ),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   //=============================
//                   //self assessed -1
//                   //=============================
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Longitute  :  " + (controller.tcLeftLong.toString()),
//                           style: GoogleFonts.publicSans(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal,
//                               color: Colors.black
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //AGENCY TC
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Latitude  :  " +
//                             ( controller.tcLeftLat.toString()),
//                             style: GoogleFonts
//                                 .publicSans(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 fontStyle: FontStyle.normal,
//                                 color: Colors.black
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                   //============================
//                   //IMAGE
//                   //============================
//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (_) => Dialog(
//                           child: Image.network(
//                             // Strings.base_url + '/' + controller.tcLeftRelativeImage.toString() + '/' +
//                             controller.tcLeftImage.toString(),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Flexible(
//                           child: Image.network(
//                             // Strings.base_url + '/'  + controller.tcLeftRelativeImage.toString() + '/' +
//                             controller.tcLeftImage.toString(),
//                             fit: BoxFit.cover,
//                             width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
//                             height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]),
//           ),
//         )
//       ],
//     ),
//   ),

// =============================================================================================================================
//ADD FLOOR