import 'package:get/get.dart';

import '../controllers/property_new_assessment_controller.dart';

class PropertyNewAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyNewAssessmentController>(
      () => PropertyNewAssessmentController(),
    );
  }
}
