import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isNumber;
  final String labelText;
  final Color labelColor;
  final bool pass;

  const MyTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.labelColor,
    required this.pass,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: pass, // biar bisa dipakai untuk password juga
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // biar ada border
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
