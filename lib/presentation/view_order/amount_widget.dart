import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({
    super.key,
    required this.totalGrossAmount,
    required this.shippingCharge,
    required this.orderType,
    required this.grandTotal,
  });

  final String totalGrossAmount;
  final String shippingCharge;
  final String orderType;
  final String grandTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        children: [
          const SizedBox(height: AppSize.s30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalGrossAmount,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s14, color: ColorManager.colorPrimary),
              ),
              Text(
                "\$$totalGrossAmount",
                style: getSemiBoldStyle(
                    fontSize: FontSize.s14, color: ColorManager.colorPrimary),
              ),
            ],
          ),
          if (orderType == "Delivery")
            Column(
              children: [
                const SizedBox(height: AppSize.s30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.shippingCharge,
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.colorPrimary),
                    ),
                    Text(
                      "+ \$$shippingCharge",
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.colorPrimary),
                    ),
                  ],
                ),
              ],
            ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.grandAmount,
                style: getBoldStyle(
                    fontSize: FontSize.s16, color: ColorManager.colorBlack),
              ),
              Text(
                "\$$grandTotal",
                style: getBoldStyle(
                    fontSize: FontSize.s16, color: ColorManager.colorBlack),
              )
            ],
          ),
        ],
      ),
    );
  }
}
