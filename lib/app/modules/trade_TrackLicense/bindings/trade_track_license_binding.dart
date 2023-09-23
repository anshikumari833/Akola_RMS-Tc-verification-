import 'package:get/get.dart';

import '../controllers/trade_track_license_controller.dart';

class TradeTrackLicenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeTrackLicenseController>(
      () => TradeTrackLicenseController(),
    );
  }
}
