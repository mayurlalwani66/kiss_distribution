import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/data/network/error_handler.dart';
import 'package:k_distribution/presentation/common/common_provider/form_data_provider.dart';
import 'package:k_distribution/presentation/common/common_widgets/circular_progress.dart';
import 'package:k_distribution/presentation/common/common_widgets/no_internet_widget.dart';
import 'package:k_distribution/presentation/order_list/order_list_card.dart';
import 'package:k_distribution/presentation/order_list/order_list_provider.dart';

import '../common/common_widgets/error_retry_widget.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class OrderListScreen extends ConsumerStatefulWidget {
  const OrderListScreen({super.key});

  @override
  ConsumerState<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends ConsumerState<OrderListScreen> {
  @override
  void initState() {
    super.initState();
    _bind();
  }

  _bind() {
    ref.read(orderListProvider.notifier).getAllMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    final allOrdersProvider = ref.watch(orderListProvider);
    final allOrdersNotifier = ref.watch(orderListProvider.notifier);
    final canCancelOrder = ref.watch(formDataStoreProvider).canCancelOrder;
    return Scaffold(
        backgroundColor: ColorManager.colorLightGray4,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
          titleSpacing: AppSize.s0,
        ),
        body: allOrdersProvider.when(
          error: (error, stackTrace) {
            if (error.toString() == ResponseMessage.NO_INTERNET_CONNECTION) {
              return NoInternetWidget(
                onRetry: () {
                  allOrdersNotifier.getAllMyOrders();
                },
              );
            }
            return ErrorRetryWidget(
              message: error.toString(),
              onRetry: () {
                allOrdersNotifier.getAllMyOrders();
              },
            );
          },
          loading: () => CircularProgressWidget(),
          data: (data) {
            return ListView.builder(
                physics: Platform.isIOS
                    ? ClampingScrollPhysics()
                    : ClampingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var order = data[index];
                  return OrderListCard(
                    order: order,
                    canCancelOrder: canCancelOrder,
                    getOrderList: () {
                      _bind();
                    },
                  );
                });
          },
        ));
  }
}
