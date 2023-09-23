import 'package:get/get.dart';

import '../controllers/property_apply_harvesting_controller.dart';

class PropertyApplyHarvestingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyApplyHarvestingController>(
      () => PropertyApplyHarvestingController(),
    );
  }
}
