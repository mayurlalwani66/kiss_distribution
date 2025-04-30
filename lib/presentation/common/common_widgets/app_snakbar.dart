import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';

class AppSnackbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: ColorManager.colorSnakbarErrorBg,
          content: Text(
            message,
            style: getBoldStyle(
                color: ColorManager.colorSnakbarErrorText,
                fontSize: FontSize.s14),
          )),
    );
  }
}
