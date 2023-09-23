import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../MediaServices/Print_Receipt.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyPaymentView extends GetView<PropertyNewAssessmentController> {
  const PropertyPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  border: Border.all(color: Colors.greenAccent.shade200, width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Application No :'),Text(
                            controller.paysafNo.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Old Ward No :'),
                          Text(
                            // controller.wardList
                            //     .firstWhere(
                            //       (item) =>
                            //   item['id'].toString() ==
                            //       controller.oldWardNo.toString(),
                            //   orElse: () => {'ward_name': ''},
                            // )['ward_name']
                            //     .toString(),
                            controller.payOldWard.toString(),
                          ),

                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('New Ward No :'),
                          Text(
                            // controller.newWardData
                            //     .firstWhere(
                            //       (item) =>
                            //   item['id'].toString() ==
                            //       controller.newWardNo.toString(),
                            //   orElse: () => {'ward_name': ''},
                            // )['ward_name']
                            //     .toString(),
                            controller.payNewWard.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Address :'),
                          Text(
                            controller.payPropAddress.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Property Type :'),
                          Text(
                            controller.payPropType.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Holding Type :'),
                          Text(
                            controller.payPropHoldingType.toString(),
                          ),
                        ],
                      ),
                          SizedBox(height: 4,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ownership Type :'),
                              Text(
                                controller.payOwnerShipType.toString(),
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //TAX DETAIL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10.0),
              child: Container(
                padding:  EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  border: Border.all(color: Colors.greenAccent.shade200, width: 2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Column(
                    children: [
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Tax :    '),
                          Text(
                            // controller.paydemandAmount['rebateAmt'].toString(),
                            controller.payTotalTax.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rebate :    '),
                          Text(
                           // controller.paydemandAmount['rebateAmt'].toString(),
                            controller.payRebateAmt.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Special Rebate :    '),
                          Text(
                            // controller.paydemandAmount['specialRebateAmt'].toString(),
                            controller.paySpecialRebateAmt.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Late Assessment Penalty :    '),
                          Text(
                            controller.payLateAssessmentPenalty.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1% Penalty :    '),
                          Text(
                            // controller.paydemandAmount['totalOnePercPenalty'].toString(),
                              controller.payTotalOnePercPenalty.toString(),
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Payable Amount :    '),
                          Text(
                            // controller.demandAmount['payableAmount'].toString(),
                           controller.payPayableAmount.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //PAYMENT MODE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20.0),
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Payment Mode - ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.blueGrey.shade200,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),                        filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Select',
                            style:
                            TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 40,
                          // buttonPadding: EdgeInsets.only(
                          //     left: 20, right: 25, bottom: 10),
                          buttonPadding: EdgeInsets.all(5.0),
                          buttonElevation: 2,
                          itemPadding: EdgeInsets.only(left: 25, right: 20),
                          dropdownMaxHeight: 260,
                          dropdownWidth: 340,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // dropdownElevation: 8,
                          scrollbarRadius: Radius.circular(40),
                          scrollbarThickness: 5,
                          scrollbarAlwaysShow: true,
                          items: [
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
                              child: Text("NEFT"),
                              value: "NEFT",
                            ),
                          ],
                          validator: (value) {
                            if (value == null) {
                              return 'Please select.';
                            }
                          },
                          onChanged: (value) {
                            controller.mPaymentMode.value = value.toString();
                          },
                        ),
                      ),

                      Obx(() {
                        if (controller.isDataProcessing == true) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (controller.mPaymentMode.value == 'CHEQUE'||controller.mPaymentMode.value == 'DD'||controller.mPaymentMode.value == 'NEFT') {
                            return  Container(
                              child: Column(
                                children: [
                                  //BANK
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Bank Name - ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller.bankNameController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey.shade200,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'Enter Bank Name',
                                        hintStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  //BRANCH NAME
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Branch Name - ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller.branchNameController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey.shade200,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'Enter Branch Name',
                                        hintStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  //CGEQUE /DD NO
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Cheque/DD No - ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller.chequeNoController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey.shade200,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        disabledBorder: InputBorder.none,
                                        hintText: 'Enter Cheque/DD No',
                                        hintStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  //CHEQUE DD/DATE
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Cheque/DD Date - ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DateTimeField(
                                      controller: controller.chequeDateController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey.shade200,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.blue,
                                            width: 2.0,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        disabledBorder: InputBorder.none,
                                        suffixIcon: Icon(Icons.calendar_month_outlined),
                                        hintText: 'dd-mm-yyyy',
                                        hintStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      format: DateFormat("yyyy-MM-dd"),
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate: currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container(); // return a default widget
                          }
                        }
                      }),


                      //REMARKS
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Remarks - ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller.remarksController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.blueGrey.shade200,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            disabledBorder: InputBorder.none,
                            hintText: 'Remarks',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                 await controller.paymentForm(context);
                  await controller.SafReceipt();
                  Get.to(PrintReceipt(),
                      transition: Transition.rightToLeft,
                      duration: Duration(seconds: 1),
                      arguments: [
                        { 'print_string1' : controller.getPrintString1()},
                        { 'print_string2' : controller.getPrintString2()},
                        { 'print_string3' : controller.getPrintString3()},
                      ],
                      preventDuplicates: true);

                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(250, 45),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('PAY :'   ,  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
                    Text(
                      controller.payPayableAmount.toString(),  style: TextStyle(
                    color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            SizedBox(height: 20,)
,],
      ),

      ),
    );
  }
}