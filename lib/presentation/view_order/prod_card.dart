import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../domain/model/order_model.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.orderDetail,
    required this.canCancelOrder,
    required this.canCancelOrderItems,
    required this.onCancelDetails,
  });

  final OrderDetails orderDetail;
  final bool canCancelOrder;
  final bool canCancelOrderItems;
  final void Function(int id) onCancelDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m4),
      padding: const EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: orderDetail.productName,
                    style: getSemiBoldStyle(
                        color: ColorManager.colorBlack, fontSize: FontSize.s14),
                    children: orderDetail.attributes.expand((attr) {
                      return [
                        TextSpan(
                          text: ' | ${attr.name}: ',
                          style: getRegularStyle(
                            fontSize: FontSize.s12,
                            color: ColorManager.colorTextFieldLabel,
                          ),
                        ),
                        ...attr.productAttributeValues.map((val) {
                          return TextSpan(
                            text: '${val.name} ',
                            style: getRegularStyle(
                              fontSize: FontSize.s12,
                              color: ColorManager.colorTextFieldLabel,
                            ),
                          );
                        })
                      ];
                    }).toList(),
                  ),
                ),
                const SizedBox(height: AppSize.s20),
                Wrap(spacing: AppSize.s8, runSpacing: AppSize.s4, children: [
                  if (orderDetail.totalPrice > 0)
                    Text(
                      "${AppStrings.netAmount} ${(orderDetail.totalPrice)}",
                      style: getRegularStyle(
                          color: ColorManager.colorBrown,
                          fontSize: FontSize.s12),
                    ),
                  if ((orderDetail.price *
                          (orderDetail.selectedUnit?.adjustQuantity ?? 0)) >
                      0)
                    Text(
                      "${AppStrings.price} ${(orderDetail.price * (orderDetail.selectedUnit?.adjustQuantity ?? 0))} / ${orderDetail.selectedUnit?.name ?? ''}",
                      style: getRegularStyle(
                          color: ColorManager.colorBrown,
                          fontSize: FontSize.s12),
                    ),
                  if (orderDetail.discountAmount > 0)
                    Text(
                      "${AppStrings.discount} ${(orderDetail.discountAmount)}",
                      style: getRegularStyle(
                          color: ColorManager.colorBrown,
                          fontSize: FontSize.s12),
                    ),
                ]),
                if (orderDetail.sgst > 0 ||
                    orderDetail.cgst > 0 ||
                    orderDetail.igst > 0 ||
                    orderDetail.utgst > 0)
                  Text(
                    "${AppStrings.tax} \$${(orderDetail.sgst + orderDetail.cgst + orderDetail.igst + orderDetail.utgst).roundToTwo()}",
                    style: getRegularStyle(
                        fontSize: FontSize.s12, color: ColorManager.colorBrown),
                  ),
                const SizedBox(height: AppSize.s20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${(orderDetail.fulfilledAmount > 0 ? orderDetail.fulfilledAmount : orderDetail.finalPrice)}",
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.colorBlack),
                    ),
                    RichText(
                      text: TextSpan(
                        style: getRegularStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s14),
                        children: [
                          TextSpan(
                            text: AppStrings.quantity,
                            style: getRegularStyle(
                                color: ColorManager.colorBlack,
                                fontSize: FontSize.s14),
                          ),
                          if (orderDetail.orderFulfilledQuantity! > 0 &&
                              orderDetail.orderedQuantity !=
                                  orderDetail.orderFulfilledQuantity) ...[
                            TextSpan(
                              text: orderDetail.displayOrderedQuantity,
                              style: getRegularStyle(
                                  color: ColorManager.colorBlack),
                            ),
                            TextSpan(
                              text: orderDetail.displayOrderFulfilledQuantity,
                              style: getRegularStyle(
                                  color: ColorManager.colorGreen),
                            ),
                          ] else ...[
                            TextSpan(
                              text: orderDetail.displayOrderedQuantity,
                              style: getRegularStyle(
                                  color: ColorManager.colorBlack),
                            ),
                          ],
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (orderDetail.status == AppStrings.statusNew &&
              orderDetail.status != AppStrings.cancelled &&
              canCancelOrder &&
              canCancelOrderItems)
            TextButton(
              onPressed: () => onCancelDetails(orderDetail.id),
              child: Text(
                AppStrings.cancel,
                style: TextStyle(
                  color: ColorManager.colorRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          SizedBox(width: AppSize.s10),
          CachedNetworkImage(
            width: AppSize.s80,
            height: AppSize.s80,
            imageUrl: orderDetail.photoUrl,
            placeholder: (context, url) => Image.memory(kTransparentImage),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
