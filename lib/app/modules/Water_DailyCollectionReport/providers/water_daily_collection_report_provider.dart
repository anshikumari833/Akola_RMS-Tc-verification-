import 'package:get/get.dart';
import 'package:amc_rms/app/Api_List/Water_ApiList.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class WaterDailyCollectionReportProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> searchWaterDailyReportDetail(page, perPage,Map data) async {
    String url = Strings.base_url +  water_ApiEndpoints.dailyCollectionReport;
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
