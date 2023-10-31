import 'package:get/get.dart';

import '../controllers/municipal_rental_add_toll_controller.dart';

class MunicipalRentalAddTollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MunicipalRentalAddTollController>(
      () => MunicipalRentalAddTollController(),
    );
  }
}
