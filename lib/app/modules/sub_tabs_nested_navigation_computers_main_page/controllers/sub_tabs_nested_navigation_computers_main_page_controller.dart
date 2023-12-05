import 'package:flutter_starter/app/data/repository.dart';
import 'package:get/get.dart';

class SubTabsNestedNavigationComputersMainPageController
    extends GetxController with StateMixin<List<String>> {

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    Repository().getComputers.then((result) => change(result, status: RxStatus.success()))
        .onError((error, stackTrace) => change(null, status: RxStatus.error()));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
