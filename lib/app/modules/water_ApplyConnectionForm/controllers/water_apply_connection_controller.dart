
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/api_response.dart';
import '../../../common/function.dart';
import '../providers/water_apply_connection_provider.dart';
import '../views/water_form_submitted_view.dart';
import '../views/water_make_payment_view.dart';
class InstallmentInfo {
  String amount;
  String ids;

  InstallmentInfo(this.amount, this.ids);
}
class WaterApplyConnectionController extends GetxController {
  final GlobalKey<FormState> WaterApplyFormKey = GlobalKey<FormState>();
  var isDataProcessing = false.obs;
  var showContainer = false.obs;

//MASTAR DATA(---DROPDOWN LIST---)
  List<Map<String, dynamic>> connectionThroughList = [];
  List<Map<String, dynamic>> requestTypeList = [];
  List<Map<String, dynamic>> propertyTypeList = [];
  List<Map<String, dynamic>> ownerTypeList = [];
  List<Map<String, dynamic>> pipelineTypeList = [];

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    holdingId = TextEditingController();
    TApplicantName = TextEditingController();
    TGuardianName = TextEditingController();
    TMobileNo = TextEditingController();
    TEmailId = TextEditingController();
    selectListDetail();
  }


//MASTER DATA(---DROPDOWN LIST---)
//*******************************Starts here*******************************
  void selectListDetail() async {
    isDataProcessing(true);
    APIResponse result = await WaterApplyConnectionProvider().SelectDetail();
    if (result == null) {
      isDataProcessing(false);
      return;
    }
    Map<String, dynamic> data = result.data;
    data.forEach((key, value) {
      switch (key) {
        case 'water_param_pipeline_type':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["pipeline_type"] = item["pipeline_type"];
              pipelineTypeList.add(dataListMap);
            });
          }
          ;
          break;
        case 'water_connection_type_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["connection_type"] = item["connection_type"];
              requestTypeList.add(dataListMap);
            });
          }
          break;
        case 'water_connection_through_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["connection_through"] = item["connection_through"];
              connectionThroughList.add(dataListMap);
            });
          }
          break;
        case 'water_property_type_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["property_type"] = item["property_type"];
              propertyTypeList.add(dataListMap);
            });
          }
          break;
        case 'water_owner_type_mstr':
          {
            value.forEach((item) {
              Map<String, dynamic> dataListMap = Map<String, dynamic>();
              dataListMap["id"] = item["id"];
              dataListMap["owner_type"] = item["owner_type"];
              ownerTypeList.add(dataListMap);
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

//*******************************Ends here*********************************


  //SEARCH-SAF-DETAILS(---HOLDING NO---)
  //*******************************Starts here*******************************
  var connectionThrough = "".obs;
  late TextEditingController holdingId;
  List<Map<String, dynamic>> usageTypeList = [];
  List<Map<String, dynamic>> owners = [];
  var ownerType = "";
  var wardNo = "";
  var TotalArea = "";
  var pinCode = "";
  var address = "";
  var tenantedOwnerName = "";
  var tenantedGuardianName = "";
  var tenantedMobileNo = "";
  var tenantedeMail = "";
  var holdingNo = "";
  dynamic isTenanted;

  Future<void> getSafBySearch() async {
    isDataProcessing.value = true;
    APIResponse response = await WaterApplyConnectionProvider()
        .SearchHoldingDetail({
      "connectionThrough": connectionThrough.value.toString(),
      "id": holdingId.text.toString(),
    });

    if (response != null) {
      Map<String, dynamic> data = response.data;
      wardNo =
      data["new_ward_no"] == null ? '' : data["new_ward_no"].toString();
      TotalArea =
      data["areaInSqFt"] == null ? '' : data["areaInSqFt"].toString();
      pinCode =
      data["prop_pin_code"] == null ? '' : data["prop_pin_code"].toString();
      address =
      data["prop_address"] == null ? '' : data["prop_address"].toString();
      holdingNo = data["new_holding_no"].toString();
      owners.clear();
      List<dynamic> ownerData = data["owners"];
      for (var owner in ownerData) {
        Map<String, dynamic> ownerInfo = {
          "id": owner["id"].toString(),
          "ownerName": owner["ownerName"].toString(),
          "mobileNo": owner["mobileNo"].toString(),
          "guardianName": owner["guardianName"].toString(),
          "email": owner["email"].toString(),
          "gender": "",
          "is_armed_force": "",
          "is_specially_abled": "",
        };
        owners.add(ownerInfo);

        isTenanted = data["tenanted"];

        usageTypeList.clear();
        List<dynamic> usageTypeData = data["usageType"];
        for (var usage in usageTypeData) {
          Map<String, dynamic> usageTypeInfo = {
            "id": usage["id"].toString(),
            "usageType": usage["usageType"].toString(),
          };
          usageTypeList.add(usageTypeInfo);
        }

        if (isTenanted) {} else {}
      }
    }
    isDataProcessing.value = false;
    print('response.data: ${response.data}');
  }

  //*******************************Ends here*******************************


  // SUBMIT APPLICATION FORM
  var sConnectionThrough = ''.obs;
  var sHoldingNo = ''.obs;
  var sTypeOfRequest = ''.obs;
  var sOwnerType = ''.obs;
  var sPropertyType = ''.obs;
  var sCategoryType = ''.obs;
  var sPipelineType = ''.obs;
  var sWardNo = ''.obs;
  var sTotalArea = ''.obs;
  var sPincode = ''.obs;
  var sAddress = ''.obs;
  var applicationNo = '';
  var applicationId = '';
  var hintTextWhenNotTenanted = '1';


  late TextEditingController TApplicantName;
  late TextEditingController TGuardianName;
  late TextEditingController TMobileNo;
  late TextEditingController TEmailId;


  Future<void> WaterValidateForm(BuildContext context) async {
    // final isValid = WaterApplyFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // WaterApplyFormKey.currentState!.save();
    List<Map<String, dynamic>> tenantsList = [];

    if (!isTenanted && sOwnerType.value == '2') {
      tenantsList.add({
        "applicantName": TApplicantName.text.toString(),
        "guardianName": TGuardianName.text.toString(),
        "mobileNo": TMobileNo.text.toString(),
        "emailId": TEmailId.text.toString(),
      });
    }
    var result = await WaterApplyConnectionProvider().SubmitWaterForm({
      "ulbId": "2",
      "connectionTypeId":sTypeOfRequest.value,
      "holdingNo": holdingId.text.toString(),
      "connection_through":  connectionThrough.value.toString(),
      "propertyTypeId": sPropertyType.value,
      "ownerType": isTenanted == true ? sOwnerType.value : hintTextWhenNotTenanted,
      "category": sCategoryType.value,
      "pipelineTypeId": sPipelineType.value,
      "landmark": "Landmark",
      "wardId": wardNo,
      "areaSqft": TotalArea,
      "address": address,
      "pin": pinCode,
      "tenant": tenantsList,
      "owners": owners,
    });
    if (result != null && result.data != null) {
      Map<String, dynamic> data = result.data;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
      applicationNo = data['applicationNo'].toString();
      applicationId = data['applicationId'].toString();
      print('Application No: $applicationNo');
      print('Application ID: $applicationId');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WaterFormSubmittedView()),
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Form submission failed. Please try again later.')),
      );
    }
  }

  List<Map<String, dynamic>> penaltyInstallmentsList = [];
  List<String> installmentAmountsList = [];
  var payApplicationNo = '';
  var payWardNo = '';
  var payConnectionType = '';
  var payConnectionTypeId = '';
  var payOwnershipType = '';
  var payPropertyType = '';
  var payPipelineType = '';
  var payConnectionThrough = '';
  var payHoldingNo = '';
  var payConnectionFee = '';
  var payPenalty = '';
  var payTotalPayable = '';
  var payCategory = '';

  List<InstallmentInfo> installmentInfoList = [];
  String selectedInstallmentAmount = '';
  List<String> selectedIds = [];

  Future<bool> PaymentDemandDetail() async {
    APIResponse response = await WaterApplyConnectionProvider()
        .PaymentDemandDetailById(applicationId);
    if (response.error == true) {
      CommonUtils.showSnackBar(
          'Could not Save', response.errorMessage, Colors.red);
    } else {
      CommonUtils.showSnackBar('Success', response.errorMessage, Colors.blue);
      var data = response.data;
      payConnectionTypeId = data['applicationDetails']['connection_type_id'].toString();
      payApplicationNo = data['applicationDetails']['application_no'].toString();
      payWardNo = data['applicationDetails']['ward_name'].toString();
      payConnectionType = data['applicationDetails']['connection_type'].toString();
      payOwnershipType = data['applicationDetails']['owner_char_type'].toString();
      payPropertyType = data['applicationDetails']['property_type'].toString();
      payPipelineType = data['applicationDetails']['pipeline_type'].toString();
      payConnectionThrough = data['applicationDetails']['connection_through'].toString();
      payHoldingNo = data['applicationDetails']['holding_no'].toString();
      payConnectionFee = data['calculation']['connectionFee'].toString();
      payPenalty = data['calculation']['penalty'];
      payTotalPayable = data['calculation']['totalAmount'].toString();
      payCategory = data['calculation']['chargeCatagory'].toString();
      var penaltyInstallments = data['penaltyInstallments'];
      for (var installment in penaltyInstallments) {
        if (installment['apply_connection_id'] == 2) {
          penaltyInstallmentsList.add({
            'installment_amount': installment['installment_amount'].toString(),
            'balance_amount': installment['balance_amount'].toString(),
            'rebate': installment['rebate'].toString(),
            'ids' : installment['ids'].toString(),
          });
        }
      }
    }
    Get.to(WaterMakePaymentView());
    print(response.data);

    return true;
  }


  //PAYMENT
  var mPaymentMode = "".obs;
  late TextEditingController bankNameController;
  late TextEditingController branchNameController;
  late TextEditingController chequeNoController;
  late TextEditingController chequeDateController;
  late TextEditingController remarksController;
  var tranNo = '';

  Future<void> applicationAmountPayment() async {
    var result = await WaterApplyConnectionProvider().applicationPayment(
        applicationId, {
      'paymentMode': mPaymentMode.value.toString(),
      'bankName': bankNameController.value.text,
      'branchName': branchNameController.value.text,
      'chequeNo': chequeNoController.value.text,
      'chequeDate': chequeDateController.value.text,
      'remarks': remarksController.value.text,
    });
    if (result.error == true) {
      CommonUtils.showSnackBar(
          'Could not Save', result.errorMessage, Colors.red);
    }
    else {
      CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
      var data = result.data;
      tranNo = data['TransactionNo'].toString();
    }
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

