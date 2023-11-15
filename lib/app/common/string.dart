import 'package:get_storage/get_storage.dart';

class Strings {
  static String loginApi_key = GetStorage().read('key');

     //Bikash
    // static String base_url = 'http://192.168.0.21:8005';

    //PRODUCTION NEW
      static String base_url = 'http://203.129.217.62:8005';
     //static String base_url = 'https://api.modernulb.com';
    // static String base_url = 'http://203.129.217.62:8005';

    //Anshu sir🐭 {Property}
    //static String base_url = 'http://192.168.0.104:8000';
    // static String base_url = 'http://192.168.0.251:8000';

    //HALDI{Water}
    //static String base_url = 'http://192.168.0.246:86';

    //Sandeep Sir{Trade}
    //static String base_url = 'http://192.168.0.211:8002';

    //Mrinal
    // static String base_url = 'http://192.168.0.158:2005';
    // static String base_url = 'https://api.modernulb.com';

    //STAGING URL
    //   static String base_url = 'http://203.129.217.244:8005';

    static String api_key = "eff41ef6-d430-4887-aa55-9fcf46c72c99";

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + GetStorage().read('key').toString(),
    'API-KEY': "eff41ef6-d430-4887-aa55-9fcf46c72c99",
  };
}
