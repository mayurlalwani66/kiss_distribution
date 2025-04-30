import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/user_model.dart';
import '../../common/common_provider/shipping_provider.dart';
import '../../common/common_widgets/circular_progress.dart';
import '../../common/common_widgets/error_text_widget.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'address_card.dart';

class ChangeAddress extends ConsumerWidget {
  const ChangeAddress({super.key, required this.shippingAddresses});
  final List<ShippingAddress> shippingAddresses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          AppPadding.p16, AppPadding.p16, AppPadding.p16, 0),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: mediaHeight * 1.0,
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
                      context.router.pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: ref.watch(shippingAddressProvider).when(
                      data: (shipping) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: shipping!.shippingAddresses.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(height: AppSize.s2),
                          itemBuilder: (context, index) {
                            ShippingAddress address =
                                shipping.shippingAddresses[index];

                            return SelectAddressCard(
                              address: address,
                              onTap: () async {
                                await ref
                                    .read(markAsDefaultProvider.notifier)
                                    .markAsDefault(address.id!);
                                ref
                                    .read(shippingAddressProvider.notifier)
                                    .setSelectedAddress(address);

                                Future.microtask(() {
                                  if (context.mounted) {
                                    context.router.pop();
                                  }
                                });
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
