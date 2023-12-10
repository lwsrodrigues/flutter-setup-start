import 'package:get/get.dart';

import '../controllers/alaki_controller.dart';

class AlakiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlakiController>(
      () => AlakiController(),
    );
  }
}
