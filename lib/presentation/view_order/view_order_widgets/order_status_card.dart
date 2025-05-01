import 'package:flutter/material.dart';
import 'package:k_distribution/presentation/resources/assets_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.orderStatus,
    required this.orderType,
    required this.otp,
    required this.addtionalDeliveryCharge,
    required this.onCallSupport,
  });

  final String orderStatus;
  final String orderType;
  final String? otp;
  final double addtionalDeliveryCharge;
  final VoidCallback? onCallSupport;

  @override
  Widget build(BuildContext context) {
    Widget statusCard({
      required Color color,
      required String image,
      required String message,
      required Color textColor,
      Widget? extra,
    }) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m10, vertical: AppMargin.m5),
        elevation: AppSize.s2,
        child: Container(
          padding: EdgeInsets.all(AppPadding.p15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: AppSize.s30, fit: BoxFit.cover),
              const SizedBox(width: AppSize.s12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: getBoldStyle(
                        fontSize: FontSize.s16,
                        color: textColor,
                      ),
                    ),
                    if (extra != null) ...[
                      const SizedBox(height: AppSize.s8),
                      extra,
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    switch (orderStatus) {
      case AppStrings.draft:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorDraftOrder,
          image: ImageAssets.orderConfirmationImg,
          message: AppStrings.orderInConfirmation,
          extra: addtionalDeliveryCharge > 0
              ? TextButton.icon(
                  onPressed: onCallSupport,
                  icon: Image.asset(
                    ImageAssets.orderCallImg,
                    width: AppSize.s15,
                  ),
                  label: Text(
                    AppStrings.callSupport,
                    style: getSemiBoldStyle(
                        color: ColorManager.colorCallOrderLabel,
                        fontSize: FontSize.s14),
                  ),
                )
              : const Text(AppStrings.paymentNotConfirmed),
        );
      case AppStrings.statusNew:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorNewOrder,
          image: ImageAssets.checkListImg,
          message: AppStrings.orderPlaced,
        );
      case AppStrings.accepted:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorAcceptedOrder,
          image: ImageAssets.orderAcceptedImg,
          message: AppStrings.orderAccepted,
        );
      case AppStrings.packingInProcess:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorPreparedOrder,
          image: ImageAssets.orderPreparedImg,
          message: AppStrings.orderPreparing,
        );
      case AppStrings.packed:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorPackedOrder,
          image: ImageAssets.orderPackedImg,
          message: orderType == AppStrings.delivery
              ? AppStrings.orderPackedDelivery
              : AppStrings.orderPackedPickup,
          extra: otp != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.s8),
                    Text(AppStrings.deliveryVerificationCode,
                        style: getRegularStyle(color: ColorManager.colorBlack)),
                    Text(otp!,
                        style: getBoldStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s16)),
                  ],
                )
              : null,
        );
      case AppStrings.delivering:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorDeliveryOrder,
          image: ImageAssets.orderDeliveryImg,
          message:
              "${orderType == AppStrings.delivery ? AppStrings.orderOutForDelivery : AppStrings.orderOutForPickup}.",
          extra: otp != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.s8),
                    Text(AppStrings.deliveryVerificationCode,
                        style: getRegularStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s12)),
                    Text(otp!,
                        style: getBoldStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s16)),
                  ],
                )
              : null,
        );
      case AppStrings.completed:
        return statusCard(
          textColor: ColorManager.colorWhite,
          color: ColorManager.colorCompletedOrder,
          image: ImageAssets.checkListImg,
          message: orderType == AppStrings.delivery
              ? AppStrings.orderDelivered
              : AppStrings.orderPicked,
        );
      case AppStrings.rejected:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorRejectedOrder,
          image: ImageAssets.orderRejectedImg,
          message: AppStrings.orderRejected,
          extra: Text(AppStrings.rejectionReason,
              style: getRegularStyle(
                  color: ColorManager.colorRejectedOrderReason,
                  fontSize: FontSize.s12)),
        );
      case AppStrings.cancelled:
        return statusCard(
          textColor: ColorManager.colorBlack,
          color: ColorManager.colorRejectedOrder,
          image: ImageAssets.orderCancelledImg,
          message: AppStrings.orderCancelled,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
