import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/water_consumer_search_controller.dart';

class WaterPaymentHistoryView extends GetView<WaterConsumerSearchController> {
  const WaterPaymentHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WaterPaymentHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
