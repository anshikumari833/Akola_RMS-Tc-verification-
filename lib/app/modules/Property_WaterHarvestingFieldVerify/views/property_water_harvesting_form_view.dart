import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/location_widget.dart';
import '../controllers/property_water_harvesting_field_verify_controller.dart';

class PropertyWaterHarvestingFormView extends GetView<PropertyWaterHarvestingFieldVerifyController> {
  const PropertyWaterHarvestingFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Text("RWH Harvesting",style:GoogleFonts.publicSans(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(69, 70, 70, 0.9),
          ),),
        ),),
      body: SingleChildScrollView(
        key: controller.waterHarvestingFormKey,
        child:Form(
          child: Column(
            children: [
              Container(
                // margin : EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/archive.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      ' Applicant Details',
                      style: GoogleFonts.roboto(
                          fontSize: 21,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo
                        // color: Color.fromRGBO(69, 70, 70, 0.9),
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
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0,1),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: Column(
                  children: [
                    _buildDetailsRow('Application No',capitalizeFirstLetter(controller.mapplicationNo.toString())),
                    _buildDetailsRow('Does Completion Of \nWater Harvesting is \ndone before 31-03-2017?',capitalizeFirstLetter(controller.mharvestingBefore2017.toString() == 'true' ? 'Yes' : 'No',)),
                    _buildDetailsRow('Holding No',capitalizeFirstLetter(controller.mholdingNo.toString())),
                    _buildDetailsRow('Name',capitalizeFirstLetter(controller.mapplicantName.toString())),
                    _buildDetailsRow('Guardian Name',capitalizeFirstLetter(controller.mguardianName.toString())),
                    _buildDetailsRow('Ward No',capitalizeFirstLetter(controller.mwardNo.toString())),
                    _buildDetailsRow('Address',capitalizeFirstLetter(controller.mpropertyAddress.toString())),
                    _buildDetailsRow('Mobile No',capitalizeFirstLetter(controller.mmobileNo.toString())),
                    _buildDetailsRow('Date of Completion \nof Water Harvesting Structure',capitalizeFirstLetter(controller.mdateOfCompletion.toString())),
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
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0,1),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: Image.network(
                          "http://203.129.217.246:8000/" + controller.mharvestingImage.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Use a Flexible widget to allow the Image.network to take up available space
                      Flexible(
                        child: Image.network(
                          "http://203.129.217.246:8000/" + controller.mharvestingImage.toString(),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                          height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(   margin: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0,1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Obx(
                            () => Column(
                          children: [
                            RadioListTile(
                              title: Text('Verify'),
                              value: '0',
                              groupValue:controller.verificationstatus.value,
                              onChanged: (value) => controller.verificationstatus.value = value!,
                            ),
                            RadioListTile(
                                title: Text('Reject'),
                                value: '1',
                                groupValue: controller.verificationstatus.value,
                                onChanged: (value) => controller.verificationstatus.value = value!
                            ),
                          ],
                        ),
                      ),
                      Obx(() => controller.selectedImage1Path == ''
                          ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                            child: Text(
                              'Select image from camera/gallery',
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            )),
                      )
                          : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Image.file(
                                    File(controller.selectedImage1Path.value))),
                          ),
                          Obx(() => Center(
                              child: Text(
                                controller.selectedImage1Size.value,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )))
                        ],
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                              color: Colors.green,
                              child: Text(
                                "Camera",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                controller.getImage1(ImageSource.camera);
                              }),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: LocationInputField(
                          title: 'Longitude',
                          controller: controller.rwhLongitudeController,
                          isLatitude: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: LocationInputField(
                          title: 'Latitude',
                          controller: controller.rwhLatitudeController,
                          isLatitude: true,
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        controller.ForwardHarvestingForm(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




Widget _buildDetailsRow(String label, String value) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 170,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    label,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.publicSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(63, 148, 213, 1),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  value.isNotEmpty ? value : 'N/A',
                  style: GoogleFonts.publicSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.0,
          color: Colors.grey.withOpacity(0.5),
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