import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/responsive_controller.dart';
import '../controllers/dashboard_controller.dart';

class ResponsiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());
  }
}
