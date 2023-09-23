import 'package:get/get.dart';

import '../controllers/trade_home_screen_controller.dart';

class TradeHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeHomeScreenController>(
      () => TradeHomeScreenController(),
    );
  }
}
