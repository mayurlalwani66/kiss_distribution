import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';

import '../common/common_widgets/common_elevated_button.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder(
      {super.key,
      required this.grandTotal,
      required this.totalAmount,
      required this.shippingCharges,
      required this.onTap});

  final double grandTotal;
  final double totalAmount;
  final double shippingCharges;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.placeOrder,
                  style: getBoldStyle(
                      color: ColorManager.colorBlack, fontSize: FontSize.s16)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.totalAmount,
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s16)),
                Text("\$${totalAmount.roundToTwo()}",
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s16)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.shippingCharges,
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s16)),
                Text("\$${shippingCharges.toStringAsFixed(2)}",
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s16)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.grandAmount,
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s18)),
                Text("\$${grandTotal.roundToTwo()}",
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s18)),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s30),
          CommonElevatedButton(
              text: AppStrings.orderNow,
              onTap: () {
                onTap();
              })
        ],
      ),
    );
  }
}
