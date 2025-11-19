import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/controllers/register_controller.dart';
import '../../../widget/widget_textfield.dart';
import '../../../widget/widget_button.dart';

class RegisterWide extends StatelessWidget {
  RegisterWide({super.key});

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 168, 168),
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Register Account",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 240, 38, 38),
                ),
              ),
              const SizedBox(height: 32),


              MyTextField(
                textEditingController: controller.usernameC,
                labelText: "Username",
                labelColor: Colors.black87,
                pass: false,
                isNumber: false,
              ),
              const SizedBox(height: 24),


              MyTextField(
                textEditingController: controller.fName,
                labelText: "Full Name",
                labelColor: Colors.black87,
                pass: false,
                isNumber: false,
              ),
              const SizedBox(height: 16),


              MyTextField(
                textEditingController: controller.email,
                labelText: "Email",
                labelColor: Colors.black87,
                pass: false,
                isNumber: false,
              ),
              const SizedBox(height: 24),


              MyTextField(
                textEditingController: controller.passwordC,
                labelText: "Password",
                labelColor: Colors.black87,
                pass: true,
                isNumber: false,
              ),
              const SizedBox(height: 32),


              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        text: "Register",
                        textColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 240, 38, 38),
                        onPressed: controller.register,
                      ),
              ),

              const SizedBox(height: 24),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sudah punya akun?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: controller.login,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
