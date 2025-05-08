import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import '../../../domain/model/user_model.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'address_card.dart';

class ChangeAddress extends StatelessWidget {
  const ChangeAddress(
      {super.key,
      required this.shippingAddresses,
      required this.onSelectAddress,
      required this.isLoading});
  final bool isLoading;
  final List<ShippingAddress> shippingAddresses;
  final void Function(ShippingAddress address) onSelectAddress;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              AppPadding.p16, AppPadding.p16, AppPadding.p16, AppPadding.p0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: mediaHeight * AppSize.s1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.selectedAddress,
                        style: getBoldStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s16)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: shippingAddresses.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(height: AppSize.s2),
                        itemBuilder: (context, index) {
                          ShippingAddress address = shippingAddresses[index];

                          return SelectAddressCard(
                            address: address,
                            onTap: () {
                              onSelectAddress(address);
                            },
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        ),
        if (isLoading == true)
          Positioned.fill(
            child: Container(
              color: ColorManager.colorTransparentWhite,
              child: const Center(child: CircularProgressWidget()),
            ),
          )
      ],
    );
  }
}
