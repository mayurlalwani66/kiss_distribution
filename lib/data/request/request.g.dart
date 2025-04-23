// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      json['phoneNumber'] as String,
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
    };

GetAllProductsFilterReq _$GetAllProductsFilterReqFromJson(
        Map<String, dynamic> json) =>
    GetAllProductsFilterReq(
      categoryId: (json['categoryId'] as num?)?.toInt(),
      slugName: json['slugName'] as String?,
      tagId: (json['tagId'] as num?)?.toInt(),
      includingSubCategory: json['includingSubCategory'] as bool?,
      status:
          (json['status'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      pageNo: (json['pageNo'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 30,
      search: json['search'] as String?,
      sortOrder: json['sortOrder'] as String? ?? 'desc',
      sortBy: json['sortBy'] as String?,
      filterBy: json['filterBy'] as String?,
    );

Map<String, dynamic> _$GetAllProductsFilterReqToJson(
        GetAllProductsFilterReq instance) =>
    <String, dynamic>{
      'pageCount': instance.pageCount,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'search': instance.search,
      'sortOrder': instance.sortOrder,
      'sortBy': instance.sortBy,
      'filterBy': instance.filterBy,
      'categoryId': instance.categoryId,
      'slugName': instance.slugName,
      'tagId': instance.tagId,
      'includingSubCategory': instance.includingSubCategory,
      'status': instance.status,
    };

AddToCartReqModel _$AddToCartReqModelFromJson(Map<String, dynamic> json) =>
    AddToCartReqModel(
      (json['productId'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
      json['displayQuantity'] as String?,
      (json['valueIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      (json['totalAmount'] as num?)?.toDouble(),
      (json['productAttributeValueCombinationId'] as num?)?.toInt(),
      (json['couponId'] as num?)?.toInt(),
      json['type'] as String?,
      json['hasRelatedProducts'] as bool?,
      json['weight'] as num?,
    );

Map<String, dynamic> _$AddToCartReqModelToJson(AddToCartReqModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'displayQuantity': instance.displayQuantity,
      'valueIds': instance.valueIds,
      'totalAmount': instance.totalAmount,
      'productAttributeValueCombinationId':
          instance.productAttributeValueCombinationId,
      'couponId': instance.couponId,
      'type': instance.type,
      'hasRelatedProducts': instance.hasRelatedProducts,
      'weight': instance.weight,
    };

ShippingChargeRequest _$ShippingChargeRequestFromJson(
        Map<String, dynamic> json) =>
    ShippingChargeRequest(
      (json['weight'] as num?)?.toDouble(),
      (json['amount'] as num?)?.toDouble(),
      (json['addressId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShippingChargeRequestToJson(
        ShippingChargeRequest instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'amount': instance.amount,
      'addressId': instance.addressId,
    };

DynamicFormRequest _$DynamicFormRequestFromJson(Map<String, dynamic> json) =>
    DynamicFormRequest(
      (json['controlKeys'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DynamicFormRequestToJson(DynamicFormRequest instance) =>
    <String, dynamic>{
      'controlKeys': instance.controlKeys,
    };

CreateMyOrder _$CreateMyOrderFromJson(Map<String, dynamic> json) =>
    CreateMyOrder(
      $enumDecodeNullable(_$OrderTypeEnumEnumMap, json['orderType']),
      json['billingAddress'] == null
          ? null
          : ShippingAddressResponse.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      json['shippingAddress'] == null
          ? null
          : ShippingAddressResponse.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      json['orderDiscountAmount'] as num?,
      json['notes'] as String?,
      json['additionalDeliveryCharge'] as num?,
      json['totalAmount'] as num?,
      (json['orderDetails'] as List<dynamic>)
          .map((e) => MyOrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['paymentMethodId'] as num?)?.toInt(),
      json['paymentMethodType'] as String?,
      json['packingEstimate'] == null
          ? null
          : DateTime.parse(json['packingEstimate'] as String),
      json['shippingCharge'] as num?,
      (json['shippingIntegrationId'] as num?)?.toInt(),
      json['shippingNotes'] == null
          ? null
          : ShippingNotes.fromJson(
              json['shippingNotes'] as Map<String, dynamic>),
      (json['orderDiscountId'] as num?)?.toInt(),
      json['currentAddress'] == null
          ? null
          : CurrentAddress.fromJson(
              json['currentAddress'] as Map<String, dynamic>),
      json['fromNative'] as bool?,
    );

Map<String, dynamic> _$CreateMyOrderToJson(CreateMyOrder instance) =>
    <String, dynamic>{
      'orderType': _$OrderTypeEnumEnumMap[instance.orderType],
      'billingAddress': instance.billingAddress,
      'shippingAddress': instance.shippingAddress,
      'orderDiscountAmount': instance.orderDiscountAmount,
      'notes': instance.notes,
      'additionalDeliveryCharge': instance.additionalDeliveryCharge,
      'totalAmount': instance.totalAmount,
      'orderDetails': instance.orderDetails,
      'paymentMethodId': instance.paymentMethodId,
      'paymentMethodType': instance.paymentMethodType,
      'packingEstimate': instance.packingEstimate?.toIso8601String(),
      'shippingCharge': instance.shippingCharge,
      'shippingIntegrationId': instance.shippingIntegrationId,
      'shippingNotes': instance.shippingNotes,
      'orderDiscountId': instance.orderDiscountId,
      'currentAddress': instance.currentAddress,
      'fromNative': instance.fromNative,
    };

const _$OrderTypeEnumEnumMap = {
  OrderTypeEnum.Pickup: 'Pickup',
  OrderTypeEnum.Delivery: 'Delivery',
};

MyOrderDetails _$MyOrderDetailsFromJson(Map<String, dynamic> json) =>
    MyOrderDetails(
      (json['productId'] as num?)?.toInt(),
      (json['orderedQuantity'] as num?)?.toInt(),
      json['totalAmount'] as num?,
    )..productAttributeValueCombinationId =
        json['productAttributeValueCombinationId'] as num?;

Map<String, dynamic> _$MyOrderDetailsToJson(MyOrderDetails instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'orderedQuantity': instance.orderedQuantity,
      'totalAmount': instance.totalAmount,
      'productAttributeValueCombinationId':
          instance.productAttributeValueCombinationId,
    };

ShippingNotes _$ShippingNotesFromJson(Map<String, dynamic> json) =>
    ShippingNotes(
      json['deliveryTime'] as String?,
      json['serviceCode'] as String?,
    );

Map<String, dynamic> _$ShippingNotesToJson(ShippingNotes instance) =>
    <String, dynamic>{
      'serviceCode': instance.serviceCode,
      'deliveryTime': instance.deliveryTime,
    };

CurrentAddress _$CurrentAddressFromJson(Map<String, dynamic> json) =>
    CurrentAddress(
      json['longitude'] as num?,
      json['latitude'] as num?,
    );

Map<String, dynamic> _$CurrentAddressToJson(CurrentAddress instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

CancelMyOrder _$CancelMyOrderFromJson(Map<String, dynamic> json) =>
    CancelMyOrder(
      (json['orderId'] as num?)?.toInt(),
      (json['orderDetailIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      json['refundReason'] as String?,
    );

Map<String, dynamic> _$CancelMyOrderToJson(CancelMyOrder instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderDetailIds': instance.orderDetailIds,
      'refundReason': instance.refundReason,
    };

DeleteUserShippingAddress _$DeleteUserShippingAddressFromJson(
        Map<String, dynamic> json) =>
    DeleteUserShippingAddress(
      (json['addressId'] as num?)?.toInt(),
      (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteUserShippingAddressToJson(
        DeleteUserShippingAddress instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'userId': instance.userId,
    };
