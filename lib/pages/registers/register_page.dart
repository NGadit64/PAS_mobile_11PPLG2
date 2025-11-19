import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/register_controller.dart';
import '../../../controllers/login_controller.dart';
import '../../../widget/widget_textfield.dart';
import '../../../widget/widget_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login API",
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(221, 255, 252, 252),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 248, 97, 97),
      ),
      backgroundColor: const Color.fromARGB(255, 234, 168, 168),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              textEditingController: controller.usernameC,
              labelText: "Username",
              labelColor: const Color.fromARGB(221, 0, 0, 0),
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 24),
            MyTextField(
              textEditingController: controller.fName,
              labelText: "Full Name",
              labelColor: const Color.fromARGB(221, 0, 0, 0),
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 16),
            MyTextField(
              textEditingController: controller.email,
              labelText: "Email",
              labelColor: const Color.fromARGB(221, 0, 0, 0),
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 24),
            MyTextField(
              textEditingController: controller.passwordC,
              labelText: "Password",
              labelColor: const Color.fromARGB(221, 0, 0, 0),
              pass: true,
              isNumber: false,
            ),
            const SizedBox(height: 24),
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: "Register",
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: const Color.fromARGB(255, 240, 38, 38),
                      onPressed: controller.register,
                    ),
            ),
            Text(
              "sudah punya akun?",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(221, 0, 0, 0),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
            CustomButton(
              text: "Login",
              textColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color.fromARGB(255, 77, 18, 18),
              onPressed: controller.login,
            ),
          ],
        ),
      ),
    );
  }
}
