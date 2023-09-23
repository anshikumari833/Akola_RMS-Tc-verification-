import 'package:get/get.dart';

import '../controllers/trade_amendment_controller.dart';

class TradeAmendmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeAmendmentController>(
      () => TradeAmendmentController(),
    );
  }
}
