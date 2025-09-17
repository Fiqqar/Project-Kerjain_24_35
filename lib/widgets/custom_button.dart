import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
    this.borderRadius = 15.0,
    this.textColor = ColorPalette.backgroundColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w600,
    this.width,     
    this.height = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width ?? 64, height ?? 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        label,

        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double borderRadius;

  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.backgroundColor = ColorPalette.primaryColor,
    this.iconColor = ColorPalette.backgroundColor,
    this.size = 56.0,
    this.borderRadius = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      elevation: 6,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: iconColor, size: size * 0.5),
        ),
      ),
    );
  }
}
