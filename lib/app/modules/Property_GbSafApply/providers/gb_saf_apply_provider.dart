import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class GbSafApplyProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //WARD LIST
  Future<List<dynamic>> getWardData() async {
    String token = await CommonUtils.getToken();
    token = 'Bearer $token';

    var apiKey = token;
    String url = Strings.base_url + '/api/property/saf/master-saf';

    final response = await get('$url', headers: <String, String>{
      'Authorization': token,
      'API-KEY': apiKey,
    });
    if (response.status.hasError) {
      print('1.Error');
      return Future.error(response.statusText!);
    } else {
      List<dynamic> dataList = response.body['data'].values.toList();
      return dataList;
    }
  }

  //SUBMIT FORM
  Future<APIResponse> saveGbSafForm (Map data) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    // String url = Strings.safApplyBase_url + 'property/saf/apply';
    String url = Strings.base_url + '/api/property/saf/gb-apply';

    var apiKey = token;
    try {

      final response = await post(url, {
        "ulbId": "2",
        "buildingName": data['buildingName'],
        "nameOfOffice": data['nameOfOffice'],
        "wardId": data['oldWardNo'],
        "buildingAddress": data['buildingAddress'],
        "gbUsageTypes": data['gbUsageTypes'],
        "gbPropUsageTypes": data['gbPropUsageTypes'],
        "zone": data['zone'],
        "roadWidth": data['roadWidth'],
        "designation": data['officerDesignation'],
        "officerName": data['officerName'],
        "officerMobile": data['officerMobile'],
        "officerEmail": data['officerEmail'],
        "address": data['officerAddress'],
        "floors": data['newfloors'],
        "isMobileTower": data['isMobileTower'],
        "mobileTower": {
          "area": data['towerArea'],
          "dateFrom": data['towerInstallation'],
        },
        "isHoardingBoard": data['isHoardingBoard'],
        "hoardingBoard": {
          "area": data['hoardingArea'],
          "dateFrom": data['hoardingInstallation'],
        },
        "isPetrolPump": data['isPetrolPump'],
        "petrolPump": {
          "area": data['pumpArea'],
          "dateFrom": data['pumpInstallation'],
        },
        "isWaterHarvesting": data['isWaterHarvesting'],
        "areaOfPlot": data['areaOfPlot'],
        "holdingNo": data['holdingNo'],

      }, headers: <String, String>{
        'Authorization': token,
        'API-KEY': apiKey,
        'Content-Type': 'application/json',
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
