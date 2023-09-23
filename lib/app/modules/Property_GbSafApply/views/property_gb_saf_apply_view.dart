import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_gb_saf_apply_controller.dart';

class PropertyGbSafApplyView extends GetView<PropertyGbSafApplyController> {
  const PropertyGbSafApplyView({Key? key}) : super(key: key);
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
            "Government SAF Form",
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),
          ),
        ),
        actions: [
          SizedBox(width: 10,),
          GestureDetector(
              onTap: () {Get.to(HomeView());},
              child: Icon(Icons.home, color: Colors.black,)),
          SizedBox(width: 14,),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              //PROPERTY DETAIL --STARTS
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 15, left:15, right: 0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/gb_propertydetail.png",
                            height: 45,
                            width: 45,
                          ),
                          Text(
                            ' Property Details',
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
                    //CARD - 1
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
                                      "Name of Building",
                              style: GoogleFonts.publicSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller:controller.buildingNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a building name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //NAME OF OFFICE OPERATED BY THE BUILDING
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name of office operated by the Building",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller:
                                  controller.officeBuildingNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter name of office operated';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //WARD NO
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Ward No",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  if (controller.isDataProcessing == true) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return DropdownButtonFormField<String>(
                                      decoration: InputDecoration(),
                                      menuMaxHeight: 300,
                                      items: controller.wardList?.isNotEmpty ??
                                          false
                                          ? controller.wardList!.map((items) {
                                        return DropdownMenuItem(
                                          value: items["id"].toString(),
                                          child: Text(
                                              items["ward_name"].toString()),
                                        );
                                      }).toList()
                                          : [],
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please Select ward no';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.wardNo.value = value.toString();
                                      },
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                          // NEW WARD NO
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "New Ward No",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  if (controller.isDataProcessing == true) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return DropdownButtonFormField<String>(
                                      decoration: InputDecoration(),
                                      items: controller.wardList?.isNotEmpty ??
                                          false
                                          ? controller.wardList!.map((items) {
                                        return DropdownMenuItem(
                                          value: items["id"].toString(),
                                          child: Text(
                                              items["ward_name"].toString()),
                                        );
                                      }).toList()
                                          : [],
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please Select new ward no';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.newWardNo.value =
                                            value.toString();
                                      },
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                          //HOLDING NO
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Holding No.(Previous holding no.if any)",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.holdingNoController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter holding no';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //GOVT. BUILDING USAGE TYPE
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Govt. Building Usage Type",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  if (controller.isDataProcessing == true) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return DropdownButtonFormField<String>(
                                      decoration: InputDecoration(),
                                      items: controller
                                          .gbBuildingList?.isNotEmpty ??
                                          false
                                          ? controller.gbBuildingList!.map((items) {
                                        return DropdownMenuItem(
                                          value: items["id"].toString(),
                                          child: Text(items["building_type"]
                                              .toString()),
                                        );
                                      }).toList()
                                          : [],
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please Select usage type';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.buildingUsage.value =
                                            value.toString();
                                      },
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                          //PROPERTY USAGE TYPE
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Property Usage Type",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  if (controller.isDataProcessing == true) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return DropdownButtonFormField<String>(
                                      decoration: InputDecoration(),
                                      items: controller.gbPropList?.isNotEmpty ??
                                          false
                                          ? controller.gbPropList!.map((items) {
                                        return DropdownMenuItem(
                                          value: items["id"].toString(),
                                          child: Text(items["prop_usage_type"]
                                              .toString()),
                                        );
                                      }).toList()
                                          : [],
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please Select property usage type';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.propertyType.value =
                                            value.toString();
                                      },
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                          //ZONE
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Zone",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                Obx(() {
                                  if (controller.isDataProcessing == true) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return DropdownButtonFormField<String>(
                                      decoration: InputDecoration(),
                                      items: controller.zoneList?.isNotEmpty ??
                                          false
                                          ? controller.zoneList!.map((items) {
                                        return DropdownMenuItem(
                                          value: items["id"].toString(),
                                          child:
                                          Text(items["zone"].toString()),
                                        );
                                      }).toList()
                                          : [],
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please Select Zone';
                                        }
                                      },
                                      onChanged: (value) {
                                        controller.Zone.value = value.toString();
                                      },
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                          //ROAD WITDH(IN FT)
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Road Width(in ft)",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.roadWidthController,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter road width';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //AREA OF PLOT
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Area of plot(In Decimal)",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.areaOfPlotController,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter area of plot';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //STREET NAME
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Street Name",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.streetNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter street name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //LOCATION
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Location",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.locationController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter location';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //LANDMARK
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Landmark",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.landmarkController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter landmark';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //BUILDING ADDRESS
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Building Address",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.buildingAddressController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter building address';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //DIVIDER
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.blue,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //CARD-2
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
                      child: Column(
                        children: [
                          //OFFICER DESIGNATION
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Officer Designtion",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller:
                                  controller.officerDesignationController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter desiganation';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //OFFICER ADDRESS
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Officer Address",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.officerAddressController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter address';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //OFFICER NAME
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Officer Name",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.officernameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter name';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //OFFICER EMAIL
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Officer Email",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.officerEmailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          //OFFICER MOBILE
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Officer Mobile",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: controller.officermobileController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter mobile no';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //DIVIDER
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.blue,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //CARD-3
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
                      child: Column(
                        children: [

                          // MOBILE TOWER
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Property has Mobile Tower(s)?",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(),
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: '0',
                                      child: Text('No'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '1',
                                      child: Text('Yes'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select mobile tower';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.isMobileTower.value =
                                        value.toString();
                                  },
                                )
                              ],
                            ),
                          ),
                          Obx(() {
                            if (controller.isDataProcessing == true) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Visibility(
                                visible: (controller.isMobileTower.value == "1"),
                                child: Container(
                                  child: Column(
                                    children: [
                                      //TOTAL AREA COVERED
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Total Area Covered",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            TextFormField(
                                              controller: controller.towerAreaController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter area';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //INSTALLATION DATE
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Installation Date",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            DateTimeField(
                                              controller: controller.towerInstallationController,
                                              decoration:
                                              InputDecoration(
                                                suffixIcon:
                                                Icon(Icons.calendar_month_outlined),
                                                hintText:
                                                ' dd-mm-yyyy',
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              format: DateFormat("dd-MM-yyyy"),
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

                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                          // HOARDING BOARD
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Property has Hoarding Board(s)?",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(),
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: '0',
                                      child: Text('No'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '1',
                                      child: Text('Yes'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select hoarding board';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.isHoarding.value = value.toString();
                                  },
                                )
                              ],
                            ),
                          ),
                          Obx(() {
                            if (controller.isDataProcessing == true) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Visibility(
                                visible: (controller.isHoarding.value == "1"),
                                child: Container(
                                  child: Column(
                                    children: [
                                      //TOTAL AREA COVERED
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Total Area Covered",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            TextFormField(
                                              controller: controller.hoardingAreaController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter area';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //INSTALLATION DATE
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Installation Date",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            DateTimeField(
                                              controller: controller.hoardingInstallationController,
                                              decoration:
                                              InputDecoration(
                                                suffixIcon:
                                                Icon(Icons.calendar_month_outlined),
                                                hintText:
                                                ' dd-mm-yyyy',
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              format: DateFormat("dd-MM-yyyy"),
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

                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                          //PETROL PUMP
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Is property a Petrol Pump?",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(),
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: '0',
                                      child: Text('No'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '1',
                                      child: Text('Yes'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select petrol pump';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.isPetrolPump.value = value.toString();
                                  },
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
                              return Visibility(
                                visible: (controller.isPetrolPump.value == "1"),
                                child: Container(
                                  child: Column(
                                    children: [
                                      //TOTAL AREA COVERED
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Total Area Covered",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            TextFormField(
                                              controller: controller.pumpAreaController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter area';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      //INSTALLATION DATE
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Installation Date",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            DateTimeField(
                                              controller: controller.pumpInstallationController,
                                              decoration:
                                              InputDecoration(
                                                suffixIcon:
                                                Icon(Icons.calendar_month_outlined),
                                                hintText:
                                                ' dd-mm-yyyy',
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              format: DateFormat("dd-MM-yyyy"),
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

                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                          //RAINWATER HARVESTING
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Rainwater Harvesting Provision?",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    Text(
                                      " *",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(),
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: '0',
                                      child: Text('No'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: '1',
                                      child: Text('Yes'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please Select rainwater harvesting';
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.isWaterHarvesting.value = value.toString();
                                  },
                                )
                              ],
                            ),
                          ),
                          Obx(() {
                            if (controller.isDataProcessing == true) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Visibility(
                                visible: (controller.isWaterHarvesting.value == "1"),
                                child: Container(
                                  child: Column(
                                    children: [
                                      //INSTALLATION DATE
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Construction Date",
                                                  style: GoogleFonts.publicSans(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      fontStyle: FontStyle.normal),
                                                ),
                                                Text(
                                                  " *",
                                                  style: TextStyle(color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            DateTimeField(
                                              controller: controller.harvestingCompletionDateController,
                                              decoration:
                                              InputDecoration(
                                                suffixIcon:
                                                Icon(Icons.calendar_month_outlined),
                                                hintText:
                                                ' dd-mm-yyyy',
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                              format: DateFormat("dd-MM-yyyy"),
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

                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                    //DIVIDER
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.blue,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              //PROPERTY DETAIL --ENDS

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
                                    Image.asset(
                                      "assets/images/gb-floorDetail.png",
                                      height: 45,
                                      width: 45,
                                    ),
                                    Text(
                                      ' Floor Details',
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                            controller: controller.floorDateFromController[
                                                            currentIndex],
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
                                                                style: GoogleFonts.publicSans(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 16,
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
                                                            controller: controller.floordateUptoController[
                                                            currentIndex],
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
                        color: Colors.red[100],
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
                                        "  Click Add floor button to add floors of the property.  "
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
              // FLOOR DETAILS --ENDS

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
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.GbSafFormSubmit();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}


