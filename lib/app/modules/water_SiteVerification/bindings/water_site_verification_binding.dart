import 'package:get/get.dart';

import '../controllers/water_site_verification_controller.dart';

class WaterSiteVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterSiteVerificationController>(
      () => WaterSiteVerificationController(),
    );
  }
}
