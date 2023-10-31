import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../common/cluster.dart';
import '../../../widgets/Common_DateTimeField.dart';
import '../../../widgets/Common_DropdownField.dart';
import '../controllers/municipal_rental_pay_toll_rent_controller.dart';

class tollPaymentView extends GetView<MunicipalRentalPayTollRentController> {
  const tollPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
            //Basic detail
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.person_pin_outlined, color: Colors.indigo),
                  Text(
                    ' Basic Details',
                    style: GoogleFonts.publicSans(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
            //DETAIL SECTION
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
                  _buildDetailsRow('Toll No', controller.searchedTollDataBy_Id[0]['toll_no'].toString()),
                  _buildDetailsRow('Vendor Name',controller.searchedTollDataBy_Id[0]['vendor_name'].toString()),
                  _buildDetailsRow('Vendor Type',controller.searchedTollDataBy_Id[0]['vendor_type'].toString()),
                  _buildDetailsRow('Address',controller.searchedTollDataBy_Id[0]['address'].toString()),
                  _buildDetailsRow('Circle',controller.searchedTollDataBy_Id[0]['circle_name'].toString()),
                  _buildDetailsRow('Market',controller.searchedTollDataBy_Id[0]['market_name'].toString()),
                  _buildDetailsRow('Rate',controller.searchedTollDataBy_Id[0]['rate'].toString()),
                  _buildDetailsRow('Last Payment Date',controller.searchedTollDataBy_Id[0]['last_payment_date'].toString()),
                  _buildDetailsRow('Last Payment Amount',controller.searchedTollDataBy_Id[0]['last_amount'].toString()),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.paid_outlined, color: Colors.indigo),
                      Text(
                        ' Payment ',
                        style: GoogleFonts.publicSans(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(14.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(15.0),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.1),
                //         spreadRadius: 2,
                //         blurRadius: 1,
                //         offset: Offset(0, 1),
                //       ),
                //     ],
                //   ),
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       _buildDetailsRow('Payment Amount', controller.searchedTollDataBy_Id[0]['toll_no'].toString()),
                //       _buildDetailsRow('Payment Upto',controller.searchedTollDataBy_Id[0]['vendor_name'].toString()),
                //
                //     ],
                //   ),
                // ),
               ],
            ),
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDateTimeField(
                     controller: controller.dateFromController,
                      headingText: 'Select Date',
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
                          lastDate: DateTime(2100),
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a date and time';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDateTimeField(
                       controller: controller.dateUptoController,
                      headingText: 'Select Date',
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
                          lastDate: DateTime(2100),
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a date and time';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.CalculatePaymentDetail();
                      },
                      child: Text("    Search    "),
                    ),



                  ],
                ),
              ),
            ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDetailsRow('Payable Amount', controller.payableAmount.value.toString()),
                  _buildDetailsRow('Payment Upto',controller.searchedTollDataBy_Id[0]['vendor_name'].toString()),
                  CustomDropdownFormField(
                    headingText: 'Payment Method',
                    items: [
                      DropdownMenuItem(
                        child: Text("Cash"),
                        value: "CASH",
                      ),
                      // DropdownMenuItem(
                      //   child: Text("Cheque"),
                      //   value: "CHEQUE",
                      // ),
                      // DropdownMenuItem(
                      //   child: Text("DD"),
                      //   value: "DD",
                      // ),
                      // DropdownMenuItem(
                      //   child: Text("NEFT"),
                      //   value: "NEFT",
                      // ),
                      // DropdownMenuItem(
                      //   child: Text("ONILNE"),
                      //   value: "ONLINE",
                      // ),
                    ],
                    hintText: 'Select an option',
                    validator: (value) {
                      if (value == null) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                    onChanged: (Payment) {
                    controller.toll_PaymentMode.value = Payment.toString();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.CalculatePaymentDetail();
                    },
                    child: Text("      Pay Now       "),
                  ),
                ],
              ),
            ),
            SizedBox(height:200,),
          ],
        ),),
    );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0 ,horizontal: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 145,
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        Flexible(
          child: Text(
            nullToNA(value),
            style: GoogleFonts.publicSans(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent),
          ),
        ),
      ],
    ),

  );
}