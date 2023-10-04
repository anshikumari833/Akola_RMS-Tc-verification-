import 'package:amc_rms/app/Api_List/Water_ApiList.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class WaterConsumerSearchProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //Search List
  Future<APIResponse> searchConsumerDetail(Map data) async {
    String url = Strings.base_url + water_ApiEndpoints.searchConsumer;
      final response = await post(
        url,
        {
          "filterBy": data['filteredBy'],
          "parameter": data['parameter'],
        },
        headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }



  //Consumer Basic Details(BY ID)
  Future<APIResponse> SearchedComsumerData(consumerId) async {
    String url = Strings.base_url + water_ApiEndpoints.getConsumerDetails;
      final response = await post(url, {
        "applicationId": consumerId.toString()
      },  headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

//Demand Detail(BY ID)
  Future<APIResponse> ComsumerListDemandDetails(consumerId) async {
    String url = Strings.base_url + water_ApiEndpoints.listDemands;
    final response = await post(url, {
      "ConsumerId": consumerId.toString()
    },  headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //Payment History
  Future<APIResponse> ComsumerPaymentHistory(consumerId) async {
    String url = Strings.base_url + water_ApiEndpoints.paymentHistory;
      final response = await post(url, {
        "consumerId": consumerId.toString()
      },  headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //Receipt
  Future<APIResponse> ComsumerReceiptDetail(consumerId) async {
    String url = Strings.base_url + water_ApiEndpoints.generatePaymentReceipt ;
    final response = await post(url, {
      "consumerId": consumerId.toString()
    },  headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  //Payment
  Future<APIResponse> ComsumerDemandPayment(consumerId) async {
    String url = Strings.base_url + water_ApiEndpoints.payDemand;
    final response = await post(url, {
      "consumerId": consumerId.toString()
    },  headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
}
