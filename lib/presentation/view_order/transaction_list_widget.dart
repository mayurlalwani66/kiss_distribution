import 'package:flutter/material.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/view_order/transaction_details.dart';

class TransactionListWidget extends StatelessWidget {
  final List<TransactionByOrderId> transactionList;
  final String storeName;

  const TransactionListWidget(
      {super.key, required this.transactionList, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactionList.map((transaction) {
        return TransactionDetailsWidget(
          transaction: transaction,
          storeName: storeName,
        );
      }).toList(),
    );
  }
}
