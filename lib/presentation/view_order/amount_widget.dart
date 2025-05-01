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
    required this.isShippingOnCustomer,
    required this.additionalDeliveryCharge,
    this.shippingNotes = "",
    this.onInfoTap,
  });

  final String totalGrossAmount;
  final double shippingCharge;
  final String orderType;
  final String grandTotal;
  final bool isShippingOnCustomer;
  final double additionalDeliveryCharge;
  final String shippingNotes;
  final VoidCallback? onInfoTap;

  bool get _shouldShowShippingCharge =>
      orderType == "Delivery" &&
      ((isShippingOnCustomer && shippingCharge > 0) ||
          additionalDeliveryCharge > 0);

  double get _totalShippingCost =>
      (isShippingOnCustomer ? shippingCharge : 0) + additionalDeliveryCharge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        children: [
          const SizedBox(height: AppSize.s30),
          _row(AppStrings.totalGrossAmount, "\$$totalGrossAmount"),
          if (_shouldShowShippingCharge) ...[
            const SizedBox(height: AppSize.s30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.shippingCharge,
                      style: getSemiBoldStyle(
                        fontSize: FontSize.s14,
                        color: ColorManager.colorPrimary,
                      ),
                    ),
                    if (shippingNotes.isNotEmpty) ...[
                      const SizedBox(width: AppSize.s15),
                      Text(
                        "($shippingNotes)",
                        style: getRegularStyle(
                          fontSize: FontSize.s10,
                          color: ColorManager.colorPrimary,
                        ),
                      ),
                    ],
                    if (additionalDeliveryCharge > 0 && onInfoTap != null) ...[
                      const SizedBox(width: AppSize.s15),
                      GestureDetector(
                        onTap: onInfoTap,
                        child: Icon(
                          Icons.info_outline,
                          size: AppSize.s15,
                          color: ColorManager.colorRed,
                        ),
                      ),
                    ]
                  ],
                ),
                Text(
                  "+ \$${_totalShippingCost.toStringAsFixed(2)}",
                  style: getSemiBoldStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.colorGreen,
                  ),
                ),
              ],
            ),
          ],
          const Divider(),
          _row(
            AppStrings.grandAmount,
            "\$$grandTotal",
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? getBoldStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.colorBlack,
                )
              : getSemiBoldStyle(
                  fontSize: FontSize.s14,
                  color: ColorManager.colorPrimary,
                ),
        ),
        Text(
          value,
          style: isBold
              ? getBoldStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.colorBlack,
                )
              : getSemiBoldStyle(
                  fontSize: FontSize.s14,
                  color: ColorManager.colorPrimary,
                ),
        ),
      ],
    );
  }
}
