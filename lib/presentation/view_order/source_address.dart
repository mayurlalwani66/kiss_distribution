import 'package:flutter/material.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class SourceAddressWidget extends StatelessWidget {
  const SourceAddressWidget({super.key, required this.sourceAddress});

  final SourceAddress? sourceAddress;
  String getValue(String? value) =>
      (value != null && value.isNotEmpty) ? value : '-';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p15),
      margin: const EdgeInsets.only(top: AppMargin.m4),
      color: ColorManager.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.sourceAddress,
            style: getBoldStyle(
                fontSize: FontSize.s16, color: ColorManager.colorBlack),
          ),
          const Divider(),
          const SizedBox(height: AppSize.s10),
          Wrap(
            spacing: AppSize.s20,
            runSpacing: AppSize.s10,
            children: [
              addressItem(
                  AppStrings.state, getValue(sourceAddress?.sourceState)),
              addressItem(
                  AppStrings.district, getValue(sourceAddress?.sourceDistrict)),
              addressItem(
                  AppStrings.city, getValue(sourceAddress?.sourceVillage)),
              addressItem(
                  AppStrings.postCode, getValue(sourceAddress?.sourcePincode)),
              addressItem(AppStrings.sourcePhoneNumberOne,
                  getValue(sourceAddress?.sourcePhoneNumberOne)),
              addressItem(AppStrings.sourcePhoneNumberTwo,
                  getValue(sourceAddress?.sourcePhoneNumberTwo)),
            ],
          ),
          const SizedBox(height: AppSize.s10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.address,
                style: getBoldStyle(
                    fontSize: FontSize.s14, color: ColorManager.colorBlack),
              ),
              const SizedBox(height: AppSize.s3),
              Text(getValue(sourceAddress?.address),
                  style: getRegularStyle(
                      fontSize: FontSize.s12, color: ColorManager.colorBlack)),
              Divider(color: ColorManager.colorSoftBlue),
            ],
          ),
        ],
      ),
    );
  }

  Widget addressItem(String title, String value) {
    return SizedBox(
      width: AppSize.s160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: getBoldStyle(
                  fontSize: FontSize.s14, color: ColorManager.colorBlack)),
          const SizedBox(height: AppSize.s3),
          Text(value,
              style: getRegularStyle(
                  fontSize: FontSize.s12, color: ColorManager.colorBlack)),
          Divider(color: ColorManager.colorSoftBlue),
        ],
      ),
    );
  }
}
