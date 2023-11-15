package com.amcakola.tc_verification_app

import android.content.Intent
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity

/**
 * | Created By: ANSHI KUMARI
 * | Description:Handles communication with a Point of Sale (POS) device through a Method Channel.
 * | Fields:
 * |   - `CHANNEL`: Method channel identifier for communication with Flutter and POS device.
 * |   - `REQUEST_CODE`: Request code for `startActivityForResult`.
 * | Methods:
 * |   - `configureFlutterEngine`: Configures the Flutter engine, sets up the MethodChannel, and handles method calls to send payment intents.
 * |   - `onActivityResult`: Handles the result of the activity, invokes the Flutter method to handle the POS response.
 */

class MainActivity: FlutterActivity() {
    // Method channel identifier for communication between Flutter and POS device.
    private val CHANNEL = "com.amcakola.tc_verification_app/com.pinelabs.masterapp"
    private val REQUEST_CODE = 1004 // request code for startActivityForResult

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // Modify your MethodCallHandler to accept the payload JSON
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "sendPaymentIntent") {
                    // Extract payload JSON from Flutter method call arguments.
                    val payloadJson = call.arguments as String

                    val intent = Intent("com.pinelabs.masterapp.HYBRID_REQUEST")
                    intent.setPackage("com.pinelabs.masterapp")
                    intent.putExtra("REQUEST_DATA", payloadJson)
                    intent.putExtra("packageName", "com.amcakola.tc_verification_app")

                    try {
                        // Start the activity for result, expecting a response.
                        startActivityForResult(intent, REQUEST_CODE)
                    } catch (e: Throwable) {
                        // Handle any errors and report them back to Flutter.
                        result.error("SEND_INTENT_ERROR", e.message, null)
                    }
                } else {
                    result.notImplemented()
                }
            }

//
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            // Checking the Method Call
//            if (call.method == "sendPaymentIntent") {
//                // Constructing the Intent
////                val doTransactionPayload = "{},\"Header\"{\"ApplicationId\":\"1004\",\"MethodId\":\"1004\",\"UserId\":\"1234\",\"VersionNo\":\"1.0\"}"
//                // Constructing the Intent
//                val doTransactionPayload = """
//            {
//              "Detail": {
//                "BillingRefNo": "TX12345678",
//                "PaymentAmount": 9900,
//                "TransactionType": 4001
//              },
//              "Header": {
//                "ApplicationId": "48a78da62f144f209d8837b96d709e7a",
//                "MethodId": "1001",
//                "UserId": "1234",
//                "VersionNo": "1.0"
//              }
//            }
//            """
//                // Log the request payload
//                println("Request Payload: $doTransactionPayload")
//
//                val intent = Intent("com.pinelabs.masterapp.HYBRID_REQUEST")
//                intent.setPackage("com.pinelabs.masterapp")
//                intent.putExtra("REQUEST_DATA", doTransactionPayload)
//                intent.putExtra("packageName", "com.amcakola.tc_verification_app")
//                // Starting the Activity
//                try {
//                    startActivityForResult(intent, REQUEST_CODE)
//                    // handling the result in onActivityResult
//                } catch (e: Throwable) {
//                    result.error("SEND_INTENT_ERROR", e.message, null)
//                }
//            } else {
//                result.notImplemented()
//            }
//        }
    }

    // Handleing the result of activity
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == REQUEST_CODE) {
            if (resultCode == RESULT_OK) {
                // successfull result
                if (data != null) {
                    val responseData = data.getStringExtra("RESPONSE_DATA")
                    if (responseData != null) {
                        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("handleResponse", responseData)
                    }
                }
            } else {
            }
        }
    }
}