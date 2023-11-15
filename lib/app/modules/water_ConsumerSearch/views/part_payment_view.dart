import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../../../widgets/Common_TextField.dart';
import '../controllers/water_consumer_search_controller.dart';

class PartPaymentView extends GetView<WaterConsumerSearchController> {
  const PartPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child:   Column(
          children: [
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailsRow('Consumer No',controller.searchedConsumerDataById[0]['consumer_no'].toString()),
                  _buildDetailsRow('Property No',controller.searchedConsumerDataById[0]['property_no'].toString()),
                  _buildDetailsRow('Holding No',controller.searchedConsumerDataById[0]['holding_no'].toString()),
                  _buildDetailsRow('Applicant Name',controller.searchedConsumerDataById[0]['applicant_name'].toString()),
                  _buildDetailsRow('Property Address',controller.searchedConsumerDataById[0]['address'].toString()),
                ],
              ),
            ),

            Obx(() {
              if (controller.isDataProcessing.value == true) {
                return  SpinKitSpinningLines(
                  color: Colors.blue,
                  size: 70.0,
                );
              }
              return  Form(
                key: controller.partPaymentFormkey,
                child: Container(
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      CustomDropdownFormField(
                        headingText: 'Select Month Upto',
                        items: controller.consumerDemands.value.map<DropdownMenuItem<String>>((demand) {
                          return DropdownMenuItem<String>(
                            value: demand['demand_upto'],
                            child: Text(demand['demand_upto']),
                          );
                        }).toList(),
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        onChanged: (DemandPayment) {
                          controller.selectDateUpto.value = DemandPayment.toString();
                          controller.getCalculationDemandDetails();
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                child: Text(
                                  'Total Demand',
                                  style: GoogleFonts.publicSans(
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                child: TextFormField(
                                  controller: TextEditingController(text:controller.Calculation_totalPayAmount.value),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    disabledBorder: InputBorder.none,

                                  ),
                                  enabled: false,
                                  // initialValue: controller.Calculation_totalPayAmount.value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return '';
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // hintText: controller.Calculation_totalPayAmount.value,hintStyle: TextStyle(color:Colors.black),
                      CustomDropdownFormField(
                        headingText: 'Payment Method',
                        items: [
                          DropdownMenuItem(
                            child: Text("Cash"),
                            value: "Cash",
                          ),
                          DropdownMenuItem(
                            child: Text("Cheque"),
                            value: "Cheque",
                          ),
                          DropdownMenuItem(
                            child: Text("DD"),
                            value: "DD",
                          ),
                          DropdownMenuItem(
                            child: Text("NEFT"),
                            value: "Neft",
                          ),
                        ],
                        hintText: 'Select an option',
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                        onChanged: (DemandPayment) {
                          controller.demand_PaymentMode.value = DemandPayment.toString();
                        },
                      ),
                      CustomTextField(
                        controller: controller.partPayment_amountController,
                        headingText: "Enter Amount", hintText: "Amount",validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return "";
                      },),
                      // 🔴 🔴 🔴 IN CASE OF CHEQUE/DD
                      if (controller.demand_PaymentMode.value == 'Cheque'||controller.demand_PaymentMode.value == 'DD')
                        Container(
                          child: Column(
                            children: [
                              //BANK NAME
                              CustomTextField(
                                controller: controller.partPayment_bankNameController,
                                headingText: "Bank Name", hintText: "Enter Bank Name",validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return "";
                              },),
                              //BRANCH NAME
                              CustomTextField(
                                controller: controller.partPayment_branchNameController,
                                headingText: "Branch Name", hintText: "Enter Branch Name",validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return "";
                              },),
                              //CHEQUE /DD NO
                              CustomTextField(
                                controller: controller.partPayment_chequeNoController,
                                headingText: "Cheque/DD No", hintText: "Enter Cheque/DD No",validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return "";
                              },),
                              //CHEQUE DD/DATE
                              CustomDateTimeField(
                                headingText: 'Cheque/DD Date ',
                                controller: controller.partPayment_chequeDateController,
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  border: OutlineInputBorder(),
                                ),
                                format: DateFormat("yyyy-MM-dd"),
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate: currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select a date and time';
                                  }
                                  // Add more validation if needed
                                  return null;
                                },
                              ),
                              // SizedBox(height: 30),
                              Obx(() => controller.selectedImage1Path == ''
                                  ? Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Center(
                                  child: Text(
                                    'Select image from camera/gallery',
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              )
                                  : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Image.file(
                                        File(controller.selectedImage1Path.value),
                                      ),
                                    ),
                                  ),
                                  Obx(() => Center(
                                    child: Text(
                                      controller.selectedImage1Size.value,
                                      style: TextStyle(fontSize: 12, color: Colors.black),
                                    ),
                                  )),
                                ],
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  MaterialButton(
                                    color: Colors.blueGrey.shade300,
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.getImage1(ImageSource.camera);
                                    },
                                  ),
                                  MaterialButton(
                                    color: Colors.teal.shade300,
                                    child: Text(
                                      "Device",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      controller.getImage1(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                              // SizedBox(height:30,),
                            ],
                          ),
                        ),
                      CustomTextField(
                        controller: controller.partPayment_remarksController,
                        headingText: "Remarks", hintText: "Enter value",validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return "";
                      },),
                      SizedBox(height:10,),
                      Container(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.PartPaymentDetail(type: 'cash');
                                  },
                                  child: Text(' Pay Tax '),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:10,),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}




Container buildDecoratedContainer(Widget child) {
  return Container(
    padding:  EdgeInsets.only(right: 15.0),
    decoration: BoxDecoration(
      border: Border(right: BorderSide(width: 1, color: Colors.grey)),
    ),
    child: Center(child: child),
  );
}

Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0 ,horizontal: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 145,
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        Flexible(
          child: Text(
            nullToNA(value),
            style: GoogleFonts.publicSans(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent),
          ),
        ),
      ],
    ),
  );
}