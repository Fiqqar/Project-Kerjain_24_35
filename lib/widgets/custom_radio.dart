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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: selected ? ColorPalette.primaryColorShade100 : ColorPalette.transparent,
          border: Border.all(
            color: selected ? ColorPalette.primaryColor : ColorPalette.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
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
                color: selected ? ColorPalette.textColor :ColorPalette.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
