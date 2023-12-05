import 'package:flutter/material.dart';
import 'package:flutter_starter/app/modules/nested_navigation_detail/bindings/nested_navigation_detail_binding.dart';
import 'package:flutter_starter/app/modules/nested_navigation_detail/views/nested_navigation_detail_view.dart';
import 'package:flutter_starter/app/modules/nested_navigation_main/controllers/nested_navigation_main_controller.dart';
import 'package:flutter_starter/app/modules/nested_navigation_main/views/nested_navigation_main_view.dart';
import 'package:flutter_starter/app/modules/standard_navigation_main/controllers/standard_navigation_main_controller.dart';
import 'package:flutter_starter/app/modules/standard_navigation_main/views/standard_navigation_main_view.dart';
import 'package:flutter_starter/app/modules/sub_tabs_nested_navigation_main/controllers/sub_tabs_nested_navigation_main_controller.dart';
import 'package:flutter_starter/app/modules/sub_tabs_nested_navigation_main/views/sub_tabs_nested_navigation_main_view.dart';
import 'package:flutter_starter/constants.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

// void main() {
//   runApp(
//     GetMaterialApp(
//       title: "Application",
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//       defaultTransition: Transition.fadeIn,
//     ),
//   );
// }
void main() {
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => MyHomePage(), binding: HomeBinding()),
      GetPage(name: '/second', page: () => Second()),
      GetPage(name: '/third', page: () => Third(), transition: Transition.zoom),
      GetPage(name: '/third', page: () => Third2(), transition: Transition.zoom),
    ],
  ));
}

class HomeController2 extends GetxController {
  RxInt tabIndex = 0.obs;

  void onTabClick(int newTab) {
    print('Tab $newTab');
    tabIndex(newTab);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController2>(
      () => HomeController2(),
    );
    Get.lazyPut<StandardNavigationMainController>(
      () => StandardNavigationMainController(),
    );
    Get.lazyPut<NestedNavigationMainController>(
      () => NestedNavigationMainController(),
    );
    Get.lazyPut<SubTabsNestedNavigationMainController>(
      () => SubTabsNestedNavigationMainController(),
    );
  }
}

class MyHomePage extends GetView<HomeController2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            StandardNavigationMainView(),
            Navigator(
              key: Get.nestedKey(Constants.nestedNavigationNavigatorId),
              initialRoute: Routes.NESTED_NAVIGATION_MAIN,
              onGenerateRoute: (routeSettings) {
                if (routeSettings.name == Routes.NESTED_NAVIGATION_MAIN) {
                  return MaterialPageRoute(builder: (context) {
                    return NestedNavigationMainView();
                  });
                } else if (routeSettings.name == Routes.NESTED_NAVIGATION_DETAIL) {
                  return GetPageRoute(
                      routeName: Routes.NESTED_NAVIGATION_DETAIL,
                      page: () => NestedNavigationDetailView(
                            argument: routeSettings.arguments as String,
                          ),
                      binding: NestedNavigationDetailBinding());
                }
              },
            ),
            SubTabsNestedNavigationMainView()
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Standard'),
            BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Nested'),
            BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'SubTabs Nested'),
          ],
          onTap: controller.onTabClick,
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Second'),
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Third'),
    );
  }
}

class Third2 extends StatelessWidget {
  const Third2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Third2'),
    );
  }
}
