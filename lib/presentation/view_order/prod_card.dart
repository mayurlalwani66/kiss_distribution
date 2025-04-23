import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      margin: EdgeInsets.only(top: AppMargin.m4),
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7C7D7E),
                          ),
                        );
                      })
                    ];
                  }).toList(),
                ),
              ),
              const SizedBox(height: AppSize.s20),
              Wrap(spacing: 8, runSpacing: 4, children: [
                if (orderDetail.totalPrice > 0)
                  Text(
                    "Net Amount : ${(orderDetail.totalPrice)}",
                    style: getRegularStyle(
                        color: ColorManager.colorBrown, fontSize: FontSize.s12),
                  ),
                if ((orderDetail.price *
                        (orderDetail.selectedUnit?.adjustQuantity ?? 0)) >
                    0)
                  Text(
                    "Price : ${(orderDetail.price * (orderDetail.selectedUnit?.adjustQuantity ?? 0))} / ${orderDetail.selectedUnit?.name ?? ''}",
                    style: getRegularStyle(
                        color: ColorManager.colorBrown, fontSize: FontSize.s12),
                  ),
                if (orderDetail.discountAmount > 0)
                  Text(
                    "Discount : ${(orderDetail.discountAmount)}",
                    style: getRegularStyle(
                        color: ColorManager.colorBrown, fontSize: FontSize.s12),
                  ),
              ]),
              if (orderDetail.sgst > 0 ||
                  orderDetail.cgst > 0 ||
                  orderDetail.igst > 0 ||
                  orderDetail.utgst > 0)
                Text(
                  "Tax : \$${(orderDetail.sgst + orderDetail.cgst + orderDetail.igst + orderDetail.utgst)}",
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
                        fontSize: FontSize.s14, color: ColorManager.colorBlack),
                  ),
                  const SizedBox(width: AppSize.s100),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: "Qty : ",
                          style: getBoldStyle(
                              color: ColorManager.colorBlack,
                              fontSize: FontSize.s14),
                        ),
                        if (orderDetail.orderFulfilledQuantity > 0 &&
                            orderDetail.orderedQuantity !=
                                orderDetail.orderFulfilledQuantity) ...[
                          TextSpan(
                            text: orderDetail.displayOrderedQuantity,
                            style:
                                getRegularStyle(color: ColorManager.colorBlack),
                          ),
                          TextSpan(
                            text: orderDetail.displayOrderFulfilledQuantity,
                            style:
                                getRegularStyle(color: ColorManager.colorGreen),
                          ),
                        ] else ...[
                          TextSpan(
                            text: orderDetail.displayOrderedQuantity,
                            style:
                                getRegularStyle(color: ColorManager.colorBlack),
                          ),
                        ],
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          if (orderDetail.status == 'New' &&
              orderDetail.status != 'Cancelled' &&
              canCancelOrder &&
              canCancelOrderItems)
            TextButton(
              onPressed: () => onCancelDetails(orderDetail.id),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
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
