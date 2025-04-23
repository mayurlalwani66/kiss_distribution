import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton(
      {super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s52,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style: getRegularStyle(
            color: ColorManager.colorWhite,
            fontSize: FontSize.s18,
          ),
        ),
      ),
    );
  }
}
