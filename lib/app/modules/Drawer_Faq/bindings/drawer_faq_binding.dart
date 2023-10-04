import 'package:get/get.dart';

import '../controllers/drawer_faq_controller.dart';

class DrawerFaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerFaqController>(
      () => DrawerFaqController(),
    );
  }
}
