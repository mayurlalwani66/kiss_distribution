import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/user_model.dart';
import '../common/common_provider/shipping_provider.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'address/address_card.dart';

class AddressPanel extends ConsumerWidget {
  const AddressPanel({
    super.key,
    required this.selectedAddress,
    required this.addresses,
    required this.onTap,
  });

  final ShippingAddress? selectedAddress;
  final List<ShippingAddress> addresses;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m3),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p10,
        vertical: AppPadding.p15,
      ),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: AppSize.s10),
          if (selectedAddress != null) _buildSelectedAddressCard(ref),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.address, style: Theme.of(context).textTheme.titleLarge),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSize.s20),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p10,
              vertical: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              color: ColorManager.colorLightGray4,
              borderRadius: BorderRadius.circular(AppSize.s20),
              border: Border.all(
                width: AppSize.s1,
                color: ColorManager.colorPrimary,
              ),
            ),
            child: Text(
              selectedAddress != null
                  ? AppStrings.changeAddress
                  : AppStrings.addAddress,
              style: getRegularStyle(
                color: ColorManager.colorPrimary,
                fontSize: FontSize.s12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedAddressCard(WidgetRef ref) {
    final state = ref.watch(shippingAddressProvider);
    final selectedAddress = state.value?.selectedAddress;

    if (selectedAddress != null) {
      return SelectAddressCard(
        address: selectedAddress,
        onTap: () {},
      );
    } else {
      return const SizedBox();
    }
  }
}
