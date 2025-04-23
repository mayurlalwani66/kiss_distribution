// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponDiscountResponse _$CouponDiscountResponseFromJson(
        Map<String, dynamic> json) =>
    CouponDiscountResponse(
      (json['couponId'] as num?)?.toInt(),
      json['couponCode'] as String?,
      json['description'] as String?,
      json['name'] as String?,
      json['type'] as String?,
      json['maxDiscountAmount'] as num?,
      json['discountType'] as String?,
      json['discountValue'] as num?,
      json['isNotApplicable'] as bool?,
      (json['productIds'] as List<dynamic>?)?.map((e) => e as num).toList(),
      json['onOrderDiscount'] as bool?,
      json['isDeliveryChargeIncluded'] as bool?,
      json['minOrderAmount'] as num?,
      json['validFrom'] == null
          ? null
          : DateTime.parse(json['validFrom'] as String),
      json['validTo'] == null
          ? null
          : DateTime.parse(json['validTo'] as String),
      (json['renewInDays'] as num?)?.toInt(),
      json['showDetail'] as bool?,
    );

Map<String, dynamic> _$CouponDiscountResponseToJson(
        CouponDiscountResponse instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'couponCode': instance.couponCode,
      'description': instance.description,
      'name': instance.name,
      'type': instance.type,
      'maxDiscountAmount': instance.maxDiscountAmount,
      'discountType': instance.discountType,
      'discountValue': instance.discountValue,
      'isNotApplicable': instance.isNotApplicable,
      'productIds': instance.productIds,
      'onOrderDiscount': instance.onOrderDiscount,
      'isDeliveryChargeIncluded': instance.isDeliveryChargeIncluded,
      'minOrderAmount': instance.minOrderAmount,
      'validFrom': instance.validFrom?.toIso8601String(),
      'validTo': instance.validTo?.toIso8601String(),
      'renewInDays': instance.renewInDays,
      'showDetail': instance.showDetail,
    };
