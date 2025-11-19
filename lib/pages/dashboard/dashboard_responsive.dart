import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/responsive_controller.dart';
import 'package:pas_mobile_11pplg_01/pages/dashboard/dashboard.dart';
import 'package:pas_mobile_11pplg_01/pages/dashboard/dashboard_wide.dart';

class DashboardResponsive extends StatelessWidget {
  DashboardResponsive({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          controller.updateLayout(constraints);
          return Obx(()=> controller.isMobile.value ? DashboardPage() : DashboardWidescreen());
        }
        ),
    );
  }
}