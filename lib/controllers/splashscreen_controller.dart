import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.dashboardResponsive);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
