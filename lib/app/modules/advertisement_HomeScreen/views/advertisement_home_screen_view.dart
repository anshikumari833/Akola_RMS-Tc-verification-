import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_appbar.dart';
import '../controllers/advertisement_home_screen_controller.dart';

class AdvertisementHomeScreenView extends GetView<AdvertisementHomeScreenController> {

  const AdvertisementHomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
        ),
      ),
    );
  }
}
