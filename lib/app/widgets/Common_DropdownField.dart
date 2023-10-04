import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String headingText;
  final List<DropdownMenuItem<String>> items;
  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String?>? onChanged;

  CustomDropdownFormField({
    required this.headingText,
    required this.items,
    required this.hintText,
    required this.validator,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           width: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal:0),
              child: Text(
                headingText,
                style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal:0),
              child:  DropdownButtonFormField2<String>(
                items: items,
                 dropdownMaxHeight:230,
                 dropdownWidth: 200,
                buttonHeight: 40,
                buttonPadding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                ),
                itemPadding: EdgeInsets.only(left: 25, right: 0, bottom: 10),
                dropdownElevation: 1,
                scrollbarRadius: Radius.circular(40),
                scrollbarThickness: 5,
                scrollbarAlwaysShow: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
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
                hint: Text(
                  hintText,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                validator: validator,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
