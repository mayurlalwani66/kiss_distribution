import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/presentation/common/common_provider/form_data_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/error_text_widget.dart';
import 'package:k_distribution/presentation/order_list/order_list_card.dart';
import 'package:k_distribution/presentation/order_list/order_list_provider.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

@RoutePage()
class OrderListScreen extends ConsumerStatefulWidget {
  const OrderListScreen({super.key});

  @override
  ConsumerState<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends ConsumerState<OrderListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(orderListProvider.notifier).getAllMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    final allOrdersProvider = ref.watch(orderListProvider);
    final canCancelOrder = ref.watch(formDataStoreProvider).canCancelOrder;
    return Scaffold(
        backgroundColor: ColorManager.colorLightGray4,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        right: AppMargin.m8, left: AppMargin.m16),
                    child:
                        Image.asset(ImageAssets.backImg, width: AppSize.s10)),
                Text(AppStrings.yourOrders),
              ],
            ),
          ),
          titleTextStyle: getBoldStyle(
              color: ColorManager.colorBlack, fontSize: FontSize.s16),
          titleSpacing: 0,
        ),
        body: allOrdersProvider.when(
          error: (error, stackTrace) =>
              ErrorTextWidget(error: error.toString()),
          loading: () => CircularProgressWidget(),
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var order = data[index];
                  return OrderListCard(
                    order: order,
                    canCancelOrder: canCancelOrder,
                  );
                });
          },
        ));
  }
}
