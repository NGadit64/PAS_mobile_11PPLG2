import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookmarkController());

    return Scaffold(
      appBar: AppBar(title: const Text("Login API",
                      style: TextStyle(
                      color: const Color.fromARGB(221, 255, 252, 252),
                      ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 65, 45, 45),),
      backgroundColor: const Color.fromARGB(255, 170, 134, 134),
      body: Obx(() {
        if (controller.bookmarks.isEmpty) {
          return const Center(child: Text("Belum ada bookmark"));
        }

        return ListView.builder(
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            final item = controller.bookmarks[index];

            return Card(
  margin: const EdgeInsets.all(10),
  child: ListTile(
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(item['image']),
    ),
    title: Text(
      item['name'],
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text("Genres: ${item['genre']}"),
    trailing: IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        controller.deleteBookmark(item['id']);
      },
    ),
  ),
);

          },
        );
      }),
    );
  }
}
