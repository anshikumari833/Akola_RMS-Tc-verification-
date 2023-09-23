import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class GbSafVerificationProvider extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

//  INBOX
  Future<APIResponse> getVerificationList(page,perPage) async {
    String url = Strings.base_url + '/api/property/gbsaf/inbox';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var loginApiKey = token;
    try {
      final response = await post(url, {
        'page' : page,
        'perPage' : perPage ,
      }, headers: <String, String>{
        'Authorization': token,
        'API-Key': loginApiKey,
      });
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return APIResponse(
            data: response.body['data'],
            error: false,
            errorMessage: response.statusText!);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }
}
