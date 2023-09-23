import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/string.dart';

class TradeSurrenderProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
  // SEARCH-RENEWAL-DETAILS
  Future<APIResponse> searchRenewalDetail(Map data) async {
    String url = Strings.base_url + '/api/trade/application/search-for-renew';
    try {
      final response = await post(
        url,
        {
          "applicationType": data['applicationType'],
          "licenceNo": data['licenceNo'],
        },
          headers: Strings.headers
      );
      if (response.status.hasError) {
        return APIResponse(
          data: null,
          error: true,
          errorMessage: response.statusText!,
        );
      } else {
        return APIResponse(
          data: response.body,
          error: false,
          errorMessage: '',
        );
      }
    } catch (exception) {
      return APIResponse(
        data: null,
        error: true,
        errorMessage: exception.toString(),
      );
    }
  }
}
