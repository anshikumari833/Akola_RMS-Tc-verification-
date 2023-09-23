import 'package:get/get.dart';

import '../controllers/water_home_screen_controller.dart';

class WaterHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterHomeScreenController>(
      () => WaterHomeScreenController(),
    );
  }
}
