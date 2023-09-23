import 'package:amc_rms/app/modules/water_ApplyConnectionForm/views/water_rate_chart_view.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/water_apply_connection_controller.dart';

class WaterMakePaymentView extends GetView<WaterApplyConnectionController> {
  const WaterMakePaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Color(0xFFF0F6F9),
          appBar: AppBar(
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Color(0xFFF1F7FC),
            title: Center(
              child: Text(
                "Water Connection",
                style: GoogleFonts.publicSans(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(69, 70, 70, 0.9),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 2, left:0, right: 0),
                        child:
                        Column(
                          children: [
                            _buildDetailsRow('Application No ',controller.payApplicationNo.toString()),
                            _buildDetailsRow('Ward No ', controller.payWardNo.toString()),
                            _buildDetailsRow('Connection Type ',controller.payConnectionType.toString()),
                            _buildDetailsRow('Ownership Type ', controller.payOwnershipType.toString()),
                            _buildDetailsRow('Property Type ', controller.payPropertyType.toString()),
                            _buildDetailsRow('Pipeline Type ',controller.payPipelineType.toString()),
                            _buildDetailsRow('Connection Through ', controller.payConnectionThrough.toString()),
                            _buildDetailsRow('Holding no ',controller.payHoldingNo.toString()),


                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 2, left:0, right: 0),
                        child:
                        Column(
                          children: [
                            _buildDetailsRow('Connection Fee ', controller.payConnectionFee.toString()),
                            _buildDetailsRow('Penalty ', controller.payPenalty.toString()),
                            _buildDetailsRow('Total Payable ',controller.payTotalPayable.toString()),
                            _buildDetailsRow('Category ', controller.payCategory.toString()),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                 // if (controller.payConnectionTypeId == 2)
                Container(
                  margin: EdgeInsets.all(20.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 2, left:0, right: 0),
                        child:
                        Column(
                          children: [
                            Text('Note : 10% rebate on penalty in case whole penalty is paid',
                              style: GoogleFonts.publicSans(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pay penalty on \n  installment? ',
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromRGBO(63, 148, 213, 1),
                                    ),
                                  ),
                                  // SizedBox(width: 20),
                                  Row(
                                    children: [
                                      Radio<bool>(
                                        value: true,
                                        groupValue: true,
                                        onChanged: (value) {
                                        },
                                      ),
                                      Text('Yes'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<bool>(
                                        value: false,
                                        groupValue: true,
                                        onChanged: (value) {
                                        },
                                      ),
                                      Text('No'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Select Installment',
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromRGBO(63, 148, 213, 1),
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {

                                        var selectedInfo = controller.installmentInfoList.firstWhere((info) => info.amount == newValue);

                                       controller.selectedInstallmentAmount = newValue;

                                        controller.selectedIds = selectedInfo.ids.split(',');

                                      }
                                    },
                                    value: controller.selectedInstallmentAmount,
                                    items: controller.installmentInfoList.map<DropdownMenuItem<String>>((info) {
                                      var amount = info.amount;
                                      if (controller.selectedIds.contains(info.ids)) {
                                        amount = '${double.parse(amount) + double.parse(controller.selectedInstallmentAmount)}';
                                      }
                                      return DropdownMenuItem<String>(
                                        value: amount,
                                        child: Text(amount),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: [
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
                                ],
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select.';
                                  }
                                },
                                onChanged: (value) {
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
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     TextButton(onPressed: (){
                       Get.to(WaterRateChartView());
                     }, child: Text(' View Rate Chart ',style: GoogleFonts.publicSans(
                         fontWeight: FontWeight.w700,
                         color: Colors.indigoAccent,
                         fontSize: 15,
                         fontStyle: FontStyle.normal),),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          controller.applicationAmountPayment();
                        },
                        child: Text(" Pay Tax ",style: GoogleFonts.publicSans(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          )

      ),   );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              label,
              style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  color: Color.fromRGBO(63, 148, 213, 1)),
            ),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontStyle: FontStyle.normal,
                color: Colors.black),
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
