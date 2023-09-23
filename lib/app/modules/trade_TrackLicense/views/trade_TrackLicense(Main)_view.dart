import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/trade_track_license_controller.dart';

class TradeTrackLicenseView extends GetView<TradeTrackLicenseController> {
  const TradeTrackLicenseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title:    Center(
          child: Text(
            '  Track License',
            style:  GoogleFonts.publicSans(
              fontSize: 21,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),),
        ), ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              //DROPDOWN AND TEXT BOX
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6, bottom: 4, left:6, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.search_circle),
                          Text(
                            '  Track License No...',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Column(
                        children: [
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(70),
                                  borderSide: BorderSide.none),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Select',
                              style:
                              TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 40,
                            buttonPadding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                            // buttonElevation: 2,
                            // itemHeight: 50,
                            itemPadding: EdgeInsets.only(left: 25, right: 0, bottom: 10),
                            dropdownMaxHeight: 300,

                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            dropdownElevation: 1,
                            scrollbarRadius: Radius.circular(40),
                            scrollbarThickness: 5,
                            scrollbarAlwaysShow: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Select"),
                                  value: "",
                                ),
                                DropdownMenuItem(
                                  child: Text("Application No"),
                                  value: "ptn",
                                ),
                                DropdownMenuItem(
                                  child: Text("License No"),
                                  value: "holdingNo",
                                ),
                                DropdownMenuItem(
                                  child: Text("Mobile No"),
                                  value: "mobileNo",
                                ),
                                DropdownMenuItem(
                                  child: Text("Firm Name"),
                                  value: "address",
                                ),
                                DropdownMenuItem(
                                  child: Text("Owner Name"),
                                  value: "address",
                                ),
                              ],
                            onChanged: (value) {

                            }
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          child: TextField(

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: EdgeInsets.only(
                                  left: 35, right: 10),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(70),
                                  borderSide: BorderSide.none),
                              suffixIcon:
                              Icon(Icons.search, color: Colors.grey),
                              hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey),
                              hintText: "Search...",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                          ),
                          child: Text('Search'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Divider(
                  thickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
