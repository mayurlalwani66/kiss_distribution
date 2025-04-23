import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final double height;

  const CustomCheckbox({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.label,
    this.height = AppSize.s15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isSelected
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            size: height,
            color: isSelected ? ColorManager.colorBlack : Colors.grey,
          ),
          SizedBox(width: AppSize.s6),
          Text(
            label,
            style: getRegularStyle(
                color: ColorManager.colorBlack, fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}
