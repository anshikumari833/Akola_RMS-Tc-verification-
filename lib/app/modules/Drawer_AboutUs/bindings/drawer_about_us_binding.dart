import 'package:get/get.dart';

import '../controllers/drawer_about_us_controller.dart';

class DrawerAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerAboutUsController>(
      () => DrawerAboutUsController(),
    );
  }
}
