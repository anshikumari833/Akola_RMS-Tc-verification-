import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../../home/views/home_view.dart';
import '../controllers/SearchHolding_controller.dart';
import '../search_propert_model.dart';
import 'SearchHolding_BasicDetails_view.dart';
import 'SearchHolding_DemandDetails_view.dart';
import 'SearchHolding_PaymentHistory_view.dart';
import 'SearchHolding_PropertyDetails_view.dart';

class PropertyPayPropertyTaxView extends GetView<PropertyPayPropertyTaxController> {
  SearchedData searchedData = SearchedData();
   PropertyPayPropertyTaxView({Key? key}) : super(key: key);
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
                '  Search Holding',
                style:  GoogleFonts.publicSans(
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),),
            ],
          ),
        ),
      //   actions: [
      //   SizedBox(width: 10,),
      //   GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
      //   SizedBox(width: 14,),
      // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color:  Color(0xFFF0F6F9),
          child: Column(
            children: [
              //SEARCH HOLDING
              //DROPDOWN AND TEXT BOX
              SizedBox(height: 10,),
              Form(
                key: controller.SearchHoldingFormKey,
                child: Container(
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
                              '  Search Holding...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Obx(() => CustomDropdownFormField(
                        headingText: 'Zone',
                        items: controller.isPageLoading.value
                            ? [
                          DropdownMenuItem(
                            value: null,
                            child:  Center(child:SpinKitThreeBounce(
                              color: Colors.blue,
                              size: 20.0,
                            ),),
                          ),
                        ]
                            : controller.zoneList.map<DropdownMenuItem<String>>((circle) {
                          return DropdownMenuItem<String>(
                            value: circle['id'].toString(),
                            child: Text(circle['zone_name'].toString()),
                          );
                        }).toList(),
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a search criteria';
                          }
                          return null;
                        },
                        onChanged: (value) async{
                          await controller.getWardByZone(zoneId: value.toString());
                          controller.zoneType.value = value.toString();
                          controller.newWardNo.value = '';
                        },
                      ),),
                      Obx(() => CustomDropdownFormField(
                        headingText: 'Ward No ',
                        items: controller.isPageLoading.value
                            ? [
                          DropdownMenuItem(
                            value: null,
                            child:  Center(child:SpinKitThreeBounce(
                              color: Colors.blue,
                              size: 20.0,
                            ),),
                          ),
                        ]
                            : controller.WardListByZone.map<DropdownMenuItem<String>>((circle) {
                          return DropdownMenuItem<String>(
                            value: circle['id'].toString(),
                            child: Text(circle['ward_name'].toString()),
                          );
                        }).toList(),
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a search criteria';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          controller.newWardNo.value = value.toString();
                        },
                      ),),
                      CustomDropdownFormField(
                        headingText: 'Filter By',
                        items: [
                          DropdownMenuItem(
                            child: Text("Select"),
                            value: "",
                          ),
                          DropdownMenuItem(
                            child: Text("Property No"),
                            value: "propertyNo",
                          ),
                          DropdownMenuItem(
                            child: Text("Holding No"),
                            value: "holdingNo",
                          ),
                          DropdownMenuItem(
                            child: Text("Owner Name"),
                            value: "ownerName",
                          ),
                          DropdownMenuItem(
                            child: Text("Mobile No"),
                            value: "mobileNo",
                          ),
                          DropdownMenuItem(
                            child: Text("Address"),
                            value: "address",
                          ),
                        ],
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a search criteria';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          controller.filterByValue.value = value.toString();
                        },
                      ),
                      // Obx(() =>   Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: DropdownButtonFormField2(
                      //     // Dropdown field code
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.grey[100],
                      //       contentPadding: EdgeInsets.zero,
                      //       enabledBorder: UnderlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5),
                      //         borderSide: BorderSide(
                      //           color: Color(0xff263238),
                      //           width: 0.1,
                      //         ),
                      //       ),
                      //     ),
                      //     isExpanded: true,
                      //     hint: const Text(
                      //       'Select',
                      //       style: TextStyle(fontSize: 14, color: Colors.black45),
                      //     ),
                      //     icon: const Icon(
                      //       Icons.arrow_drop_down,
                      //       color: Colors.black45,
                      //     ),
                      //     iconSize: 30,
                      //     buttonHeight: 40,
                      //     buttonPadding:
                      //     EdgeInsets.only(left: 20, right: 25, bottom: 10),
                      //     buttonElevation: 2,
                      //     itemPadding: EdgeInsets.only(left: 25, right: 25),
                      //     dropdownMaxHeight: 250,
                      //     dropdownWidth: 325,
                      //     dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                      //     ),
                      //     dropdownElevation: 1,
                      //     scrollbarRadius: Radius.circular(40),
                      //     scrollbarThickness: 5,
                      //     scrollbarAlwaysShow: true,
                      //     items: controller.isDataProcessing.value
                      //         ? [
                      //       DropdownMenuItem(
                      //         value: null,
                      //         child:  Center(child:SpinKitThreeBounce(
                      //           color: Colors.blue,
                      //           size: 20.0,
                      //         ),),
                      //       ),
                      //     ]
                      //         : controller.zoneList.map((ward) {
                      //       return DropdownMenuItem(
                      //         value: ward["id"].toString(),
                      //         child: Text(ward["zone_name"].toString()),
                      //       );
                      //     }).toList(),
                      //     validator: (value) {
                      //       if (value == null) {
                      //         return 'Please select.';
                      //       }
                      //     },
                      //     onChanged: (value) async{
                      //       await controller.getWardByZone(zoneId: value.toString());
                      //       controller.zoneType.value = value.toString();
                      //       controller.newWardNo.value = '';
                      //     },
                      //   ),
                      // ),),
                      // Obx(() =>   Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: DropdownButtonFormField2(
                      //     // Dropdown field code
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.grey[100],
                      //       contentPadding: EdgeInsets.zero,
                      //       enabledBorder: UnderlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5),
                      //         borderSide: BorderSide(
                      //           color: Color(0xff263238),
                      //           width: 0.1,
                      //         ),
                      //       ),
                      //     ),
                      //     isExpanded: true,
                      //     hint: const Text(
                      //       'Select',
                      //       style: TextStyle(fontSize: 14, color: Colors.black45),
                      //     ),
                      //     icon: const Icon(
                      //       Icons.arrow_drop_down,
                      //       color: Colors.black45,
                      //     ),
                      //     iconSize: 30,
                      //     buttonHeight: 40,
                      //     buttonPadding:
                      //     EdgeInsets.only(left: 20, right: 25, bottom: 10),
                      //     buttonElevation: 2,
                      //     itemPadding: EdgeInsets.only(left: 25, right: 25),
                      //     dropdownMaxHeight: 250,
                      //     dropdownWidth: 325,
                      //     dropdownDecoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //     ),
                      //     dropdownElevation: 1,
                      //     scrollbarRadius: Radius.circular(40),
                      //     scrollbarThickness: 5,
                      //     scrollbarAlwaysShow: true,
                      //     items: controller.isDataProcessing.value
                      //         ? [
                      //       DropdownMenuItem(
                      //         value: null,
                      //         child:  Center(child:SpinKitThreeBounce(
                      //           color: Colors.blue,
                      //           size: 20.0,
                      //         ),),
                      //       ),
                      //     ]
                      //         : controller.WardListByZone.map((ward) {
                      //       return DropdownMenuItem(
                      //         value: ward["id"].toString(),
                      //         child: Text(ward["ward_name"].toString()),
                      //       );
                      //     }).toList(),
                      //     validator: (value) {
                      //       if (value == null) {
                      //         return 'Please select.';
                      //       }
                      //     },
                      //     onChanged: (value) {
                      //       // controller.newWardNo.value = '';
                      //       controller.newWardNo.value = value.toString();
                      //     },
                      //   ),
                      // ),),
                      //DROPDOWN
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       DropdownButtonFormField2(
                      //         decoration: InputDecoration(
                      //           filled: true,
                      //           fillColor: Colors.grey[100],
                      //           contentPadding: EdgeInsets.only(left:10, right: 20, bottom:20),
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30),
                      //             borderSide: BorderSide.none,
                      //           ),
                      //         ),
                      //         isExpanded: true,
                      //         hint: const Text(
                      //           'Select',
                      //           style: TextStyle(fontSize: 16, color: Colors.black45),
                      //         ),
                      //         iconSize: 30,
                      //         buttonPadding: EdgeInsets.only(left:10),
                      //         buttonElevation: 2,
                      //         dropdownMaxHeight: 270,
                      //         dropdownElevation:1,
                      //         scrollbarRadius: Radius.circular(40),
                      //         scrollbarThickness: 5,
                      //         scrollbarAlwaysShow: true,
                      //         items: [
                      //           DropdownMenuItem(
                      //             child: Text("Select"),
                      //             value: "",
                      //           ),
                      //           DropdownMenuItem(
                      //             child: Text("Property No"),
                      //             value: "propertyNo",
                      //           ),
                      //           DropdownMenuItem(
                      //             child: Text("Holding No"),
                      //             value: "holdingNo",
                      //           ),
                      //           DropdownMenuItem(
                      //             child: Text("Owner Name"),
                      //             value: "ownerName",
                      //           ),
                      //           DropdownMenuItem(
                      //             child: Text("Mobile No"),
                      //             value: "mobileNo",
                      //           ),
                      //           DropdownMenuItem(
                      //             child: Text("Address"),
                      //             value: "address",
                      //           ),
                      //         ],
                      //         validator: (value) {
                      //           if (value == null || value.isEmpty) {
                      //             return 'Please select a search criteria';
                      //           }
                      //           return null;
                      //         },
                      //         onChanged: (value) {
                      //           controller.filterByValue.value = value.toString();
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 10,),
                      //TEXTFIELD
                      CustomTextField(
                        controller: controller.searchByController,
                        validator: (value) {
                          if (controller.filterByValue.value == "ptn" && (value == null || value.isEmpty)) {
                            return 'Please enter Property Tax No';
                          }
                          if (controller.filterByValue.value == "holdingNo" && (value == null || value.isEmpty)) {
                            return 'Please enter Holding No';
                          }
                          if (controller.filterByValue.value == "ownerName" && (value == null || value.isEmpty)) {
                            return 'Please enter Owner Name';
                          }
                          if (controller.filterByValue.value == "mobileNo" && (value == null || value.isEmpty)) {
                            return 'Please enter Mobile No';
                          }
                          if (controller.filterByValue.value == "address" && (value == null || value.isEmpty)) {
                            return 'Please enter Address';
                          }
                          return '';
                        },
                        headingText: "Search By",
                        hintText: "Enter Parameter",
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: TextFormField(
                      //         controller: controller.searchByController,
                      //         validator: (value) {
                      //           if (controller.filterByValue.value == "ptn" && (value == null || value.isEmpty)) {
                      //             return 'Please enter Property Tax No';
                      //           }
                      //           if (controller.filterByValue.value == "holdingNo" && (value == null || value.isEmpty)) {
                      //             return 'Please enter Holding No';
                      //           }
                      //           if (controller.filterByValue.value == "ownerName" && (value == null || value.isEmpty)) {
                      //             return 'Please enter Owner Name';
                      //           }
                      //           if (controller.filterByValue.value == "mobileNo" && (value == null || value.isEmpty)) {
                      //             return 'Please enter Mobile No';
                      //           }
                      //           if (controller.filterByValue.value == "address" && (value == null || value.isEmpty)) {
                      //             return 'Please enter Address';
                      //           }
                      //           return null;
                      //         },
                      //         decoration: InputDecoration(
                      //           filled: true,
                      //           fillColor: Colors.grey[100],
                      //           contentPadding: EdgeInsets.only(left: 35, right: 10, bottom: 10),
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.all(Radius.circular(40),
                      //             ),
                      //             borderSide: BorderSide.none,
                      //           ),
                      //           hintStyle: TextStyle(fontSize: 16, color: Colors.black45),
                      //           hintText: "Enter Parameter ",
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                              controller.isDataProcessing.value = true;

                              // if (controller.SearchHoldingFormKey.currentState!.validate()) {
                                var page = 1;
                                await controller.getDetaiBySearch(page);
                              // }

                              // Set isDataProcessing flag to false to hide loader
                              controller.isDataProcessing.value = false;
                            },

                            child: Text('Search Record'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //DIVIDER
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                if (controller.isDataProcessing.value == true || controller.isPageLoading.value) {
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
                }  else if (controller.searchedPropData.isEmpty) {
                  return Container(
                    // color: Colors.white,
                    // height: 440,
                    // width: 390,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Image.asset(
                          "assets/images/search_img3.png",),
                        ),
                        Text('No Data Available !!!')
                      ],
                    ),
                  );
                }else {
                  final startIndex = (controller.currentPage.value - 1) * controller.perPage;
                  final endIndex = startIndex + controller.perPage;
                  final displayedData = startIndex < controller.searchedPropData.length
                      ? controller.searchedPropData.sublist(startIndex,
                    endIndex < controller.searchedPropData.length ? endIndex : controller.searchedPropData.length,) : [];
                  return SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: displayedData.length,
                      itemBuilder: (context, index) {
                        final propertyDetails = displayedData[index];
                        return   GestureDetector(
                          onTap: () async{
                            GetStorage().remove('assessmentType');
                            controller.clearAllFields();
                            controller.isDataProcessing.value = true;
                            // if(nullToNA(GetStorage().read('assessmentType')) == "NA"){
                            //   await controller.searchHoldingById(controller.searchedPropData[index]['id']);
                            //   await controller.getDemandDetail(propertyDetails['id'],'demand');
                            //   await controller.getPaymentDetail(propertyDetails['id']);
                            //   Get.to(PropertyNewDetailsView(),
                            //     preventDuplicates: true,
                            //   );
                            //   controller.isDataProcessing.value = false;
                            // }
                           if(GetStorage().read('assessmentType') == "re" || GetStorage().read('assessmentType') == "mu" || GetStorage().read('assessmentType') == "bi"){
                             await controller.searchHoldingById(controller.searchedPropData[index]['id']);
                             Get.toNamed(Routes.PROPERTY_NEW_ASSESSMENT, arguments: controller.searchedDataById);
                           }
                            controller.isDataProcessing.value = false;
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
                                              _buildDetailsRow('Holding No', propertyDetails['holding_no'].toString()),
                                              _buildDetailsRow('Property No', propertyDetails['property_no'].toString()),
                                              _buildDetailsRow('Zone', propertyDetails['zone_name'].toString()),
                                              _buildDetailsRow('Ward No', propertyDetails['ward_name'].toString()),
                                              _buildDetailsRow('Property Address', propertyDetails['prop_address'].toString()),
                                              _buildDetailsRow('Mobile No', propertyDetails['mobile_no'].toString()),
                                              _buildDetailsRow('Owner Name', propertyDetails['owner_name'].toString()),
                                              _buildPaidStatusRow('Paid Status', propertyDetails['paid_status']),
                                    ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            //BASIC DETAILS
                                            TextButton(onPressed:  ()
                                            async{
                                                 GetStorage().remove('assessmentType');
                                                 controller.clearAllFields();
                                                 controller.isDataProcessing.value = true;
                                                 if(nullToNA(GetStorage().read('assessmentType')) == "NA"){
                                                 await controller.searchHoldingById(controller.searchedPropData[index]['id']);
                                                 Get.to(PropertyBasicDetailsView(),
                                                 preventDuplicates: true,
                                                 );
                                                 controller.isDataProcessing.value = false;
                                                 }
                                                 },
                                            child: Text('Basic Detail')),
                                            //DEMAND DETAILS
                                            TextButton(onPressed:  () async{
                                              GetStorage().remove('assessmentType');
                                              controller.clearAllFields();
                                              controller.isDataProcessing.value = true;
                                              if(nullToNA(GetStorage().read('assessmentType')) == "NA"){
                                                await controller.getDemandDetail(propertyDetails['id'],'demand');
                                                Get.to(PropertyDemandDetailsView(),
                                                  preventDuplicates: true,
                                                );
                                                controller.isDataProcessing.value = false;
                                              }
                                            }, child: Text('Demand Detail')),
                                            //PAYMENT HISTORY
                                            TextButton(onPressed:  () async{
                                              GetStorage().remove('assessmentType');
                                              controller.clearAllFields();
                                              controller.isDataProcessing.value = true;
                                              if(nullToNA(GetStorage().read('assessmentType')) == "NA"){
                                                await controller.searchHoldingById(controller.searchedPropData[index]['id']);
                                                await controller.getPaymentDetail(propertyDetails['id']);
                                                Get.to(PropertyPaymentHistoryView(),
                                                  preventDuplicates: true,
                                                );
                                                controller.isDataProcessing.value = false;
                                              }
                                            }, child: Text('Payment History'))
                                          ],)
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
            // value.isNotEmpty ? value : 'N/A',
            nullToNA(value),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPaidStatusRow(String label, dynamic value) {
  Color textColor = Colors.black;
  String textValue = value.toString();
  if (label == 'Paid Status') {
    switch (value) {
      case 1:
        textValue = 'Paid';
        textColor = Colors.green;
        break;
      case 2:
        textValue = 'Payment Due';
        textColor = Colors.red;
        break;
      case 3:
        textValue = 'Not Paid';
        textColor = Colors.orange;
        break;
      case 4:
        textValue = 'Arrear Overdue';
        textColor = Colors.amber;
        break;
      default:
        textValue = 'Unknown';
        textColor = Colors.black;
        break;
    }
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
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
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
        Flexible(
          child: Text(
            textValue,
            style: GoogleFonts.publicSans(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    ),
  );
}

