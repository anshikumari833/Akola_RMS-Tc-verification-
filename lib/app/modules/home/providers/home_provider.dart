import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //PAYMENT RECEIPT
  Future<APIResponse> getTcCollection() async {
    String url = Strings.base_url + '/api/property/reports/property/tc-collection';
    final response = await post(url, {}, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
}
