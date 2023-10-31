

class municipalRental_ApiEndpoints {
  // Circle APIs
  static const String listAllCircles = '/api/market/v1/crud/circle/list-all-circle';

  // Market APIs
  static const String listMarketByCircle = '/api/market/v1/crud/market/list-market-by-circleId';
  static const String getTollPriceList = '/api/market/rental/get-toll-price-list';
  static const String insertToll = '/api/market/crud/toll/insert';
  static const String listToll = '/api/market/crud/toll/list-toll';

  // Toll APIs
  static const String getTollDetailById = '/api/market/rental/get-toll-detail-by-id';
  static const String searchTollByNameOrMobile = '/api/market/rental/search-toll';
  static const String listTollByMarketId = '/api/market/rental/list-toll-by-market-id';
  static const String tollAmtCalculation = '/api/market/rental/calculate-toll-price';
  static const String tollPayment = '/api/market/toll-payments';
}
