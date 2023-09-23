import 'package:get/get.dart';

import '../controllers/home_about_controller.dart';

class HomeAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAboutController>(
      () => HomeAboutController(),
    );
  }
}
