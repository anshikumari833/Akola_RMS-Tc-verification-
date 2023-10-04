import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class DrawerProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> UserDetailData(Map data) async {
    String url = Strings.base_url + '/api/my-profile-details';

    // Construct the URL with query parameters
    final Uri uri = Uri.parse(url).replace(queryParameters: {
      "name": data["name"],
      "mobileNo": data["mobileNo"],
      "email": data["email"],
      "dateOfBirth": data["dateOfBirth"],
      "gender": data["gender"],
    });

    final response = await get(uri.toString(), headers: Strings.headers);

    return APIResponse.fromJson(
      {"data": response.body, "error": response.status.hasError},
    );
  }



  // Future<APIResponse> UserDetailData(Map data) async {
  //   String url = Strings.base_url + '/api/my-profile-details';
  //   final response = await post(url, {
  //   "name":data["name"],
  //   "moblieNo":data["moblieNo"],
  //   "email":data["email"],
  //   "dateOfBirth":data["dateOfBirth"],
  //   "gender":data["gender"],
  //   }, headers: Strings.headers,);
  //   return APIResponse.fromJson(
  //       {"data": response.body, "error": response.status.hasError});
  // }

  Future<APIResponse> changeUserPassword(Map data) async {
    String url = Strings.base_url + '/api/change-password';
    final response = await post(url, {
      "password":data["password"],
      "newPassword":data["newPassword"],
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
}
