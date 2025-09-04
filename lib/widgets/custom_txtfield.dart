
import 'package:flutter/material.dart';

class CustomTxtfield extends StatelessWidget{
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTxtfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    );
  }
}