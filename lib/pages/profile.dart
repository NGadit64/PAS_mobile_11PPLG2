import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg_01/routes/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "-";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username") ?? "-";
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("username");

    Get.offAllNamed(AppRoutes.splashscreenPage);
  }

  @override
  Widget build(BuildContext context) {

    String email = "$username@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 45, 45),
      ),
      backgroundColor: const Color.fromARGB(255, 79, 50, 50),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/adit.jpeg'),
            ),
            const SizedBox(height: 20),

            Text(
              "Username: $username",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),

            Text(
              "Email: $email",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
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
