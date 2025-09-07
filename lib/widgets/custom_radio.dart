import 'package:flutter/material.dart';
import 'package:kerjain/colors/app_colors.dart';

class CustomRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final ValueChanged<String?> onChanged;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  bool get selected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: ColorPalette.accentColor,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: ColorPalette.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
