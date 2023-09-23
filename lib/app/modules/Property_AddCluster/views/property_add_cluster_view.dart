import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/property_add_cluster_controller.dart';

class PropertyAddClusterView extends GetView<PropertyAddClusterController> {
  const PropertyAddClusterView({Key? key}) : super(key: key);
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
            "Add Cluster",
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
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
                        SizedBox(height: 15,),
                        // WARD NO
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text('Ward No',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
                            hint: const Text('Select',
                              style: TextStyle(fontSize: 16, color: Colors.black),),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 40,
                            buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                            buttonElevation: 2,
                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                            dropdownMaxHeight: 250,
                            dropdownWidth: 320,
                            dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                            dropdownElevation: 8,
                            scrollbarRadius: Radius.circular(40),
                            scrollbarThickness: 5,
                            scrollbarAlwaysShow: true,
                            items: [
                              DropdownMenuItem(
                                child: Text("Zone 1"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Zone 2"),
                                value: "2",
                              ),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Please Select Zone';
                              }
                            },
                            onChanged: (value) {
                            },
                          ),
                        ),
                        // NEW WARD NO
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 15),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text('New Ward No',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
                            hint: const Text('Select',
                              style: TextStyle(fontSize: 16, color: Colors.black),),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 40,
                            buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                            buttonElevation: 2,
                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                            dropdownMaxHeight: 250,
                            dropdownWidth: 320,
                            dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                            dropdownElevation: 8,
                            scrollbarRadius: Radius.circular(40),
                            scrollbarThickness: 5,
                            scrollbarAlwaysShow: true,
                            items: [
                              DropdownMenuItem(
                                child: Text("Zone 1"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Zone 2"),
                                value: "2",
                              ),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Please Select Zone';
                              }
                            },
                            onChanged: (value) {
                            },
                          ),
                        ),
                        // NAME
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 15),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text(
                                'Name',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 0.1,
                                ),
                              ),    hintText: 'Name',
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Name ';
                              }
                              return null;
                            },
                          ),
                        ),
                        // TYPE
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 15),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text(
                                'Type',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
                            hint: const Text('Select',
                              style: TextStyle(fontSize: 16, color: Colors.black),),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 40,
                            buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                            buttonElevation: 2,
                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                            dropdownMaxHeight: 250,
                            dropdownWidth: 320,
                            dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                            dropdownElevation: 8,
                            scrollbarRadius: Radius.circular(40),
                            scrollbarThickness: 5,
                            scrollbarAlwaysShow: true,
                            items: [
                              DropdownMenuItem(
                                child: Text("Zone 1"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("Zone 2"),
                                value: "2",
                              ),
                            ],
                            validator: (value) {
                              if (value == null) {
                                return 'Please Select Zone';
                              }
                            },
                            onChanged: (value) {

                            },
                          ),
                        ),
                        // ADDRESS
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 15),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text(
                                'Address',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 0.1,
                                ),
                              ),
                              hintText: 'Address',
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Address';
                              }
                              return null;
                            },
                          ),
                        ),
                        // MOBILE NO
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 15),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text(
                                'Mobile No',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 0.1,
                                ),
                              ),
                              hintText: 'Mobile no',
                              hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter';
                              }
                              if (value.length < 10) {
                                return 'Please enter a valid 10-digit mobile number';
                              }
                              return null;
                            },
                          ),
                        ),
                        // AUTORIZED PERSON NAME
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 8),
                          child: Row(
                            children: [
                              Text(" *", style: TextStyle(color: Colors.red),),
                              Text(
                                'Authorized Person Name',
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color(0xff263238),
                                    width: 0.1,
                                  ),
                                ),
                              hintText: 'Authorized Person Name ',
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Authorized Person Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
              // BUTTONS
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text('Save & next'),
                    onPressed: () {
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
