
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg_01/model/movie_model.dart';


class TableController extends GetxController {
  var isLoading = false.obs;
  var tableStandings = <TablePremiereModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAPITablePremiere();
  }

  Future<void> fetchAPITablePremiere() async {
  const url = 'https://api.tvmaze.com/shows';

  try {
    isLoading.value = true;

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      tableStandings.assignAll(
        data.map((e) => TablePremiereModel.fromJson(e)).toList(),
      );
    } else {
      Get.snackbar("Error", "Gagal mengambil data: ${response.statusCode}");
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  } finally {
    isLoading.value = false;
  }
}
}
