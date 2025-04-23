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
  final String otp;
  final double addtionalDeliveryCharge;
  final VoidCallback? onCallSupport;

  @override
  Widget build(BuildContext context) {
    Widget statusCard(
        {required Color color,
        required String image,
        required String message,
        Widget? extra}) {
      return Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m10, vertical: AppMargin.m5),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.all(AppPadding.p15),
          leading: Image.asset(image, width: AppSize.s30, fit: BoxFit.cover),
          title: Text(message,
              style: getBoldStyle(
                  fontSize: FontSize.s16, color: ColorManager.colorBlack)),
          subtitle: extra,
        ),
      );
    }

    switch (orderStatus) {
      case "Draft":
        return statusCard(
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
      case "New":
        return statusCard(
          color: ColorManager.colorNewOrder,
          image: ImageAssets.checkListImg,
          message: AppStrings.orderPlaced,
        );
      case "Accepted":
        return statusCard(
          color: ColorManager.colorAcceptedOrder,
          image: ImageAssets.orderAcceptedImg,
          message: AppStrings.orderAccepted,
        );
      case "PackingInProcess":
        return statusCard(
          color: ColorManager.colorPreparedOrder,
          image: ImageAssets.orderPreparedImg,
          message: AppStrings.orderPreparing,
        );
      case "Packed":
        return statusCard(
          color: ColorManager.colorPackedOrder,
          image: ImageAssets.orderPackedImg,
          message: orderType == "Delivery"
              ? AppStrings.orderPackedDelivery
              : AppStrings.orderPackedPickup,
          extra: otp != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.s8),
                    Text("Delivery Verification Code:",
                        style: getRegularStyle(color: ColorManager.colorBlack)),
                    Text(otp,
                        style: getBoldStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s16)),
                  ],
                )
              : null,
        );
      case "Delivering":
        return statusCard(
          color: ColorManager.colorDeliveryOrder,
          image: ImageAssets.orderDeliveryImg,
          message:
              "${orderType == "Delivery" ? AppStrings.orderOutForDelivery : AppStrings.orderOutForPickup}.",
          extra: otp != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSize.s8),
                    Text(AppStrings.deliveryVerificationCode,
                        style: getRegularStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s12)),
                    Text(otp,
                        style: getBoldStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s16)),
                  ],
                )
              : null,
        );
      case "Completed":
        return statusCard(
          color: ColorManager.colorCompletedOrder,
          image: ImageAssets.checkListImg,
          message: orderType == "Delivery"
              ? AppStrings.orderDelivered
              : AppStrings.orderPicked,
        );
      case "Rejected":
        return statusCard(
          color: ColorManager.colorRejectedOrder,
          image: ImageAssets.orderRejectedImg,
          message: AppStrings.orderRejected,
          extra: Text(AppStrings.rejectionReason,
              style: getRegularStyle(
                  color: ColorManager.colorRejectedOrderReason,
                  fontSize: FontSize.s12)),
        );
      case "Cancelled":
        return statusCard(
          color: ColorManager.colorRejectedOrder,
          image: ImageAssets.orderCancelledImg,
          message: AppStrings.orderCancelled,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
