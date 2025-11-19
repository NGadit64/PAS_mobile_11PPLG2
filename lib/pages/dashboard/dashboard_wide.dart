import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas_mobile_11pplg_01/controllers/dashboard_controller.dart';

class DashboardWidescreen extends StatelessWidget {
  const DashboardWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Obx(() {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: controller.changePage,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.list),
                  label: Text("Movie"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history),
                  label: Text("Bookmark"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Profile"),
                ),
              ],
            ),
            Expanded(
              child: controller.pages[controller.selectedIndex.value],
            ),
          ],
        ),
      );
    });
  }
}
