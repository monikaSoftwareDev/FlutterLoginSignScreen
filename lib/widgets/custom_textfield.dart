import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //stateless means whose data wont change
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
