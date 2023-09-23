import 'package:get/get.dart';

import '../controllers/advertisement_home_screen_controller.dart';

class AdvertisementHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdvertisementHomeScreenController>(
      () => AdvertisementHomeScreenController(),
    );
  }
}
