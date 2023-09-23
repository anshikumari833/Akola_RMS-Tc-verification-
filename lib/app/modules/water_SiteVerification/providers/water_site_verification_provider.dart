import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/string.dart';

class WaterSiteVerificationProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
  // SEARCH-INSPECTION-DETAIL-LIST
  Future<APIResponse> searchInspectionDetailList(Map data) async {
    String url = Strings.base_url + '/api/water/admin/search-application';
    try {
      final response = await post(
        url,
        {
          "filterBy": data['filterBy'],
          "parameter": data['parameter'],
          "fromDate": data['fromDate'],
          "toDate": data['toDate'],
        },
          headers: Strings.headers);
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
  //SET-DATE-TIME-OF INSPECTION
  Future<APIResponse> setInspectionDateTime(applicationId, Map data) async {
    String url = Strings.base_url + '/api/water/admin/application/save-inspection-date';
    try {
      final response = await post(
          url,
          {
            // "applicationId": data['applicationId'],
            "applicationId": applicationId.toString(),
            "inspectionDate": data['inspectionDate'],
            "inspectionTime": data['inspectionTime'],
          },
          headers: Strings.headers);
      if (response.status.hasError) {
        return APIResponse(
          data: null,
          error: true,
          errorMessage: response.statusText!,
        );
      } else {
        return APIResponse(
          data: response.body,
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
//GET-INSPECTION-DETAIL
  Future<APIResponse> SiteInspecionDetail(applicationId) async {
    String url = Strings.base_url + '/api/water/admin/application/site-inspection-details';
    try {
      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers);
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return APIResponse(
            data: response.body,
            error: false,
            errorMessage: response.statusText!);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }

  //GET-INSPECTION-DETAIL-BY-ID
  Future<APIResponse> StaticInspecionData(applicationId) async {
    String url = Strings.base_url + '/api/water/application/get-by-id';

    try {
      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers);
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


  //GET-JE-INSPECTED-DETAIL-BY-ID
  Future<APIResponse> JeInspectedData(applicationId) async {
    String url = Strings.base_url + '/api/water/admin/application/je-site-details';
    try {
      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers);
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

  //CANCEL INSPECTION SCHEDULING
  Future<APIResponse> CancelInspectedSchedule(applicationId) async {
    String url = Strings.base_url + '/api/water/admin/application/cancel-inspection-scheduling';
    try {
      final response = await post(url, {
        "applicationId": applicationId.toString()
      }, headers: Strings.headers);
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return APIResponse(
            data: response.body,
            error: false,
            errorMessage: response.statusText!);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }


  // SUBMIT APPLICATION
  Future<APIResponse> SubmitInspectionApplication(Map data) async {
    String url = Strings.base_url + '/api/water/site-verification/save-site-details';
    try {
      final response = await post(url, {
        "propertyTypeId": data['propertyType'],
        "areaSqft": data['totalArea'],
        "pipelineTypeId": data['pipelineReport'],
        "pipelineSize": data['piplineSize'],
        "pipelineSizeType": data['piplineSizeType'],
        "connectionTypeId": data['underRegularization'],
        "diameter": data['PermissiblePipeDiameter'],
        "pipeQuality": data['PermissiblePipeQuality'],
        "feruleSize": data['PermissibleFerruleSize'],
        "roadType": data['roadTypeData'],
        "category": data['applicantCategory'],
        "tsMap": data['tsMap'],
        "applicationId": data['applicationId'],
        "latitude": data['latitude'],
        "longitude": data['longitude'],
      },headers: Strings.headers);
      if (response.status.hasError) {
        return APIResponse(
            data: null, error: true, errorMessage: response.statusText!);
      } else {
        return APIResponse(
            data: response.body,
            error: false,
            errorMessage: response.statusText!);
      }
    } catch (exception) {
      return APIResponse(
          data: null, error: true, errorMessage: exception.toString());
    }
  }
}

// ***API LIST***
//api/water/admin/search-application
//api/water/admin/application/site-inspection-details
//api/water/application/get-by-id
//api/water/site-verification/save-site-details
// api/water/admin/application/save-inspection-date
//api/water/admin/application/je-site-details
//api/water/admin/application/cancel-inspection-scheduling