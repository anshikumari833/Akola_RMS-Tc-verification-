import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImportView extends GetView {
  const ImportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ImportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
