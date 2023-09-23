import 'package:get/get.dart';

import '../controllers/trade_surrender_controller.dart';

class TradeSurrenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeSurrenderController>(
      () => TradeSurrenderController(),
    );
  }
}
