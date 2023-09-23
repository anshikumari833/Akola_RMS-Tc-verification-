import 'package:get/get.dart';

import '../controllers/property_consession_controller.dart';

class PropertyConsessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyConsessionController>(
      () => PropertyConsessionController(),
    );
  }
}
