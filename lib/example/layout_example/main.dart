
import 'package:flutter/material.dart';
import 'package:flutter_starter/example/layout_example/layout_example.dart';
import 'package:get/get.dart';

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter starter',
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => const LayoutView(),
          ),
          GetPage(
            name: '/home/',
            page: () => const HomeView(),
          ),
          //You can define a different page for routes with arguments, and another without arguments, but for that you must use the slash '/' on the route that will not receive arguments as above.
          GetPage(
            name: '/profile',
            page: () => const ProfileView(),
          ),
          GetPage(name: '/about', page: () => const AboutView()),
        ],
        defaultTransition: Transition.cupertino
        //    initialRoute: AppPages.INITIAL,
        // getPages: AppPages.routes,
        // defaultTransition: Transition.fadeIn,
        );
  }
}

