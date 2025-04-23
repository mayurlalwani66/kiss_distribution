import 'package:flutter/material.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/presentation/resources/color_manager.dart';
import 'package:k_distribution/presentation/resources/font_manager.dart';
import 'package:k_distribution/presentation/resources/styles_manager.dart';
import 'package:k_distribution/presentation/resources/values_manager.dart';

class ShipmentDetailWidget extends StatelessWidget {
  final ShipmentModel? shipmentDetail;

  const ShipmentDetailWidget({super.key, required this.shipmentDetail});

  String getValue(String? value) =>
      (value != null && value.isNotEmpty) ? value : '-';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p15),
      margin: const EdgeInsets.only(top: AppMargin.m4),
      color: ColorManager.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipment Details',
            style: getBoldStyle(
                fontSize: FontSize.s16, color: ColorManager.colorBlack),
          ),
          const Divider(),
          const SizedBox(height: AppSize.s10),
          Wrap(
            spacing: AppSize.s20,
            runSpacing: AppSize.s10,
            children: [
              detailItem(
                  'Provider Name', getValue(shipmentDetail?.providerName)),
              detailItem('Delivery Amount',
                  getValue(shipmentDetail?.deliveryAmount.toString())),
              detailItem('Delivery Date',
                  getValue(shipmentDetail?.deliveryDate.toFormattedString())),
              detailItem('Parcel Height (In cm)',
                  getValue(shipmentDetail?.parsalHight.toString())),
              detailItem('Parcel Width (In cm)',
                  getValue(shipmentDetail?.parsalWidth.toString())),
              detailItem('Parcel Weight (In kg)',
                  getValue(shipmentDetail?.parcelWeight.toString())),
              detailItem('Parcel Length (In cm)',
                  getValue(shipmentDetail?.parcelLength.toString())),
              detailItem('Unique ID', getValue(shipmentDetail?.uniqueId)),
              detailItem(
                  'Tracking Link', getValue(shipmentDetail?.trackingLink)),
              detailItem(
                  'Is COD', shipmentDetail?.isCOD == true ? 'Yes' : 'No'),
              detailItem('Status', getValue(shipmentDetail?.status)),
              detailItem('Notes', getValue(shipmentDetail?.notes)),
            ],
          ),
        ],
      ),
    );
  }

  Widget detailItem(String title, String value) {
    return SizedBox(
      width: AppSize.s160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: getBoldStyle(
                  fontSize: FontSize.s14, color: ColorManager.colorBlack)),
          const SizedBox(height: AppSize.s3),
          Text(value,
              style: getRegularStyle(
                  fontSize: FontSize.s12, color: ColorManager.colorBlack)),
          Divider(color: ColorManager.colorSoftBlue),
        ],
      ),
    );
  }
}
