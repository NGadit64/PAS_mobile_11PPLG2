import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/dbHelper.dart';

class BookmarkController extends GetxController {
  var bookmarks = [].obs;
  final db = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    bookmarks.value = await db.getBookmarks();
  }

  Future<void> addBookmark(team) async {
    await db.addBookmark(team);
    loadBookmarks();
    Get.snackbar("Success", "Saved to bookmark");
  }

  Future<void> deleteBookmark(int id) async {
    await db.deleteBookmark(id);
    loadBookmarks();
    Get.snackbar("Deleted", "Bookmark deleted");
  }
}
