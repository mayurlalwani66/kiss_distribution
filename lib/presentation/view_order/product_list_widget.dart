import 'package:flutter/material.dart';
import 'package:k_distribution/domain/model/order_model.dart';

import 'prod_card.dart';

class ProductListWidget extends StatelessWidget {
  final List<OrderDetails> orderDetails;
  final bool canCancelOrderItems;
  final bool canCancelOrder;
  final void Function(int id) onCancelDetails;
  const ProductListWidget(
      {super.key,
      required this.orderDetails,
      required this.canCancelOrder,
      required this.canCancelOrderItems,
      required this.onCancelDetails});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: orderDetails.length,
      itemBuilder: (context, index) {
        final orderDetail = orderDetails[index];
        return ProductCard(
          orderDetail: orderDetail,
          canCancelOrder: canCancelOrder,
          canCancelOrderItems: canCancelOrderItems,
          onCancelDetails: (int id) {
            onCancelDetails(id);
          },
        );
      },
    );
  }
}
