import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget{

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double borderRadius;

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.color = const Color(0xFFFFFFFF),
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}