import 'package:get/get.dart';

import '../controllers/property_missing_geotagging_controller.dart';

class PropertyMissingGeotaggingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyMissingGeotaggingController>(
      () => PropertyMissingGeotaggingController(),
    );
  }
}
