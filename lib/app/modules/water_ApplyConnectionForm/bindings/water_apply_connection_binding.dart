import 'package:get/get.dart';

import '../controllers/water_apply_connection_controller.dart';

class WaterApplyConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterApplyConnectionController>(
      () => WaterApplyConnectionController(),
    );
  }
}
