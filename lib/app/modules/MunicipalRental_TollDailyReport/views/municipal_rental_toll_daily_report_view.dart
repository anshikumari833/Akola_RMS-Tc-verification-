import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/municipal_rental_toll_daily_report_controller.dart';

class MunicipalRentalTollDailyReportView extends GetView<MunicipalRentalTollDailyReportController> {
  const MunicipalRentalTollDailyReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toll Daily Report'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Lottie.asset('assets/lottie/DailyLicence_DailyReport.json'),
        ),
      ),
    );
  }
}
