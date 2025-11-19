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
      appBar: AppBar(
        title: const Text(
          "Login API",
          style: TextStyle(
            color: Color.fromARGB(221, 255, 252, 252),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 104, 32, 32),
      ),

      backgroundColor: Color.fromARGB(255, 187, 44, 44),

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
                margin: const EdgeInsets.all(10),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      // POSTER
     ClipRRect(
       borderRadius: const BorderRadius.only(
       topLeft: Radius.circular(12),
       bottomLeft: Radius.circular(12),
    ),
     child: Image.network(
     team.image.original,
   width: 120,
           height: double.infinity,
          fit: BoxFit.cover,
      ),
    ),



      const SizedBox(width: 12),
      Expanded(
     child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 10),
  child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
             team.name,
       style: const TextStyle(
         fontSize: 18,
                 fontWeight: FontWeight.bold,
    
              ),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    ),



  Text(
 "Genres: ${team.genres.join(', ')}",
    style: const TextStyle(
     fontSize: 14,
           color: Colors.grey,
    ),
             maxLines: 2,
     overflow: TextOverflow.ellipsis,
    ),
   Row(children: [const Icon(Icons.star,color: Colors.amber, size: 18),const SizedBox(width: 4),
  Text("${team.rating.average ?? 'N/A'}",
   style: const TextStyle(fontSize: 14),
),
  ],
 ),



  Text(
   "Premiered: ${team.premiered.year}",
     style: const TextStyle(fontSize: 14),
     ),
      ],
),
),
   ),

IconButton(
  icon: const Icon(Icons.bookmark_add),
    onPressed: () {
 bookmarkController.addBookmark(team);
  },
  )
     ],
  ),
   ),
   );
            },
          ),
        );
      }),
    );
  }
}
