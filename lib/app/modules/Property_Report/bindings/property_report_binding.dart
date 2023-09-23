import 'package:get/get.dart';

import '../controllers/property_report_controller.dart';

class PropertyReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyReportController>(
      () => PropertyReportController(),
    );
  }
}
