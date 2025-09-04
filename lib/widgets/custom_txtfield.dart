import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomTxtfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Color borderColor;     
  final Color focusedBorderColor; 

  const CustomTxtfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.borderColor = ColorPalette.backgroundColor, 
    this.focusedBorderColor = ColorPalette.primaryGradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
    );
  }
}
