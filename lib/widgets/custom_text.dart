import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget{

  final String text;
  final TextStyle style;

  const CustomText({
    super.key,
    required this.text,
    this.style = const TextStyle(fontSize: 16.0, color: Color(0xFF000000)),
    
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      
    );
  }
}