import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    this.backgroundColor = const Color.fromARGB(255, 143, 200, 247), // default warna tombol
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // biar agak rounded
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
