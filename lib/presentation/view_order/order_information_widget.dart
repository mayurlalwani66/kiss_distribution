import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/strings_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

import 'view_order_widgets/order_status_card.dart';

class OrderInformationWidget extends StatelessWidget {
  const OrderInformationWidget({
    super.key,
    required this.orderNo,
    required this.orderCreateDate,
    required this.paymentStatus,
    required this.orderType,
    required this.orderStatus,
    required this.userName,
    required this.userPhoneNo,
    required this.otp,
    required this.addtionalDeliveryCharge,
    required this.onCallSupport,
    required this.lastOrderUpdate,
    required this.orderNote,
  });

  final String orderNo;
  final DateTime orderCreateDate;
  final String paymentStatus;
  final String orderType;
  final String orderStatus;
  final String userName;
  final String userPhoneNo;
  final String otp;
  final double addtionalDeliveryCharge;
  final VoidCallback? onCallSupport;
  final String lastOrderUpdate;
  final String? orderNote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: AppMargin.m5),
      padding: EdgeInsets.all(AppPadding.p15),
      decoration: BoxDecoration(color: ColorManager.colorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p5, bottom: AppPadding.p10),
            child: Text(
              AppStrings.orderInfo,
              style: getBoldStyle(
                  fontSize: FontSize.s16, color: ColorManager.colorBlack),
            ),
          ),
          const Divider(),
          OrderStatusCard(
            orderStatus: orderStatus,
            orderType: orderType,
            otp: otp,
            addtionalDeliveryCharge: addtionalDeliveryCharge,
            onCallSupport: onCallSupport,
          ),
          const SizedBox(height: AppSize.s12),
          _infoRow("${AppStrings.no}:", orderNo),
          _infoRow(
              AppStrings.orderCreatedDate, orderCreateDate.toFormattedString()),
          if (lastOrderUpdate != "")
            Column(
              children: [
                _infoRow(AppStrings.lastOrderUpdate, lastOrderUpdate),
              ],
            ),
          _infoRow(AppStrings.paymentStatus, paymentStatus),
          _infoRow(AppStrings.orderType, orderType),
          _infoRow(AppStrings.orderStatus, orderStatus),
          _infoRow(AppStrings.name, userName),
          if (userPhoneNo.isNotEmpty)
            _infoRow("${AppStrings.phoneNumber}:", userPhoneNo),
          if (orderNote!.isNotEmpty || orderNote != "")
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
              child: Column(
                children: [
                  Text(AppStrings.note,
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s14,
                          color: ColorManager.colorBlack)),
                  Container(
                    margin: EdgeInsets.only(top: AppMargin.m8),
                    padding: EdgeInsets.all(AppPadding.p10),
                    decoration: BoxDecoration(
                      color: ColorManager.colorNoteBackground,
                      borderRadius: BorderRadius.circular(AppSize.s6),
                    ),
                    child: Text(orderNote ?? "-",
                        style: getRegularStyle(
                            color: ColorManager.colorBlack,
                            fontSize: FontSize.s14)),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _infoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: getSemiBoldStyle(
                  fontSize: FontSize.s14, color: ColorManager.colorBlack)),
          Text(value ?? "-",
              style: getRegularStyle(
                  fontSize: FontSize.s14, color: ColorManager.colorBlack)),
        ],
      ),
    );
  }
}
