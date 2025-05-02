import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../data/network/error_handler.dart';
import '../../../domain/model/user_model.dart';
import '../../common/common_provider/shipping_provider.dart';
import '../../common/common_widgets/app_snakbar.dart';
import '../../common/common_widgets/circular_progress.dart';
import '../../common/common_widgets/error_text_widget.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'address_card.dart';

class ChangeAddress extends ConsumerWidget {
  ChangeAddress({
    super.key,
    required this.shippingAddresses,
  });
  final List<ShippingAddress> shippingAddresses;
  bool hasInternet = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Padding(
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
                physics: Platform.isIOS
                    ? ClampingScrollPhysics()
                    : ClampingScrollPhysics(),
                child: ref.watch(shippingAddressProvider).when(
                      data: (shipping) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: shipping.shippingAddresses.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(height: AppSize.s2),
                          itemBuilder: (context, index) {
                            ShippingAddress address =
                                shipping.shippingAddresses[index];

                            return SelectAddressCard(
                              address: address,
                              onTap: () async {
                                hasInternet = await InternetConnection()
                                    .hasInternetAccess;
                                if (hasInternet == true) {
                                  await ref
                                      .read(markAsDefaultProvider.notifier)
                                      .markAsDefault(address.id!);
                                  ref
                                      .read(shippingAddressProvider.notifier)
                                      .setSelectedAddress(address);

                                  Future.microtask(() {
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  });
                                } else {
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                    AppSnackbar.show(context,
                                        ResponseMessage.NO_INTERNET_CONNECTION);
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) =>
                          ErrorTextWidget(error: error.toString()),
                      loading: () => const CircularProgressWidget(),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
