import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/alaki_controller.dart';

class AlakiView extends GetView<AlakiController> {
  const AlakiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlakiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AlakiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
