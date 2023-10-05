import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class DrawerProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> getUserDetails() async {
    String url = Strings.base_url + '/api/my-profile-details';
    final response = await get(url, headers: Strings.headers);
    return APIResponse.fromJson(
      {"data": response.body, "error": response.status.hasError},
    );
  }


  // Future<APIResponse> UserDetailData(Map data) async {
  //   String url = Strings.base_url + '/api/my-profile-details';
  //   final response = await post(url, {
  //   "id":data["id"],
  //     "email":data["email"],
  //     "name":data["name"],
  //      "mobile":data["mobile"],
  //     "altMobile":data["altMobile"],
  //      "address":data["address"],
  //     "userType":data["userType"],
  //     "description":data["description"],
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
