import 'package:get/get.dart';

import '../controllers/water_consumer_search_controller.dart';

class WaterConsumerSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterConsumerSearchController>(
      () => WaterConsumerSearchController(),
    );
  }
}
