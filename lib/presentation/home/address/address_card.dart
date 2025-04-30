import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';

import '../../../domain/model/user_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class SelectAddressCard extends StatelessWidget {
  const SelectAddressCard({
    super.key,
    required this.address,
    this.onTap,
  });

  final ShippingAddress address;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap?.call();
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          AppPadding.p0,
          AppPadding.p10,
          AppPadding.p10,
          AppPadding.p0,
        ),
        margin: EdgeInsets.only(bottom: AppMargin.m4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                      AppMargin.m0, AppMargin.m0, AppMargin.m8, AppMargin.m8),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p8, vertical: AppPadding.p4),
                  decoration: BoxDecoration(
                    color: ColorManager.colorPrimary,
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        ImageAssets.homeFillImg,
                        width: AppSize.s10,
                      ),
                      const SizedBox(width: AppSize.s5),
                      Text(
                        address.typeOfAddress,
                        style: getRegularStyle(
                            color: ColorManager.colorWhite,
                            fontSize: FontSize.s10),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: address.fullName.toCapitalize(),
                      style: getRegularStyle(
                          fontSize: FontSize.s12,
                          color: ColorManager.colorBlack),
                      children: [
                        TextSpan(
                            text: " Mo.${address.phoneNumber}",
                            style: getBoldStyle(
                                color: ColorManager.colorBlack,
                                fontSize: FontSize.s12)),
                      ]),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: address.addressLineOne.toCapitalize(),
                style: getRegularStyle(
                    fontSize: FontSize.s12, color: ColorManager.colorBlack),
                children: [
                  TextSpan(
                      text: address.addressLineTwo.isNotEmpty
                          ? ", ${address.addressLineTwo.toCapitalize()}"
                          : ""),
                  TextSpan(text: address.city),
                  TextSpan(text: ", ${address.state.toCapitalize()}"),
                  TextSpan(
                      text: ", ${address.pincode.toCapitalize()}",
                      style: getBoldStyle(
                          fontSize: FontSize.s12,
                          color: ColorManager.colorBlack)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
