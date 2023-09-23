import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                          Text('Application No :'),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Old Ward No :'),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('New Ward No :'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //TAX DETAIL
            Padding(
              padding:  EdgeInsets.all(8.0),
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
                          Text('Rebate :    '),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Special Rebate :    '),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Late Assessment Penalty :    '),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1% Penalty :    '),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total PayablE Amount :    '),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
         //PAYMENT MODE
         Padding(
           padding: const EdgeInsets.all(12.0),
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
                     filled: true,
                     fillColor: Colors.white,
                     contentPadding: EdgeInsets.zero,
                     enabledBorder: UnderlineInputBorder(
                       borderRadius: BorderRadius.circular(5),
                       borderSide: BorderSide(
                         color: Color(0xff263238),
                         width: 0.1,
                       ),
                     ),
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
                   buttonPadding: EdgeInsets.only(
                       left: 20, right: 25, bottom: 10),
                   buttonElevation: 2,
                   itemPadding: EdgeInsets.only(left: 25, right: 25),
                   dropdownMaxHeight: 250,
                   dropdownWidth: 320,
                   dropdownDecoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                   ),
                   dropdownElevation: 8,
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
                     // controller.zoneType.value = value.toString();
                   },
                 ),
               ),

               Container(
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
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           filled: true,
                           fillColor: Colors.white,
                           disabledBorder: InputBorder.none,
                           hintText: 'Enter Bank Name',
                           hintStyle: const TextStyle(
                               fontSize: 16, color: Colors.black),
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
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           filled: true,
                           fillColor: Colors.white,
                           disabledBorder: InputBorder.none,
                           hintText: 'Enter Branch Name',
                           hintStyle: const TextStyle(
                               fontSize: 16, color: Colors.black),
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
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           filled: true,
                           fillColor: Colors.white,
                           disabledBorder: InputBorder.none,
                           hintText: 'Enter Cheque/DD No',
                           hintStyle: const TextStyle(
                               fontSize: 16, color: Colors.black),
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
                         // controller:
                         // controller.installationOfMobileTowerController,
                         decoration: InputDecoration(
                           border: InputBorder.none,
                           filled: true,
                           fillColor: Colors.white,
                           disabledBorder: InputBorder.none,
                           // icon: Icon(Icons.calendar_month_outlined),
                           suffixIcon: Icon(Icons.calendar_month_outlined),
                           hintText: 'dd-mm-yyyy',
                           hintStyle: const TextStyle(
                               fontSize: 16, color: Colors.black),
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
               ),

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
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     filled: true,
                     fillColor: Colors.white,
                     disabledBorder: InputBorder.none,
                     hintText: 'Remarks',
                     hintStyle: const TextStyle(
                         fontSize: 16, color: Colors.black),
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


            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      // Get.toNamed(Routes.PROPERTY_HOME_SCREEN);
                    },
                    child: Text('PAY : '))
              ],
            )
          ],
        ),

      ),
    );
  }
}
