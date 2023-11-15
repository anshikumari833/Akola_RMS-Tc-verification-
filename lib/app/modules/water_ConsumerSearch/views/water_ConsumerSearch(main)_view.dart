import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_ConsumerDetail(BasicDetails)_view.dart';
import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_DemandDetail_view.dart';
import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_PaymentHistory_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/water_consumer_search_controller.dart';

class WaterConsumerSearchView extends GetView<WaterConsumerSearchController> {
  const WaterConsumerSearchView({Key? key}) : super(key: key);
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
                ' Consumer Search',
                style:  GoogleFonts.publicSans(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),),
            ],
          ),
        ),),
      body: SingleChildScrollView(
        child: Container(
          color:  Color(0xFFF0F6F9),
          child: Column(
            children: [
              //DROPDOWN AND TEXT BOX
              SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0,top: 2),
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 4, left:6, right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.search_circle),
                        Text(
                          '  Search Water Consumer...',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomDropdownFormField(
                    headingText: 'Filter by',
                    items: [
                      DropdownMenuItem(
                        child: Text("Select"),
                        value: "",
                      ),
                      DropdownMenuItem(
                        child: Text("Consumer No"),
                        value: "consumerNo",
                      ),
                      DropdownMenuItem(
                        child: Text("Property No"),
                        value: "propertyNo",
                      ),
                      DropdownMenuItem(
                        child: Text("Application Name"),
                        value: "applicantName",
                      ),
                      DropdownMenuItem(
                        child: Text("Mobile No"),
                        value: "mobileNo",
                      ),
                    ],
                    hintText: 'Select an option',
                    validator: (value) {
                      if (value == null) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.filterByValue.value = value.toString();
                    },
                  ),
                  CustomTextField(
                    controller: controller.searchByController,
                    headingText: "Search by",
                    hintText: "Enter value",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return "";
                    },
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
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
                  SizedBox(height: 5),
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
                }  else if (controller.searchedconsumerData.isEmpty) {
                  return Container(
                    child:  Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Lottie.asset('assets/lottie/Water_searchConsumer_screen.json'),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child:  Lottie.asset('assets/lottie/HomeScreen_Water.json'),
                          // child: Image.asset(
                          //   "assets/images/Water_ConsumerSearch.png",),
                        ),
                      ],
                    ),
                  );
                }else {
                  final startIndex = (controller.currentPage.value - 1) * controller.perPage;
                  final endIndex = startIndex + controller.perPage;
                  final displayedData = startIndex < controller.searchedconsumerData.length ? controller.searchedconsumerData.sublist(startIndex,
                    endIndex < controller.searchedconsumerData.length ? endIndex : controller.searchedconsumerData.length,) : [];
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: displayedData.length,
                      itemBuilder: (context, index) {
                        final user_Details = displayedData[index];
                        return   Padding(
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
                                            _buildDetailsRow('Owners Name', user_Details['owner_name'].toString()),
                                            _buildDetailsRow('Consumer No', user_Details['consumer_no'].toString()),
                                            _buildDetailsRow('Property No', user_Details['property_no'].toString()),
                                            _buildDetailsRow('Mobile No', user_Details['mobile_no'].toString()),
                                            _buildDetailsRow('Guardian Name', user_Details['guardian_name'].toString()),
                                            _buildDetailsRow('Address', user_Details['address'].toString()),
                                            _buildDetailsRow('Bill Amount', user_Details['amount'].toString()),
                                            _buildDetailsRow('Status', user_Details['payment_status'].toString()),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          //BASIC DETAILS
                                          TextButton(onPressed:  ()
                                          async{
                                            // controller.clearAllFields();
                                            controller.isDataProcessing.value = true;
                                            await controller.searchConsumerById(controller.searchedconsumerData[index]['id']);
                                            Get.to(WaterConsumerDetailView(),
                                              preventDuplicates: true,
                                            );
                                            controller.isDataProcessing.value = false;
                                          },
                                              child: Text(' Consumer \n    Detail')),
                                          //DEMAND DETAILS
                                          TextButton(onPressed:  () async{
                                            // controller.clearAllFields();
                                            controller.isDataProcessing.value = true;
                                            await controller.getConsumerDemandDetail(controller.searchedconsumerData[index]['id']);
                                            await controller.searchConsumerById(controller.searchedconsumerData[index]['id']);
                                            Get.to(WaterDemandDetailView(),
                                              preventDuplicates: true,
                                            );
                                            controller.isDataProcessing.value = false;
                                          }, child: Text(' Demand \n   Detail')),
                                          //PAYMENT HISTORY
                                          TextButton(onPressed:  () async{
                                            // controller.clearAllFields();
                                            controller.isDataProcessing.value = true;
                                            await controller.getPaymentHistoryDetail(controller.searchedconsumerData[index]['id']);
                                            Get.to(WaterPaymentHistoryView(),
                                              preventDuplicates: true,
                                            );
                                            controller.isDataProcessing.value = false;
                                          }, child: Text(' Payment \n  History')),

                                          // //METER DETAILS
                                          // TextButton(onPressed:  () async{
                                          //   controller.clearAllFields();
                                          //   controller.isDataProcessing.value = true;
                                          //   // await controller.getDemandDetail(propertyDetails['id'],'demand');
                                          //   // Get.to(PropertyDemandDetailsView(),
                                          //   //   preventDuplicates: true,
                                          //   // );
                                          //   controller.isDataProcessing.value = false;
                                          // }, child: Text('Meter Detail')),
                                        ],),
                                      SizedBox(height: 6,)
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //
                                      //   ],)
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
            nullToNA(value),
          ),
        ),
      ],
    ),
  );
}

