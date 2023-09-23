import 'package:get/get.dart';
import '../controllers/property_home_screen_controller.dart';

class PropertyHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyHomeScreenController>(
      () => PropertyHomeScreenController(),
    );
  }
}
