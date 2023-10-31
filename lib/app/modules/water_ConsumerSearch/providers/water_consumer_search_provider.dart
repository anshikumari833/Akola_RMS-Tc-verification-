import 'package:amc_rms/app/Api_List/Water_ApiList.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';
import 'package:http/http.dart' as http;

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
  Future<APIResponse> ConsumerListDemandDetails(consumerId) async {
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


  //DEMAND PAYMENT
  Future<APIResponse> ConsumerDemandPayment(Map data) async {
    String url = Strings.base_url + water_ApiEndpoints.payDemand;
    final response = await post(url, {
      "consumerId": data['consumerId'],
      "demandUpto": data['demandUpto'],
      "amount": data['amount'],
      "paymentMode": data['paymentMode'],
      "bankName": data['bankName'],
      "branchName": data['branchName'],
      "chequeNo": data['chequeNo'],
      "chequeDate": data['chequeDate'],
      "remarks": data['remarks'],
    },  headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }


  //CALCULATE DEMAND
  Future<APIResponse> CalculateConsumerDeamnd(Map data) async {
    String url = Strings.base_url + water_ApiEndpoints.calculateDemand;
    final response = await post(url, {
      "consumerId": data['consumerId'],
      "demandUpto": data['demandUpto'],
    },  headers: Strings.headers,
    );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
  // Generate Demand
  // Future<APIResponse> GenerateConsumerDemand(consumerId, Map data) async {
  //   String url = Strings.base_url + water_ApiEndpoints.generateDemand;
  //   final response = await post(url, {
  //     "consumerId": consumerId.toString(),
  //     "finalRading": data['finalRading'],
  //     "demandUpto": data['demandUpto'],
  //     "document": data['document'],
  //   },  headers: Strings.headers,
  //   );
  //   return APIResponse.fromJson(
  //       {"data": response.body, "error": response.status.hasError});
  // }


Future<APIResponse> GenerateConsumerDemand(consumerId, Map data) async {
  String url = Strings.base_url + water_ApiEndpoints.generateDemand;

  // Create a multipart request
  final request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll(Strings.headers);
  // Add text fields to the request
  request.fields['consumerId'] = consumerId;
  request.fields['finalRading'] = data["finalRading"];
  request.fields['demandUpto'] = data["demandUpto"];

  // Add the image file to the request
  if (data["imagePath[0]"] != null) {
    final imageFile = data["imagePath[0]"];
    request.files.add(await http.MultipartFile.fromPath('document', imageFile.path));
  }

  // Send the request
  final response = await request.send();

  // Process the response and return the APIResponse
  final responseStream = await response.stream.bytesToString();
    return APIResponse.fromJson({"data": responseStream, "error": false});
}
}
