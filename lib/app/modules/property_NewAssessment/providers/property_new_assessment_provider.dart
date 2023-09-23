import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class PropertyNewAssessmentProvider extends GetConnect {
  @override
  void onInit() {
  }

  //MASTER SAF DATA - (DROPDOWN LIST)
  Future<APIResponse> getlistData() async {
    String url = Strings.base_url + '/api/property/saf/master-saf';
      final response = await get(url,headers: Strings.headers);
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
  }



  //WARD BY ZONE - (DROPDOWN LIST)
  Future<APIResponse> WardByZone(zonemstrid) async {
    String url = Strings.base_url + '/api/property/v1/get-ward-by-zone';
      final response = await post(url, {
        "zoneId":zonemstrid,
      },  headers: Strings.headers);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //CITY-STATE-NAME
  Future<APIResponse> ulbDataToPrefill() async {
    String url = Strings.base_url + '/api/city/state/auth/ulb-id';
      final response = await post(url, {},  headers: Strings.headers);
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }

  //APPARTMENT LIST
  Future<APIResponse> appartmentList(Map data) async {
    String url = Strings.base_url + '/api/property/saf/list-apartment';
    try {
      final response = await post(url, {
        "ulbId": "2",
        "wardMstrId": "1"
      }, headers: Strings.headers,
      );
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        List<dynamic> data = response.body['data'];
        List<Map<String, dynamic>> dataList = data.map((apartment) =>
        {
          'id': apartment['id'],
          'apt_code': apartment['apt_code'],
          'apartment_name': apartment['apartment_name']
        }).toList();
        // print(dataList);
        return APIResponse(
            data: dataList,
            error: false,
            errorMessage: response.statusText!);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }

  // TAX CALCULATION
  Future<APIResponse> taxCalculation(Map data) async {
    String url = Strings.base_url + '/api/property/v1/review-tax';

      var assess = '';
      if(GetStorage().read('assessmentType') == 'new'){
        assess = '1';
      }
      if(GetStorage().read('assessmentType') == 're')    {
        assess = '2';
      }
      if(GetStorage().read('assessmentType') == 'mu'){
        assess = '3';
      }
      if(GetStorage().read('assessmentType') == 'bi'){
        assess = '4';
      }
      final response = await post(url, {
        "propertyType": data['propertyType'],
        "dateOfPurchase": data['dateOfPurchase'],
        "areaOfPlot": data['areaOfPlot'],
        "category": data['category'],
        "floor": data['newfloors'],
        "owner": data['owners'],
        // "ulbId": "2",
        // "assessmentType": assess,
        // "ulbId": data['ulbId'],
        // "holdingNo": data['holdingNo'],
        // "transferModeId": data['transferModeId'],
        // "ward": data['ward'],
        // "newWard": data['newWard'],
        // "apartmentId": data['apartmentId'],
        // "ownershipType": data['ownershipType'],
        // "roadType": data['roadType'],
        // "isOwnerChanged": data['isOwnerChanged'] == true ? 1 : 0,
        // "isMobileTower": data['isMobileTower'] == true ? 1 : 0,
        // "mobileTower": {
        //   "area": data['totalAreaOfMobileTower'],
        //   "dateFrom": data['installationOfMobileTower']
        // },
        // "isHoardingBoard": data['isHoardingBoard'] == true ? 1 : 0,
        // "hoardingBoard": {
        //   "area": data['totalAreaOfHoardingBoard'],
        //   "dateFrom": data['installationOfHoardingBoard']
        // },
        // "isPetrolPump": data['isPetrolPump'] == true ? 1 : 0,
        // "petrolPump": {
        //   "area": data['petrolPumpArea'],
        //   "dateFrom": data['petrolPumpDate']
        // },
        // "landOccupationDate": data['landOccupationDate'],
        // "isWaterHarvesting": data['isWaterHarvesting'] == true ? 1 : 0,
        // "rwhDateFrom": data['rwhDateFrom'],
        // "trustType": data['isTrust'],
        // "zone": data['zone'],

      }, headers: Strings.headers,
      );
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }




  //SUBMIT FORM
  Future<APIResponse> saveReAssessment(Map data) async {
    String url = Strings.base_url + '/api/property/saf/apply';

      var assess = '';
      if(GetStorage().read('assessmentType') == 'new'){
        assess = '1';
      }
      if(GetStorage().read('assessmentType') == 're')    {
        assess = '2';
      }
      if(GetStorage().read('assessmentType') == 'mu'){
        assess = '3';
      }
      if(GetStorage().read('assessmentType') == 'bi'){
        assess = '4';
      }
      final response = await post(url, {
        // "ulbId": "2",
        "assessmentType": assess,
        "ulbId": data['ulbId'],
        "holdingNo": data['holdingNo'],
        "transferModeId": data['transferModeId'],
        "ward": data['newWard'],
        "propertyType": data['propertyType'],
        "apartmentId": data['apartmentId'],
        "ownershipType": data['ownershipType'],
        "roadType": data['roadType'],
        "areaOfPlot": data['areaOfPlot'],
        "isOwnerChanged": data['isOwnerChanged'] == true ? 1 : 0,
        "isMobileTower": data['isMobileTower'] == true ? 1 : 0,
        "mobileTower": {
          "area": data['totalAreaOfMobileTower'],
          "dateFrom": data['installationOfMobileTower']
        },
        "isHoardingBoard": data['isHoardingBoard'] == true ? 1 : 0,
        "hoardingBoard": {
          "area": data['totalAreaOfHoardingBoard'],
          "dateFrom": data['installationOfHoardingBoard']
        },
        "isPetrolPump": data['isPetrolPump'] == true ? 1 : 0,
        "petrolPump": {
          "area": data['petrolPumpArea'],
          "dateFrom": data['petrolPumpDate']
        },
        "isWaterHarvesting": data['isWaterHarvesting'] == true ? 1 : 0,
        "rwhDateFrom": data['rwhDateFrom'],
        "trustType": data['isTrust'],
        "zone": data['zone'],
        "category": data['category'],
        "floor": data['newfloors'],
        "owner": data['owners'],
        "dateOfPurchase": data['dateOfPurchase'],
      },headers: Strings.headers,
      );
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }




//PAYMENT
  Future<APIResponse> safPayment(userID,Map data) async {
    String url = Strings.base_url + '/api/property/saf/offline-saf-payment';

      var assess = '';
      if(GetStorage().read('assessmentType') == 'new'){
        assess = '1';
      }
      if(GetStorage().read('assessmentType') == 're')    {
        assess = '2';
      }
      if(GetStorage().read('assessmentType') == 'mu'){
        assess = '3';
      }
      if(GetStorage().read('assessmentType') == 'bi'){
        assess = '4';
      }
      final response = await post(url, {
        "id": userID,
        "ulbId": "2",
        "assessmentType": assess,
        "ulbId": data["ulbId"],
        "paymentMode": data["paymentMode"],
        "chequeDate": data["chequeDate"],
        "bankName": data["bankName"],
        "branchName": data["branchName"],
        "chequeNo": data["chequeNo"],
      }, headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  //Demand by id
  Future<APIResponse> PaymentDemandById(id) async {
    String url = Strings.base_url + '/api/property/saf/get-demand-by-id';

      final response = await post(url, {
        'id': id.toString(),
      }, headers: Strings.headers,
      );
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  Future<APIResponse> PrintSafRecipt(tranNo) async {
    String url = Strings.base_url + '/api/property/saf/payment-receipt';
      final response = await post(url,
        {'tranNo': tranNo.toString(),}, headers: Strings.headers,);
    return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
  }
}
