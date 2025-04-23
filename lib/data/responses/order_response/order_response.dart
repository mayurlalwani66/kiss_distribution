import 'package:json_annotation/json_annotation.dart';
import 'package:k_distribution/data/responses/product_response/product_response.dart';
import 'package:k_distribution/data/responses/user_response/user_response.dart';

import '../../request/request.dart';
import '../base_response/base_response.dart';

part 'order_response.g.dart';

@JsonSerializable()
class CreateMyOrderResponse {
  String? merchantId;
  String? logo;
  num? cartId;
  num? orderId;
  num? amount;
  OrderTypeEnum? orderType;
  String? paymentMethodType;
  String? link;
  String? transactionId;
  String? token;
  String? checkoutUrl;
  String? flowType;
  String? script;

  CreateMyOrderResponse(
      this.merchantId,
      this.logo,
      this.cartId,
      this.orderId,
      this.amount,
      this.orderType,
      this.paymentMethodType,
      this.link,
      this.transactionId,
      this.token,
      this.checkoutUrl,
      this.flowType,
      this.script);

  factory CreateMyOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMyOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMyOrderResponseToJson(this);
}

@JsonSerializable()
class ViewOrderResponse {
  int? id;
  String? orderNo;
  String? orderNote;
  OrderTypeEnum? orderType;
  DateTime? orderStatusUpdateDate;
  String? lastOrderUpdate;
  DateTime? createDate;
  OrderStatusEnum? status;
  num? totalAmount;
  String? userName;
  String? userPhoneNumber;
  List<OrderDetailsResponse>? orderDetails;
  String? state;
  PaymentStatusEnum? paymentStatus;
  int? paymentMethodId;
  ShippingAddressResponse? shippingAddress;
  ShippingAddressResponse? billingAddress;
  bool? isShippingOnCustomer;
  num? shippingCharges;
  num? totalGrossAmount;
  num? oldGrossAmount;
  num? fulfilledAmount;
  String? deliveryCode;
  bool? isEligibleForOffer;
  List<UnitListModelResponse>? unitList;
  num? orderCouponDiscount;
  num? additionalDeliveryCharge;
  DateTime? packingEstimate;
  DateTime? expectedDeliveryDate;
  String? otp;
  bool? isDeleted;
  num? gstiN_Number;
  String? org_Name;
  String? uniqueCode;
  num? storeId;
  String? deliveryBoyName;
  String? phoneNumber;
  num? shipmentId;
  String? orderShippingNotes;

  ViewOrderResponse(
      this.id,
      this.orderNo,
      this.orderNote,
      this.orderType,
      this.orderStatusUpdateDate,
      this.lastOrderUpdate,
      this.createDate,
      this.status,
      this.totalAmount,
      this.userName,
      this.userPhoneNumber,
      this.orderDetails,
      this.state,
      this.paymentStatus,
      this.paymentMethodId,
      this.shippingAddress,
      this.billingAddress,
      this.isShippingOnCustomer,
      this.shippingCharges,
      this.totalGrossAmount,
      this.oldGrossAmount,
      this.fulfilledAmount,
      this.deliveryCode,
      this.isEligibleForOffer,
      this.unitList,
      this.orderCouponDiscount,
      this.additionalDeliveryCharge,
      this.packingEstimate,
      this.expectedDeliveryDate,
      this.otp,
      this.isDeleted,
      this.gstiN_Number,
      this.org_Name,
      this.uniqueCode,
      this.storeId,
      this.deliveryBoyName,
      this.phoneNumber,
      this.shipmentId,
      this.orderShippingNotes);

  factory ViewOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ViewOrderResponseToJson(this);
}

enum OrderStatusEnum {
  @JsonValue('Draft')
  Draft,
  @JsonValue('New')
  New,
  @JsonValue('PackingInProcess')
  PackingInProcess,
  @JsonValue('Accepted')
  Accepted,
  @JsonValue('Rejected')
  Rejected,
  @JsonValue('Packed')
  Packed,
  @JsonValue('Delivering')
  Delivering,
  @JsonValue('Completed')
  Completed,
  @JsonValue('Cancelled')
  Cancelled
}

