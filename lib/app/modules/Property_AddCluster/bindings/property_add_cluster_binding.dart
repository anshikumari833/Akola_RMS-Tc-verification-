import 'package:get/get.dart';

import '../controllers/property_add_cluster_controller.dart';

class PropertyAddClusterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyAddClusterController>(
      () => PropertyAddClusterController(),
    );
  }
}
