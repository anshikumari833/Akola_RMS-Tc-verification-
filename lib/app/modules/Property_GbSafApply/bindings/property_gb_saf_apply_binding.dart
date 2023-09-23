import 'package:get/get.dart';

import '../controllers/property_gb_saf_apply_controller.dart';

class PropertyGbSafApplyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyGbSafApplyController>(
      () => PropertyGbSafApplyController(),
    );
  }
}
