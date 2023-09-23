import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';
import '../property_missing_geotagging_model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PropertyMissingGeotaggingProvider extends GetConnect {
  @override
  void onInit() {
  }

  // Future<List<MissingGeoTaggingList>>getMissingGeoTaggingList() async {
  //   String token = await CommonUtils.getToken();
  //   token = 'Bearer ' + token;
  //   String url = Strings.base_url + '/api/property/saf/pending-geotagging-list';
  //   var apiKey = token;
  //     final response = await post(
  //       url,
  //       {},
  //       headers: <String, String>{
  //         'Authorization': token,
  //         'API-KEY': apiKey,
  //       },
  //     );
  //   List<dynamic> data = response.body['data'];
  //   List<MissingGeoTaggingList> result = [];
  //   data.forEach((element) {
  //     result.add(MissingGeoTaggingList.fromJson(element));
  //   });
  //   return result;
  // }
  //
  //

  //INBOX
  Future<APIResponse> getMissingGeoTaggingList(page,perPage) async {
    String url = Strings.base_url + '/api/property/saf/pending-geotagging-list';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var loginApiKey = token;
    try {
      final response = await post(url, {
        'page' : page,
        'perPage' : perPage ,
      }, headers: <String, String>{
        'Authorization': token,
        'API-Key': loginApiKey,
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

  Future<APIResponse> GeoTaggingForm(int verifyID) async {
    String url = Strings.base_url + '/api/property/gbsaf/static-details';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var apiKey = token;
    try {
      final response = await post(url,
          {
            "applicationId": verifyID.toString()
          },
          headers: <String, String>{
            'Authorization': token,
            'API-KEY': apiKey,
          });
      if (response.status.hasError) {
        return APIResponse(
            data: null,
            error: true,
            errorMessage: response.statusText!
        );
      } else {
        return APIResponse(
            data: response.body['data'],
            error: false,
            errorMessage: response.statusText!
        );
      }
    } catch (exception) {
      return APIResponse(
          data: null,
          error: true,
          errorMessage: exception.toString()
      );
    }
  }

  Future<APIResponse> MissingGeoTaggingForm(int verifyID, Map<String, dynamic> data) async {
    String url = Strings.base_url + '/api/property/saf/geotagging';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var apiKey = token;

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = token;
    request.headers['API-Key'] = apiKey;
    request.fields['safId'] = verifyID.toString();

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

    try {
      final response = await request.send();
      final responseString = await response.stream.bytesToString();
      final responseData = json.decode(responseString);
      if (response.statusCode >= 400) {
        return APIResponse(
            data: null,
            error: true,
            errorMessage: responseData['message'] ?? response.reasonPhrase);
      } else {
        return  APIResponse(
            data: responseData['data'],
            error: false,
            errorMessage: '');
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }

}

