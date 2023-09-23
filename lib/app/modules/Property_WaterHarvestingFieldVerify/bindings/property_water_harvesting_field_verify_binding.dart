import 'package:get/get.dart';

import '../controllers/property_water_harvesting_field_verify_controller.dart';

class PropertyWaterHarvestingFieldVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyWaterHarvestingFieldVerifyController>(
      () => PropertyWaterHarvestingFieldVerifyController(),
    );
  }
}
