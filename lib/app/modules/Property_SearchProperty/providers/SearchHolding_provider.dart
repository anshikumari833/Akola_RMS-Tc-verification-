import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';
import 'package:http/http.dart' as http;

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
          "zoneId": data['zone'],
          "wardId": data['wardNo'],
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
  Future<APIResponse> PropPaymentReceip(tranId) async {
    String url = Strings.base_url + '/api/property/prop-payment-receipt';
      final response = await post(url, {
        "tranId":tranId.toString(),
      }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  // //PAYMENT(CASH - CHEQUE- DD -NEFT)
  // Future<APIResponse> DemandTaxDuePayment(demand_PropertyId,Map data) async {
  //   String url = Strings.base_url + '/api/property/offline-payment-holding';
  //     final response = await post(url, {
  //       "id": demand_PropertyId,
  //       "deviceId": "01",
  //       "paymentMode": data["paymentMode"],
  //       "chequeDate": data["chequeDate"],
  //       "bankName": data["bankName"],
  //       "branchName": data["branchName"],
  //       "chequeNo": data["chequeNo"],
  //       "isArrear": data["isArrear"],
  //     }, headers: Strings.headers,
  //     );
  //   return APIResponse.fromJson(
  //       {"data": response.body, "error": response.status.hasError});
  // }

//PHASE - 2 (version 2)(CODE OF DEMAND PAYMENT WITH PART PAYMENT)
  // PAYMENT (CASH,CHEQUE,DD)
  Future<APIResponse> DemandTaxDuePayment(demand_PropertyId, Map data) async {
    String url = Strings.base_url + '/api/property/v2/offline-payment-holding';

    // Create a multipart request
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(Strings.headers);
    // Add text fields to the request
    request.fields['id'] = demand_PropertyId;
    request.fields['deviceId'] = '01';
    request.fields['paymentType'] = data["paymentType"];
    request.fields['paidAmount'] = data["paidAmount"];
    request.fields['paymentMode'] = data["paymentMode"];
    request.fields['chequeDate'] = data["chequeDate"];
    request.fields['bankName'] = data["bankName"];
    request.fields['branchName'] = data["branchName"];
    request.fields['chequeNo'] = data["chequeNo"];
    // Add the image file to the request
    if (data["imagePath[0]"] != null) {
      final imageFile = data["imagePath[0]"];
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    }
    // Send the request
    final response = await request.send();
    // Process the response and return the APIResponse
    final responseStream = await response.stream.bytesToString();
    final responseStatus = response.statusCode;

    return APIResponse.fromJson({"data": responseStream, "error": false});
  }



  //PINLAB PAYMENT ONLINE(PAYMENT REF NO )
  Future<APIResponse> Pinelab_PaymentOnline(Map data) async {
    String url = Strings.base_url + '/api/property/v1/get-billref-no';
    final response = await post(url, {
      "propId":data["propId"],
      // "isArrear":data["isArrear"],
      "paymentMode":data["paymentMode"],
      "paymentType":data["paymentType"],
      "paidAmount":data["paidAmount"]
    }, headers: Strings.headers,);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //SENDING POS RESPONSE TO BACKEND
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

