import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/views/home_view.dart';
import '../controllers/water_application_search_controller.dart';

class WaterApplicationSearchView extends GetView<WaterApplicationSearchController> {
  const WaterApplicationSearchView({Key? key}) : super(key: key);
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
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/609/609751.png?w=740&t=st=1684829581~exp=1684830181~hmac=a4721d1ba070f3860932478763dc7f523da0cea201eb89186b74ac6b4f1baf0b',
                height: 25,
                width: 30,
              ),
              Text(
                ' Application Search ',
                style:  GoogleFonts.publicSans(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),),
            ],
          ),
        ), actions: [
        SizedBox(width: 10,),
        GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
        SizedBox(width: 14,),
      ],),
      body: SingleChildScrollView(
        child: Container(
          color:  Color(0xFFF0F6F9),
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
                      padding: EdgeInsets.only(top: 10, bottom: 4, left:6, right: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.search_circle),
                          Text(
                            '  Search Water Applied Application...',
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
                      child: Column(
                        children: [
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: EdgeInsets.only(left:10, right: 0, bottom: 1.4),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Select',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            icon: Container(
                              width: 47,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                                onTap: () {
                                  // dropdown icon tap event
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            iconSize: 46,
                            buttonPadding: EdgeInsets.only(left:10),
                            buttonElevation: 2,
                            dropdownMaxHeight: 270,
                            dropdownElevation:1,
                            scrollbarRadius: Radius.circular(40),
                            scrollbarThickness: 5,
                            scrollbarAlwaysShow: true,
                            items: [
                              DropdownMenuItem(
                                child: Text("Select"),
                                value: "",
                              ),
                              DropdownMenuItem(
                                child: Text("New Connection"),
                                value: "newConnection",
                              ),
                              DropdownMenuItem(
                                child: Text("Regularization"),
                                value: "regularization",
                              ),
                              DropdownMenuItem(
                                child: Text("Name"),
                                value: "name",
                              ),
                              DropdownMenuItem(
                                child: Text("SAF No"),
                                value: "safNo",
                              ),
                              DropdownMenuItem(
                                child: Text("Holding No"),
                                value: "holdingNo",
                              ),
                            ],
                            onChanged: (value) {
                              controller.filterByValue.value = value.toString();
                            },
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
                              controller: controller.searchByController,
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
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            controller.isDataProcessing.value = true;
                            var page = 1;
                            await controller.getDetailBySearch();
                            controller.isDataProcessing.value = false;
                          },
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Text(' Search Record '),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
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

                          // SizedBox(width: 5.0),
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
                if (controller.isDataProcessing.value == true) {
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
                }  else if (controller.searchedApplicationData.isEmpty) {
                  return Container(
                    // color: Colors.white,
                    height: 440,
                    width: 390,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Image.asset(
                            "assets/images/search_img3.png",),
                        ),
                      ],
                    ),
                  );
                }else {
                  final startIndex = (controller.currentPage.value - 1) * controller.perPage;
                  final endIndex = startIndex + controller.perPage;
                  final displayedData = startIndex < controller.searchedApplicationData.length
                      ? controller.searchedApplicationData.sublist(startIndex,
                    endIndex < controller.searchedApplicationData.length ? endIndex : controller.searchedApplicationData.length,) : [];
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // itemCount: controller.searchedPropData.length,
                      itemCount: displayedData.length,
                      itemBuilder: (context, index) {
                        // final propertyDetails = controller.searchedPropData[index];
                        final propertyDetails = displayedData[index];
                        return  GestureDetector(
                          onTap: () async{
                          },
                          child: Card(
                            margin: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent[100],
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Details',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildDetailsRow('Ward No', propertyDetails['ward_name'].toString()),
                                      _buildDetailsRow('Application No', propertyDetails['application_no'].toString()),
                                      _buildDetailsRow('Saf No', propertyDetails['saf_no'].toString()),
                                      _buildDetailsRow('Holding No', propertyDetails['holding_no'].toString()),
                                      _buildDetailsRow('Applicant Name', propertyDetails['applicantname'].toString()),
                                      _buildDetailsRow('Guardian Name', propertyDetails['guardianname'].toString()),
                                      _buildDetailsRow('Address', propertyDetails['address'].toString()),
                                      _buildDetailsRow('Mobile No', propertyDetails['mobileno'].toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
            value.isNotEmpty ? value : 'N/A',
          ),
        ),
      ],
    ),
  );
}


