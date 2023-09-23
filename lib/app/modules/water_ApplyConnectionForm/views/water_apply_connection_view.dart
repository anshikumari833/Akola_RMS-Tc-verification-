import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/water_apply_connection_controller.dart';

class WaterApplyConnectionView extends GetView<WaterApplyConnectionController> {
  const WaterApplyConnectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child:  Form(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/basic_details.png",
                      height: 45,
                      width: 45,
                    ),
                    Text(
                      '  Details',
                      style: GoogleFonts.roboto(
                          fontSize: 21,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
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
                  child:
                  Column(
                    children: [
                      SizedBox(height:2,),
                      Container(
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(" *", style: TextStyle(color: Colors.red),),
                                    Text(
                                      'Connection Through',
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonFormField2(
                                      // Dropdown field code
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[100],
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
                                        style: TextStyle(fontSize: 14, color: Colors.black45),
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 30,
                                      buttonHeight: 40,
                                      buttonPadding:
                                      EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                      buttonElevation: 2,
                                      itemPadding: EdgeInsets.only(left: 25, right: 25),
                                      dropdownMaxHeight: 250,
                                      dropdownWidth: 330,
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      dropdownElevation: 1,
                                      scrollbarRadius: Radius.circular(40),
                                      scrollbarThickness: 5,
                                      scrollbarAlwaysShow: true,
                                      items: controller.connectionThroughList.map((ward) {
                                        return DropdownMenuItem(
                                          value: ward["id"].toString(),
                                          child: Text(ward["connection_through"].toString()),
                                        );
                                      }).toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select.';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.connectionThrough.value = value.toString();
                                      },
                                    ),
                                  );
                                }
                              }),
                              SizedBox(height: 15,),
                              Obx(() {
                                if (controller.isDataProcessing == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      Visibility(
                                        visible: controller.connectionThrough.value == '',
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                " *",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                              Text(
                                                'Select Connection Through',
                                                style: GoogleFonts.publicSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: controller.connectionThrough.value == "2",
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                " *",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                              Text(
                                                'Enter SAF No',
                                                style: GoogleFonts.publicSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: controller.connectionThrough.value == "1",
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                " *",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                              Text(
                                                'Enter Holding No',
                                                style: GoogleFonts.publicSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller.holdingId,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height:2,),
                    ],
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  controller.showContainer.value = true; // show the container when the button is clicked
                  controller.isDataProcessing.value = true;
                  await controller.getSafBySearch();
                  // controller.showContainer.value = false; // hide the container after data is fetched
                },
                child: Text('Search'),
              ),

              Obx(() {
                if (controller.showContainer.value) {
                  if (controller.isDataProcessing.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        Visibility(
                          visible: true,
                          child:  Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.indigo,
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
                                  SizedBox(height:2,),
                                  Container(
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
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 15,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Type Of Request',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(() {
                                            if (controller.isDataProcessing == true) {
                                              return Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else {
                                              return  Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: DropdownButtonFormField2(
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[100],
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
                                                    TextStyle(fontSize: 14, color: Colors.black45),
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
                                                  dropdownWidth: 330,
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  dropdownElevation: 1,
                                                  scrollbarRadius: Radius.circular(40),
                                                  scrollbarThickness: 5,
                                                  scrollbarAlwaysShow: true,
                                                  items: controller.requestTypeList.map((ward) {
                                                    return DropdownMenuItem(
                                                      value: ward["id"].toString(),
                                                      child: Text(ward["connection_type"].toString()),
                                                    );
                                                  }).toList(),
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'Please select.';
                                                    }
                                                  },
                                                  onChanged: (value) {
                                                    controller.sTypeOfRequest.value = value.toString();
                                                  },
                                                ),
                                              );
                                            }
                                          }),
                                          //OWNER TYPE
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Owner Type',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(() {
                                            if (controller.isDataProcessing == true) {
                                              return Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else {
                                              if (controller.isTenanted == true) {
                                                return  Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: DropdownButtonFormField2(
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.grey[100],
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
                                                      TextStyle( fontSize: 14, color: Colors.black45),
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
                                                    items: controller.ownerTypeList.map((ward) {
                                                      return DropdownMenuItem(
                                                        value: ward["id"].toString(),
                                                        child: Text(ward["owner_type"].toString()),
                                                      );
                                                    }).toList(),
                                                    validator: (value) {
                                                      if (value == null) {
                                                        return 'Please select.';
                                                      }
                                                    },
                                                    onChanged: (value) {
                                                      controller.sOwnerType.value = value.toString();
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(

                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      filled: true,
                                                      fillColor: Colors.grey[100],
                                                      disabledBorder: InputBorder.none,
                                                      hintText: 'OWNER',
                                                      hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
                                                    ),
                                                    enabled: false,
                                                  ),
                                                );

                                              }
                                            }
                                          }),

                                          //PROPERTY TYPE
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Property Type',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(() {
                                            if (controller.isDataProcessing == true) {
                                              return Center(
                                                child: CircularProgressIndicator(),
                                              );
                                            } else {
                                              return  Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: DropdownButtonFormField2(
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[100],
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
                                                    TextStyle( fontSize: 14, color: Colors.black45),
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
                                                  // items: controller.propertyTypeList.map((ward) {
                                                  //   return DropdownMenuItem(
                                                  //     value: ward["id"].toString(),
                                                  //     child: Text(ward["property_type"].toString()),
                                                  //   );
                                                  // }).toList(),
                                                  items: controller.usageTypeList.map((ward) {
                                                    return DropdownMenuItem(
                                                      value: ward["id"].toString(),
                                                      child: Text(ward["usageType"].toString()),
                                                    );
                                                  }).toList(),
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'Please select.';
                                                    }
                                                  },
                                                  onChanged: (value) {
                                                    controller.sPropertyType.value = value.toString();
                                                  },
                                                ),
                                              );
                                            }
                                          }),
                                          //CATEGORY TYPE
                                          //PIPELINE TYPE
                                          Obx(() {
                                            if (controller.sPropertyType.value == '1') {
                                              return Visibility(
                                                visible: true,
                                                child:
                                                //CATEGORY TYPE
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                          Text(
                                                            'Category Type',
                                                            style: GoogleFonts.publicSans(
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 16,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: DropdownButtonFormField2(
                                                        decoration: InputDecoration(
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
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
                                                          TextStyle( fontSize: 14, color: Colors.black45),
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
                                                        dropdownWidth: 330,
                                                        dropdownDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                        ),
                                                        dropdownElevation: 8,
                                                        scrollbarRadius: Radius.circular(40),
                                                        scrollbarThickness: 5,
                                                        scrollbarAlwaysShow: true,
                                                        items: [
                                                          DropdownMenuItem(
                                                            child: Text("APL"),
                                                            value: "0",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("BPL"),
                                                            value: "1",
                                                          ),
                                                        ],
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return 'Please select.';
                                                          }
                                                        },
                                                        onChanged: (value) {
                                                          controller.sCategoryType.value = value.toString();
                                                        },
                                                      ),
                                                    ),
                                                    //PIPELINE TYPE
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                          Text(
                                                            'Pipeline Type',
                                                            style: GoogleFonts.publicSans(
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 16,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Obx(() {
                                                      if (controller.isDataProcessing == true) {
                                                        return Center(
                                                          child: CircularProgressIndicator(),
                                                        );
                                                      } else {
                                                        return  Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: DropdownButtonFormField2(
                                                            decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors.grey[100],
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
                                                              TextStyle( fontSize: 14, color: Colors.black45),
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
                                                            dropdownWidth: 330,
                                                            dropdownDecoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5),
                                                            ),
                                                            dropdownElevation: 8,
                                                            scrollbarRadius: Radius.circular(40),
                                                            scrollbarThickness: 5,
                                                            scrollbarAlwaysShow: true,
                                                            items: controller.pipelineTypeList.map((ward) {
                                                              return DropdownMenuItem(
                                                                value: ward["id"].toString(),
                                                                child: Text(ward["pipeline_type"].toString()),
                                                              );
                                                            }).toList(),
                                                            validator: (value) {
                                                              if (value == null) {
                                                                return 'Please select.';
                                                              }
                                                            },
                                                            onChanged: (value) {
                                                              controller.sPipelineType.value = value.toString();
                                                            },
                                                          ),
                                                        );
                                                      }
                                                    }),
                                                  ],
                                                ),

                                              );
                                            }else {
                                              return SizedBox(); // Return an empty widget when property type is not Residential
                                            }
                                          }),
                                          //WARD NO
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Ward No',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue: controller.wardNo ?? '',
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Enter Ward No',
                                                hintStyle: const TextStyle(
                                                    fontSize: 14, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          //TOTAL AREA(SQ.FT)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Total Area (Sq.Ft)',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue: controller.TotalArea ?? '',
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Enter Total Area ',
                                                hintStyle: const TextStyle(
                                                    fontSize: 14, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          //PINCODE
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Pincode',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue: controller.pinCode ?? '',
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Enter Pincode',
                                                hintStyle: const TextStyle(
                                                    fontSize: 14, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          //ADDRESS
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(" *", style: TextStyle(color: Colors.red),),
                                                Text(
                                                  'Address',
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              initialValue: controller.address ?? '',
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                disabledBorder: InputBorder.none,
                                                hintText: 'Enter Address',
                                                hintStyle: const TextStyle(
                                               fontSize: 14, color: Colors.black45),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //LIST OF OWNERS
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
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
                                                  top:0, right: 4, bottom: 0),
                                              child: Icon(Icons.info_outlined,
                                                  color: Colors.white, size: 20),
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            "  List of Owner(s) from Property ",
                                            style: GoogleFonts.publicSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.white,
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
                      //TABLE OF PROPERTY OWNERS
                      Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: Column(
                children: [
                Container(
                padding: const EdgeInsets.all(10.0),
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
                child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                columnSpacing: 30,
                columns: [
                DataColumn(label: Center(child: Text('S.No')),),
                DataColumn(label: Center(child: Text('Applicant Name')),),
                DataColumn(label: Center(child: Text('Applicant Father')),),
                DataColumn(label: Center(child: Text('Phone No')),),
                DataColumn(label: Center(child: Text('Email')),),
                ],
                rows: List<DataRow>.generate(
                controller.owners.length,
                (index) {
                var owner = controller.owners[index];
                return DataRow(
                cells: [
                DataCell(Center(child: Text((index + 1).toString()))),
                DataCell(Center(child: Text(owner['ownerName'].toString()))),
                DataCell(Center(child: Text(owner['guardianName'].toString()))),
                DataCell(Center(child: Text(owner['mobileNo'].toString()))),
                DataCell(Center(child: Text(owner['email'].toString()))),
                ],
                );
                },
                ),
                ),
                ),
                ),],
                ),
                ),
                        // FOR TENANT
                        Obx(() {
                          if (controller.sOwnerType.value == '2') {
                            return  Visibility(
                              visible: true,
                              child:  Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
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
                                                            top:0, right: 4, bottom: 0),
                                                        child: Icon(Icons.info_outlined,
                                                            color: Colors.black, size: 20),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                      "  List of Tenant\n"
                                                          "\nYou can add or remove water Tenet from below actions",
                                                      style: GoogleFonts.publicSans(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 15,
                                                        fontStyle: FontStyle.normal,
                                                        color: Colors.black,
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
                                    SizedBox(height: 20,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
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
                                          SizedBox(height:2,),
                                          Container(
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
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 15,),
                                                  //APPLICANT NAME
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(" *", style: TextStyle(color: Colors.red),),
                                                        Text(
                                                          'Applicant Name',
                                                          style: GoogleFonts.publicSans(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 16,
                                                              fontStyle: FontStyle.normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller: controller.TApplicantName,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        filled: true,
                                                        fillColor: Colors.grey[100],
                                                        disabledBorder: InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  //GUARDIAN NAME
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(" *", style: TextStyle(color: Colors.red),),
                                                        Text(
                                                          'Guardian Name',
                                                          style: GoogleFonts.publicSans(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 16,
                                                              fontStyle: FontStyle.normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller: controller.TGuardianName,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        filled: true,
                                                        fillColor: Colors.grey[100],
                                                        disabledBorder: InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  //MOBILE NO
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(" *", style: TextStyle(color: Colors.red),),
                                                        Text(
                                                          'Mobile No',
                                                          style: GoogleFonts.publicSans(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 16,
                                                              fontStyle: FontStyle.normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller: controller.TMobileNo,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        filled: true,
                                                        fillColor: Colors.grey[100],
                                                        disabledBorder: InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  //ADDRESS
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(" *", style: TextStyle(color: Colors.red),),
                                                        Text(
                                                          'Email Id',
                                                          style: GoogleFonts.publicSans(
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 16,
                                                              fontStyle: FontStyle.normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller: controller.TEmailId,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        filled: true,
                                                        fillColor: Colors.grey[100],
                                                        disabledBorder: InputBorder.none,),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }else {
                            return SizedBox();
                          }
                        }),
                      ],
                    );
                  }
                } else {
                  return Visibility(
                    visible: false,
                    child: SizedBox.shrink(),
                  );
                }
              }),

              SizedBox(
                height: 30,
              ),

              Obx(
                    () =>   Visibility(
                  visible: controller.showContainer.value,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: Text("Are you sure to cancel ?"),
                              actions: [
                                TextButton(
                                  child: Text("No"),
                                  onPressed: () => Get.back(),
                                ),
                                TextButton(
                                    child: Text("yes"),
                                    onPressed: () {}),
                              ],
                            ),
                          );
                        },
                        child: Text(" Cancel "),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.WaterValidateForm(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('  Submit Form  '),
                      ),
                    ],
                  ),
                ),),
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
