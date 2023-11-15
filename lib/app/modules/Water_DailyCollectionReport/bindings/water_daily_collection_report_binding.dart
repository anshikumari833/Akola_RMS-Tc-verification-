import 'package:get/get.dart';

import '../controllers/water_daily_collection_report_controller.dart';

class WaterDailyCollectionReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterDailyCollectionReportController>(
      () => WaterDailyCollectionReportController(),
    );
  }
}
