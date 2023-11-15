
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
  //FULL Payment
  static const String payDemand = '/api/water/consumer/offline-demand-payment';
  //PART Payment
  static const String payPartDemand = '/api/water/consumer/part-payment';
  // Generate Demand
  static const String generateDemand = '/api/water/admin/consumer/generate-demand';
  // Calculate Demand
  static const String calculateDemand = '/api/water/consumer/calculate-month-demand';
  // Calculate Demand
  static const String dailyCollectionReport = '/api/water/report/tc-collection';
}
