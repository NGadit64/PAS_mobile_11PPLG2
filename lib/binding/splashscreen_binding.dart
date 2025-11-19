import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg_01/controllers/splashscreen_controller.dart';
import '../controllers/dashboard_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
