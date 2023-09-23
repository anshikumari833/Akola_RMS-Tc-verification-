import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../providers/property_cluster_provider.dart';

class PropertyClusterController extends GetxController {
  var Detaillists = List<dynamic>.empty(growable: true).obs;
var isLoading = false.obs;
  var id = '';
  var oldWardNo = '';
  var newWardNo = '';
  var name = '';
  var type = '';
  var address = '';
  var mobileNo = '';
  var authorizedPerson = '';




  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     getClusterDetails();
  }

  Future<bool> getClusterDetails() async {
    APIResponse response = await PropertyClusterProvider().getClusterList({});
    List<dynamic> dataList = response.data;
    for (var item in dataList) {
      Map<String, dynamic> map = Map<String, dynamic>.from(item);
      // id = item['id'];
      oldWardNo = item['oldWard'].toString();
      newWardNo = item['newWardName'].toString();
      name = item['name'].toString();
      type = item['type'].toString();
      address = item['address'].toString();
      mobileNo = item['mobileNo'].toString();
      authorizedPerson = item['authPersonName'].toString();
      Detaillists.add(map);
    }
    return true;
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
