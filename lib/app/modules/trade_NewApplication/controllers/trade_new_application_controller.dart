import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../providers/trade_new_application_provider.dart';

class TradeNewApplicationController extends GetxController {
  final count = 0.obs;
  var isDataProcessing = false.obs;

  //GET-APPLY-DATA (---DROPDOWN LIST---)
  List<Map<String, dynamic>> firmTypeList = [];
  List<Map<String, dynamic>> ownershipTypeList = [];
  List<Map<String, dynamic>> categoryTypeList = [];
  List<Map<String, dynamic>> natureOfBusiness = [];
  List<Map<String, dynamic>> wardList = [];

  @override
  void onInit() {
    super.onInit();
    selectListData();
  }
//GET-APPLY-DATA (---DROPDOWN LIST---)
  void selectListData() async {
    isDataProcessing(true);
    APIResponse result = await TradeNewApplicationProvider().SelectListDetail();
    if (result == null) {
      isDataProcessing(false);
      return;
    }
    Map<String, dynamic> data = result.data;
    data.forEach((key, value) {
      switch (key) {
        case 'firmTypeList':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["firm_type"] = item["firm_type"];
              firmTypeList.add(dataListMap);
            });
          }
          ;
          break;
        case 'ownershipTypeList':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["ownership_type"] = item["ownership_type"];
              ownershipTypeList.add(dataListMap);
            });
          }
          break;
        case 'categoryTypeList':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["category_type"] = item["category_type"];
              categoryTypeList.add(dataListMap);
            });
          }
          break;
        case 'natureOfBusiness':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["trade_item"] = item["trade_item"];
              dataListMap["trade_code"] = item["trade_code"];
              natureOfBusiness.add(dataListMap);
            });
          }
          break;
        case 'wardList':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["ward_name"] = item["ward_name"];
              dataListMap["ward_no"] = item["ward_no"];
              wardList.add(dataListMap);
            });
          }
          break;
        default:
          {
            break;
          }
      }
    });
    isDataProcessing(false);
  }




  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
