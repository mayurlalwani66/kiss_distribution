import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class QueryPanelWidget extends StatelessWidget {
  const QueryPanelWidget(
      {super.key,
      required this.supportEmail,
      required this.supportPhone,
      required this.onCallSupport,
      required this.onEmailSupport});
  final String supportEmail;
  final String supportPhone;
  final VoidCallback? onCallSupport;
  final VoidCallback? onEmailSupport;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (supportPhone.isNotEmpty || supportPhone != "")
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p15, vertical: AppPadding.p5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.callToSupportPerson,
                  style: getSemiBoldStyle(
                      fontSize: FontSize.s14, color: ColorManager.colorBlack),
                ),
                GestureDetector(
                  onTap: onCallSupport,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p15, vertical: AppPadding.p12),
                    decoration: BoxDecoration(
                        color: ColorManager.colorGreen,
                        borderRadius: BorderRadius.circular(AppSize.s50)),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageAssets.callImg,
                          width: AppSize.s16,
                          height: AppSize.s16,
                        ),
                        const SizedBox(width: AppSize.s7),
                        Text(
                          AppStrings.callNow,
                          style: getRegularStyle(
                              fontSize: FontSize.s12,
                              color: ColorManager.colorWhite),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        if (supportEmail.isNotEmpty || supportEmail != "")
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p15, vertical: AppPadding.p5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.emailForHelp,
                  style: getSemiBoldStyle(
                      fontSize: FontSize.s14, color: ColorManager.colorBlack),
                ),
                GestureDetector(
                  onTap: onEmailSupport,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p15, vertical: AppPadding.p12),
                    decoration: BoxDecoration(
                        color: ColorManager.colorMailForHelp,
                        borderRadius: BorderRadius.circular(AppSize.s50)),
                    child: Row(
                      children: [
                        Image.asset(ImageAssets.mailImg,
                            width: AppSize.s16, height: AppSize.s16),
                        const SizedBox(width: AppSize.s7),
                        Text(
                          AppStrings.emailNow,
                          style: getRegularStyle(
                              fontSize: FontSize.s12,
                              color: ColorManager.colorWhite),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        const SizedBox(height: AppSize.s10),
      ],
    );
  }
}
