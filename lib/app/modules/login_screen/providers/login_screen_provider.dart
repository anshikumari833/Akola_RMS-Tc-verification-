import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class LoginScreenProvider extends GetConnect {
  @override
  void onInit() {
  }

  Future<APIResponse> userLogin(Map data) async {
    String url = Strings.base_url + '/api/login';
      final response = await post('$url', data  );

    //sending data to APIResponse
    return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
  }
}

