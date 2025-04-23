class CouponDiscount {
  int couponId;
  String couponCode;
  String description;
  String name;
  String type;
  num maxDiscountAmount;
  String discountType;
  num discountValue;
  bool isNotApplicable;
  List<int> productIds;
  bool onOrderDiscount;
  bool isDeliveryChargeIncluded;
  num minOrderAmount;
  DateTime validFrom;
  DateTime validTo;
  int renewInDays;
  bool showDetail;

  CouponDiscount(
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
}
