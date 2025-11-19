import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg_01/controllers/table_controller.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());
    final bookmarkController = Get.put(BookmarkController());


    return Scaffold(
      appBar: AppBar(title: const Text("Login API",
                      style: TextStyle(
                      color: const Color.fromARGB(221, 255, 252, 252),
                      ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 104, 32, 32),
                      ),
      backgroundColor: const Color.fromARGB(255, 187, 44, 44),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchAPITablePremiere(); 
          },
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), 
            itemCount: controller.tableStandings.length,
            itemBuilder: (context, index) {
              final team = controller.tableStandings[index];
              return Card(
                 child:
          ListTile(
  leading: CircleAvatar(
    backgroundImage: NetworkImage(team.image.original),
  ),
  title: Text(team.name),
  subtitle: Text(team.summary),
  trailing: IconButton(
    icon: Icon(Icons.bookmark_add),
    onPressed: () {
      bookmarkController.addBookmark(team);
    },
  ),
)


              );
            },
          ),
        );
      }),
    );
  }
}
