import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_consession_controller.dart';

class PropertyConsessionView extends GetView<PropertyConsessionController> {
  const PropertyConsessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Concession',
              style:  GoogleFonts.publicSans(
                fontSize: 21,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),),
          ],
        ),
        actions: [
          SizedBox(width: 10,),
          GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
          SizedBox(width: 14,),
        ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 14),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "If a property owner falls under any of the following categories, they are eligible for an additional 5 percent concession on their property tax demand from the current financial year until the financial year of their ownership, if they requested for the concession.",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,

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
                  _buildDetailsRow('Owners Name  -',  "2"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Check the below option by which you want to apply ?',style: GoogleFonts.publicSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Gender'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Senior Citizen'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Specially Abled'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Armed Force'),
                      ],
                    ),
                  ),
                ],
              ),
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
                  //GENDER
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Gender',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                  //SELECT DOCUMENT TO UPLOAD
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Select Document to upload',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                  //UPLOAD GENDER PROOF
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Upload Gender Proof',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                ],
              ),
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
                  //DOB
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'DOB',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateTimeField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[100],
                        disabledBorder: InputBorder.none,
                        // icon: Icon(Icons.calendar_month_outlined),
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                        hintText: 'dd-mm-yyyy',
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
                  ),
                  //SELECT DOCUMENT TO UPLOAD
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Select Document to upload',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Pan"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("Aadhar"),
                          value: "2",
                        ),
                        DropdownMenuItem(
                          child: Text("Voter Id"),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text("Driving Licence "),
                          value: "3",
                        ),
                        DropdownMenuItem(
                          child: Text("Passport"),
                          value: "4",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                  //UPLOAD DOB PROOF
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Upload DOB Proof',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                ],
              ),
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
                  //SPECIALLY ABLED
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Specially-Abled',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('  Yes',style: GoogleFonts.publicSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                        ),
                      ],
                    )
                  ),
                  //SPECIALLY ABLED PERCENTAGE
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Specially Abled percentage(%)',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                  //SELECT DOCUMENT TO UPLOAD
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Select document to upload',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Handicaped Cerificate"),
                          value: "1",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                  //UPLOAD SPECIALLY-ABLED PROOF
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Upload Specially-abled Proof',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                ],
              ),
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
                  //ARMED FORCE
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Armed Force',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('  Yes',style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                          ),
                        ],
                      )
                  ),
                  //SELECT DOCUMENT TO UPLOAD
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Select document to upload',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Armed Certificate"),
                          value: "1",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                  //UPLOAD ARMED FORCE PROOF
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(" *", style: TextStyle(color: Colors.red),),
                        Text(
                          'Upload Armed Force Proof',
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color(0xff263238),
                            width: 0.1,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select',
                        style:
                        TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 40,
                      buttonPadding: EdgeInsets.only(
                          left: 20, right: 25, bottom: 10),
                      buttonElevation: 2,

                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                      dropdownMaxHeight: 250,
                      dropdownWidth: 320,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: Radius.circular(40),
                      scrollbarThickness: 5,
                      scrollbarAlwaysShow: true,
                      items: [
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: "Male",
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Others"),
                          value: "Others",
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select.';
                        }
                      },
                      onChanged: (value) {
                      },
                    ),
                  ),
                ],
              ),
            ),
            // BUTTONS
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                ElevatedButton(
                    child: Text('Save & next'),
                    onPressed: () {}
                ),
              ],
            ),
            SizedBox(height: 40,),
          ],
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
                  color: Colors.black),
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