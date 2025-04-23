import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
    required this.onTap,
    required this.grandTotal,
    required this.totalItems,
  });

  final void Function() onTap;
  final double grandTotal;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(AppSize.s0),
      color: ColorManager.colorLightGray4,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          margin: const EdgeInsets.only(
              top: AppSize.s0,
              left: AppSize.s15,
              right: AppPadding.p15,
              bottom: AppSize.s15),
          padding: const EdgeInsets.all(AppSize.s15),
          decoration: BoxDecoration(
              color: ColorManager.colorPrimary.withValues(alpha: AppSize.s0_8),
              borderRadius: BorderRadius.circular(AppSize.s15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.totalAmount,
                  style: getBoldStyle(
                      color: ColorManager.colorWhite, fontSize: FontSize.s18)),
              RichText(
                  text: TextSpan(
                      text: "\$${grandTotal.roundToTwo()}",
                      style: getBoldStyle(
                          color: ColorManager.colorWhite,
                          fontSize: FontSize.s16),
                      children: [
                    TextSpan(
                        text:
                            " | $totalItems Item ${totalItems > 1 ? 's' : ''}",
                        style: getRegularStyle(
                            color: ColorManager.colorWhite,
                            fontSize: FontSize.s12))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
