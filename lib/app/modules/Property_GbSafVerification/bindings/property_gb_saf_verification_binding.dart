import 'package:get/get.dart';

import '../controllers/property_gb_saf_verification_controller.dart';

class PropertyGbSafVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyGbSafVerificationController>(
      () => PropertyGbSafVerificationController(),
    );
  }
}
