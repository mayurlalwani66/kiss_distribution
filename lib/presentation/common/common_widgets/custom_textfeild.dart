import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';

import '../../resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color? borderColor;
  final Color? focusedBorderColor;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderColor,
    this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getRegularStyle(
              color: ColorManager.colorTextFieldLabel, fontSize: FontSize.s12),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: getRegularStyle(
              color: ColorManager.colorBlack, fontSize: FontSize.s15),
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: getRegularStyle(
                color: ColorManager.colorBlack, fontSize: FontSize.s15),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? ColorManager.colorBlack),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: focusedBorderColor ?? ColorManager.colorBlack,
                  width: 2),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s30),
      ],
    );
  }
}
