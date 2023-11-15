import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/drawer_about_us_controller.dart';
/**
 * | Created By: ANSHI KUMARI
 */

class DrawerAboutUsView extends GetView<DrawerAboutUsController> {
  const DrawerAboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT US'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/akola_logo.png',
              fit: BoxFit.cover,
              height: 180,
              width: 180,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: Text(
                      "Introduction",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Akola Municipal Corporation-AMC is one of the nodal Department of the Government of Maharashtra, "
                          "responsible for ensuring proper and planned growth of cities and towns. It aims to provide adequate "
                          "infrastructure, amenities, and services to citizens through Urban Local Bodies and agencies. Government "
                          "of Maharashtra also works on formulating policies for urban development activities, creating urban "
                          "infrastructure, and implementing various poverty alleviation programs. "
                          "The Department has been taking concrete measures for efficient management & delivery of civic "
                          "services like provision of affordable housing, safe drinking water, sanitation including solid waste "
                          "management, storm water drainage, sewerage, roads, public transport; and creation of livelihood "
                          "opportunities for urban poor by accelerating economic growth of cities/towns and building capacity of "
                          "the urban poor. The Development & Housing Department is headed by the Minister at AMC, "
                          "Government of Maharashtra. The Additional Chief Secretary, Urban Development & Housing "
                          "Department is the administrative head of the Department. The office of Urban Development & Housing "
                          "Department is located at Akola (i.e., the capital of the state) in Project Building.",
                          style: TextStyle(
                            fontSize: 16, // Customize the font size
                            color: Colors.black, // Customize the text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: Text(
                      "Vision",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "To ensure planned and inclusive development of cities/towns into livable, economically vibrant and "
                          "productive, sustainable and efficient entities with provision of adequate and durable public "
                          "infrastructure and amenities, including affordable housing, various municipal services and livelihood "
                          "opportunities for all sections of society and bringing out efficiency in the service delivery mechanisms, "
                          "community participation and accountability of Urban Local Bodies and agencies towards citizens, in "
                          "convergent manner. "
                          "We believe that the answers to today’s biggest social challenges—from climate change and "
                          "environmental justice to affordable housing and workforce development—require creative, "
                          "multidisciplinary, and community-driven solutions. Our ULBs and other stakeholder are prepared to "
                          "think critically and comprehensively about these solutions and to foster meaningful community "
                          "engagement as part of the decision-making process. The AMC, Government of Maharashtra is an "
                          "intellectually exciting, creative, and productive community with largest professional’s resource.",
                          style: TextStyle(
                            fontSize: 16, // Customize the font size
                            color: Colors.black, // Customize the text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: Text(
                      "Mission",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "To ensure planned and inclusive development of cities/towns into livable, economically vibrant and "
                          "productive, sustainable and efficient entities with provision of adequate and durable public "
                          "infrastructure and amenities, including affordable housing, various municipal services and livelihood "
                          "opportunities for all sections of society and bringing out efficiency in the service delivery mechanisms, "
                          "community participation and accountability of Urban Local Bodies and agencies towards citizens, in "
                          "convergent manner. "
                          "We believe that the answers to today’s biggest social challenges—from climate change and "
                          "environmental justice to affordable housing and workforce development—require creative, "
                          "multidisciplinary, and community-driven solutions. Our ULBs and other stakeholder are prepared to "
                          "think critically and comprehensively about these solutions and to foster meaningful community "
                          "engagement as part of the decision-making process. The AMC, Government of Maharashtra is an "
                          "intellectually exciting, creative, and productive community with largest professional’s resource.",
                          style: TextStyle(
                            fontSize: 16, // Customize the font size
                            color: Colors.black, // Customize the text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
