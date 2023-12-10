
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Navigator(
          key: Get.nestedKey(1), // create a key by index
          initialRoute: '/home',
          onGenerateRoute: (settings) {
            if (settings.name == '/home') {
              return GetPageRoute(page: () => const HomeView());
            } else if (settings.name == '/profile') {
              return GetPageRoute(page: () => const ProfileView());
            } else if (settings.name == '/about') {
              return GetPageRoute(page: () => const AboutView());
            }
            return null;
          }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 0) Get.toNamed('/about', id: 1);
            if (index == 1) Get.toNamed('/home', id: 1);
            if (index == 2) Get.toNamed('/profile', id: 1);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.precision_manufacturing,
                ),
                label: 'about'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'profile'),
          ]),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('home'),
      ),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('about'),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('profile'),
      ),
    );
  }
}
