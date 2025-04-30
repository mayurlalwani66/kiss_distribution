import 'dart:io';

import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/domain/model/product_model.dart';

import 'package:k_distribution/presentation/home/product_card.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {super.key,
      required this.products,
      required this.totalAmount,
      required this.increaseQuantity,
      required this.decreaseQuantity});
  final List<ProductViewModel> products;
  final double Function(int productId) totalAmount;
  final void Function(int productId) increaseQuantity;
  final void Function(int productId) decreaseQuantity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          Platform.isIOS ? ClampingScrollPhysics() : ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: AppSize.s60,
            margin: const EdgeInsets.only(top: AppMargin.m10),
            padding: const EdgeInsets.all(AppPadding.p15),
            child: Text(
              AppStrings.products,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: FontSize.s16),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            var product = products[index];
            var quantity = product.cartQty;
            return ProductCardWidget(
              product: product,
              quantity: quantity,
              increaseQuantity: () {
                increaseQuantity(product.id);
              },
              decreaseQuantity: () {
                decreaseQuantity(product.id);
              },
              totalAmount: totalAmount(product.id).roundToTwo(),
            );
          },
          childCount: products.length,
        )),
      ],
    );
  }
}
