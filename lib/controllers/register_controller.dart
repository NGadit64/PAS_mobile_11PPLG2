import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/routes.dart';

class RegisterController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final fName = TextEditingController();
  final email = TextEditingController();
  var isLoading = false.obs;

  void login() {
    Get.toNamed(AppRoutes.loginPage);
  }

  Future<void> register() async {
    isLoading.value = true;

    try {
      final url = Uri.parse('https://mediadwi.com/api/latihan/register-user');
      final response = await http.post(
        url,
        body: {'username': usernameC.text, 'password': passwordC.text, 'full_name': fName.text, 'email': email.text},
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
          await prefs.setString("password", passwordC.text,);
          

          Get.offAllNamed(AppRoutes.splashscreenPage);
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
