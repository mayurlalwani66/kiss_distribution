import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class TransactionDetailsWidget extends StatelessWidget {
  const TransactionDetailsWidget(
      {super.key, required this.transaction, required this.storeName});

  final TransactionByOrderId transaction;
  final String storeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.transactionDetails,
            style: getBoldStyle(
                fontSize: FontSize.s16, color: ColorManager.colorBlack),
          ),
          const Divider(),
          const SizedBox(height: AppSize.s5),
          ExpansionTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s10)),
            backgroundColor: ColorManager.colorLightGray4,
            collapsedBackgroundColor: ColorManager.colorLightGray4,
            title: Padding(
              padding: const EdgeInsets.only(
                  bottom: AppPadding.p10, top: AppPadding.p5),
              child: Column(children: [
                RichText(
                  text: TextSpan(
                    text: AppStrings.referenceNo,
                    style: getBoldStyle(
                        fontSize: FontSize.s14, color: ColorManager.colorBlack),
                    children: [
                      TextSpan(
                        text: (transaction.refrenceNo.isNotEmpty
                            ? ' ${transaction.refrenceNo} '
                            : '-'),
                        style: getSemiBoldStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.colorBlack),
                      ),
                      TextSpan(
                        text: (transaction.paymentMethodName == AppStrings.cash
                            ? AppStrings.cashOnDelivery
                            : transaction.paymentMethodName ==
                                    AppStrings.bankTransfer
                                ? '| ${AppStrings.bankTransfer}'
                                : AppStrings.online),
                        style: getSemiBoldStyle(
                            fontSize: FontSize.s14,
                            color: ColorManager.colorBlack),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            subtitle: Row(
              children: [
                Icon(
                  transaction.paymentType == AppStrings.credit
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                  color: transaction.paymentType == AppStrings.credit
                      ? ColorManager.colorRed
                      : ColorManager.colorGreen,
                  size: AppSize.s16,
                ),
                if (transaction.paymentProcessStatus != AppStrings.completed)
                  Expanded(
                    child: Text(
                      "\$${transaction.amount} has been ${(transaction.paymentType == AppStrings.credit ? AppStrings.refunded : AppStrings.paid)} on ${transaction.paymentDate.toFormattedString()}",
                      style: getRegularStyle(color: ColorManager.colorPrimary),
                    ),
                  ),
                if (transaction.paymentProcessStatus != 'Pending')
                  Expanded(
                    child: Text(
                      "\$${transaction.amount} Your ${(transaction.paymentType == AppStrings.credit ? AppStrings.refunded : AppStrings.paid)} is being processed on ${transaction.paymentDate.toFormattedString()}",
                      style: getRegularStyle(color: ColorManager.colorPrimary),
                    ),
                  ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16, vertical: AppPadding.p8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.paymentThrough,
                          style: getSemiBoldStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.colorGreen),
                        ),
                        Text(
                          (transaction.transactionType.isNotEmpty
                              ? transaction.transactionType
                              : AppStrings.online),
                          style: getSemiBoldStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.colorBlack),
                        )
                      ],
                    ),
                    const SizedBox(height: AppSize.s10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${AppStrings.status}: ",
                          style: getSemiBoldStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.colorGreen),
                        ),
                        Text(
                          transaction.paymentProcessStatus,
                          style: getRegularStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.colorBlack),
                        )
                      ],
                    ),
                    const SizedBox(height: AppSize.s10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppStrings.notes}: ",
                          style: getSemiBoldStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.colorGreen),
                        ),
                        const SizedBox(height: AppSize.s10),
                        if (transaction.paymentProcessStatus ==
                            AppStrings.completed) ...[
                          if (transaction.paymentType == 'Credit')
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Your refund has been completed from the bank. In case of amount not reflected to your balance, you can contact $storeName support cell by clicking the help & support link on this page.",
                                style: getRegularStyle(
                                    color: ColorManager.colorBlack,
                                    fontSize: FontSize.s14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          else if (transaction.paymentMethodName ==
                              AppStrings.cash)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: AppPadding.p5),
                              child: Text(
                                AppStrings.paymentReceivedCash,
                                style: getRegularStyle(
                                    color: ColorManager.colorBlack,
                                    fontSize: FontSize.s14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          else if (transaction.paymentMethodName ==
                              AppStrings.bankTransfer)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: AppPadding.p5),
                              child: Text(
                                AppStrings.paymentReceivedBankTransfer,
                                style: getRegularStyle(
                                    color: ColorManager.colorBlack,
                                    fontSize: FontSize.s14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Your payment has been received to the $storeName's bank account.",
                                style: getRegularStyle(
                                    color: ColorManager.colorBlack,
                                    fontSize: FontSize.s14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                        ] else if (transaction.paymentProcessStatus ==
                            AppStrings.pending) ...[
                          Padding(
                            padding: const EdgeInsets.only(top: AppPadding.p5),
                            child: Text(
                              transaction.paymentType == AppStrings.credit
                                  ? AppStrings.refundPending
                                  : AppStrings.paymentPending,
                              style: getRegularStyle(
                                  color: ColorManager.colorBlack,
                                  fontSize: FontSize.s14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ] else if (transaction.paymentProcessStatus ==
                            AppStrings.failed) ...[
                          Container(
                            padding: const EdgeInsets.only(top: AppPadding.p5),
                            decoration: BoxDecoration(
                              color:
                                  ColorManager.colorRed.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppSize.s5),
                            ),
                            child: Text(
                              transaction.paymentType == AppStrings.credit
                                  ? AppStrings.refundFailed
                                  : AppStrings.paymentFailed,
                              style: getRegularStyle(
                                  color: ColorManager.colorBlack,
                                  fontSize: FontSize.s14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ]
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
