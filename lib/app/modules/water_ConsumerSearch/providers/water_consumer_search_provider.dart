import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class WaterConsumerSearchProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  // SEARCH-PROPERTY-DETAILS
  Future<APIResponse> searchConsumerDetail(Map data) async {
    String url = Strings.base_url + '/api/water/search-consumer';
      final response = await post(
        url,
        {
          "filterBy": data['filteredBy'],
          "parameter": data['parameter'],
        },
        headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }



  //CONSUMER DETAIL
  Future<APIResponse> SearchedComsumerData(consumerId) async {
    String url = Strings.base_url + '/api/water/consumer/get-listed-details';
      final response = await post(url, {
        "id": consumerId.toString()
      },  headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
}
