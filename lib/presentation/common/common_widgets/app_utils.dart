import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';

import '../../resources/values_manager.dart';

class AppUtils {
  static bottomsheetView({
    required BuildContext context,
    required Widget widget,
    safeArea = true,
    isDismissible = false,
    isScrollControlled = false,
    BoxConstraints? constraints,
  }) {
    return showModalBottomSheet(
        isScrollControlled: false,
        useSafeArea: safeArea,
        isDismissible: isDismissible,
        constraints: constraints,
        backgroundColor: ColorManager.colorWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s10),
                topRight: Radius.circular(AppSize.s10))),
        context: context,
        builder: (context) {
          return widget;
        });
  }
}
