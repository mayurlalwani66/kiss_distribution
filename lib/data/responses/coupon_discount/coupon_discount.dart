import 'package:json_annotation/json_annotation.dart';
part 'coupon_discount.g.dart';

@JsonSerializable()
class CouponDiscountResponse {
  @JsonKey(name: "couponId")
  int? couponId;
  @JsonKey(name: "couponCode")
  String? couponCode;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "maxDiscountAmount")
  num? maxDiscountAmount;
  @JsonKey(name: "discountType")
  String? discountType;
  @JsonKey(name: "discountValue")
  num? discountValue;
  @JsonKey(name: "isNotApplicable")
  bool? isNotApplicable;
  @JsonKey(name: "productIds")
  List<num>? productIds;
  @JsonKey(name: "onOrderDiscount")
  bool? onOrderDiscount;
  @JsonKey(name: "isDeliveryChargeIncluded")
  bool? isDeliveryChargeIncluded;
  @JsonKey(name: "minOrderAmount")
  num? minOrderAmount;
  @JsonKey(name: "validFrom")
  DateTime? validFrom;
  @JsonKey(name: "validTo")
  DateTime? validTo;
  @JsonKey(name: "renewInDays")
  int? renewInDays;
  @JsonKey(name: "showDetail")
  bool? showDetail;

  CouponDiscountResponse(
    this.couponId,
    this.couponCode,
    this.description,
    this.name,
    this.type,
    this.maxDiscountAmount,
    this.discountType,
    this.discountValue,
    this.isNotApplicable,
    this.productIds,
    this.onOrderDiscount,
    this.isDeliveryChargeIncluded,
    this.minOrderAmount,
    this.validFrom,
    this.validTo,
    this.renewInDays,
    this.showDetail,
  );

  factory CouponDiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponDiscountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CouponDiscountResponseToJson(this);
}
