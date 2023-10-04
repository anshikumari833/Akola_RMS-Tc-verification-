import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_DemandDetail_view.dart';
import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_MeterDetail_view.dart';
import 'package:amc_rms/app/modules/water_ConsumerSearch/views/water_PaymentHistory_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/water_consumer_search_controller.dart';

class WaterConsumerDetailView extends GetView<WaterConsumerSearchController> {
  const WaterConsumerDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conumer Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),
              //Basic detail
              Container(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      ' Basic Details',
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
              // _buildDetailsRow('Holding No', controller.searchedPropData[0]['holding_no'].toString() ?? ''),
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
                    // _buildDetailsRow('Id', controller.searchedConsumerDataById[0].id),
                    _buildDetailsRow('Consumer No', controller.searchedConsumerDataById[0]['consumer_no']),
                    // _buildDetailsRow('Holding No',  controller.searchedConsumerDataById[0]['holding_no'].toString()),
                    _buildDetailsRow('Property No',  controller.searchedConsumerDataById[0]['property_no'].toString()),
                    _buildDetailsRow('Tap Size',  controller.searchedConsumerDataById[0]['tab_size'].toString()),
                    _buildDetailsRow('Cycle',  controller.searchedConsumerDataById[0]['cycle']),
                    _buildDetailsRow('Category',  controller.searchedConsumerDataById[0]['category']),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      ' Property Address & Details',
                      // textAlign: TextAlign.start,
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailsRow('DTC Code', controller.searchedConsumerDataById[0]['dtc_code']),
                    _buildDetailsRow('Address', controller.searchedConsumerDataById[0]['address']),
                    _buildDetailsRow('Zone', controller.searchedConsumerDataById[0]['zone']),
                    _buildDetailsRow('Landmark', controller.searchedConsumerDataById[0]['landmark']),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      'Owner Details',
                      // textAlign: TextAlign.start,
                      style:  GoogleFonts.publicSans(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailsRow('Owner Name', controller.searchedConsumerDataById[0]['applicant_name'].toString() ?? ''),
                    _buildDetailsRow('Guardian Name', controller.searchedConsumerDataById[0]['guardian_name'].toString() ?? ''),
                    _buildDetailsRow('Mobile No', controller.searchedConsumerDataById[0]['mobile_no'].toString() ?? ''),
                    _buildDetailsRow('Email', controller.searchedConsumerDataById[0]['email'].toString() ?? ''),
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
      ),
    );
  }
}



Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5.0),
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
            value.isNotEmpty ? value : 'NA',
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