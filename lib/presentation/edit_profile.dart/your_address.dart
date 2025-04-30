import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/domain/model/user_model.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/custom_dialog.dart';
import 'package:k_distribution/presentation/common/common_widgets/error_text_widget.dart';
import 'package:k_distribution/presentation/edit_profile.dart/custom_checkbox.dart';
import 'package:k_distribution/presentation/home/address/address_card.dart';
import 'package:k_distribution/presentation/home/address/address_form.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class YourAddressWidget extends ConsumerStatefulWidget {
  const YourAddressWidget({super.key});

  @override
  ConsumerState<YourAddressWidget> createState() => _YourAddressWidgetState();
}

class _YourAddressWidgetState extends ConsumerState<YourAddressWidget> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    final shipping = ref.watch(shippingAddressProvider);

    return shipping.when(
      loading: () => const CircularProgressWidget(),
      error: (error, _) => ErrorTextWidget(error: error.toString()),
      data: (shipping) {
        final addresses = shipping!.shippingAddresses;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            const SizedBox(height: AppSize.s10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: addresses.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final address = addresses[index];

                return addressCard(address, context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget addressCard(ShippingAddress address, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SelectAddressCard(
                address: address,
                onTap: null,
              ),
            ),
            PopupMenuButton(
              color: ColorManager.colorWhite,
              icon: const Icon(Icons.more_horiz),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text(
                    AppStrings.editAddress,
                    style: getRegularStyle(
                        color: ColorManager.colorBlack, fontSize: FontSize.s15),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      enableDrag: false,
                      context: context,
                      builder: (ctx) => AddressForm(
                        isFromHomeScreen: false,
                        shippingData: address,
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  child: Text(
                    AppStrings.deleteAddress,
                    style: getRegularStyle(
                        color: ColorManager.colorBlack, fontSize: FontSize.s15),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return CustomDialog(
                              message: AppStrings
                                  .deleteShippingAddressConfirmationMsg,
                              onTapNo: () => context.pop(),
                              onTapYes: () {
                                ref
                                    .watch(shippingAddressProvider.notifier)
                                    .deleteShippingAddress(
                                        DeleteShippingAddressUseCaseInput(
                                            address.id!, address.userId),
                                        context);
                              });
                        }).then((_) {
                      ref
                          .read(shippingAddressProvider.notifier)
                          .getAllShippingAddress();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSize.s30),
        CustomCheckbox(
          height: AppSize.s18,
          isSelected: address.isDefault,
          onTap: () => _onMarkDefault(address),
          label: AppStrings.markAsDefault,
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.yourAddress,
            style: getBoldStyle(
                color: ColorManager.colorBlack, fontSize: FontSize.s18)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.colorYellow,
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p15, vertical: AppPadding.p10),
          ),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: false,
                isDismissible: false,
                useSafeArea: true,
                context: context,
                builder: (ctx) {
                  return AddressForm();
                }).then((_) {
              ref
                  .read(shippingAddressProvider.notifier)
                  .getAllShippingAddress();
            });
          },
          child: Text(
            AppStrings.addAddress,
            style: getRegularStyle(
                color: ColorManager.colorBlack, fontSize: FontSize.s14),
          ),
        ),
      ],
    );
  }

  void _onMarkDefault(address) async {
    if (address.isDefault) return;

    setState(() {
      selectedId = address.id;
    });

    await ref
        .read(markAsDefaultProvider.notifier)
        .markAsDefault(address.id!)
        .then((_) {
      ref
          .read(shippingAddressProvider.notifier)
          .updateDefaultLocally(address.id!);
    });
  }
}
