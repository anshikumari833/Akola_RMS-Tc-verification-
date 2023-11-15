import 'dart:convert';
/**
 * | Created By: ANSHI KUMARI
 * | Description:Parses JSON response and handles different scenarios, including error handling.
 */
class APIResponse<T> {
  T data;
  bool error;
  String errorMessage;

  APIResponse({
    required this.data,
    this.error = false,
    required this.errorMessage,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    var decodedData = json['data']; // Initialize decodedData with the raw data.

    if (json['error'] == false) {
      if (json['data'] is String) {
        // If 'data' is a string, decode it.
        decodedData = jsonDecode(json['data']);
      }

      if (decodedData is Map<String, dynamic>) {
        // Check if decodedData is a Map (assuming it's a JSON object).
        if (decodedData['status']) {
          return APIResponse(
            data: decodedData['data'],
            error: false,
            errorMessage: decodedData['message'].toString(),
          );
        } else {
          return APIResponse(
            data: decodedData['data'],
            error: true,
            errorMessage: decodedData['message'].toString(),
          );
        }
      }
    }

    return APIResponse(
      data: decodedData,
      error: json['error'],
      errorMessage: 'Server Error! Please try again later!!',
    );
  }
}




//*^*^*^*^* STAGE 1 *^*^*^*^*^

// import 'dart:convert';
//
// class APIResponse<T> {
//   T data;
//   bool error;
//   String errorMessage;
//
//   APIResponse({
//     required this.data,
//     this.error = false,
//     required this.errorMessage,
//   });
//
//   factory APIResponse.fromJson(Map<String, dynamic> json) {
//     //constant to store response data
//     var decodedData = null;
//
//     // checking response error
//     if(json['error'] == false){
//
//       //checking response is string or not and decode it
//       if (json['data'] is String) {
//         decodedData = jsonDecode(json['data']);
//       } else {
//         decodedData = json['data'];
//       }
//
//       //after checking response type
//       if(decodedData['status']){
//         return APIResponse(
//           data: decodedData['data'],
//           error: false,
//           errorMessage: decodedData['message'].toString(),
//         );
//       } else {
//         return APIResponse(
//           data: decodedData['data'],
//           error: true,
//           errorMessage: decodedData['message'].toString(),
//         );
//       }
//
//     } else {
//       return APIResponse(
//         data:json['data'],
//         error: json['error'],
//         errorMessage: 'Server Error! Please try again later!!',
//       );
//     }
//   }
// }
