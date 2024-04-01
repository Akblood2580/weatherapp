import 'package:get/get.dart';


import '../controller/homePageController.dart';

class GetxControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
  }
}
