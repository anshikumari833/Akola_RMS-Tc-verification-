import 'package:amc_rms/app/Api_List/MunicipalRental_ApiList.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class MunicipalRentalPayTollRentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


  // SEARCH-DETAILS
  Future<APIResponse> searchTollDetail(Map data) async {
    String url = Strings.base_url + municipalRental_ApiEndpoints.searchTollByNameOrMobile;
    final response = await post(
      url,
      {
        "searchBy": data['searchBy'],
        "value": data['value'],
      },
      headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  // DETAIL BY ID
  Future<APIResponse> SearchedTollDataById(tollId) async {
    String url = Strings.base_url + municipalRental_ApiEndpoints.getTollDetailById;
    final response = await post(url, {
      "tollId": tollId.toString()
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  // PAYMENT CALCULATION DETAILS
  Future<APIResponse> PaymentCalculationDetails(Map Data) async {
    String url = Strings.base_url + municipalRental_ApiEndpoints.tollAmtCalculation;
    final response = await post(url, {
      "tollId": Data['tollId'],
      "dateUpto": Data['dateUpto'],
      "dateFrom": Data['dateFrom'],
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
  //Toll PAYMENT
  Future<APIResponse> payTollTax(Map Data) async {
    String url = Strings.base_url + municipalRental_ApiEndpoints.tollPayment;
    final response = await post(url, {
      "tollId": Data['tollId'],
      "dateUpto": Data['dateUpto'],
      "dateFrom": Data['dateFrom'],
      "paymentMode": Data['paymentMode'],
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
}
