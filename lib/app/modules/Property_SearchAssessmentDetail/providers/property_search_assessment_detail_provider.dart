import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class PropertySearchAssessmentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
  // SEARCH-ASSESSMENT-DETAILS
  Future<APIResponse> searchDetail(page, perPage,Map data) async {
    String url = Strings.base_url + '/api/property/get-filter-application-details';
      final response = await post(
        url,
        {
          "page": page,
          "perPage": perPage,
          "filteredBy": data['filteredBy'],
          "searchBy": data['searchBy'],
          "value": data['value'],
        },
        headers: Strings.headers,);
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }


    //GET-ASSESSMENT-DETAIL-BY-ID
  Future<APIResponse> StaticSafData(applicationId) async {
    String url = Strings.base_url + '/api/property/saf/static-saf-dtls';
      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  Future<APIResponse> UploadedDocData(applicationId) async {
    String url = Strings.base_url + '/api/property/saf/get-uploaded-documents';

      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  Future<APIResponse> IndiVerificationsData(applicationId) async {
    String url = Strings.base_url + '/api/property/saf/IndiVerificationsList';
      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  Future<APIResponse> fetchDemandDetail(applicationId) async {
    String url = Strings.base_url + '/api/property/saf/calculate-by-saf-id';
    final response = await post(url, {
      "id": applicationId.toString()
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

}