import 'package:get/get.dart';

import '../controllers/property_search_assessment_detail_controller.dart';

class PropertySearchAssessmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchAssessmentDetailController>(
      () => SearchAssessmentDetailController(),
    );
  }
}
