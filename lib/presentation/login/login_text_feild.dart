import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class LoginTextFeild extends StatelessWidget {
  const LoginTextFeild({
    super.key,
    this.validator,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    required this.keyboardType,
  });

  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: AppSize.s10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: getRegularStyle(
            color: ColorManager.colorBlack,
            fontSize: FontSize.s14,
          ),
          decoration: InputDecoration(
            fillColor: ColorManager.colorGrayDB,
            filled: true,
            hintText: hintText,
            hintStyle: getRegularStyle(
              color: ColorManager.colorBlack,
              fontSize: FontSize.s14,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
