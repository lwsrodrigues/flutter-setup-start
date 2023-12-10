import 'package:flutter/material.dart';
import 'package:flutter_starter/views/neutrophil/home.dart';

import 'package:get/get.dart';

void main() {
  //NOTE: custom Error Page
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return const Material();
  // };

  //NOTE: getx nested router startup
  // runApp(const AppGetXNestedRouter());
  // runApp(const LayoutExample());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter starter',
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const HomeNeutrophil(),
          ),
        
        ],
        defaultTransition: Transition.cupertino
        //    initialRoute: AppPages.INITIAL,
        // getPages: AppPages.routes,
        // defaultTransition: Transition.fadeIn,
        );
  }
}
