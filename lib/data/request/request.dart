import 'package:json_annotation/json_annotation.dart';

import '../responses/base_response/base_response.dart';
import '../responses/user_response/user_response.dart';
part 'request.g.dart';

@JsonSerializable()
class LoginRequest {
  String phoneNumber;
  String email;
  String password;

  LoginRequest(this.phoneNumber, this.email, this.password);
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class GetAllProductsFilterReq extends BaseFilterRequest {
  int? categoryId;
  String? slugName;
  int? tagId;
  bool? includingSubCategory;
  List<String>? status;

  GetAllProductsFilterReq({
    this.categoryId,
    this.slugName,
    this.tagId,
    this.includingSubCategory,
    this.status,
    super.pageCount,
    super.pageNo,
    super.pageSize,
    super.search,
    super.sortOrder,
    super.sortBy,
    super.filterBy,
  });

  factory GetAllProductsFilterReq.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsFilterReqFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetAllProductsFilterReqToJson(this);
}

@JsonSerializable()
class AddToCartReqModel {
  int? productId;
  int? quantity;
  String? displayQuantity;
  List<int>? valueIds;
  double? totalAmount;
  int? productAttributeValueCombinationId;
  int? couponId;
  String? type;
  bool? hasRelatedProducts;
  num? weight;

  AddToCartReqModel(
    this.productId,
    this.quantity,
    this.displayQuantity,
    this.valueIds,
    this.totalAmount,
    this.productAttributeValueCombinationId,
    this.couponId,
    this.type,
    this.hasRelatedProducts,
    this.weight,
  );

  factory AddToCartReqModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartReqModelToJson(this);
}

@JsonSerializable()
class ShippingChargeRequest {
  double? weight;
  double? amount;
  int? addressId;
  ShippingChargeRequest(this.weight, this.amount, this.addressId);

  factory ShippingChargeRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingChargeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingChargeRequestToJson(this);
}

@JsonSerializable()
class DynamicFormRequest {
  List<String> controlKeys;

  DynamicFormRequest(this.controlKeys);

  factory DynamicFormRequest.fromJson(Map<String, dynamic> json) =>
      _$DynamicFormRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicFormRequestToJson(this);
}

enum OrderTypeEnum {
  @JsonValue('Pickup')
  Pickup,

  @JsonValue('Delivery')
  Delivery,
}

@JsonSerializable()
class CreateMyOrder {
  OrderTypeEnum? orderType;
  ShippingAddressResponse? billingAddress;
  ShippingAddressResponse? shippingAddress;
  num? orderDiscountAmount;
  String? notes;
  num? additionalDeliveryCharge;
  num? totalAmount;
  List<MyOrderDetails> orderDetails;
  int? paymentMethodId;
  String? paymentMethodType;
  DateTime? packingEstimate;
  num? shippingCharge;
  int? shippingIntegrationId;
  ShippingNotes? shippingNotes;
  int? orderDiscountId;
  CurrentAddress? currentAddress;
  bool? fromNative;

  CreateMyOrder(
      this.orderType,
      this.billingAddress,
      this.shippingAddress,
      this.orderDiscountAmount,
      this.notes,
      this.additionalDeliveryCharge,
      this.totalAmount,
      this.orderDetails,
      this.paymentMethodId,
      this.paymentMethodType,
      this.packingEstimate,
      this.shippingCharge,
      this.shippingIntegrationId,
      this.shippingNotes,
      this.orderDiscountId,
      this.currentAddress,
      this.fromNative);

  factory CreateMyOrder.fromJson(Map<String, dynamic> json) =>
      _$CreateMyOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMyOrderToJson(this);
}

@JsonSerializable()
class MyOrderDetails {
  int? productId;
  int? orderedQuantity;
  num? totalAmount;
  num? productAttributeValueCombinationId;

  MyOrderDetails(this.productId, this.orderedQuantity, this.totalAmount);

  factory MyOrderDetails.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderDetailsToJson(this);
}

@JsonSerializable()
class ShippingNotes {
  String? serviceCode;
  String? deliveryTime;
  ShippingNotes(this.deliveryTime, this.serviceCode);

  factory ShippingNotes.fromJson(Map<String, dynamic> json) =>
      _$ShippingNotesFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingNotesToJson(this);
}

@JsonSerializable()
class CurrentAddress {
  num? longitude;
  num? latitude;

  CurrentAddress(this.longitude, this.latitude);

  factory CurrentAddress.fromJson(Map<String, dynamic> json) =>
      _$CurrentAddressFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentAddressToJson(this);
}

@JsonSerializable()
class CancelMyOrder {
  int? orderId;
  List<int>? orderDetailIds;
  String? refundReason;

  CancelMyOrder(this.orderId, this.orderDetailIds, this.refundReason);

  factory CancelMyOrder.fromJson(Map<String, dynamic> json) =>
      _$CancelMyOrderFromJson(json);

  Map<String, dynamic> toJson() => _$CancelMyOrderToJson(this);
}

@JsonSerializable()
class DeleteUserShippingAddress {
  int? addressId;
  int? userId;

  DeleteUserShippingAddress(this.addressId, this.userId);

  factory DeleteUserShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserShippingAddressToJson(this);
}
