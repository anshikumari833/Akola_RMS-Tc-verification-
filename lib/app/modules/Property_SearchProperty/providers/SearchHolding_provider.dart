import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class SearchHoldingProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  // SEARCH-PROPERTY-DETAILS
  Future<APIResponse> searchDetail(page,perPage,Map data) async {
    String url = Strings.base_url + '/api/property/get-filter-property-details';
      final response = await post(
        url,
        {
          "page": page,
          "perPage": perPage,
          "filteredBy": data['filteredBy'],
          "parameter": data['parameter'],
        },
        headers: Strings.headers,
      );
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }

  //PROPERTY DETAIL
  Future<APIResponse> SearchedPropertyData(propertyId) async {
    String url = Strings.base_url + '/api/property/saf/get-prop-byholding';
      final response = await post(url, {
        "propertyId": propertyId.toString()
      }, headers: Strings.headers,);
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }

  //DEMAND- DETAIL
  Future<APIResponse> SearchedDemandData(propertyId, type) async {
    String url = Strings.base_url + '/api/property/get-holding-dues';
    var body = null;
    if(type == 'demand'){
      body ={
        "propId": propertyId.toString()
      };
    } else {
      body ={
        "propId": propertyId.toString(),
        "qtr" : 12,
        "fYear" : 1232
      };
    }
      final response = await post(url, {
        "propId": propertyId.toString()
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //PAYMENT HISTORY
  Future<APIResponse> SearchedPaymentData(propertyId) async {
    String url = Strings.base_url + '/api/property/prop-payment-history';
      final response = await post(url, {
        "propId": propertyId.toString()
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //PAYMENT RECEIPT
  Future<APIResponse> PropPaymentReceip(tran_no) async {
    String url = Strings.base_url + '/api/property/prop-payment-receipt';

      final response = await post(url, {
        "tranNo":tran_no.toString(),
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //PAYMENT
  Future<APIResponse> DemandTaxDuePayment(demand_PropertyId,Map data) async {
    String url = Strings.base_url + '/api/property/offline-payment-holding';
      final response = await post(url, {
        "id": demand_PropertyId,
        "paymentMode": data["paymentMode"],
        "chequeDate": data["chequeDate"],
        "bankName": data["bankName"],
        "branchName": data["branchName"],
        "chequeNo": data["chequeNo"],
        "isArrear": data["isArrear"],
      }, headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  //PINLAB PAYMENT ONLINE
  Future<APIResponse> Pinelab_PaymentOnline(Map data) async {
    String url = Strings.base_url + '/api/payment/v1/pinelab/initiate-payment';
    final response = await post(url, {
     "workflowId":1,
      "amount":data["amount"],
      // "moduleId":data["moduleId"],
      "applicationId":data["applicationId"],
      "paymentType":"Property"
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
  Future<APIResponse> Pinelab_PaymentResponse(Map data) async {
    String url = Strings.base_url + '/api/payment/v1/pinelab/save-response';
    final response = await post(url, {
      "billRefNo" : data["BillingRefNo"],
      "amount" : data["amount"],
     "applicationId":data["applicationId"],
     "paymentType":"Property",
      "pinelabResponseBody":data["pinelabResponseBody"],
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
  }

