import 'package:flutter/cupertino.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomText extends StatelessWidget{

  final String text;
  final TextStyle style;

  const CustomText({
    super.key,
    required this.text,
    this.style = const TextStyle(fontSize: 16.0, color: ColorPalette.shadowColor),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}