import 'package:flutter/services.dart';
/**
 * | Created By: ANSHI KUMARI
 * | Description: communication with a (POS) device through a Method Channel.
 * |              Utilizes the platform-specific channel "com.amcakola.tc_verification_app/com.pinelabs.masterapp" to send payment intents to Pine Labs.
 * | Methods:- `sendIntentToPineLabs`: Sends a payment intent to Pine Labs through the method channel and handles potential platform exceptions.
 */

class PaymentService {
  //here its,Method Channel name  to build  communication with Flutter and pos device
  static const platform = MethodChannel("com.amcakola.tc_verification_app/com.pinelabs.masterapp");
  // calls from Flutter
  static Future<void> sendIntentToPineLabs() async {
    try {
      //listens for a method "sendPaymentIntent"
      await platform.invokeMethod('sendPaymentIntent');
      print('Sent intent to Pine Labs');
    } on PlatformException catch (e) {
      print('Error sending intent: ${e.message}');
    }
  }
}
