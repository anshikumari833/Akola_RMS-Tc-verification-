import 'package:amc_rms/app/modules/Property_Report/views/property_ReportList.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_report_controller.dart';

class PropertyReportView extends GetView<PropertyReportController> {
  const PropertyReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F6F9),
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF1F7FC),
          title: Center(
            child: Text("Report",style:GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),),
          ), actions: [
          SizedBox(width: 10,),
          GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
          SizedBox(width: 14,),
        ],),
      body:Container(
          color: const Color(0xFFF0F6F9),
        child: Stack(
          children: [
            Positioned.fill(
              child: SlideTransition(
                position: controller.slideAnimation,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "assets/images/search_img4.png",
                        ),
                      ),
                      Obx(() =>  Visibility(
          visible: controller.isContainerVisible.value,
          child:  SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
              ),
              padding: EdgeInsets.all(14.0),
              child: Column(
                  children: [
                    //COLLECTION TYPE
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Collection Type',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonHideUnderline(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.grey[200],
                                ),
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      'Select Items',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {},
                                  items: [
                                    DropdownMenuItem(
                                      value: 'property',
                                      child: Obx(() => CheckboxListTile(
                                        title: Text('Property'),
                                        value: controller.selectedItems.contains('property'),
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            if (newValue) {
                                              controller.selectedItems.add('property');
                                            } else {
                                              controller.selectedItems.remove('property');
                                            }
                                          }
                                          controller.collectionType.value =
                                              controller.selectedItems.toList();
                                        },
                                      )),
                                    ),
                                    DropdownMenuItem(
                                      value: 'saf',
                                      child: Obx(() => CheckboxListTile(
                                        title: Text('SAF'),
                                        value: controller.selectedItems.contains('saf'),
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            if (newValue) {
                                              controller.selectedItems.add('saf');
                                            } else {
                                              controller.selectedItems.remove('saf');
                                            }
                                          }
                                          controller.collectionType.value =
                                              controller.selectedItems.toList();
                                        },
                                      )),
                                    ),
                                    DropdownMenuItem(
                                      value: 'gbsaf',
                                      child: Obx(() => CheckboxListTile(
                                        title: Text('Gov.SAF'),
                                        value: controller.selectedItems.contains('gbsaf'),
                                        onChanged: (newValue) {
                                          if (newValue != null) {
                                            if (newValue) {
                                              controller.selectedItems.add('gbsaf');
                                            } else {
                                              controller.selectedItems.remove('gbsaf');
                                            }
                                          }
                                          controller.collectionType.value =
                                              controller.selectedItems.toList();
                                        },
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //DATE FROM
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Date From',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DateTimeField(
                              controller: controller.dateFromController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                disabledBorder: InputBorder.none,
                                // icon: Icon(Icons.calendar_month_outlined),
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                hintText: 'dd-mm-yyyy',
                                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              format: DateFormat("yyyy-MM-dd"),
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //DATE UPTO
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Date Upto',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child:DateTimeField(
                              controller: controller.dateUptoController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.grey[200],
                                disabledBorder: InputBorder.none,
                                // icon: Icon(Icons.calendar_month_outlined),
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                                hintText: 'dd-mm-yyyy',
                                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              format: DateFormat("yyyy-MM-dd"),
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //WARD NO
                    Obx(() {
                      if (controller.isDataProcessing == true) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Ward No',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'Select',
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 40,
                                  buttonPadding: EdgeInsets.only(left: 30, right: 25, bottom: 10),
                                  buttonElevation: 2,
                                  itemHeight: 50,
                                  itemPadding: EdgeInsets.only(left: 10, right: 25, bottom: 10),
                                  dropdownMaxHeight: 270,
                                  // dropdownWidth:250,
                                  dropdownDecoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(50),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: Radius.circular(40),
                                  scrollbarThickness: 5,
                                  scrollbarAlwaysShow: true,
                                  items: controller.wardList?.isNotEmpty ?? false
                                      ? controller.wardList!.map((items) {
                                    return DropdownMenuItem(
                                      value: items["id"].toString(),
                                      child: Text(items["ward_name"].toString()),
                                    );
                                  }).toList()
                                      : [],
                                  onChanged: (value) {
                                    controller.wardNo.value = value.toString();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                    //PAYMENT MODE
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Payment \n Mode',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Select',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 40,
                              buttonPadding: EdgeInsets.only(left: 30, right: 25, bottom: 10),
                              buttonElevation: 2,
                              itemHeight: 50,
                              itemPadding: EdgeInsets.only(left: 10, right: 25, bottom: 10),
                              dropdownMaxHeight: 270,
                              // dropdownWidth:250,
                              dropdownDecoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(50),
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: Radius.circular(40),
                              scrollbarThickness: 5,
                              scrollbarAlwaysShow: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Select"),
                                  value: "",
                                ),
                                DropdownMenuItem(
                                  child: Text("Cash"),
                                  value: "CASH",
                                ),
                                DropdownMenuItem(
                                  child: Text("Cheque"),
                                  value: "CHEQUE",
                                ),
                                DropdownMenuItem(
                                  child: Text("DD"),
                                  value: "DD",
                                ),
                                DropdownMenuItem(
                                  child: Text("Online"),
                                  value: "ONLINE",
                                ),
                              ],
                              onChanged: (value) {
                                controller.paymentMode.value = value.toString();
                              },
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
                          onPressed: () async {
                            int page = 1;
                            controller.getReportDetail(page);
                            await Get.to(ReportListView());
                          },
                          child: Text('Search'),
                        ),
                      ],
                    ),
                  ],
              ),
            ),
          ),

        ),)

            ]),
                ),
        ))
          ],
        ),
      ));
  }
}

