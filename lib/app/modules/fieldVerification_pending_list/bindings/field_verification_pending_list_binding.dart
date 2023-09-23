import 'package:get/get.dart';
import '../controllers/tc_FieldVerification_controller.dart';

class FieldVerificationPendingListBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<TcFieldVerificationController>(
      () => TcFieldVerificationController(),
    );
  }
}
