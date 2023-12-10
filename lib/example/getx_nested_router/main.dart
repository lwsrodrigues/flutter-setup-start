import 'package:flutter/material.dart';
import 'package:flutter_starter/example/getx_nested_router/routes/app_pages.dart';
import 'package:get/get.dart';

class AppGetXNestedRouter extends StatelessWidget {
  const AppGetXNestedRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
    );
  }
}
