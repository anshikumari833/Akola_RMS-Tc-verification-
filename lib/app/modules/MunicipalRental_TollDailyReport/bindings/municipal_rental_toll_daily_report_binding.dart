import 'package:get/get.dart';

import '../controllers/municipal_rental_toll_daily_report_controller.dart';

class MunicipalRentalTollDailyReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MunicipalRentalTollDailyReportController>(
      () => MunicipalRentalTollDailyReportController(),
    );
  }
}
