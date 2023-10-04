import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/string.dart';

class PropertyDailyTcReportProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> searchReportDetail(page, perPage,Map data) async {
    String url = Strings.base_url + '/api/property/reports/property/collection';
    final response = await post(
        url,
        {
          // "userId":1,
          "fromDate":data['fromDate'],
          "uptoDate":data['uptoDate'],
          "all":"1",
          "footer":1
        },
        headers: Strings.headers);
    return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
  }

}


//**API LIST**
//api/property/reports/prop/saf/collection