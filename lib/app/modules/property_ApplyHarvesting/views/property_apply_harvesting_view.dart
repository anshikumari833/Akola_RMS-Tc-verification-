import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_apply_harvesting_controller.dart';

class PropertyApplyHarvestingView extends GetView<PropertyApplyHarvestingController> {
  const PropertyApplyHarvestingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    XFile? _pickedFile;
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor: Color(0xFFF1F7FC),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'RWH Form',
            style:  GoogleFonts.publicSans(
              fontSize: 21,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),),
        ],
      ),
        actions: [
      SizedBox(width: 10,),
      GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
      SizedBox(width: 14,),
    ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 14),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "As per the provision of Notification Number: "
                                    " 01/विविध/रा.क.नि./10/2016/न.वि.-5350,Dated: "
                                    "24-09-2016, issued by the UD&HD, if any property"
                                    " or asset is located in an area of 300 square meters "
                                    "(3228 sqft) or more and does not adopt the technique or "
                                    "structure for rainwater harvesting, then a penalty will be imposed"
                                    " equal to 1.5 times of the total payable property tax and collected as the rainwater tax.",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                  wordSpacing:1
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  _buildDetailsRow('Holding No  -',  "2"),
                  _buildDetailsRow('Old Ward No  -',  "2"),
                  _buildDetailsRow('New Ward No  -', "2"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(14.0),
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
              child: Column(
                children: [
                  //NAME OF BUILDING
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " *",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              "Date of Completion of Water Harvesting \nStructure",
                              style: GoogleFonts.publicSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal),
                            ),

                          ],
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DateTimeField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[100],
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
                  //RAIN WATER HARVESTING IMAGE
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              " *",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              "Rain Water Harvesting Image",
                              style: GoogleFonts.publicSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal),
                            ),

                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'jpeg', 'pdf'],
                            );

                            if (result != null) {
                              _pickedFile = result.files.first as XFile?;
                              // Do something with the picked file
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: Text('Pick a file'),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
            // BUTTONS
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                ElevatedButton(
                  child: Text('Save & next'),
                  onPressed: () {}
                ),
              ],
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}



Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              label,
              style: GoogleFonts.publicSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.black),
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
                color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