enum PaymentStatusEnum {
  @JsonValue('Paid')
  Paid,
  @JsonValue('Pending')
  Pending,
  @JsonValue('Refunded')
  Refunded,
  @JsonValue('PaymentFailed')
  PaymentFailed,
  @JsonValue('RefundFailed')
  RefundFailed
}

@JsonSerializable()
class OrderDetailsResponse {
  num? availableStock;
  String? brandName;
  String? childCategoryName;
  num? finalPrice;
  num? gst;
  num? cgst;
  num? sgst;
  num? igst;
  num? utgst;
  int? id;
  num? memberDiscount;
  num? orderFulfilledQuantity;
  String? displayOrderFulfilledQuantity;
  DateTime? orderStatusUpdateDate;
  num? orderedQuantity;
  String? displayOrderedQuantity;
  String? parentCategoryName;
  String? photoUrl;
  num? price;
  int? productId;
  String? productModel;
  String? productName;
  String? status;
  num? unit;
  List<OrderAttributesResponse>? attributes;
  int? productAttributeValueCombinationId;
  int? appliedTierPriceId;
  num? appliedTierPrice;
  num? totalPrice;
  num? discountAmount;
  bool? allowNegetive;
  bool? allowTracking;
  num? stockAvailable;
  num? refundedAmount;
  num? fulfilledAmount;
  UnitListModelResponse? selectedUnit;
  bool? isDeleted;
  String? sku;
  bool? allowDecimal;
  num? stepQuantity;
  num? stepUnit;
  num? totalAmount;
  num? couponId;
  List<int>? attributeValueIds;

  OrderDetailsResponse(
    this.availableStock,
    this.brandName,
    this.childCategoryName,
    this.finalPrice,
    this.gst,
    this.cgst,
    this.sgst,
    this.igst,
    this.utgst,
    this.id,
    this.memberDiscount,
    this.orderFulfilledQuantity,
    this.displayOrderFulfilledQuantity,
    this.orderStatusUpdateDate,
    this.orderedQuantity,
    this.displayOrderedQuantity,
    this.parentCategoryName,
    this.photoUrl,
    this.price,
    this.productId,
    this.productModel,
    this.productName,
    this.status,
    this.unit,
    this.attributes,
    this.productAttributeValueCombinationId,
    this.appliedTierPriceId,
    this.appliedTierPrice,
    this.totalPrice,
    this.discountAmount,
    this.allowNegetive,
    this.allowTracking,
    this.stockAvailable,
    this.refundedAmount,
    this.fulfilledAmount,
    this.selectedUnit,
    this.isDeleted,
    this.sku,
    this.allowDecimal,
    this.stepQuantity,
    this.stepUnit,
    this.totalAmount,
    this.couponId,
    this.attributeValueIds,
  );

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseToJson(this);
}

@JsonSerializable()
class OrderAttributesResponse {
  int? id;
  String? name;
  List<ListIdNameModel>? productAttributeValues;

  OrderAttributesResponse(this.id, this.name, this.productAttributeValues);

  factory OrderAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderAttributesResponseToJson(this);
}

enum TransactionType {
  @JsonValue('Credit')
  Credit,
  @JsonValue('Debit')
  Debit
}

enum PaymentProcessStatusEnum {
  @JsonValue('Completed')
  Completed,
  @JsonValue('Pending')
  Pending,
  @JsonValue('Failed')
  Failed,
}

@JsonSerializable()
class TransactionByOrderIdResponse {
  int? id;
  String? refrenceNo;
  DateTime? paymentDate;
  num? amount;
  TransactionType? paymentType;
  String? refundReason;
  String? transactionType; // eg. net-banking / upi /
  String? paymentMethodName;
  int? paymentMethodTypeId;
  String? paymentMethodTypeName;
  PaymentProcessStatusEnum? paymentProcessStatus;

  TransactionByOrderIdResponse(
      this.id,
      this.refrenceNo,
      this.paymentDate,
      this.amount,
      this.paymentType,
      this.refundReason,
      this.transactionType,
      this.paymentMethodName,
      this.paymentMethodTypeId,
      this.paymentMethodTypeName,
      this.paymentProcessStatus);

  factory TransactionByOrderIdResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionByOrderIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionByOrderIdResponseToJson(this);
}

