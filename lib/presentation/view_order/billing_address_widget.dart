import 'package:flutter/material.dart';
import 'package:k_distribution/domain/model/user_model.dart';
import 'package:k_distribution/presentation/home/address/address_card.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';

import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class BillingAddressWidget extends StatelessWidget {
  const BillingAddressWidget({super.key, required this.address});

  final ShippingAddress? address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.billingAddress,
            style: getBoldStyle(
                fontSize: FontSize.s16, color: ColorManager.colorBlack),
          ),
          const Divider(),
          const SizedBox(height: AppSize.s5),
          SelectAddressCard(address: address!)
        ],
      ),
    );
  }
}
