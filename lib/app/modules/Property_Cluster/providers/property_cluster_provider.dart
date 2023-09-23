import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class PropertyClusterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> getClusterList(Map data) async {
    String url = Strings.base_url + '/api/property/cluster/get-all-clusters';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var loginApiKey = token;
    try {
      final response = await post(url, {
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











// Future<APIResponse> FetchLocationData(Map data) async {
//     String token = await CommonUtils.getToken();
//     token = 'Bearer ' + token;
//     String url = Strings.base_url + '/api/post-geo-location';
//     var apiKey = token;
//     try {
//       final response = await post(url, {
//         'lattitude': data['lat'],
//         'longitude': data['long'],
//       }, headers: <String, String>{
//         'Authorization': token,
//         'API-KEY': apiKey,
//         'Content-Type': 'application/json',
//       });
//       if (response.status.hasError) {
//         return APIResponse(
//             data: null, error: true, errorMessage: response.statusText!);
//       } else {
//         return APIResponse(
//             data: response.body['data'],
//             error: false,
//             errorMessage: response.statusText!);
//       }
//     } catch (exception) {
//       return APIResponse(
//           data: null, error: true, errorMessage: exception.toString());
//     }
//   }