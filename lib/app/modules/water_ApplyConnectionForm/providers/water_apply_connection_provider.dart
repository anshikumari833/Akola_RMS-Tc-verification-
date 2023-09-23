import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class WaterApplyConnectionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


//MASTR DATA(---DROPDOWN LIST---)
  Future<APIResponse> SelectDetail() async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    String url = Strings.base_url + '/api/water/master/get-listed-details';
    var apiKey = token;

    try {
      final response = await post(
        url, {},
        headers: <String, String>{
          'Authorization': token,
          'API-KEY': apiKey,
          'Content-Type': 'application/json',
        },
      );
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return
          APIResponse(
            data: response.body['data'], error: true, errorMessage: '',);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }

//SEARCH-SAF-DETAILS(---HOLDING NO---)
  Future<APIResponse> SearchHoldingDetail(Map data) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    String url = Strings.base_url + '/api/water/search-holding-saf';
    var apiKey = token;

    try {
      final response = await post(
        url,
        {
          "connectionThrough": data['connectionThrough'],
          "id": data['id'],
          "ulbId": "2"
        },
        headers: <String, String>{
          'Authorization': token,
          'API-KEY': apiKey,
          'Content-Type': 'application/json',
        },
      );
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return
          APIResponse(
            data: response.body['data'], error: false, errorMessage: '',);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }


//  SUBMIT APPLICATION FORM
  Future<APIResponse> SubmitWaterForm(Map data) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    String url = Strings.base_url + '/api/water/application/apply-new-connection';
    var apiKey = token;
    try {
      final response = await post(url, {
        "ulbId": "2",
        "connectionTypeId":data['connectionTypeId'],
        "propertyTypeId": data['propertyTypeId'],
        "ownerType":data['ownerType'],
        "category":data['category'],
        "pipelineTypeId":data['pipelineTypeId'],
        "connection_through": data['connection_through'],
        "landmark": "Landmark",
        "holdingNo": data['holdingNo'],
        "wardId":data['wardId'],
        "areaSqft": data['areaSqft'],
        "address":data['address'],
        "pin": data['pin'],
        "tenant":  data['tenant'],
        "owners": data['owners'],
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

  Future<APIResponse> PaymentDemandDetailById(applicationId) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    String url = Strings.base_url + '/api/water/admin/application/get-details-by-id';
    var apiKey = token;
    try {
      final response = await post(url, {
        'applicationId': applicationId.toString(),
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

  //PAYMENT
  Future<APIResponse> applicationPayment(applicationId,Map data) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    String url = Strings.base_url + '/api/water/application/payment/offline/pay-connection-charge';
    var apiKey = token;
    try {
      final response = await post(url, {
        "id": applicationId,
        "ulbId": "2",
        "ulbId": data["ulbId"],
        "paymentMode": data["paymentMode"],
        "chequeDate": data["chequeDate"],
        "bankName": data["bankName"],
        "branchName": data["branchName"],
        "chequeNo": data["chequeNo"],
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
