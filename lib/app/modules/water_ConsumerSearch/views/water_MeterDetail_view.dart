import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/water_consumer_search_controller.dart';

class WaterMeterDetailView extends GetView<WaterConsumerSearchController> {
  const WaterMeterDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WaterMeterDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
