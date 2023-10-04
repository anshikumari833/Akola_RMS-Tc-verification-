
class water_ApiEndpoints {
  //CONSUMER SEARCH API LIST
  //Search List
  static const String searchConsumer = '/api/water/search-consumer';
  //Consumer Basic Details(BY ID)
  static const String getConsumerDetails = '/api/water/consumer/get-details';
  //Demand Detail
  static const String listDemands = '/api/water/consumer/list-demand';
  //Payment History
  static const String paymentHistory = '/api/water/consumer/get-payment-history';
  //Receipt
  static const String generatePaymentReceipt = '/api/water/consumer/demand/generate-payment-receipt';
  //Payment
  static const String payDemand = '/api/water/consumer/offline-demand-payment';
}