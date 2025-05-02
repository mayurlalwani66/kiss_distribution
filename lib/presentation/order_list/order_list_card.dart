import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import '../view_order/view_order.dart';
import 'cancel_order.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard(
      {super.key,
      required this.order,
      required this.canCancelOrder,
      required this.getOrderList});
  final OrderListingModel order;
  final bool canCancelOrder;
  final void Function() getOrderList;

  @override
  Widget build(BuildContext context) {
    final style = _getBadgeStyle(order.orderStatus);
    return Container(
      padding: EdgeInsets.fromLTRB(
          AppPadding.p10, AppPadding.p15, AppPadding.p15, AppPadding.p15),
      margin: EdgeInsets.only(top: AppMargin.m5),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              ViewOrderScreen(orderId: '${order.id}')));
                },
                child: RichText(
                  text: TextSpan(
                    text: 'No. : ',
                    style: getRegularStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.colorDarkBlue),
                    children: [
                      TextSpan(
                        text: order.orderNo,
                        style: getBoldStyle(
                            fontSize: FontSize.s16,
                            color: ColorManager.colorBlack),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p10, vertical: AppPadding.p5),
                decoration: BoxDecoration(
                  color: style.backgroundColor,
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Text(
                  order.orderStatus,
                  style: getRegularStyle(
                    color: style.textColor,
                    fontSize: FontSize.s12,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: AppSize.s10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(order.orderDate.toFormattedString(),
                  style: getRegularStyle(
                      color: ColorManager.colorTextFieldLabel,
                      fontSize: FontSize.s14)),
              Text(
                  "\$${(order.fulfilledTotalAmount > 0 ? order.fulfilledTotalAmount : order.totalAmount)}",
                  style: getBoldStyle(
                      color: ColorManager.colorPrimary, fontSize: FontSize.s18))
            ],
          ),
          const SizedBox(height: AppSize.s10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              order.orderStatus != 'New'
                  ? canCancelOrder
                      ? InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: ColorManager.colorWhite,
                                isScrollControlled: true,
                                isDismissible: false,
                                useSafeArea: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(AppSize.s10),
                                        topRight:
                                            Radius.circular(AppSize.s10))),
                                context: context,
                                builder: (context) {
                                  return CancelOrder();
                                });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.s7, horizontal: AppSize.s10),
                            decoration: BoxDecoration(
                                color: ColorManager.colorRed,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s50),
                                border: Border.all(
                                    width: AppSize.s1,
                                    color: ColorManager.colorRed)),
                            child: Text(
                              AppStrings.cancelOrder,
                              style: getRegularStyle(
                                  fontSize: FontSize.s14,
                                  color: ColorManager.colorWhite),
                            ),
                          ),
                        )
                      : Container()
                  : Container(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    ViewOrderScreen(orderId: '${order.id}')))
                        .then((_) {
                      getOrderList.call();
                    });
                  },
                  child: Text(
                    AppStrings.viewSummary,
                    style: getRegularStyle(
                        color: ColorManager.colorBrown, fontSize: FontSize.s14),
                  ))
            ],
          )
        ],
      ),
    );
  }

  BadgeStyle _getBadgeStyle(String status) {
    switch (status) {
      case AppStrings.statusNew:
        return BadgeStyle(
            ColorManager.colorLightGray4, ColorManager.colorPrimary);
      case AppStrings.accepted:
      case AppStrings.packed:
        return BadgeStyle(
            ColorManager.colorLightYellow, ColorManager.colorYellow);
      case AppStrings.packingInProcess:
        return BadgeStyle(
            ColorManager.colorLightBlack, ColorManager.colorBlack);
      case AppStrings.completed:
        return BadgeStyle(
            ColorManager.colorLightGreen, ColorManager.colorGreen);
      case AppStrings.cancelled:
        return BadgeStyle(ColorManager.colorLightRed, ColorManager.colorRed);
      case AppStrings.rejected:
        return BadgeStyle(ColorManager.colorLightRed, ColorManager.colorRed);
      case AppStrings.delivering:
        return BadgeStyle(
            ColorManager.colorLightOrange, ColorManager.colorOrange);
      case AppStrings.draft:
        return BadgeStyle(
            ColorManager.colorLighterBlue, ColorManager.colorLightBlue);
      default:
        return BadgeStyle(
            ColorManager.colorLightGray4, ColorManager.colorPrimary);
    }
  }
}

class BadgeStyle {
  final Color backgroundColor;
  final Color textColor;

  const BadgeStyle(this.backgroundColor, this.textColor);
}
