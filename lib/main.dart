import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  //NOTE: custom Error Page
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return const Material();
  // };

  

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
    ),
  );
}
