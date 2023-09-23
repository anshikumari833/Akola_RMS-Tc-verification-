import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/string.dart';

class TradeNewApplicationProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
  //GET-APPLY-DATA (---DROPDOWN LIST---)
  Future<APIResponse> SelectListDetail() async {
    String url = Strings.base_url + '/api/trade/getApplyData';
    try {
      final response = await post(
        url, {
        "applicationType": "NEWLICENSE"
      },
          headers: Strings.headers
      );
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return
          APIResponse(
            data: response.body['data'], error: true, errorMessage: '',);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }

}
