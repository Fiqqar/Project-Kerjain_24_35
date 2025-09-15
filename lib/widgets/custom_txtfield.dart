import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomTxtfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Color borderColor;     
  final Color focusedBorderColor; 
  final Color hintTextColor;
  final Color textColor;
  final Widget? suffixIcon;

  const CustomTxtfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.borderColor = ColorPalette.backgroundColor, 
    this.focusedBorderColor = ColorPalette.primaryGradientColor,
    this.hintTextColor = ColorPalette.backgroundColor,
    this.textColor = ColorPalette.backgroundColor,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText, 
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
