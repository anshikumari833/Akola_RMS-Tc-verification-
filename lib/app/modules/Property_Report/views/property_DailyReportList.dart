import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PropertyDailyReportListView extends GetView {
  const PropertyDailyReportListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PropertyDailyReportListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PropertyDailyReportListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
