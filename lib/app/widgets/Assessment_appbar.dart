
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/home/views/home_view.dart';

class AssessmentAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AssessmentAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor: Color(0xFFF1F7FC),
      title: Row(
        children: [
          Center(
            child: GetStorage().read('assessmentType') == "new"
                ? Text(
              "New Assessment",
              style: GoogleFonts.publicSans(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),
            )
                : null,
          ),
          Center(
            child: GetStorage().read('assessmentType') == "re"
                ? Text(
              "Re-Assessment",
              style: GoogleFonts.publicSans(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),
            )
                : null,
          ),
          Center(
            child: GetStorage().read('assessmentType') == "mu"
                ? Text(
              "Mutation",
              style: GoogleFonts.publicSans(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),
            )
                : null,
          ),
          Center(
            child: GetStorage().read('assessmentType') == "bi"
                ? Text(
              "Bifurcation",
              style: GoogleFonts.publicSans(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(69, 70, 70, 0.9),
              ),
            )
                : null,
          ),
        ],
      ),
    );}

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
