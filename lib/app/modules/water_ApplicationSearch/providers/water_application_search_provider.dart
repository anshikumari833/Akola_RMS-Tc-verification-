import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class WaterApplicationSearchProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  // SEARCH-PROPERTY-DETAILS
  Future<APIResponse> searchApplicationDetail(Map data) async {
    String token = await CommonUtils.getToken();
    String url = Strings.base_url + '/api/water/application/search';

    try {
      final response = await post(
        url,
        {
          "filterBy": data['filteredBy'],
          "parameter": data['parameter'],
        },
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'API-KEY': token,
          'Content-Type': 'application/json',
        },
      );
      if (response.status.hasError) {
        return APIResponse(
          data: null,
          error: true,
          errorMessage: response.statusText!,
        );
      } else {
        return APIResponse(
          data: response.body['data'],
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
