import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/trade_track_license_controller.dart';

class TradeTrackLicenseView extends GetView<TradeTrackLicenseController> {
  const TradeTrackLicenseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TradeTrackLicenseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TradeTrackLicenseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
