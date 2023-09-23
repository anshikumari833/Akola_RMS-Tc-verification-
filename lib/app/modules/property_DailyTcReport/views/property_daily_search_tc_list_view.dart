import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PropertyDailySearchTcListView extends GetView {
  const PropertyDailySearchTcListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PropertyDailySearchTcListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PropertyDailySearchTcListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
