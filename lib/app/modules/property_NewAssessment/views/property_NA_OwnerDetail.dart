import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_ExtraDetail.dart';
import 'package:amc_rms/app/modules/property_NewAssessment/views/property_NA_FloorDetails.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../widgets/Assessment_appbar.dart';
import '../controllers/property_new_assessment_controller.dart';

class OwnerDetailView extends GetView<PropertyNewAssessmentController> {
   OwnerDetailView({Key? key}) : super(key: key);
   @override
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
                                      Image.asset(
                                        "assets/images/owner_details.png",
                                        height: 45,
                                        width: 45,
                                      ),
                                      Text(
                                        ' Owner Details',
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
                                    controller.addOwners();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        int currentIndex = controller.ownersController.length - 1;
                                        return StatefulBuilder(
                                          builder: (BuildContext context, StateSetter setState)
                                          {
                                            return AlertDialog(
                                              // backgroundColor: Color(0xFFF0F6F9),
                                              content: SingleChildScrollView(
                                                child:  Column(
                                                  children: [
                                                    Padding(
                                                      padding:  EdgeInsets.only(top:5, bottom: 3, left:0, right:0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            "Owner Details  ",
                                                            style: TextStyle( fontSize:15,
                                                              fontWeight: FontWeight  .w700,
                                                              color: Colors .indigo,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            onPressed:
                                                                () {
                                                              controller.removeOwnerData(currentIndex);
                                                              Navigator.of(context).pop();
                                                            },
                                                            icon: Icon(Icons.delete,color: Colors.indigo,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top:0, bottom: 5, left:0, right:0),
                                                      child: Divider(
                                                        color: Colors.blue,
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                    //OWNER NAME
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Owner Name',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.ownerNameController[currentIndex],
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                          )
                                                        ],
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter Owner name',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //OWNER MARATHI NAME
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Owner Marathi Name',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.ownerMarathiNameController[currentIndex],
                                                        // onChanged: (value) {
                                                        //   controller.convertToMarathi(value);
                                                        // },
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]+')),
                                                        ],
                                                        keyboardType: TextInputType.text,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter Owner name',
                                                          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    // Obx(() => Padding(
                                                    //   padding: const EdgeInsets.all(8.0),
                                                    //   child: Text(
                                                    //     'Marathi Text: ${controller.marathiText}',
                                                    //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                    //   ),
                                                    // )),

                                                    //GENDER
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Gender',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
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
                                                          style: TextStyle(fontSize: 16, color: Colors.grey),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black45,
                                                        ),
                                                        iconSize: 30,
                                                        buttonHeight: 40,
                                                        buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                                        buttonElevation: 2,
                                                        itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                        dropdownMaxHeight: 250,
                                                        dropdownWidth: 320,
                                                        dropdownDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),),
                                                        dropdownElevation: 8,
                                                        scrollbarRadius: Radius.circular(40),
                                                        scrollbarThickness: 5,
                                                        scrollbarAlwaysShow: true,
                                                        items: [
                                                          DropdownMenuItem(
                                                            child: Text("Male"),
                                                            value: "Male",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("Female"),
                                                            value: "Female",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("Others"),
                                                            value: "Others",
                                                          ),
                                                        ],
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return 'Please select.';
                                                          }
                                                        },
                                                        onChanged: (value) {
                                                          controller.gender.value = value.toString();
                                                        },
                                                      ),
                                                    ),
                                                    //DOB
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'DOB',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: DateTimeField(
                                                        controller: controller.dobController[currentIndex],
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          suffixIcon: Icon(Icons.calendar_month_outlined),
                                                          hintText: 'dd-mm-yyyy',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),
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
                                                    //GUARDIAN NAME
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Guardian Name - ',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.guardianNameController[currentIndex],
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                          )
                                                        ],
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter guardian name',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //GUARDIAN MARATHI NAME
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Guardian Name - ',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.guardianMarathiNameController[currentIndex],
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                          )
                                                        ],
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter guardian name',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //RELATION
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Relation',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
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
                                                          TextStyle(fontSize: 14, color: Colors.grey),),
                                                        icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black45,
                                                        ),
                                                        iconSize: 30,
                                                        buttonHeight: 40,
                                                        buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                                        buttonElevation: 2,
                                                        itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                        dropdownMaxHeight: 250,
                                                        dropdownWidth: 320,
                                                        dropdownDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),),
                                                        dropdownElevation: 8,
                                                        scrollbarRadius: Radius.circular(40),
                                                        scrollbarThickness: 5,
                                                        scrollbarAlwaysShow: true,
                                                        items: [
                                                          DropdownMenuItem(
                                                            child: Text("S/O"),
                                                            value: "S/O",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("D/O"),
                                                            value: "D/O",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("W/O"),
                                                            value: "W/O",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("C/O"),
                                                            value: "C/O",
                                                          ),
                                                        ],
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return 'Please select.';
                                                          }
                                                        },
                                                        onChanged: (value) {
                                                          controller.relation.value = value.toString();
                                                        },
                                                      ),
                                                    ),
                                                    //MOBILE NO
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Mobile No',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.mobileNoController[currentIndex],
                                                        keyboardType: TextInputType.number,
                                                        maxLength: 10,
                                                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter mobile no',
                                                          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          if (value.length < 10) {
                                                            return 'Please enter a valid 10-digit mobile number';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //AADHAR NO
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Aadhar No',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.aadharNoController[currentIndex],
                                                        keyboardType: TextInputType.number,
                                                        maxLength: 12,
                                                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter aadhar no',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          if (value.length < 12) {
                                                            return 'Please enter a valid 12-digit Aadhar number';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //PAN NO
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Pan No',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.panNoController[currentIndex],
                                                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$')),],
                                                        maxLength: 10,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter pan no',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          if (value.length < 10) {
                                                            return 'Please enter a valid 10-character PAN number';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //E-MAIL
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Email',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: TextFormField(
                                                        controller: controller.emailController[currentIndex],
                                                        keyboardType: TextInputType.emailAddress,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          filled: true,
                                                          fillColor: Colors.grey[100],
                                                          disabledBorder: InputBorder.none,
                                                          hintText: 'Enter email',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 14, color: Colors.grey),
                                                        ),
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                    //IS ARMED FORM
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Is Armed Force',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
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
                                                          TextStyle(fontSize: 16, color: Colors.grey),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black45,
                                                        ),
                                                        iconSize: 30,
                                                        buttonHeight: 40,
                                                        buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                                        buttonElevation: 2,
                                                        itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                        dropdownMaxHeight: 250,
                                                        dropdownWidth: 320,
                                                        dropdownDecoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),),
                                                        dropdownElevation: 8,
                                                        scrollbarRadius: Radius.circular(40),
                                                        scrollbarThickness: 5,
                                                        scrollbarAlwaysShow: true,
                                                        items: [
                                                          DropdownMenuItem(
                                                            child: Text("No"),
                                                            value: "0",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("Yes"),
                                                            value: "1",
                                                          ),
                                                        ],
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return 'Please select';
                                                          }
                                                        },
                                                        onChanged: (value) {
                                                          controller.isArmedForce.value = value.toString();
                                                        },
                                                      ),
                                                    ),
                                                    // IS SPECIALLY ABLED
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Is Specially Abled',
                                                            style: GoogleFonts.literata(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal),
                                                          ),
                                                          Text(" *", style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(1.0),
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
                                                          TextStyle(fontSize: 16, color: Colors.grey),
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
                                                        items: [
                                                          DropdownMenuItem(
                                                            child: Text("No"),
                                                            value: "0",
                                                          ),
                                                          DropdownMenuItem(
                                                            child: Text("Yes"),
                                                            value: "1",
                                                          ),
                                                        ],
                                                        validator: (value) {
                                                          if (value == null) {
                                                            return 'Please select';
                                                          }
                                                        },
                                                        onChanged: (value) {
                                                          controller.isSpeciallyAbled.value = value.toString();
                                                        },
                                                      ),
                                                    ),
                                                    //  BUTTONS
                                                    SizedBox(height: 20,),

                                                    ElevatedButton(
                                                      child: Text('Add'),
                                                      onPressed: () {
                                                        Map<String, dynamic>
                                                        ownerData = {
                                                          "Owner Name": controller.ownerNameController[currentIndex].text.toString(),
                                                          "Owner Marathi Name": controller.ownerMarathiNameController[currentIndex].text.toString(),
                                                          "Guardian Marathi Name": controller.guardianNameController[currentIndex].text.toString(),
                                                          "Gender": controller.gender.value.toString(),
                                                          "DOB":  controller.dobController[currentIndex].text.toString(),
                                                          "Guardian Name": controller.guardianNameController[currentIndex].text.toString(),
                                                          "Relation": controller.relation.value.toString(),
                                                          "Mobile No": controller.mobileNoController[currentIndex].text.toString(),
                                                          "Aadhar No": controller.panNoController[currentIndex].text.toString(),
                                                          "Pan No": controller.panNoController[currentIndex].text.toString(),
                                                          "Email": controller.emailController[currentIndex].text.toString(),
                                                          "Is Armed Force": controller.isArmedForce.value.toString(),
                                                          "Is Specially Abled": controller.isSpeciallyAbled.value.toString(),
                                                        };
                                                        setState(() {
                                                          controller.ownerDataList.add(ownerData);
                                                        });
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Text("Add Owner"),
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
                                          " Click add owner button to add owner of the property, You can add multiple owners by repeating the same method",
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
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15.0),
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
                                child: Column(
                                  children: List<Widget>.generate(controller.ownerDataList.length, (index) {
                                    final ownerData = controller.ownerDataList[index];
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Owner Name:'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(' ${ownerData['Owner Name']}'),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Owner Marathi Name: ${ownerData['Owner Marathi Name']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Gender: ${ownerData['Gender']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('DOB: ${ownerData['DOB']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Guardian Name: ${ownerData['Guardian Name']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Guardian Marathi Name: ${ownerData['Guardian Marathi Name']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Relation: ${ownerData['Relation']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Mobile No: ${ownerData['Mobile No']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Aadhar No: ${ownerData['Aadhar No']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Pan No: ${ownerData['Pan No']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Email: ${ownerData['Email']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Is Armed Force: ${ownerData['Is Armed Force']}'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Is Specially Abled: ${ownerData['Is Specially Abled']}'),
                                          ),
                                          Center(
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.edit),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          int currentIndex = index; // The index of the owner data being edited
                                                          Map<String, dynamic> existingData = controller.ownerDataList[currentIndex];
                                                          TextEditingController ownerNameController = TextEditingController(text: existingData['ownerName']);
                                                          TextEditingController ownerMarathiNameController = TextEditingController(text: existingData['Owner Marathi Name']);
                                                          TextEditingController guardianMarathiNameController = TextEditingController(text: existingData['Guardian Marathi Name']);
                                                          TextEditingController dobController = TextEditingController(text: existingData['dob']);
                                                          TextEditingController mobileNoController = TextEditingController(text: existingData['mobileNo']);
                                                          TextEditingController guardianNameController = TextEditingController(text: existingData['guardianName']);
                                                          TextEditingController aadharNoController = TextEditingController(text: existingData['aadhar']);
                                                          TextEditingController panNoController = TextEditingController(text: existingData['pan']);
                                                          TextEditingController emailController = TextEditingController(text: existingData['email']);

                                                          return StatefulBuilder(
                                                            builder: (BuildContext context, StateSetter setState) {
                                                              return  AlertDialog(
                                                                backgroundColor: Color(0xFFF0F6F9),
                                                                content: SingleChildScrollView(
                                                                  child:  Container(
                                                                    // decoration: BoxDecoration(
                                                                    //     color:Colors.white,
                                                                    //     borderRadius: BorderRadius.circular(15),
                                                                    //     boxShadow: const [
                                                                    //       BoxShadow(
                                                                    //         color: Color.fromRGBO(0, 0, 0, 0.06),
                                                                    //         offset: Offset(0, 4),
                                                                    //         blurRadius: 4,
                                                                    //         spreadRadius: 0,
                                                                    //       ),
                                                                    //     ]),
                                                                    child: Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding:  EdgeInsets.only(top:5, bottom: 3, left:0, right:0),
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Text(
                                                                                "Owner Details  ",
                                                                                style: TextStyle( fontSize:15,
                                                                                  fontWeight: FontWeight  .w700,
                                                                                  color: Colors .indigo,
                                                                                ),
                                                                              ),
                                                                              IconButton(
                                                                                onPressed:
                                                                                    () {
                                                                                  controller.removeOwnerData(currentIndex);
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                icon: Icon(Icons.delete,color: Colors.indigo,),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(top:0, bottom: 5, left:0, right:0),
                                                                          child: Divider(
                                                                            color: Colors.blue,
                                                                            thickness: 1,
                                                                          ),
                                                                        ),
                                                                        //OWNER NAME
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Owner Name',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.ownerNameController[currentIndex],
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                                              )
                                                                            ],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter Owner name',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),
                                                                            ),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //OWNER MARATHI NAME
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Owner Marathi Name',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.ownerMarathiNameController[currentIndex],
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                                              )
                                                                            ],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter Owner name',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),
                                                                            ),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //GENDER
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Gender',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
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
                                                                              style: TextStyle(fontSize: 16, color: Colors.grey),
                                                                            ),
                                                                            icon: const Icon(
                                                                              Icons.arrow_drop_down,
                                                                              color: Colors.black45,
                                                                            ),
                                                                            iconSize: 30,
                                                                            buttonHeight: 40,
                                                                            buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                                                            buttonElevation: 2,
                                                                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                            dropdownMaxHeight: 250,
                                                                            dropdownWidth: 320,
                                                                            dropdownDecoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(5),),
                                                                            dropdownElevation: 8,
                                                                            scrollbarRadius: Radius.circular(40),
                                                                            scrollbarThickness: 5,
                                                                            scrollbarAlwaysShow: true,
                                                                            items: [
                                                                              DropdownMenuItem(
                                                                                child: Text("Male"),
                                                                                value: "Male",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("Female"),
                                                                                value: "Female",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("Others"),
                                                                                value: "Others",
                                                                              ),
                                                                            ],
                                                                            validator: (value) {
                                                                              if (value == null) {
                                                                                return 'Please select.';
                                                                              }
                                                                            },
                                                                            onChanged: (value) {
                                                                              controller.gender.value = value.toString();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //DOB
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'DOB',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: DateTimeField(
                                                                            controller: controller.dobController[currentIndex],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              suffixIcon: Icon(Icons.calendar_month_outlined),
                                                                              hintText: 'dd-mm-yyyy',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),
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
                                                                        //GUARDIAN NAME
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Guardian Name - ',
                                                                                style: GoogleFonts.publicSans(
                                                                                    fontWeight: FontWeight.w700,
                                                                                    fontSize: 16,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.guardianNameController[currentIndex],
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                                              )
                                                                            ],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter guardian name',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //GUARDIAN MARATHI NAME
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Guardian Name - ',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.guardianMarathiNameController[currentIndex],
                                                                            inputFormatters: [
                                                                              FilteringTextInputFormatter.allow( RegExp(r'[a-zA-Z\s]+')
                                                                              )
                                                                            ],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter guardian name',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //RELATION
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Relation',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
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
                                                                              TextStyle(fontSize: 14, color: Colors.grey),),
                                                                            icon: const Icon(
                                                                              Icons.arrow_drop_down,
                                                                              color: Colors.black45,
                                                                            ),
                                                                            iconSize: 30,
                                                                            buttonHeight: 40,
                                                                            buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                                                            buttonElevation: 2,
                                                                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                            dropdownMaxHeight: 250,
                                                                            dropdownWidth: 320,
                                                                            dropdownDecoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(5),),
                                                                            dropdownElevation: 8,
                                                                            scrollbarRadius: Radius.circular(40),
                                                                            scrollbarThickness: 5,
                                                                            scrollbarAlwaysShow: true,
                                                                            items: [
                                                                              DropdownMenuItem(
                                                                                child: Text("S/O"),
                                                                                value: "S/O",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("D/O"),
                                                                                value: "D/O",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("W/O"),
                                                                                value: "W/O",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("C/O"),
                                                                                value: "C/O",
                                                                              ),
                                                                            ],
                                                                            validator: (value) {
                                                                              if (value == null) {
                                                                                return 'Please select.';
                                                                              }
                                                                            },
                                                                            onChanged: (value) {
                                                                              controller.relation.value = value.toString();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //MOBILE NO
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Mobile No',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.mobileNoController[currentIndex],
                                                                            keyboardType: TextInputType.number,
                                                                            maxLength: 10,
                                                                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter mobile no',
                                                                              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              if (value.length < 10) {
                                                                                return 'Please enter a valid 10-digit mobile number';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //AADHAR NO
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Aadhar No',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.aadharNoController[currentIndex],
                                                                            keyboardType: TextInputType.number,
                                                                            maxLength: 12,
                                                                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter aadhar no',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),
                                                                            ),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              if (value.length < 12) {
                                                                                return 'Please enter a valid 12-digit Aadhar number';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //PAN NO
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Pan No',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.panNoController[currentIndex],
                                                                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$')),],
                                                                            maxLength: 10,
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter pan no',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),
                                                                            ),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              if (value.length < 10) {
                                                                                return 'Please enter a valid 10-character PAN number';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //E-MAIL
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Email',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: controller.emailController[currentIndex],
                                                                            keyboardType: TextInputType.emailAddress,
                                                                            decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: Colors.grey[100],
                                                                              disabledBorder: InputBorder.none,
                                                                              hintText: 'Enter email',
                                                                              hintStyle: const TextStyle(
                                                                                  fontSize: 14, color: Colors.grey),
                                                                            ),
                                                                            validator: (value) {
                                                                              if (value!.isEmpty) {
                                                                                return 'Please enter';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //IS ARMED FORM
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Is Armed Force',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
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
                                                                              TextStyle(fontSize: 16, color: Colors.grey),
                                                                            ),
                                                                            icon: const Icon(
                                                                              Icons.arrow_drop_down,
                                                                              color: Colors.black45,
                                                                            ),
                                                                            iconSize: 30,
                                                                            buttonHeight: 40,
                                                                            buttonPadding: EdgeInsets.only(left: 20, right: 25, bottom: 10),
                                                                            buttonElevation: 2,
                                                                            itemPadding: EdgeInsets.only(left: 25, right: 25),
                                                                            dropdownMaxHeight: 250,
                                                                            dropdownWidth: 320,
                                                                            dropdownDecoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(5),),
                                                                            dropdownElevation: 8,
                                                                            scrollbarRadius: Radius.circular(40),
                                                                            scrollbarThickness: 5,
                                                                            scrollbarAlwaysShow: true,
                                                                            items: [
                                                                              DropdownMenuItem(
                                                                                child: Text("No"),
                                                                                value: "0",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("Yes"),
                                                                                value: "1",
                                                                              ),
                                                                            ],
                                                                            validator: (value) {
                                                                              if (value == null) {
                                                                                return 'Please select';
                                                                              }
                                                                            },
                                                                            onChanged: (value) {
                                                                              controller.isArmedForce.value = value.toString();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        // IS SPECIALLY ABLED
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                'Is Specially Abled',
                                                                                style: GoogleFonts.literata(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    fontStyle: FontStyle.normal),
                                                                              ),
                                                                              Text(" *", style: TextStyle(color: Colors.red),),
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
                                                                              TextStyle(fontSize: 16, color: Colors.grey),
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
                                                                            items: [
                                                                              DropdownMenuItem(
                                                                                child: Text("No"),
                                                                                value: "0",
                                                                              ),
                                                                              DropdownMenuItem(
                                                                                child: Text("Yes"),
                                                                                value: "1",
                                                                              ),
                                                                            ],
                                                                            validator: (value) {
                                                                              if (value == null) {
                                                                                return 'Please select';
                                                                              }
                                                                            },
                                                                            onChanged: (value) {
                                                                              controller.isSpeciallyAbled.value = value.toString();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        //  BUTTONS
                                                                        SizedBox(height: 20,),

                                                                        ElevatedButton(
                                                                          child: Text('Save'),
                                                                          onPressed: () {
                                                                            Map<String, dynamic> editedOwnerData = {
                                                                              'ownerName':  controller.ownerNameController[currentIndex].text,
                                                                              'gender': existingData['gender'],
                                                                              'dob':  controller.dobController[currentIndex].text,
                                                                              'guardianName':  controller.guardianNameController[currentIndex].text,
                                                                              'relation': existingData['relation'],
                                                                              'mobileNo':  controller.mobileNoController[currentIndex].text,
                                                                              'aadhar':  controller.aadharNoController[currentIndex].text,
                                                                              'pan':  controller.panNoController[currentIndex].text,
                                                                              'email':  controller.emailController[currentIndex].text,
                                                                              'isArmedForce': existingData['isArmedForce'],
                                                                              'isSpeciallyAbled': existingData['isSpeciallyAbled'],
                                                                            };

                                                                            controller.editOwnerData(currentIndex, editedOwnerData);

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
                                                      controller.deleteOwnerData(index);
                                                    },
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    );

                                  }),
                                ),
                              ),
                              SizedBox(height: 10,)
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
                          if (controller.propertyType.value == "4") {
                            Get.to(PropertyExtraDetailView());
                          } else {
                            Get.to(PropertyFloorDetailView());
                          }
                        },
                        child: Text('Save & next')
                    )
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

