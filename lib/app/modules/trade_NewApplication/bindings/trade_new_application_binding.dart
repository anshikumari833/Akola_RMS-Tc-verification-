import 'package:get/get.dart';

import '../controllers/trade_new_application_controller.dart';

class TradeNewApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeNewApplicationController>(
      () => TradeNewApplicationController(),
    );
  }
}
