import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_about_controller.dart';

class HomeAboutView extends GetView<HomeAboutController> {
  const HomeAboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/akola_logo.png',
              fit: BoxFit.cover,
              height: 350,
              width: 350,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY:1.0),
            child: Container(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
              //    Text("The Urban Development & Housing Department (UD&HD) is the nodal Department of Government of Jharkhand (GoJ) for ensuring proper and planned growth of cities and towns with adequate infrastructure, amenities and services provided to the citizens through the Urban Local Bodies and agencies. "
              //        "UD&HD, GoJ also work for formulating policies of Urban Development activities, creation of urban infrastructure, implementation & monitoring of various poverty alleviation programme.   "
              //        "\n \n"
              //        "  The Department has been taking concrete measures for efficient management & delivery of civic services like provision of affordable housing, safe drinking water, sanitation including solid waste management, storm water drainage, sewerage, roads, public transport; and creation of livelihood opportunities for urban poor by accelerating economic growth of cities/towns and building capacity of the urban poor. The Development & Housing Department is headed by the Minister, UD&HD, GoJ. The Additional Chief Secretary, Urban Development & Housing Department is the administrative head of the Department. The office of Urban Development & Housing Department is located at Ranchi town (i.e, capital of the state) in Project Building."
              //        "\n \n"
              //        "To ensure planned and inclusive development of cities/towns into liveable, economically vibrant and productive, sustainable and efficient entities with provision of adequate and durable public infrastructure and amenities, including fulfil need of affordable housing for Economically Weaker Sections (EWS) & Slum Dwellers, Lower Income Group (LIG), Middle Income Group (MIG) and Higher Income Group(HIG) families in systematic manners. The UD&HD, GoJ also provide various municipal services and livelihood opportunities for all sections of society and bringing out efficiency in the service delivery mechanisms, community participation and accountability of Urban Local Bodies and agencies towards citizens, in convergent manner.",
              //   style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black),
              // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
