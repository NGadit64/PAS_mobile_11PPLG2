import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("username");

    Get.offAllNamed(AppRoutes.splashscreenPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login API",
                      style: TextStyle(
                      color: const Color.fromARGB(221, 255, 252, 252),
                      ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 65, 45, 45),
                      ),
      backgroundColor: const Color.fromARGB(255, 79, 50, 50),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/adit.jpeg'),
                      ),
            const SizedBox(height: 20),
            const Text("Username: admin",
                      style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(221, 255, 252, 252),
                      ),
                      ),
            const Text("Email: admin@example.com",
                      style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(221, 255, 252, 252),
                      ),
                      ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: logout, child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
