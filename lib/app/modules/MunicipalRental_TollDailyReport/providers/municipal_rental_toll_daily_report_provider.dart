import 'package:get/get.dart';

class MunicipalRentalTollDailyReportProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
}
