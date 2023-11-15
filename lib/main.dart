import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';


/**
 * | Created By: ANSHI KUMARI
 * | Description: Entry point for the e-Gov Flutter application.
 * | Initializes GetStorage, sets up routes using Get, and runs the app.
 */

void main() async {
  debugProfileBuildsEnabled = true; // Enable performance overlay
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "e-Gov",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: HomeView(),
    ),
  );
}
