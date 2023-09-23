import 'package:get/get.dart';

class TradeTrackLicenseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
