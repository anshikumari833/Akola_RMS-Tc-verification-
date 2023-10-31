import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
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
                                  value: "APPLICATION",
                                ),
                                DropdownMenuItem(
                                  child: Text("License No"),
                                  value: "LICENSE",
                                ),
                                DropdownMenuItem(
                                  child: Text("Mobile No"),
                                  value: "MOBILE",
                                ),
                                DropdownMenuItem(
                                  child: Text("Firm Name"),
                                  value: "FIRM",
                                ),
                                DropdownMenuItem(
                                  child: Text("Owner Name"),
                                  value: "OWNER",
                                ),
                              ],
                            onChanged: (value) {
                              controller.filterByValue.value = value.toString();
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
                            controller: controller.searchByController,
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
                          onPressed: () async{
                            FocusManager.instance.primaryFocus?.unfocus();
                            controller.isPageLoading.value = true;
                            await controller.getLicenseDetailBySearch();
                            controller.isPageLoading.value = false;
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
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
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.keyboard_double_arrow_left),
                            onPressed: controller.previousPage,
                            disabledColor: Colors.grey,
                          ),
                          Obx(() => Text(
                            ' ${controller.currentPage.value}' ' to ${controller.totalPages.value}',
                            style:  GoogleFonts.publicSans(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                          IconButton(
                            icon: Icon(Icons.keyboard_double_arrow_right),
                            onPressed: controller.nextPage,
                            disabledColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.isPageLoading.value == true) {
                  return Container(
                    height: 450,
                    width: 390,
                    child:  Center(
                      child:  SpinKitSpinningLines(
                        color: Colors.blue,
                        size: 70.0,
                      ),
                    ),
                  );
                }  else if (controller.searchedLicenseData.isEmpty) {
                  return Container(
                    child:  Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            "assets/images/trade_SearchLicenseimg.png",),
                        ),
                      ],
                    ),
                  );
                }else {
                  final startIndex = (controller.currentPage.value - 1) * controller.perPage;
                  final endIndex = startIndex + controller.perPage;
                  final displayedData = startIndex < controller.searchedLicenseData.length ? controller.searchedLicenseData.sublist(startIndex,
                    endIndex < controller.searchedLicenseData.length ? endIndex : controller.searchedLicenseData.length,) : [];
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: displayedData.length,
                      itemBuilder: (context, index) {
                        final user_Details = displayedData[index];
                        return   Stack(
                          children: [
                              Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child:
                                 Container(
                                 decoration: BoxDecoration(
                                 color: Colors.blue[100],
                                 borderRadius: BorderRadius.circular(20.0),
                                 ),
                                 child: Column(
                                 children: [
                                 Card(
                                 margin: EdgeInsets.all(2.0),
                                 shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20.0),
                                 ),
                                 elevation: 2,
                                 child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: [
                                 Container(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 _buildDetailsRow('Application No', user_Details['application_no'].toString()),
                                 _buildDetailsRow('License No', user_Details['license_no'].toString()),
                                 _buildDetailsRow('Apply Date', user_Details['application_date'].toString()),
                                 _buildDetailsRow('Apply From', user_Details['apply_from'].toString()),
                                 _buildDetailsRow('Firm Name', user_Details['firm_name'].toString()),
                                 _buildDetailsRow('Mobile No', user_Details['mobile_no'].toString()),
                                 _buildDetailsRow('Application Type', user_Details['application_type'].toString()),
                                 ],
                                 ),
                                 ),
                                 Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                 //BASIC DETAILS
                                 TextButton(onPressed:  ()
                                 async{
                                 controller.getapplicantDetail(controller.searchedLicenseData[index]['id']);
                                 Get.to(TradeTrackLicenseView());
                                 }, child: Text('View Details')),
                                 //DEMAND DETAILS
                                 TextButton(onPressed:  () async{}, child: Text('Payment')),
                                 //PAYMENT HISTORY
                                 TextButton(onPressed:  () async{}, child: Text('Payment History'))
                                 ],),
                                 ],
                                 ),
                                 ),
                                 ],
                                 ),
                                 ),
                                 ),
                              Positioned(
                              // top: 10.0,
                              right: 10.0,
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
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
            nullToNA(value),
          ),
        ),
      ],
    ),
  );
}
