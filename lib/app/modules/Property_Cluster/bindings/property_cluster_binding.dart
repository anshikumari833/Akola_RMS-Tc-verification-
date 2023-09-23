import 'package:get/get.dart';

import '../controllers/property_cluster_controller.dart';

class PropertyClusterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyClusterController>(
      () => PropertyClusterController(),
    );
  }
}
