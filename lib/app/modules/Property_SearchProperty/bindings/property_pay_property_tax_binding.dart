import 'package:get/get.dart';

import '../controllers/SearchHolding_controller.dart';


class PropertyPayPropertyTaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyPayPropertyTaxController>(
      () => PropertyPayPropertyTaxController(),
    );
  }
}
