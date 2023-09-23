import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class FieldVerificationPendingListProvider extends GetConnect {
  @override
  void onInit() {}

  //INBOX
  Future<APIResponse> getUserVerified(page,perPage) async {
    String url = Strings.base_url + '/api/property/saf/inbox';
      final response = await post(url, {
        'page' : page.toString(),
        'perPage' : perPage.toString() ,
      }, headers: Strings.headers);
    return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
  }



  Future<APIResponse> TcVerifyData(userID) async {
    String url = Strings.base_url + '/api/property/saf/static-saf-dtls';
      final response = await post(url, {
        "applicationId": userID.toString()
      }, headers: Strings.headers);
    return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
  }

  Future<APIResponse> UtcVerifyData(userID) async {
    String url = Strings.base_url + '/api/property/saf/get-tc-verifications';
      final response = await post(url, {
        "safId": userID.toString()
      }, headers: Strings.headers);
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }




  Future<List<dynamic>> getWardData() async {
    String url = Strings.base_url + '/api/property/saf/master-saf';

    final response = await get('$url', headers: Strings.headers);
    if (response.status.hasError) {
      print('1.Error');
      return Future.error(response.statusText!);
    } else {
      // return response.body['data'].values;
      List<dynamic> dataList = response.body['data'].values.toList();
      return dataList;
    }
  }

  //VerificationForm
  Future<APIResponse> VerificationForm(userID ,Map data) async {
    String url = Strings.base_url + '/api/property/saf/site-verification';

    var mFloor = [];
    if(GetStorage().read('isTc')){
      if(data['propertyType'] == '4' || data['propertyType'] == 4){
        mFloor = [];
      }

      if(data['isVacant'] && (data['propertyType'] != '4' || data['propertyType'] != 4)){
        mFloor == data['newFloors'];
      }

      if(!data['isVacant'] && (data['propertyType'] != '4' || data['propertyType'] != 4)){
        mFloor = [...data['oldFloors'], ...data['newFloors']];
      }
    }

    if(GetStorage().read('isUtc')){
      if(data['propertyType'] == '4' || data['propertyType'] == 4){
        mFloor = [];
      }

      if(data['isVacant'] && (data['propertyType'] != '4' || data['propertyType'] != 4)){
        mFloor == data['newFloors'];
      }

      if(!data['isVacant'] && (data['propertyType'] != '4' || data['propertyType'] != 4)){
        // mFloor = (allFormData?.floor?.concat(data['newFloors']))?.concat(allFormData?.floor2)
        mFloor = [...data['oldFloors'], ...data['newFloors']];
      }
    }

      final response = await post(url,{
        "safId": userID.toString(),
        "propertyType": data['propertyType'],
        "category": data['category'],
        "areaOfPlot": data['areaOfPlot'],
        "wardId": data['newWardNo'],
        "isMobileTower": data['isMobileTower'],
        "mobileTower": {
          "area": data['tMobileTower'],
          "dateFrom": data['sMobileTower']
        },
        "isHoardingBoard": data['isHoardingBoard'],
        "hoardingBoard": {
          "area": data['tHoardingBoard'],
          "dateFrom": data['sHoardingBoard']
        },
        "isPetrolPump": data['isPetrolPump'],
        "petrolPump": {
          "area": data['tPetrolPump'],
          "dateFrom": data['sPetrolPump']
        },
        "isWaterHarvesting": data['isWaterHarvesting'],
        // "rwhDateFrom":data['waterharvestinginstallationdate'],
        "zone": data['zone'],
        // "ulbId": 1,
        "floor": data['isVacant'] ? [] : mFloor
        // "floors": data['newfloors'] != null ? data['oldfloors'].concat(data['newfloors']) : data['oldfloors']
        // "floor": data['newfloors'] != null ? [...data['oldfloors'], ...data['newfloors'], ...data['citizenFloor']] : [data['oldfloors'], ...data['citizenFloor']],
      }, headers: Strings.headers);
      return APIResponse.fromJson(
          {"data": response.body, "error": response.status.hasError});
    }



  Future<APIResponse>   GeoTaggingForm(userID, Map<String, dynamic> data) async {
    String url = Strings.base_url + '/api/property/saf/geotagging';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(Strings.headers);
    // request.headers['Authorization'] = token;
    // request.headers['API-Key'] = apiKey;
    request.fields['safId'] = userID.toString();

    if (data['imagePath[0]'] != null) {
      final file = data['imagePath[0]'] as File;
      final imageBytes = await file.readAsBytes();
      final image = http.MultipartFile.fromBytes(
        'imagePath[0]', imageBytes,
        filename: 'image.png',
      );
      request.files.add(image);
      request.fields['longitude[0]'] = data['longitude[0]'] ?? '';
      request.fields['latitude[0]'] = data['latitude[0]'] ?? '';
      request.fields['directionType[0]'] = data['directionType[0]'] ?? '';
    }

    if (data['imagePath[1]'] != null) {
      final file = data['imagePath[1]'] as File;
      final imageBytes = await file.readAsBytes();
      final image1 = http.MultipartFile.fromBytes(
        'imagePath[1]', imageBytes,
        filename: 'image.png',
      );
      request.files.add(image1);
      request.fields['longitude[1]'] = data['longitude[1]'] ?? '';
      request.fields['latitude[1]'] = data['latitude[1]'] ?? '';
      request.fields['directionType[1]'] = data['directionType[1]'] ?? '';
    }

    if (data['imagePath[2]'] != null) {
      final file = data['imagePath[2]'] as File;
      final imageBytes = await file.readAsBytes();
      final image2 = http.MultipartFile.fromBytes(
        'imagePath[2]', imageBytes,
        filename: 'image.png',
      );
      request.files.add(image2);
      request.fields['longitude[2]'] = data['longitude[2]'] ?? '';
      request.fields['latitude[2]'] = data['latitude[2]'] ?? '';
      request.fields['directionType[2]'] = data['directionType[2]'] ?? '';
    }
      final response = await request.send();
      final responseString = await response.stream.bytesToString();
    return APIResponse.fromJson(
        {"data": responseString, "error": false});
  }

  Future<APIResponse> FieldVerificationWorkflowAction(userID, Map data) async {
    String url = Strings.base_url + '/api/property/saf/post/level';
      final response = await post(
        url,
        {
          "applicationId": userID.toString(),
          "action": data['action'],
          "comment": data['comment'] ?? '',
        },
          headers: Strings.headers);
      return APIResponse.fromJson({"data": response.body, "error": response.status.hasError});
  }

  //WARD BY ZONE - (DROPDOWN LIST)
  Future<APIResponse> WardByZone(selectedZoneId) async {
    String url = Strings.base_url + '/api/property/v1/get-ward-by-zone';

      final response = await post(url, {
        "zoneId":selectedZoneId,
      },  headers: Strings.headers);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }

  Future<APIResponse> SearchDetail(Map data) async {
    String url = Strings.base_url + '/api/property/get-filter-application-details';

      final response = await post(url, {
        'applicationNo': data['applicationNo'],
        'filteredBy': data['filteredBy'],
      },headers: Strings.headers);
    return APIResponse.fromJson(
        {"data": response.body, "error": response.status.hasError});
  }
}

