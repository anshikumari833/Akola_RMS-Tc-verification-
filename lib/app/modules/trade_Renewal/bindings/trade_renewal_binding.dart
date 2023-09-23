import 'package:get/get.dart';

import '../controllers/trade_renewal_controller.dart';

class TradeRenewalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeRenewalController>(
      () => TradeRenewalController(),
    );
  }
}
