import 'package:get/get.dart';

import '../controllers/property_apply_form_home_screen_controller.dart';

class PropertyApplyFormHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyApplyFormHomeScreenController>(
      () => PropertyApplyFormHomeScreenController(),
    );
  }
}
