import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class PropertyReportProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //WARD LIST
  Future<List<dynamic>> getWardData() async {
    String url = Strings.base_url + '/api/property/saf/master-saf';
    final response = await get('$url',    headers: Strings.headers);
    if (response.status.hasError) {
      print('1.Error');
      return Future.error(response.statusText!);
    } else {
      // return response.body['data'].values;
      List<dynamic> dataList = response.body['data'].values.toList();
      return dataList;
    }
  }


  Future<APIResponse> searchReportDetail(page, perPage,Map data) async {
    String url = Strings.base_url + '/api/property/reports/prop/saf/collection';
      final response = await post(
        url,
        {
          'page' : page,
          'perPage' : perPage ,
          "user":"tc",
          "collectionType":data['collectionType'],
          "fromDate":data['fromDate'],
          "uptoDate":data['uptoDate'],
          "wardNo":data['wardNo'],
          "paymentMode":data['paymentMode'],
        },
          headers: Strings.headers);
      return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
    }




}

//**API LIST**
//api/property/saf/master-saf
//api/property/reports/prop/saf/collection