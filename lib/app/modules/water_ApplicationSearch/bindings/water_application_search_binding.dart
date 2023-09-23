import 'package:get/get.dart';

import '../controllers/water_application_search_controller.dart';

class WaterApplicationSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterApplicationSearchController>(
      () => WaterApplicationSearchController(),
    );
  }
}
