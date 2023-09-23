import 'package:get/get.dart';

import '../controllers/property_DailyTcReport_controller.dart';

class PropertyDailyTcReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyDailyTcReportController>(
      () => PropertyDailyTcReportController(),
    );
  }
}
