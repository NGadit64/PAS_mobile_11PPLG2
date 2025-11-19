import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/dashboard_controller.dart'; 

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    

    return Obx(() {
      return Scaffold(
        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Movie",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history), 
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
