import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../controllers/SearchHolding_controller.dart';

class PropertyBasicDetailsView extends GetView<PropertyPayPropertyTaxController> {
  const PropertyBasicDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Details'),
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
                padding: const EdgeInsets.all(10),
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
                    _buildDetailsRow('Holding No', controller.searchedDataById[0].holdingNo),
                    _buildDetailsRow('Old Ward No',  controller.searchedDataById[0].oldWardNo.toString()),
                    _buildDetailsRow('New Ward No',  controller.searchedDataById[0].newWardNo.toString()),
                    _buildDetailsRow('Ownership Type',  controller.searchedDataById[0].ownershipType),
                    _buildDetailsRow('Property Type',  controller.searchedDataById[0].propertyType),
                    _buildDetailsRow('Holding Type',  controller.searchedDataById[0].holdingType),
                    _buildDetailsRow('Apartment Name',  controller.searchedDataById[0].apartmentName),
                    _buildDetailsRow('Apartment Code',  controller.searchedDataById[0].apartmentCode),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      ' Property Address & Details',
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
                    _buildDetailsRow('Khata No', controller.searchedDataById[0].khataNo),
                    _buildDetailsRow('Plot No', controller.searchedDataById[0].plotNo),
                    _buildDetailsRow('Village/Mauja Name', controller.searchedDataById[0].villageMaujaName),
                    _buildDetailsRow('Area of Plot(decimal)', controller.searchedDataById[0].areaOfPlot),
                    _buildDetailsRow('Road Width(ft)', controller.searchedDataById[0].roadWidth),
                    _buildDetailsRow('Property Address', controller.searchedDataById[0].propAddress),
                    _buildDetailsRow('Corresponding Address', controller.searchedDataById[0].corrAddress),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      '  Owner Details',
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.searchedDataById[0].owners.length,
                itemBuilder: (context, index) {
                  var owner = controller.searchedDataById[0].owners[index];
                  return Container(
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
                        _buildDetailsRow('Owner Name', owner.ownerName.toString() ?? ''),
                        _buildDetailsRow('Gender', owner.gender.toString() ?? ''),
                        _buildDetailsRow('DOB', owner.dob.toString() ?? ''),
                        _buildDetailsRow('Guardian Name', owner.guardianName.toString() ?? ''),
                        _buildDetailsRow('Relation', owner.relationType.toString() ?? ''),
                        _buildDetailsRow('Mobile No', owner.mobileNo.toString() ?? ''),
                        _buildDetailsRow('Aadhar', owner.aadharNo.toString() ?? ''),
                        _buildDetailsRow('Pan No', owner.panNo.toString() ?? ''),
                        _buildDetailsRow('Email', owner.email.toString() ?? ''),
                        _buildDetailsRow('Is Armed-Force?', owner.isArmedForce.toString()),
                        _buildDetailsRow('Is Specially Abled?', owner.isSpeciallyAbled.toString()),
                      ],
                    ),
                  );
                },
              ),


              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      '  Electricity Details',
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
                    _buildDetailsRow('Electricity k. No', controller.searchedDataById[0].electConsumerNo),
                    _buildDetailsRow('ACC No', controller.searchedDataById[0].electAccNo),
                    _buildDetailsRow('Bind/Book No', controller.searchedDataById[0].electBindBookNo),
                    _buildDetailsRow('Ward No', controller.searchedDataById[0].wardMstrId.toString()),
                    _buildDetailsRow('Electricity Consumer Category', controller.searchedDataById[0].electConsCategory),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      '  Building Details',
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
                    _buildDetailsRow('Building Plan Approval No', controller.searchedDataById[0].buildingPlanApprovalNo.toString()),
                    _buildDetailsRow('Building Plan Approval Date', controller.searchedDataById[0].buildingPlanApprovalDate.toString()),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      '  Water Details',
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
                    _buildDetailsRow('Water Consumer No', controller.searchedDataById[0].waterConnNo.toString()),
                    _buildDetailsRow('Water Connection Date', controller.searchedDataById[0].waterConnDate.toString()),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      '  Floor Details',
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.searchedDataById[0].floors.length,
                itemBuilder: (context, index) {
                  var floor = controller.searchedDataById[0].floors[index];
                  return Container(
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
                        _buildDetailsRow('Floor', floor.floorName.toString() ?? ''),
                        _buildDetailsRow('Usage Type', floor.usageType.toString() ?? ''),
                        _buildDetailsRow('Occupancy Type', floor.occupancyType.toString() ?? ''),
                        _buildDetailsRow('Construction Type', floor.constructionType.toString() ?? ''),
                        _buildDetailsRow('Built Up Area(Sqt)', floor.builtupArea.toString() ?? ''),
                        _buildDetailsRow('From Date', floor.dateFrom.toString() ?? ''),
                        _buildDetailsRow('Upto Date', floor.dateUpto.toString() ?? ''),
                      ],
                    ),
                  );
                },
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.person_pin_outlined,
                        color: Colors.indigo),
                    Text(
                      '  Additional Details',
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
                    _buildDetailsRow('Property has Mobile Tower(s)?',controller.searchedDataById[0].isMobileTower.toString() == 'true' ? 'Yes' : 'No',),
                    _buildDetailsRow('Property has Hoarding Board(s)?', controller.searchedDataById[0].isHoardingBoard.toString() == 'true' ? 'Yes' : 'No',),
                    _buildDetailsRow('Is Property a Petrol Pump?',controller.searchedDataById[0].isPetrolPump.toString() == 'true' ? 'Yes' : 'No',),
                    _buildDetailsRow('Rainwater Harvesting Provision?', controller.searchedDataById[0].isWaterHarvesting.toString() == 'true' ? 'Yes' : 'No',),
                    _buildDetailsRow('Zone',controller.searchedDataById[0].zoneMstrId.toString() ),
                  ],
                ),
              ),
              SizedBox(height: 30,)

            ],
          ),),
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