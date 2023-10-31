import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../controllers/trade_track_license_controller.dart';

class TradeTrackLicenseView extends GetView<TradeTrackLicenseController> {
  const TradeTrackLicenseView({Key? key}) : super(key: key);
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
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Initial Information About the Business',
                    style:  GoogleFonts.publicSans(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
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
                  _buildDetailsRow('Ward No', controller.basicLicenseDetails[0].holdingNo),
                  _buildDetailsRow('Firm Name', controller.basicLicenseDetails[0].propertyNo),
                  _buildDetailsRow('Firm Type',controller.basicLicenseDetails[0].zoneName.toString() ),
                  _buildDetailsRow('Nature of Business',  controller.basicLicenseDetails[0].wardNo.toString()),
                  _buildDetailsRow('License For Year',  controller.basicLicenseDetails[0].ownershipType),
                  _buildDetailsRow('Category Type',  controller.basicLicenseDetails[0].propertyType),
                  _buildDetailsRow('License No',  controller.basicLicenseDetails[0].holdingType),
                  _buildDetailsRow('Ownership Type',  controller.basicLicenseDetails[0].appartmentName),
                  _buildDetailsRow('Application Type',  controller.basicLicenseDetails[0].apartmentCode),
                  _buildDetailsRow('Apply Date',  controller.basicLicenseDetails[0].apartmentCode),
                  _buildDetailsRow('Valid Upto',  controller.basicLicenseDetails[0].apartmentCode),
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
                    ' Property Details',
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
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Property Related Information Of The Business',
                    style:  GoogleFonts.publicSans(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
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
                  _buildDetailsRow('Holding No', controller.basicLicenseDetails[0].holdingNo),
                  _buildDetailsRow('Apply Date', controller.basicLicenseDetails[0].propertyNo),
                  _buildDetailsRow('Business Area',controller.basicLicenseDetails[0].zoneName.toString() ),
                  _buildDetailsRow('Owner of Business Premises',  controller.basicLicenseDetails[0].wardNo.toString()),
                  _buildDetailsRow('Pinecode',  controller.basicLicenseDetails[0].ownershipType),
                  _buildDetailsRow('Business Address',  controller.basicLicenseDetails[0].propertyType),
                  _buildDetailsRow('Landmark',  controller.basicLicenseDetails[0].holdingType),
                  _buildDetailsRow('Firm Establishment Date',  controller.basicLicenseDetails[0].appartmentName),
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
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Owner Related Information Of The Business',
                    style:  GoogleFonts.publicSans(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.ownerDetailList[0].owners.length,
              itemBuilder: (context, index) {
                var owner = controller.ownerDetailList[0].owners[index];
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
                      _buildDetailsRow('Mobile No', owner.mobileNo.toString() ?? ''),
                      _buildDetailsRow('Email', owner.email.toString() ?? ''),
                    ],
                  ),
                );
              },
            ),


            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: Row(
            //     children: [
            //       Icon(Icons.person_pin_outlined,
            //           color: Colors.indigo),
            //       Text(
            //         '  Floor Details',
            //         style:  GoogleFonts.publicSans(
            //           fontSize: 16,
            //           fontStyle: FontStyle.normal,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.indigo,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Column(
            //   children: [
            //     if (controller.searchedDataById[0].propTypeMstrId == 4)
            //       Container(
            //         margin: EdgeInsets.all(14.0),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(15.0),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.1),
            //               spreadRadius: 2,
            //               blurRadius: 1,
            //               offset: Offset(0, 1),
            //             ),
            //           ],
            //         ),
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text("  No Floors, As Property is Vacant Land   ")
            //           ],
            //         ),
            //       ),
            //     ListView.builder(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: controller.searchedDataById[0].floors.length,
            //       itemBuilder: (context, index) {
            //         var floor = controller.searchedDataById[0].floors[index];
            //         return Container(
            //           margin: EdgeInsets.all(14.0),
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(15.0),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey.withOpacity(0.1),
            //                 spreadRadius: 2,
            //                 blurRadius: 1,
            //                 offset: Offset(0, 1),
            //               ),
            //             ],
            //           ),
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               _buildDetailsRow('Floor', floor.floorName.toString() ?? ''),
            //               _buildDetailsRow('Usage Type', floor.usageType.toString() ?? ''),
            //               _buildDetailsRow('Occupancy Type', floor.occupancyType.toString() ?? ''),
            //               _buildDetailsRow('Construction Type', floor.constructionType.toString() ?? ''),
            //               _buildDetailsRow('Built Up Area(Sqt)', floor.builtupArea.toString() ?? ''),
            //               _buildDetailsRow('From Date', floor.dateFrom.toString() ?? ''),
            //               _buildDetailsRow('Upto Date', floor.dateUpto.toString() ?? ''),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ],
            // ),

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