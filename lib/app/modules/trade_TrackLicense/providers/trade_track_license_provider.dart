import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';
import 'package:amc_rms/app/Api_List/Trade_ApiList.dart';

class TradeTrackLicenseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //Search Trade License List
  Future<APIResponse> searchLicenseDetail(Map data) async {
    String url = Strings.base_url + trade_ApiEndpoints.searchLicense;
    final response = await post(
      url,
      {
        "entityName": data['filteredBy'],
        "entityValue": data['parameter'],
      },
      headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  //Trade License Basic Details(BY ID)
  Future<APIResponse> SearchedApplicantData(applicantId) async {
    String url = Strings.base_url + trade_ApiEndpoints.DetailLicenseData;
    final response = await post(url, {
      "id": applicantId.toString()
    },  headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }



}
