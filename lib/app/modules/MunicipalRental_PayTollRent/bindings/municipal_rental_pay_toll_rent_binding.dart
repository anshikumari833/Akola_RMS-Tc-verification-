import 'package:get/get.dart';

import '../controllers/municipal_rental_pay_toll_rent_controller.dart';

class MunicipalRentalPayTollRentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MunicipalRentalPayTollRentController>(
      () => MunicipalRentalPayTollRentController(),
    );
  }
}
