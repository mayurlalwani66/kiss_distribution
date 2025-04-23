import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/home/home_widgets/add_button.dart';
import 'package:k_distribution/presentation/home/home_widgets/product_image.dart';
import 'package:k_distribution/presentation/home/home_widgets/quantity_control_button.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';

import '../../domain/model/product_model.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      {super.key,
      required this.product,
      required this.totalAmount,
      required this.quantity,
      required this.increaseQuantity,
      required this.decreaseQuantity});
  final ProductViewModel product;
  final int quantity;
  final double totalAmount;
  final void Function() increaseQuantity;
  final void Function() decreaseQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppMargin.m4),
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(product.productName,
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: FontSize.s16)),
                      const SizedBox(height: AppSize.s10),
                      RichText(
                          text: TextSpan(
                              text: "\$${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: FontSize.s18),
                              children: [
                            TextSpan(
                                text: "/${product.unit}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: FontSize.s10))
                          ])),
                      const SizedBox(height: AppSize.s5),
                    ])),
                const SizedBox(width: AppSize.s20),
                Stack(clipBehavior: Clip.hardEdge, children: [
                  ProductImage(photoUrl: product.photoUrl),
                  if (quantity == 0)
                    AddButton(onTap: () {
                      increaseQuantity();
                    })
                ])
              ]),
          if (quantity > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text("${AppStrings.total} \$$totalAmount",
                      style: getSemiBoldStyle(
                          color: ColorManager.colorPrimary,
                          fontSize: FontSize.s14)),
                  Text(AppStrings.includedTax,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: FontSize.s12)),
                ]),
                QuantityControlButton(
                    quantity: quantity,
                    unit: product.unit,
                    onDecrease: () {
                      decreaseQuantity();
                    },
                    onIncrease: () {
                      increaseQuantity();
                    })
              ],
            )
        ],
      ),
    );
  }
}
