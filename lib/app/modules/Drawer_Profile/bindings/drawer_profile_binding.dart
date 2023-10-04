import 'package:get/get.dart';

import '../controllers/drawer_profile_controller.dart';

class DrawerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerProfileController>(
      () => DrawerProfileController(),
    );
  }
}
