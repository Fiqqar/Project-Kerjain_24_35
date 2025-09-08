import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final String myFont;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final bool isLineThrough;

  const CustomText({
    super.key,
    required this.text,
    this.textColor = ColorPalette.textColor,
    this.myFont = 'Poppins',
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16.0,
    this.textAlign = TextAlign.start,
    this.isLineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: myFont,
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: isLineThrough
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}

Widget buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: CustomText(
            text: "$label: $value",
            fontSize: 16,
            textColor: ColorPalette.textColor,
          ),
        ),
        Icon(Icons.edit, size: 18, color: ColorPalette.accentColor),
      ],
    ),
  );
}