@JsonSerializable()
class ShipmentModelResponse {
  int? id;
  int? shipmentId;
  int? orderId;
  num? deliveryAmount;
  DateTime? deliveryDate;
  num? parsalHight;
  num? parsalWidth;
  num? parsalDepth;
  num? parcelWeight;
  num? parcelLength;
  String? notes;
  String? trackingLink;
  String? invoiceLink;
  String? providerName;
  String? uniqueId;
  ShipmentStatus status;
  bool? isCOD;
  SourceAddressResponse? sourceAddress;
  ShipmentModelResponse(
      this.id,
      this.shipmentId,
      this.orderId,
      this.deliveryAmount,
      this.deliveryDate,
      this.parsalHight,
      this.parsalWidth,
      this.parsalDepth,
      this.parcelWeight,
      this.parcelLength,
      this.notes,
      this.trackingLink,
      this.invoiceLink,
      this.providerName,
      this.uniqueId,
      this.status,
      this.isCOD,
      this.sourceAddress);

  factory ShipmentModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentModelResponseToJson(this);
}

@JsonSerializable()
class SourceAddressResponse {
  String? sourceVillage;
  String? sourcePincode;
  String? sourceState;
  String? sourcePhoneNumberTwo;
  String? address;
  String? sourcePhoneNumberOne;
  String? sourceDistrict;
  SourceAddressResponse(
      this.sourceVillage,
      this.sourcePincode,
      this.sourceState,
      this.sourcePhoneNumberTwo,
      this.address,
      this.sourcePhoneNumberOne,
      this.sourceDistrict);

  factory SourceAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$SourceAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SourceAddressResponseToJson(this);
}

enum ShipmentStatus {
  @JsonValue("ShipmentCreated")
  ShipmentCreated,

  @JsonValue("ParsalPickedUp")
  ParsalPickedUp,

  @JsonValue("ParcelDelivered")
  ParcelDelivered
}

@JsonSerializable()
class OrderListingModelResponse {
  int? id;
  String? customerName;
  num? totalAmount;
  num? fulfilledTotalAmount;
  num? orderQuantity;
  num? orderPrice;
  num? orderFulfilledQuantity;
  DateTime? orderDate;
  OrderStatusEnum? orderStatus;
  DateTime? orderStatusUpdateDate;
  String? unit;
  String? photoUrl;
  String? orderNo;
  bool? isWalkInCustomer;
  String? notes;
  OrderTypeEnum? orderType;
  PaymentStatusEnum? paymentStatus;
  num? paymentMethodId;
  num? refundedAmount;
  String? storeURL;
  num? totalCount;
  num? organizationId;
  String? viewOrderLink;
  num? orderDiscount;
  num? finalTotalAmount;
  bool? isShippingOnCustomer;
  num? shippingCharge;
  num? additionalDeliveryCharge;
  num? promotionalOrderDiscount;

  OrderListingModelResponse(
      this.id,
      this.customerName,
      this.totalAmount,
      this.fulfilledTotalAmount,
      this.orderQuantity,
      this.orderPrice,
      this.orderFulfilledQuantity,
      this.orderDate,
      this.orderStatus,
      this.orderStatusUpdateDate,
      this.unit,
      this.photoUrl,
      this.orderNo,
      this.isWalkInCustomer,
      this.notes,
      this.orderType,
      this.paymentStatus,
      this.paymentMethodId,
      this.refundedAmount,
      this.storeURL,
      this.totalCount,
      this.organizationId,
      this.viewOrderLink,
      this.orderDiscount,
      this.finalTotalAmount,
      this.isShippingOnCustomer,
      this.shippingCharge,
      this.additionalDeliveryCharge,
      this.promotionalOrderDiscount);

  factory OrderListingModelResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderListingModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListingModelResponseToJson(this);
}

enum ServiceType {
  @JsonValue('Order')
  order,

  @JsonValue('Product')
  product,
}

@JsonSerializable()
class FeedbackModelResponse {
  String? title;
  String? description;
  num? rating;

  FeedbackModelResponse(this.title, this.description, this.rating);

  factory FeedbackModelResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelResponseToJson(this);
}
