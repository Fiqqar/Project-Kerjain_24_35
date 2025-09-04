import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final bool hasShadow;
  final double elevation;
  final List<BoxShadow>? customShadow;
  final double topRadius;
  final double? height;
  final double width;  

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.color = Colors.white,
    this.hasShadow = true,
    this.elevation = 8.0,
    this.customShadow,
    this.topRadius = 20.0,
    this.width = double.infinity,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius),
          topRight: Radius.circular(topRadius),
        ),
        boxShadow: hasShadow
            ? customShadow ??
                [
                  BoxShadow(
                    color: ColorPalette.shadowColor,
                    offset: const Offset(0, 4),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: ColorPalette.shadowColor,
                    offset: const Offset(0, 2),
                    blurRadius: 1,
                    spreadRadius: 0,
                  ),
                ]
            : null,
      ),
      child: child,
    );
  }
}
