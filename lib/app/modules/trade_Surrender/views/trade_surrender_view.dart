import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/trade_surrender_controller.dart';

class TradeSurrenderView extends GetView<TradeSurrenderController> {
  const TradeSurrenderView({Key? key}) : super(key: key);
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
            '  Trade Surrender',
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
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
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
                            '  Search License For Surrender...',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[100],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller.licenceNoController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 35, right: 10, bottom: 10),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                                hintText: "Search ",
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            child: Container(
                              color: Colors.blue,
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {

                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: ()  {
                            controller.getDetailBySearch();
                          },
                          child: Text('Search Record'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //DIVIDER
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom:0, left: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Application List',
                        style:  GoogleFonts.publicSans(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                        ),),
                    ],
                  ),
                ),
              ),
          Container(
            // ... Other widgets ...
            child: Obx(() {
              if (controller.isDataProcessing.value) {
                return CircularProgressIndicator();
              } else {
                if (controller.searchRenewalData == null) {
                  return Container(

                    child: Text(controller.messageFromResponse.value),
                  );
                }
                else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.searchRenewalData.length,
                    itemBuilder: (context, index) {
                      return
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical:4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // _buildDetailsRow('Name -', capitalizeFirstLetter(controller.searchRenewalData[index]['vOwnerName'])),
                            // _buildDetailsRow('Ward No. -', capitalizeFirstLetter(controller.searchRenewalData[index]['vwardNo'])),
                            // _buildDetailsRow('Assessment Type -', capitalizeFirstLetter(controller.searchRenewalData[index]['vAssessmentType'])),
                            // _buildDetailsRow('Mobile No -', capitalizeFirstLetter(controller.searchRenewalData[index]['vMobileNo'])),
                            // _buildDetailsRow('Property Type -', capitalizeFirstLetter(controller.searchRenewalData[index]['vPropertyType'])),
                          ],
                        ),
                      );
                    },
                  );
                }
              }
            }),
          ),

          ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5.0),
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
                  fontSize: 14,
                  fontStyle:
                  FontStyle.normal),
            ),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
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