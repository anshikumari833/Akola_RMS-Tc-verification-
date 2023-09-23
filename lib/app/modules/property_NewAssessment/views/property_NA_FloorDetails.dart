import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_ExtraDetail.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class PropertyFloorDetailView extends GetView<PropertyNewAssessmentController> {
  const PropertyFloorDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AssessmentAppbar(),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top:0, bottom: 5, left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Floor Details',
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

                                TextButton(
                                  onPressed: () {
                                    controller.addFloor();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        int currentIndex = controller.remarkControllers.length - 1;
                                        return StatefulBuilder(
                                          builder: (BuildContext context, StateSetter setState)
                                          {
                                            return AlertDialog(
                                              backgroundColor: Color(0xFFF0F6F9),
                                              content: SingleChildScrollView(
                                                child:  Container(
                                                  decoration: BoxDecoration(
                                                      color:Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(0, 0, 0, 0.06),
                                                          offset: Offset(0, 4),
                                                          blurRadius: 4,
                                                          spreadRadius: 0,
                                                        ),
                                                      ]),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:  EdgeInsets.only(top:5, bottom: 3, left:20, right:20),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Text(
                                                              "Floor Details  ",
                                                              style: TextStyle( fontSize:15,
                                                                fontWeight: FontWeight  .w700,
                                                                color: Colors .indigo,
                                                              ),
                                                            ),
                                                            IconButton(
                                                              onPressed:
                                                                  () {
                                                                controller.removeFloor(currentIndex);
                                                                Navigator.of(context).pop();
                                                              },
                                                              icon: Icon(Icons.delete,color: Colors.indigo,),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top:0, bottom: 5, left:10, right:10),
                                                        child: Divider(
                                                          color: Colors.blue,
                                                          thickness: 1,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Floor",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),),
                                                                Text(" *",
                                                                  style: TextStyle(color: Colors.red),),
                                                              ],
                                                            ),
                                                            DropdownButtonFormField2(
                                                              decoration: InputDecoration(
                                                                contentPadding: EdgeInsets.zero,
                                                                enabledBorder: UnderlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide:
                                                                  BorderSide(
                                                                    color: Colors.black,
                                                                    width: 0.7,
                                                                  ),
                                                                ),
                                                              ),
                                                              isExpanded: true,
                                                              hint: const Text('Select',
                                                                style: TextStyle(fontSize: 16,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                              icon:
                                                              const Icon(
                                                                Icons.arrow_drop_down,
                                                                color: Colors.black45,
                                                              ),
                                                              iconSize: 30,
                                                              buttonHeight: 60,
                                                              buttonPadding:
                                                              EdgeInsets.only(left: 20, right: 25),
                                                              buttonElevation: 2,
                                                              itemHeight: 60,
                                                              itemPadding:
                                                              EdgeInsets.only(left: 25, right: 25),
                                                              dropdownMaxHeight: 350,
                                                              dropdownWidth: 240,
                                                              dropdownDecoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(5),
                                                              ),
                                                              items: controller.floorList?.isNotEmpty ?? false
                                                                  ? controller.floorList!.map((items) {
                                                                return DropdownMenuItem(
                                                                  value: items["id"].toString(), child:
                                                                Text(items["floor_name"].toString()),
                                                                );
                                                              }).toList() : [],
                                                              validator: (value) {
                                                                if (value == null) {
                                                                  return 'Please select floor ';
                                                                }
                                                              },
                                                              onChanged: (value) {
                                                                controller.floorType.value = value.toString();
                                                              },
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Usage Type",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),
                                                                ),
                                                                Text(
                                                                  " *",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            DropdownButtonFormField2(
                                                              decoration:
                                                              InputDecoration(
                                                                contentPadding:
                                                                EdgeInsets.zero,
                                                                enabledBorder:
                                                                UnderlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                    color:Colors.black,
                                                                    width: 0.7,
                                                                  ),
                                                                ),
                                                              ),
                                                              isExpanded: true,
                                                              hint: const Text('Select',
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                              icon:
                                                              const Icon(Icons.arrow_drop_down,
                                                                color: Colors.black45,
                                                              ),
                                                              iconSize: 30,
                                                              buttonHeight: 60,
                                                              buttonPadding: EdgeInsets.only(left: 20, right: 25),
                                                              buttonElevation: 2,
                                                              itemHeight: 80,
                                                              itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                              dropdownMaxHeight: 350,
                                                              dropdownWidth: 240,
                                                              dropdownDecoration:
                                                              BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              items: controller.usageList
                                                                  ?.isNotEmpty ?? false ? controller.usageList!
                                                                  .map((items) {
                                                                return DropdownMenuItem(
                                                                  value: items["id"].toString(),
                                                                  child: Text(items["usage_type"].toString()),
                                                                );
                                                              }).toList() : [],
                                                              validator: (value) {
                                                                if (value == null) {
                                                                  return 'Please select usage type';
                                                                }
                                                              },
                                                              onChanged:
                                                                  (value) {
                                                                controller.floorUseType.value = value.toString();
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Occupancy Type",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),
                                                                ),
                                                                Text(
                                                                  " *",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            DropdownButtonFormField2(
                                                              // value:controller.pNewWard,
                                                              decoration:
                                                              InputDecoration(
                                                                contentPadding:
                                                                EdgeInsets.zero,
                                                                enabledBorder: UnderlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(color:Colors.black,
                                                                    width: 0.7,
                                                                  ),
                                                                ),
                                                              ),
                                                              isExpanded:
                                                              true,
                                                              hint:
                                                              const Text('Select', style:
                                                              TextStyle(fontSize: 16,
                                                                color: Colors.black,
                                                              ),
                                                              ),
                                                              icon:
                                                              const Icon(
                                                                Icons.arrow_drop_down,
                                                                color: Colors.black45,
                                                              ),
                                                              iconSize: 30,
                                                              buttonHeight: 60,
                                                              buttonPadding:
                                                              EdgeInsets.only(left: 20, right: 25),
                                                              buttonElevation: 2,
                                                              itemHeight: 50,
                                                              itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                              dropdownMaxHeight: 250,
                                                              dropdownWidth: 240,
                                                              dropdownDecoration:
                                                              BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                                              items: controller.occuppancyList?.isNotEmpty ?? false
                                                                  ? controller.occuppancyList!.map(
                                                                      (items) {return DropdownMenuItem(
                                                                    value: items["id"].toString(),
                                                                    child:
                                                                    Text(items["occupancy_type"].toString()),
                                                                  );
                                                                  }).toList() : [],
                                                              validator: (value) {
                                                                if (value == null) {
                                                                  return 'Please select occupancy type';
                                                                }
                                                              },
                                                              onChanged:
                                                                  (value) {
                                                                controller.floorOccupancyType.value = value.toString();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Construction Type",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),
                                                                ),
                                                                Text(
                                                                  " *",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            DropdownButtonFormField2(
                                                              // value:controller.pNewWard,
                                                              decoration: InputDecoration(
                                                                contentPadding: EdgeInsets.zero,
                                                                enabledBorder: UnderlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  borderSide: BorderSide(
                                                                    color: Colors.black,
                                                                    width: 0.7,
                                                                  ),
                                                                ),
                                                              ),
                                                              isExpanded: true,
                                                              hint: const Text(
                                                                'Select',
                                                                style:
                                                                TextStyle(fontSize: 16,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                              icon:
                                                              const Icon(
                                                                Icons.arrow_drop_down,
                                                                color: Colors.black45,
                                                              ),
                                                              iconSize: 30,
                                                              buttonHeight: 60,
                                                              buttonPadding:
                                                              EdgeInsets.only(left: 20,
                                                                  right: 25),
                                                              buttonElevation: 2,
                                                              itemHeight: 60,
                                                              itemPadding:
                                                              EdgeInsets.only(left: 25,
                                                                  right: 25),
                                                              dropdownMaxHeight: 250,
                                                              dropdownWidth: 240,
                                                              dropdownDecoration:
                                                              BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              items: controller
                                                                  .constructionList?.isNotEmpty ?? false
                                                                  ? controller.constructionList!.map(
                                                                      (items) {
                                                                    return DropdownMenuItem(
                                                                      value: items["id"].toString(),
                                                                      child: Text(items["construction_type"].toString()),
                                                                    );
                                                                  }).toList() : [],
                                                              validator: (value) {
                                                                if (value == null) {
                                                                  return 'Please select construction type';
                                                                }
                                                              },
                                                              onChanged:
                                                                  (value) {
                                                                controller.floorConstructionType.value = value.toString();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Built Up Area",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),
                                                                ),
                                                                Text(
                                                                  " *",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            TextField(
                                                              controller: controller.floorBuiltUpController[currentIndex],
                                                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],),

                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(
                                                            15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Date From",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),
                                                                ),
                                                                Text(
                                                                  " *",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            DateTimeField(
                                                              controller: controller.floorDateFromController[currentIndex],
                                                              decoration:
                                                              InputDecoration(
                                                                suffixIcon:
                                                                Icon(Icons.calendar_month_outlined),
                                                                hintText:
                                                                'yyyy-mm-dd',
                                                                hintStyle: const TextStyle(
                                                                    fontSize: 16,
                                                                    color: Colors.black),
                                                              ),
                                                              format: DateFormat("yyyy-MM-dd"),
                                                              onShowPicker:
                                                                  (context,
                                                                  currentValue) {
                                                                return showDatePicker(
                                                                    context: context,
                                                                    firstDate: DateTime(1900),
                                                                    initialDate: currentValue ?? DateTime.now(),
                                                                    lastDate: DateTime(2100));
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                        EdgeInsets.all(15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Date Upto",
                                                                  style: GoogleFonts.literata(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 14,
                                                                      fontStyle: FontStyle.normal),
                                                                ),
                                                                Text(
                                                                  " *",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red),
                                                                ),
                                                              ],
                                                            ),
                                                            DateTimeField(
                                                              controller: controller.floordateUptoController[currentIndex],
                                                              decoration:
                                                              InputDecoration(
                                                                suffixIcon:
                                                                Icon(Icons.calendar_month_outlined),
                                                                hintText: 'yyyy-mm-dd',
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
                                                          ],
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        child: Text('Add'),
                                                        onPressed: () {
                                                          Map<String, dynamic>
                                                          floorData = {
                                                            'floorNo': controller.floorList.firstWhere((item) => item['id'].toString() == controller.floorType.value)['floor_name'],
                                                            'userType': controller.usageList.firstWhere((item) => item['id'].toString() == controller.floorUseType.value)['usage_type'],
                                                            'occupancyType': controller.occuppancyList.firstWhere((item) => item['id'].toString() == controller.floorOccupancyType.value)['occupancy_type'],
                                                            'constructionType': controller.constructionList.firstWhere((item) => item['id'].toString() == controller.floorConstructionType.value)['construction_type'],
                                                            'builtUpArea': controller.floorBuiltUpController[currentIndex].text,
                                                            'fromDate': controller.floorDateFromController[currentIndex].text,
                                                            'uptoDate': controller.floordateUptoController[currentIndex].text,
                                                          };
                                                          setState(() {
                                                            controller.floorDataList.add(floorData);
                                                          });
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Text("Add Floor"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //INFO
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red[100],
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
                            child: Row(
                              children: [
                                SizedBox(width: 14),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, right: 4, bottom: 1),
                                            child: Icon(Icons.info_outlined,
                                                color: Colors.red, size: 20),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          "  Click Add floor button to add floor of the property in case any floor is missing.  "
                                              " You can add multiple floors by repeating the same method.",
                                          style: GoogleFonts.publicSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.red,
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
                      //  Table
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 1),
                                    ),
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columnSpacing: 30,
                                    columns: [
                                      DataColumn(label: Center(child: Text('#'))),
                                      DataColumn(label: Center(child: Text('Floor no'))),
                                      DataColumn(label: Center(child: Text('User Type'))),
                                      DataColumn(label: Center(child: Text('Occupancy Type'))),
                                      DataColumn(label: Center(child: Text('Construction Type'))),
                                      DataColumn(label: Center(child: Text('Built up Area'))),
                                      DataColumn(label: Center(child: Text('From Date'))),
                                      DataColumn(label: Center(child: Text('Upto Date'))),
                                      DataColumn(label: Center(child: Text('Actions'))),
                                    ],
                                    rows: List<DataRow>.generate(
                                      controller.floorDataList.length,
                                          (index) {
                                        final floorData = controller.floorDataList[index];
                                        return DataRow(
                                          cells: [
                                            DataCell(Center(child: Text((index + 1).toString()))),
                                            DataCell(Center(child: Text(floorData['floorNo']))),
                                            DataCell(Center(child: Text(floorData['userType']))),
                                            DataCell(Center(child: Text(floorData['occupancyType']))),
                                            DataCell(Center(child: Text(floorData['constructionType']))),
                                            DataCell(Center(child: Text(floorData['builtUpArea']))),
                                            DataCell(Center(child: Text(floorData['fromDate']))),
                                            DataCell(Center(child: Text(floorData['uptoDate']))),
                                            DataCell(
                                              Center(
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.edit),
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            int currentIndex = index; // The index of the floor data being edited
                                                            // Create a copy of the existing floor data
                                                            Map<String, dynamic> existingData = controller.floorDataList[currentIndex];
                                                            // Create a copy of the TextEditingController to pre-fill the fields
                                                            TextEditingController builtUpController =
                                                            TextEditingController(text: existingData['builtUpArea']);
                                                            TextEditingController fromDateController =
                                                            TextEditingController(text: existingData['fromDate']);
                                                            TextEditingController uptoDateController =
                                                            TextEditingController(text: existingData['uptoDate']);

                                                            return StatefulBuilder(
                                                              builder: (BuildContext context, StateSetter setState) {
                                                                return  AlertDialog(
                                                                  backgroundColor: Color(0xFFF0F6F9),
                                                                  content: SingleChildScrollView(
                                                                    child:  Container(
                                                                      decoration: BoxDecoration(
                                                                          color:Colors.white,
                                                                          borderRadius: BorderRadius.circular(15),
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              color: Color.fromRGBO(0, 0, 0, 0.06),
                                                                              offset: Offset(0, 4),
                                                                              blurRadius: 4,
                                                                              spreadRadius: 0,
                                                                            ),
                                                                          ]),
                                                                      child: Column(
                                                                        children: [
                                                                          Padding(
                                                                            padding:  EdgeInsets.only(top:5, bottom: 3, left:20, right:20),
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: <Widget>[
                                                                                Text(
                                                                                  "Floor Details  ",
                                                                                  style: TextStyle( fontSize:15,
                                                                                    fontWeight: FontWeight  .w700,
                                                                                    color: Colors .indigo,
                                                                                  ),
                                                                                ),
                                                                                IconButton(
                                                                                  onPressed:
                                                                                      () {
                                                                                    controller.removeFloor(currentIndex);
                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  icon: Icon(Icons.delete,color: Colors.indigo,),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsets.only(top:0, bottom: 5, left:10, right:10),
                                                                            child: Divider(
                                                                              color: Colors.blue,
                                                                              thickness: 1,
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Floor",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),),
                                                                                    Text(" *",
                                                                                      style: TextStyle(color: Colors.red),),
                                                                                  ],
                                                                                ),
                                                                                DropdownButtonFormField2(
                                                                                  decoration: InputDecoration(
                                                                                    contentPadding: EdgeInsets.zero,
                                                                                    enabledBorder: UnderlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                      borderSide:
                                                                                      BorderSide(
                                                                                        color: Colors.black,
                                                                                        width: 0.7,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  isExpanded: true,
                                                                                  hint: const Text('Select',
                                                                                    style: TextStyle(fontSize: 16,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                  icon:
                                                                                  const Icon(
                                                                                    Icons.arrow_drop_down,
                                                                                    color: Colors.black45,
                                                                                  ),
                                                                                  iconSize: 30,
                                                                                  buttonHeight: 60,
                                                                                  buttonPadding:
                                                                                  EdgeInsets.only(left: 20, right: 25),
                                                                                  buttonElevation: 2,
                                                                                  itemHeight: 60,
                                                                                  itemPadding:
                                                                                  EdgeInsets.only(left: 25, right: 25),
                                                                                  dropdownMaxHeight: 350,
                                                                                  dropdownWidth: 240,
                                                                                  dropdownDecoration:
                                                                                  BoxDecoration(
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(5),
                                                                                  ),
                                                                                  items: controller.floorList?.isNotEmpty ?? false
                                                                                      ? controller.floorList!.map((items) {
                                                                                    return DropdownMenuItem(
                                                                                      value: items["id"].toString(), child:
                                                                                    Text(items["floor_name"].toString()),
                                                                                    );
                                                                                  }).toList() : [],
                                                                                  validator: (value) {
                                                                                    if (value == null) {
                                                                                      return 'Please select floor ';
                                                                                    }
                                                                                  },
                                                                                  onChanged: (value) {
                                                                                    controller.floorType.value = value.toString();
                                                                                  },
                                                                                ),

                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(
                                                                                15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Usage Type",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),
                                                                                    ),
                                                                                    Text(
                                                                                      " *",
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                DropdownButtonFormField2(
                                                                                  decoration:
                                                                                  InputDecoration(
                                                                                    contentPadding:
                                                                                    EdgeInsets.zero,
                                                                                    enabledBorder:
                                                                                    UnderlineInputBorder(
                                                                                      borderRadius:
                                                                                      BorderRadius.circular(5),
                                                                                      borderSide: BorderSide(
                                                                                        color:Colors.black,
                                                                                        width: 0.7,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  isExpanded: true,
                                                                                  hint: const Text('Select',
                                                                                    style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                  icon:
                                                                                  const Icon(Icons.arrow_drop_down,
                                                                                    color: Colors.black45,
                                                                                  ),
                                                                                  iconSize: 30,
                                                                                  buttonHeight: 60,
                                                                                  buttonPadding: EdgeInsets.only(left: 20, right: 25),
                                                                                  buttonElevation: 2,
                                                                                  itemHeight: 80,
                                                                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                                  dropdownMaxHeight: 350,
                                                                                  dropdownWidth: 240,
                                                                                  dropdownDecoration:
                                                                                  BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  items: controller.usageList
                                                                                      ?.isNotEmpty ?? false ? controller.usageList!
                                                                                      .map((items) {
                                                                                    return DropdownMenuItem(
                                                                                      value: items["id"].toString(),
                                                                                      child: Text(items["usage_type"].toString()),
                                                                                    );
                                                                                  }).toList() : [],
                                                                                  validator: (value) {
                                                                                    if (value == null) {
                                                                                      return 'Please select usage type';
                                                                                    }
                                                                                  },
                                                                                  onChanged:
                                                                                      (value) {
                                                                                    controller.floorUseType.value = value.toString();
                                                                                  },
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding: EdgeInsets.all(15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Occupancy Type",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),
                                                                                    ),
                                                                                    Text(
                                                                                      " *",
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                DropdownButtonFormField2(
                                                                                  // value:controller.pNewWard,
                                                                                  decoration:
                                                                                  InputDecoration(
                                                                                    contentPadding:
                                                                                    EdgeInsets.zero,
                                                                                    enabledBorder: UnderlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                      borderSide: BorderSide(color:Colors.black,
                                                                                        width: 0.7,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  isExpanded:
                                                                                  true,
                                                                                  hint:
                                                                                  const Text('Select', style:
                                                                                  TextStyle(fontSize: 16,
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                  ),
                                                                                  icon:
                                                                                  const Icon(
                                                                                    Icons.arrow_drop_down,
                                                                                    color: Colors.black45,
                                                                                  ),
                                                                                  iconSize: 30,
                                                                                  buttonHeight: 60,
                                                                                  buttonPadding:
                                                                                  EdgeInsets.only(left: 20, right: 25),
                                                                                  buttonElevation: 2,
                                                                                  itemHeight: 50,
                                                                                  itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                                  dropdownMaxHeight: 250,
                                                                                  dropdownWidth: 240,
                                                                                  dropdownDecoration:
                                                                                  BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                                                                  items: controller.occuppancyList?.isNotEmpty ?? false
                                                                                      ? controller.occuppancyList!.map(
                                                                                          (items) {return DropdownMenuItem(
                                                                                        value: items["id"].toString(),
                                                                                        child:
                                                                                        Text(items["occupancy_type"].toString()),
                                                                                      );
                                                                                      }).toList() : [],
                                                                                  validator: (value) {
                                                                                    if (value == null) {
                                                                                      return 'Please select occupancy type';
                                                                                    }
                                                                                  },
                                                                                  onChanged:
                                                                                      (value) {
                                                                                    controller.floorOccupancyType.value = value.toString();
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Construction Type",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),
                                                                                    ),
                                                                                    Text(
                                                                                      " *",
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                DropdownButtonFormField2(
                                                                                  // value:controller.pNewWard,
                                                                                  decoration: InputDecoration(
                                                                                    contentPadding: EdgeInsets.zero,
                                                                                    enabledBorder: UnderlineInputBorder(
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.black,
                                                                                        width: 0.7,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  isExpanded: true,
                                                                                  hint: const Text(
                                                                                    'Select',
                                                                                    style:
                                                                                    TextStyle(fontSize: 16,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                  icon:
                                                                                  const Icon(
                                                                                    Icons.arrow_drop_down,
                                                                                    color: Colors.black45,
                                                                                  ),
                                                                                  iconSize: 30,
                                                                                  buttonHeight: 60,
                                                                                  buttonPadding:
                                                                                  EdgeInsets.only(left: 20,
                                                                                      right: 25),
                                                                                  buttonElevation: 2,
                                                                                  itemHeight: 60,
                                                                                  itemPadding:
                                                                                  EdgeInsets.only(left: 25,
                                                                                      right: 25),
                                                                                  dropdownMaxHeight: 250,
                                                                                  dropdownWidth: 240,
                                                                                  dropdownDecoration:
                                                                                  BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                  ),
                                                                                  items: controller
                                                                                      .constructionList?.isNotEmpty ?? false
                                                                                      ? controller.constructionList!.map(
                                                                                          (items) {
                                                                                        return DropdownMenuItem(
                                                                                          value: items["id"].toString(),
                                                                                          child: Text(items["construction_type"].toString()),
                                                                                        );
                                                                                      }).toList() : [],
                                                                                  validator: (value) {
                                                                                    if (value == null) {
                                                                                      return 'Please select construction type';
                                                                                    }
                                                                                  },
                                                                                  onChanged:
                                                                                      (value) {
                                                                                    controller.floorConstructionType.value = value.toString();
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(
                                                                                15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Built Up Area",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),
                                                                                    ),
                                                                                    Text(
                                                                                      " *",
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                TextField(
                                                                                  controller: controller.floorBuiltUpController[currentIndex],
                                                                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],),

                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(
                                                                                15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Date From",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),
                                                                                    ),
                                                                                    Text(
                                                                                      " *",
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                DateTimeField(
                                                                                  controller: controller.floorDateFromController[currentIndex],
                                                                                  decoration:
                                                                                  InputDecoration(
                                                                                    suffixIcon:
                                                                                    Icon(Icons.calendar_month_outlined),
                                                                                    hintText:
                                                                                    'yyyy-mm-dd',
                                                                                    hintStyle: const TextStyle(
                                                                                        fontSize: 16,
                                                                                        color: Colors.black),
                                                                                  ),
                                                                                  format: DateFormat("yyyy-MM-dd"),
                                                                                  onShowPicker:
                                                                                      (context,
                                                                                      currentValue) {
                                                                                    return showDatePicker(
                                                                                        context: context,
                                                                                        firstDate: DateTime(1900),
                                                                                        initialDate: currentValue ?? DateTime.now(),
                                                                                        lastDate: DateTime(2100));
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                            EdgeInsets.all(15),
                                                                            child: Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Date Upto",
                                                                                      style: GoogleFonts.literata(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 14,
                                                                                          fontStyle: FontStyle.normal),
                                                                                    ),
                                                                                    Text(
                                                                                      " *",
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                          Colors.red),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                DateTimeField(
                                                                                  controller: controller.floordateUptoController[currentIndex],
                                                                                  decoration:
                                                                                  InputDecoration(
                                                                                    suffixIcon:
                                                                                    Icon(Icons.calendar_month_outlined),
                                                                                    hintText: 'yyyy-mm-dd',
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
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          ElevatedButton(
                                                                            child: Text('Save'),
                                                                            onPressed: () {
                                                                              // Create a new floor data object with the edited values
                                                                              Map<String, dynamic> editedFloorData = {
                                                                                'floorNo': existingData['floorNo'],
                                                                                'userType': existingData['userType'],
                                                                                'occupancyType': existingData['occupancyType'],
                                                                                'constructionType': existingData['constructionType'],
                                                                                'builtUpArea': builtUpController.text,
                                                                                'fromDate': fromDateController.text,
                                                                                'uptoDate': uptoDateController.text,
                                                                              };
                                                                              // Update the floor data list with the edited data
                                                                              controller.editFloorData(currentIndex, editedFloorData);

                                                                              Navigator.of(context).pop(); // Close the dialog
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),

                                                    IconButton(
                                                      icon: Icon(Icons.delete),
                                                      onPressed: () {
                                                        controller.deleteFloorData(index);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(PropertyExtraDetailView());
                        },
                        child: Text('Save & next'))
                  ],
                ),
                SizedBox(height: 40,),
              ],
            )
        ),
      ),
    );
  }
}
