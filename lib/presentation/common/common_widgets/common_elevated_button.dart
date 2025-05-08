import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  final String text;
  final void Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s52,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.colorPrimary,
          disabledBackgroundColor:
              ColorManager.colorPrimary.withValues(alpha: AppSize.s0_5),
        ),
        child: isLoading
            ? SizedBox(
                width: AppSize.s24,
                height: AppSize.s24,
                child: CircularProgressIndicator(
                  color: ColorManager.colorWhite,
                  strokeWidth: AppSize.s2,
                ),
              )
            : Text(
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
