import 'package:get/get.dart';

class AdvertisementHomeScreenController extends GetxController {
  //TODO: Implement AdvertisementHomeScreenController
  var checked = 0.obs;
  var radioCheckGroupValue = 'radio'.obs;
  var selectedDate;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
