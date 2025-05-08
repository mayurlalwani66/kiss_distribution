import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/domain/model/user_model.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/app_snakbar.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/custom_dialog.dart';
import 'package:k_distribution/presentation/common/freezed_data_class/freezed_data_class.dart';
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
  void initState() {
    super.initState();
  }

  _bind() {
    Future.microtask(() =>
        ref.read(shippingAddressProvider.notifier).getAllShippingAddress());
  }

  @override
  Widget build(BuildContext context) {
    final shippingState = ref.watch(shippingAddressProvider);

    List<ShippingAddress> addresses =
        shippingState.value?.shippingAddresses ?? [];
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            const SizedBox(height: AppSize.s10),
            Stack(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: addresses.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final address = addresses[index];

                    return addressCard(address, context, shippingState);
                  },
                ),
                if (shippingState.isLoading) CircularProgressWidget()
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget addressCard(ShippingAddress address, BuildContext context,
      AsyncValue<ShippingState> shippingState) {
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
                    ).then((changed) {
                      if (changed == true) _bind();
                    });
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
                          return Consumer(builder: (context, ref, _) {
                            return Stack(
                              children: [
                                CustomDialog(
                                    message: AppStrings
                                        .deleteShippingAddressConfirmationMsg,
                                    onTapNo: () =>
                                        Navigator.pop(context, false),
                                    onTapYes: () {
                                      if (shippingState.error.toString() ==
                                          ResponseMessage
                                              .NO_INTERNET_CONNECTION) {
                                        ref
                                            .watch(shippingAddressProvider
                                                .notifier)
                                            .deleteShippingAddress(
                                                DeleteShippingAddressUseCaseInput(
                                                    address.id!,
                                                    address.userId),
                                                context);
                                      } else {
                                        Navigator.pop(context, false);
                                        AppSnackbar.show(
                                            context,
                                            ResponseMessage
                                                .NO_INTERNET_CONNECTION);
                                      }
                                    }),
                                if (ref
                                        .watch(shippingAddressProvider)
                                        .value
                                        ?.screenLoader ==
                                    true)
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorManager
                                              .colorTransparentWhite),
                                      child: CircularProgressWidget(),
                                    ),
                                  )
                              ],
                            );
                          });
                        }).then((changed) {
                      if (changed == true) {
                        _bind();
                      }
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
          onPressed: () async {
            await showModalBottomSheet<bool>(
              isScrollControlled: true,
              enableDrag: false,
              isDismissible: false,
              useSafeArea: true,
              context: context,
              builder: (ctx) => AddressForm(),
            ).then((changed) {
              if (changed == true) {
                _bind();
              }
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

  void _onMarkDefault(ShippingAddress address) async {
    if (ref.watch(markAsDefaultProvider).error.toString() ==
        ResponseMessage.NO_INTERNET_CONNECTION) {
      AppSnackbar.show(context, ResponseMessage.NO_INTERNET_CONNECTION);
    } else {
      final notifier = ref.read(shippingAddressProvider.notifier);

      if (address.isDefault == true) {
        await ref
            .read(markAsDefaultProvider.notifier)
            .markAsDefault(address.id!)
            .then((_) {
          notifier.removeDefaultLocally();
        });
      } else {
        await ref
            .read(markAsDefaultProvider.notifier)
            .markAsDefault(address.id!)
            .then((_) {
          notifier.updateDefaultLocally(address.id!);
        });
      }
    }
  }
}
