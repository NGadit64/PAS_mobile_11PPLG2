import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class ResponsiveController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints) {
    if (constraints.maxWidth < 600) {
      isMobile.value = true;
    } else {
      isMobile.value = false;
    }
  }
}
