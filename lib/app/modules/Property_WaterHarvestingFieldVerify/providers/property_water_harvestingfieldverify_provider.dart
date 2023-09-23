import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../../../common/string.dart';

class PropertyWaterHarvestingProvider extends GetConnect {
  @override
  void onInit() {}

  //INBOX
  Future<APIResponse> WaterHarvesting(page,perPage) async {
    String url = Strings.base_url + '/api/property/harvesting/inbox';
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


  //WATER HARVESTING FORM...........!!!
  Future<APIResponse> WaterHarvestingForm(verifyID) async {
    String url = Strings.base_url + '/api/property/harvesting/static-details';
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

  // SUBMISSION FORM...........!!!
  Future<APIResponse> WaterHarvestingSubmission(verifyID, statusID, Map data) async {
    String url = Strings.base_url + '/api/property/harvesting/site-verification';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var apiKey = token;

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = token;
    request.headers['API-KEY'] = apiKey;
    request.fields['verificationStatus'] = statusID.toString();
    request.fields['applicationId'] = verifyID.toString();

    if (data['harvestingImage'] != null) {
      final file = data['harvestingImage'] as File;
      final imageBytes = await file.readAsBytes();
      final image = http.MultipartFile.fromBytes(
        'harvestingImage',
        imageBytes,
        filename: 'image.png',
      );
      request.files.add(image);
    }

    try {
      final response = await request.send();
      final responseString = await response.stream.bytesToString();
      final responseData = json.decode(responseString);

      if (response.statusCode >= 400) {
        return APIResponse(
          data: null,
          error: true,
          errorMessage: responseData['message'] ?? response.reasonPhrase,
        );
      } else {
        return APIResponse(
          data: responseData['data'],
          error: false,
          errorMessage:'',
        );
      }
    } catch (exception) {
      return APIResponse(
        data: null,
        error: true,
        errorMessage: exception.toString(),
      );
    }
  }
  //WORKFLOW ACTION
  Future<APIResponse> WaterHarvestingWorkflowAction(verifyID, action, Map data) async {
    String url = Strings.base_url + '/api/property/harvesting/next-level';
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    var apiKey = token;
    try {
      final response = await post(
        url,
        {
          "applicationId": verifyID.toString(),
          "action": 'forward',
          "comment": data['comment'] ?? '',
        },
        headers: <String, String>{
          'Authorization': token,
          'API-KEY': apiKey,
        },
      );
      if (response.status.hasError) {
        return APIResponse(
          data: null,
          error: true,
          errorMessage: response.statusText!,
        );
      } else {
        return APIResponse(
          data: response.body['data'],
          error: false,
          errorMessage: '',
        );
      }
    } catch (exception) {
      return APIResponse(
        data: null,
        error: true,
        errorMessage: exception.toString(),
      );
    }
  }
}








// SUBMISSION FORM...........!!!
//   Future<APIResponse> WaterHarvestingSubmission(int verifyID, var statusID,Map data ) async{
//     String url = Strings.base_url + 'api/property/harvesting/site-verification';
//     String token = await CommonUtils.getToken();
//     token = 'Bearer ' + token;
//     var apiKey = token;
//     try{
//       final response = await post(url,
//           {
//             "verificationStatus": statusID.toString(),
//             "applicationId": verifyID.toString(),
//           },
//           headers: <String, String>{
//             'Authorization': token,
//             'API-KEY': apiKey,
//           });
//       if (response.status.hasError) {
//         return APIResponse(
//             data: null,
//             error: true,
//             errorMessage: response.statusText!
//         );
//       } else {
//         return APIResponse(
//             data: response.body['data'],
//             error: false,
//             errorMessage: response.statusText!
//         );
//       }
//     } catch (exception) {
//       return APIResponse(
//           data: null,
//           error: true,
//           errorMessage: exception.toString()
//       );
//     }
//   }





