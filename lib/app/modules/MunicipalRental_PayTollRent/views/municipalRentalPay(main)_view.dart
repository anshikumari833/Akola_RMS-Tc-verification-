import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/municipal_rental_pay_toll_rent_controller.dart';
import 'municipalRental_TollPayment_view.dart';

class MunicipalRentalPayTollRentView extends GetView<MunicipalRentalPayTollRentController> {
  const MunicipalRentalPayTollRentView({Key? key}) : super(key: key);
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
                ' Toll Rental Pay',
                style: GoogleFonts.publicSans(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),
              ),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
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
                    padding: EdgeInsets.only(
                        top: 6, bottom: 4, left: 6, right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.search_circle),
                        Text(
                          '  Search Toll',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  CustomDropdownFormField(
                    headingText: 'Circle',
                    items: [DropdownMenuItem(
                      child: Text("Select"),
                      value: "",
                    ),
                      DropdownMenuItem(
                        child: Text("Vendor Name"),
                        value: "vendorName",
                      ),
                      DropdownMenuItem(
                        child: Text("Mobile No"),
                        value: "mobileNo",
                      ),],
                    hintText: 'Select an option',
                    validator: (value) {
                      if (value == null) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.searchByValue.value = value.toString();
                    },
                  ),
                  SizedBox(height: 5,),
                  Obx(() {
                    if (controller.searchByValue.value == "vendorName" || controller.searchByValue.value == "mobileNo") {
                      return CustomTextField(
                        controller: controller.parameterByController,
                        headingText: controller.searchByValue.value == "vendorName" ? "Vendor Name" : "Mobile No",
                        hintText: controller.searchByValue.value == "vendorName" ? "Enter vendor name" : "Enter mobile no",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return '';
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),

                  SizedBox(height: 10,),
                  //SEARCH BUTTON
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Close the keyboard
                          FocusManager.instance.primaryFocus?.unfocus();
                          // Set isDataProcessing flag to true to show loader
                          controller.isPageLoading.value = true;

                          // if (controller.SearchHoldingFormKey.currentState!.validate()) {
                          await controller.getTollDetaiBySearch();
                          // }

                          // Set isDataProcessing flag to false to hide loader
                          controller.isPageLoading.value = false;
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
                padding: EdgeInsets.only(top: 5, bottom:0, left: 15, right: 10),
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
                          onPressed: () {
                            controller.previousPage();
                            controller.isPageLoading.value == true;
                          },
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
                          onPressed: () {
                            controller.nextPage();
                            controller.isPageLoading.value == true;
                          },
                          disabledColor: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (controller.isPageLoading.value == true || controller.isPageLoading.value) {
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
              }  else if (controller.searchedTollData.isEmpty) {
                return Container(
                  // color: Colors.white,
                  // height: 440,
                  // width: 390,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child:Lottie.asset('assets/lottie/DailyLicence_PayToll.json'),
                        // Image.asset(
                        //   "assets/images/search_img3.png",),
                      ),
                      Text('No Data Available !!!'),
                      SizedBox(height: 50,)
                    ],
                  ),
                );
              }else {
                final startIndex = (controller.currentPage.value - 1) * controller.perPage;
                final endIndex = startIndex + controller.perPage;
                final displayedData = startIndex < controller.searchedTollData.length
                    ? controller.searchedTollData.sublist(startIndex,
                  endIndex < controller.searchedTollData.length ? endIndex : controller.searchedTollData.length,) : [];
                return SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: displayedData.length,
                    itemBuilder: (context, index) {
                      final propertyDetails = displayedData[index];
                      return   GestureDetector(
                        onTap: () async{
                           controller.resetFields();
                          // controller.isDataProcessing.value = true;
                          // if(nullToNA(GetStorage().read('assessmentType')) == "NA"){
                           await controller.searchTollById(controller.searchedTollData[index]['id']);
                           await  Get.to(tollPaymentView(),
                              preventDuplicates: true,
                            );
                          //   controller.isDataProcessing.value = false;
                          // }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 5,),
                                Text(
                                  'Details',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
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
                                            _buildDetailsRow('Vendor Name ', propertyDetails['vendor_name'].toString()),
                                            _buildDetailsRow('Toll No ', propertyDetails['toll_no'].toString()),
                                            _buildDetailsRow('Last Paid on ', propertyDetails['payment_upto'].toString()),
                                            _buildDetailsRow('Circle Name', propertyDetails['circle_name'].toString()),
                                            _buildDetailsRow('Address', propertyDetails['address'].toString()),
                                            _buildDetailsRow('Vendor Type', propertyDetails['vendor_type'].toString()),
                                            _buildDetailsRow('Rate', propertyDetails['rate'].toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
            // nullToNA(value),
          ),
        ),
      ],
    ),
  );
}
