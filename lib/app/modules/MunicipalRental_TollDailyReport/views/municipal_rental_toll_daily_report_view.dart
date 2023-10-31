import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/municipal_rental_toll_daily_report_controller.dart';

class MunicipalRentalTollDailyReportView
    extends GetView<MunicipalRentalTollDailyReportController> {
  const MunicipalRentalTollDailyReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MunicipalRentalTollDailyReportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MunicipalRentalTollDailyReportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
