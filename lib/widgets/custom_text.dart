import 'package:flutter/cupertino.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final String myFont;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final bool isLineThrough; // 🔥 tambahan khusus

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
        decoration: isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}
