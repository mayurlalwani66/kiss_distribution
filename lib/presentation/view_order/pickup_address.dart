import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class PickupAddress extends StatelessWidget {
  const PickupAddress(
      {super.key,
      required this.storeName,
      required this.storePhoneNumber,
      required this.storeAddressLevel4,
      required this.storeAddressLevel2,
      required this.storePostalcode});
  final String storeName;
  final String storePhoneNumber;
  final String storeAddressLevel4;
  final String storeAddressLevel2;
  final String storePostalcode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.pickupAddress,
            style: getBoldStyle(
                fontSize: FontSize.s16, color: ColorManager.colorBlack),
          ),
          const Divider(),
          const SizedBox(height: AppSize.s5),
          RichText(
            text: TextSpan(
              style: getRegularStyle(
                  color: ColorManager.colorBlack, fontSize: FontSize.s12),
              children: [
                TextSpan(text: storeName),
                const TextSpan(text: ' '),
                TextSpan(
                    text: storePhoneNumber,
                    style: getBoldStyle(
                        color: ColorManager.colorBlack,
                        fontSize: FontSize.s12)),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s10),
          Text(
            storeAddressLevel4.replaceAll(r'\r', '\r').replaceAll(r'\n', '\n'),
            style: getRegularStyle(
                color: ColorManager.colorBlack, fontSize: FontSize.s12),
          ),
          const SizedBox(height: AppSize.s10),
          RichText(
              text: TextSpan(
                  style: getRegularStyle(
                      color: ColorManager.colorBlack, fontSize: FontSize.s12),
                  children: [
                if (storeAddressLevel2.isNotEmpty) ...[
                  const TextSpan(text: ', '),
                  TextSpan(text: storeAddressLevel2),
                ],
                if (storePostalcode.isNotEmpty) ...[
                  const TextSpan(text: ', '),
                  TextSpan(
                      text: storePostalcode,
                      style: getBoldStyle(
                          color: ColorManager.colorBlack,
                          fontSize: FontSize.s12)),
                ],
              ]))
        ],
      ),
    );
  }
}
