import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes.dart';

class LoginController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  var isLoading = false.obs;

  void register() {
    Get.toNamed(AppRoutes.registerPage);
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      final url = Uri.parse('https://mediadwi.com/api/latihan/login');
      final response = await http.post(
        url,
        body: {'username': usernameC.text, 'password': passwordC.text},
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // tampilkan pesan dari server
        Get.snackbar(
          'Server',
          data['message'] ?? 'Tidak ada pesan',
          snackPosition: SnackPosition.BOTTOM,
        );

        // jika login berhasil
        if (data['status'] == true) {
          final prefs = await SharedPreferences.getInstance();

          // SIMPAN TOKEN API
          await prefs.setString("token", data['token']);

          // simpan username (opsional)
          await prefs.setString("username", usernameC.text);

          Get.offAllNamed(AppRoutes.dashboardPage);
        }
      } else {
        Get.snackbar(
          'Error',
          'Server error: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
