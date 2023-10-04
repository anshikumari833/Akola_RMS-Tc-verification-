import 'package:get/get.dart';

import '../controllers/drawer_terms_of_use_controller.dart';

class DrawerTermsOfUseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerTermsOfUseController>(
      () => DrawerTermsOfUseController(),
    );
  }
}
