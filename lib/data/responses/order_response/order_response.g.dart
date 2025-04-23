// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMyOrderResponse _$CreateMyOrderResponseFromJson(
        Map<String, dynamic> json) =>
    CreateMyOrderResponse(
      json['merchantId'] as String?,
      json['logo'] as String?,
      json['cartId'] as num?,
      json['orderId'] as num?,
      json['amount'] as num?,
      $enumDecodeNullable(_$OrderTypeEnumEnumMap, json['orderType']),
      json['paymentMethodType'] as String?,
      json['link'] as String?,
      json['transactionId'] as String?,
      json['token'] as String?,
      json['checkoutUrl'] as String?,
      json['flowType'] as String?,
      json['script'] as String?,
    );

Map<String, dynamic> _$CreateMyOrderResponseToJson(
        CreateMyOrderResponse instance) =>
    <String, dynamic>{
      'merchantId': instance.merchantId,
      'logo': instance.logo,
      'cartId': instance.cartId,
      'orderId': instance.orderId,
      'amount': instance.amount,
      'orderType': _$OrderTypeEnumEnumMap[instance.orderType],
      'paymentMethodType': instance.paymentMethodType,
      'link': instance.link,
      'transactionId': instance.transactionId,
      'token': instance.token,
      'checkoutUrl': instance.checkoutUrl,
      'flowType': instance.flowType,
      'script': instance.script,
    };

const _$OrderTypeEnumEnumMap = {
  OrderTypeEnum.Pickup: 'Pickup',
  OrderTypeEnum.Delivery: 'Delivery',
};

ViewOrderResponse _$ViewOrderResponseFromJson(Map<String, dynamic> json) =>
    ViewOrderResponse(
      (json['id'] as num?)?.toInt(),
      json['orderNo'] as String?,
      json['orderNote'] as String?,
      $enumDecodeNullable(_$OrderTypeEnumEnumMap, json['orderType']),
      json['orderStatusUpdateDate'] == null
          ? null
          : DateTime.parse(json['orderStatusUpdateDate'] as String),
      json['lastOrderUpdate'] as String?,
      json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      $enumDecodeNullable(_$OrderStatusEnumEnumMap, json['status']),
      json['totalAmount'] as num?,
      json['userName'] as String?,
      json['userPhoneNumber'] as String?,
      (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => OrderDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['state'] as String?,
      $enumDecodeNullable(_$PaymentStatusEnumEnumMap, json['paymentStatus']),
      (json['paymentMethodId'] as num?)?.toInt(),
      json['shippingAddress'] == null
          ? null
          : ShippingAddressResponse.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      json['billingAddress'] == null
          ? null
          : ShippingAddressResponse.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      json['isShippingOnCustomer'] as bool?,
      json['shippingCharges'] as num?,
      json['totalGrossAmount'] as num?,
      json['oldGrossAmount'] as num?,
      json['fulfilledAmount'] as num?,
      json['deliveryCode'] as String?,
      json['isEligibleForOffer'] as bool?,
      (json['unitList'] as List<dynamic>?)
          ?.map(
              (e) => UnitListModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['orderCouponDiscount'] as num?,
      json['additionalDeliveryCharge'] as num?,
      json['packingEstimate'] == null
          ? null
          : DateTime.parse(json['packingEstimate'] as String),
      json['expectedDeliveryDate'] == null
          ? null
          : DateTime.parse(json['expectedDeliveryDate'] as String),
      json['otp'] as String?,
      json['isDeleted'] as bool?,
      json['gstiN_Number'] as num?,
      json['org_Name'] as String?,
      json['uniqueCode'] as String?,
      json['storeId'] as num?,
      json['deliveryBoyName'] as String?,
      json['phoneNumber'] as String?,
      json['shipmentId'] as num?,
      json['orderShippingNotes'] as String?,
    );

Map<String, dynamic> _$ViewOrderResponseToJson(ViewOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNo': instance.orderNo,
      'orderNote': instance.orderNote,
      'orderType': _$OrderTypeEnumEnumMap[instance.orderType],
      'orderStatusUpdateDate':
          instance.orderStatusUpdateDate?.toIso8601String(),
      'lastOrderUpdate': instance.lastOrderUpdate,
      'createDate': instance.createDate?.toIso8601String(),
      'status': _$OrderStatusEnumEnumMap[instance.status],
      'totalAmount': instance.totalAmount,
      'userName': instance.userName,
      'userPhoneNumber': instance.userPhoneNumber,
      'orderDetails': instance.orderDetails,
      'state': instance.state,
      'paymentStatus': _$PaymentStatusEnumEnumMap[instance.paymentStatus],
      'paymentMethodId': instance.paymentMethodId,
      'shippingAddress': instance.shippingAddress,
      'billingAddress': instance.billingAddress,
      'isShippingOnCustomer': instance.isShippingOnCustomer,
      'shippingCharges': instance.shippingCharges,
      'totalGrossAmount': instance.totalGrossAmount,
      'oldGrossAmount': instance.oldGrossAmount,
      'fulfilledAmount': instance.fulfilledAmount,
      'deliveryCode': instance.deliveryCode,
      'isEligibleForOffer': instance.isEligibleForOffer,
      'unitList': instance.unitList,
      'orderCouponDiscount': instance.orderCouponDiscount,
      'additionalDeliveryCharge': instance.additionalDeliveryCharge,
      'packingEstimate': instance.packingEstimate?.toIso8601String(),
      'expectedDeliveryDate': instance.expectedDeliveryDate?.toIso8601String(),
      'otp': instance.otp,
      'isDeleted': instance.isDeleted,
      'gstiN_Number': instance.gstiN_Number,
      'org_Name': instance.org_Name,
      'uniqueCode': instance.uniqueCode,
      'storeId': instance.storeId,
      'deliveryBoyName': instance.deliveryBoyName,
      'phoneNumber': instance.phoneNumber,
      'shipmentId': instance.shipmentId,
      'orderShippingNotes': instance.orderShippingNotes,
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.Draft: 'Draft',
  OrderStatusEnum.New: 'New',
  OrderStatusEnum.PackingInProcess: 'PackingInProcess',
  OrderStatusEnum.Accepted: 'Accepted',
  OrderStatusEnum.Rejected: 'Rejected',
  OrderStatusEnum.Packed: 'Packed',
  OrderStatusEnum.Delivering: 'Delivering',
  OrderStatusEnum.Completed: 'Completed',
  OrderStatusEnum.Cancelled: 'Cancelled',
};

const _$PaymentStatusEnumEnumMap = {
  PaymentStatusEnum.Paid: 'Paid',
  PaymentStatusEnum.Pending: 'Pending',
  PaymentStatusEnum.Refunded: 'Refunded',
  PaymentStatusEnum.PaymentFailed: 'PaymentFailed',
  PaymentStatusEnum.RefundFailed: 'RefundFailed',
};

OrderDetailsResponse _$OrderDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    OrderDetailsResponse(
      json['availableStock'] as num?,
      json['brandName'] as String?,
      json['childCategoryName'] as String?,
      json['finalPrice'] as num?,
      json['gst'] as num?,
      json['cgst'] as num?,
      json['sgst'] as num?,
      json['igst'] as num?,
      json['utgst'] as num?,
      (json['id'] as num?)?.toInt(),
      json['memberDiscount'] as num?,
      json['orderFulfilledQuantity'] as num?,
      json['displayOrderFulfilledQuantity'] as String?,
      json['orderStatusUpdateDate'] == null
          ? null
          : DateTime.parse(json['orderStatusUpdateDate'] as String),
      json['orderedQuantity'] as num?,
      json['displayOrderedQuantity'] as String?,
      json['parentCategoryName'] as String?,
      json['photoUrl'] as String?,
      json['price'] as num?,
      (json['productId'] as num?)?.toInt(),
      json['productModel'] as String?,
      json['productName'] as String?,
      json['status'] as String?,
      json['unit'] as num?,
      (json['attributes'] as List<dynamic>?)
          ?.map((e) =>
              OrderAttributesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['productAttributeValueCombinationId'] as num?)?.toInt(),
      (json['appliedTierPriceId'] as num?)?.toInt(),
      json['appliedTierPrice'] as num?,
      json['totalPrice'] as num?,
      json['discountAmount'] as num?,
      json['allowNegetive'] as bool?,
      json['allowTracking'] as bool?,
      json['stockAvailable'] as num?,
      json['refundedAmount'] as num?,
      json['fulfilledAmount'] as num?,
      json['selectedUnit'] == null
          ? null
          : UnitListModelResponse.fromJson(
              json['selectedUnit'] as Map<String, dynamic>),
      json['isDeleted'] as bool?,
      json['sku'] as String?,
      json['allowDecimal'] as bool?,
      json['stepQuantity'] as num?,
      json['stepUnit'] as num?,
      json['totalAmount'] as num?,
      json['couponId'] as num?,
      (json['attributeValueIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$OrderDetailsResponseToJson(
        OrderDetailsResponse instance) =>
    <String, dynamic>{
      'availableStock': instance.availableStock,
      'brandName': instance.brandName,
      'childCategoryName': instance.childCategoryName,
      'finalPrice': instance.finalPrice,
      'gst': instance.gst,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'igst': instance.igst,
      'utgst': instance.utgst,
      'id': instance.id,
      'memberDiscount': instance.memberDiscount,
      'orderFulfilledQuantity': instance.orderFulfilledQuantity,
      'displayOrderFulfilledQuantity': instance.displayOrderFulfilledQuantity,
      'orderStatusUpdateDate':
          instance.orderStatusUpdateDate?.toIso8601String(),
      'orderedQuantity': instance.orderedQuantity,
      'displayOrderedQuantity': instance.displayOrderedQuantity,
      'parentCategoryName': instance.parentCategoryName,
      'photoUrl': instance.photoUrl,
      'price': instance.price,
      'productId': instance.productId,
      'productModel': instance.productModel,
      'productName': instance.productName,
      'status': instance.status,
      'unit': instance.unit,
      'attributes': instance.attributes,
      'productAttributeValueCombinationId':
          instance.productAttributeValueCombinationId,
      'appliedTierPriceId': instance.appliedTierPriceId,
      'appliedTierPrice': instance.appliedTierPrice,
      'totalPrice': instance.totalPrice,
      'discountAmount': instance.discountAmount,
      'allowNegetive': instance.allowNegetive,
      'allowTracking': instance.allowTracking,
      'stockAvailable': instance.stockAvailable,
      'refundedAmount': instance.refundedAmount,
      'fulfilledAmount': instance.fulfilledAmount,
      'selectedUnit': instance.selectedUnit,
      'isDeleted': instance.isDeleted,
      'sku': instance.sku,
      'allowDecimal': instance.allowDecimal,
      'stepQuantity': instance.stepQuantity,
      'stepUnit': instance.stepUnit,
      'totalAmount': instance.totalAmount,
      'couponId': instance.couponId,
      'attributeValueIds': instance.attributeValueIds,
    };

OrderAttributesResponse _$OrderAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    OrderAttributesResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      (json['productAttributeValues'] as List<dynamic>?)
          ?.map((e) => ListIdNameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderAttributesResponseToJson(
        OrderAttributesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productAttributeValues': instance.productAttributeValues,
    };

TransactionByOrderIdResponse _$TransactionByOrderIdResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionByOrderIdResponse(
      (json['id'] as num?)?.toInt(),
      json['refrenceNo'] as String?,
      json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      json['amount'] as num?,
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['paymentType']),
      json['refundReason'] as String?,
      json['transactionType'] as String?,
      json['paymentMethodName'] as String?,
      (json['paymentMethodTypeId'] as num?)?.toInt(),
      json['paymentMethodTypeName'] as String?,
      $enumDecodeNullable(
          _$PaymentProcessStatusEnumEnumMap, json['paymentProcessStatus']),
    );

Map<String, dynamic> _$TransactionByOrderIdResponseToJson(
        TransactionByOrderIdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refrenceNo': instance.refrenceNo,
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'amount': instance.amount,
      'paymentType': _$TransactionTypeEnumMap[instance.paymentType],
      'refundReason': instance.refundReason,
      'transactionType': instance.transactionType,
      'paymentMethodName': instance.paymentMethodName,
      'paymentMethodTypeId': instance.paymentMethodTypeId,
      'paymentMethodTypeName': instance.paymentMethodTypeName,
      'paymentProcessStatus':
          _$PaymentProcessStatusEnumEnumMap[instance.paymentProcessStatus],
    };

const _$TransactionTypeEnumMap = {
  TransactionType.Credit: 'Credit',
  TransactionType.Debit: 'Debit',
};

const _$PaymentProcessStatusEnumEnumMap = {
  PaymentProcessStatusEnum.Completed: 'Completed',
  PaymentProcessStatusEnum.Pending: 'Pending',
  PaymentProcessStatusEnum.Failed: 'Failed',
};

ShipmentModelResponse _$ShipmentModelResponseFromJson(
        Map<String, dynamic> json) =>
    ShipmentModelResponse(
      (json['id'] as num?)?.toInt(),
      (json['shipmentId'] as num?)?.toInt(),
      (json['orderId'] as num?)?.toInt(),
      json['deliveryAmount'] as num?,
      json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      json['parsalHight'] as num?,
      json['parsalWidth'] as num?,
      json['parsalDepth'] as num?,
      json['parcelWeight'] as num?,
      json['parcelLength'] as num?,
      json['notes'] as String?,
      json['trackingLink'] as String?,
      json['invoiceLink'] as String?,
      json['providerName'] as String?,
      json['uniqueId'] as String?,
      $enumDecode(_$ShipmentStatusEnumMap, json['status']),
      json['isCOD'] as bool?,
      json['sourceAddress'] == null
          ? null
          : SourceAddressResponse.fromJson(
              json['sourceAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentModelResponseToJson(
        ShipmentModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipmentId': instance.shipmentId,
      'orderId': instance.orderId,
      'deliveryAmount': instance.deliveryAmount,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'parsalHight': instance.parsalHight,
      'parsalWidth': instance.parsalWidth,
      'parsalDepth': instance.parsalDepth,
      'parcelWeight': instance.parcelWeight,
      'parcelLength': instance.parcelLength,
      'notes': instance.notes,
      'trackingLink': instance.trackingLink,
      'invoiceLink': instance.invoiceLink,
      'providerName': instance.providerName,
      'uniqueId': instance.uniqueId,
      'status': _$ShipmentStatusEnumMap[instance.status]!,
      'isCOD': instance.isCOD,
      'sourceAddress': instance.sourceAddress,
    };

const _$ShipmentStatusEnumMap = {
  ShipmentStatus.ShipmentCreated: 'ShipmentCreated',
  ShipmentStatus.ParsalPickedUp: 'ParsalPickedUp',
  ShipmentStatus.ParcelDelivered: 'ParcelDelivered',
};

SourceAddressResponse _$SourceAddressResponseFromJson(
        Map<String, dynamic> json) =>
    SourceAddressResponse(
      json['sourceVillage'] as String?,
      json['sourcePincode'] as String?,
      json['sourceState'] as String?,
      json['sourcePhoneNumberTwo'] as String?,
      json['address'] as String?,
      json['sourcePhoneNumberOne'] as String?,
      json['sourceDistrict'] as String?,
    );

Map<String, dynamic> _$SourceAddressResponseToJson(
        SourceAddressResponse instance) =>
    <String, dynamic>{
      'sourceVillage': instance.sourceVillage,
      'sourcePincode': instance.sourcePincode,
      'sourceState': instance.sourceState,
      'sourcePhoneNumberTwo': instance.sourcePhoneNumberTwo,
      'address': instance.address,
      'sourcePhoneNumberOne': instance.sourcePhoneNumberOne,
      'sourceDistrict': instance.sourceDistrict,
    };

OrderListingModelResponse _$OrderListingModelResponseFromJson(
        Map<String, dynamic> json) =>
    OrderListingModelResponse(
      (json['id'] as num?)?.toInt(),
      json['customerName'] as String?,
      json['totalAmount'] as num?,
      json['fulfilledTotalAmount'] as num?,
      json['orderQuantity'] as num?,
      json['orderPrice'] as num?,
      json['orderFulfilledQuantity'] as num?,
      json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      $enumDecodeNullable(_$OrderStatusEnumEnumMap, json['orderStatus']),
      json['orderStatusUpdateDate'] == null
          ? null
          : DateTime.parse(json['orderStatusUpdateDate'] as String),
      json['unit'] as String?,
      json['photoUrl'] as String?,
      json['orderNo'] as String?,
      json['isWalkInCustomer'] as bool?,
      json['notes'] as String?,
      $enumDecodeNullable(_$OrderTypeEnumEnumMap, json['orderType']),
      $enumDecodeNullable(_$PaymentStatusEnumEnumMap, json['paymentStatus']),
      json['paymentMethodId'] as num?,
      json['refundedAmount'] as num?,
      json['storeURL'] as String?,
      json['totalCount'] as num?,
      json['organizationId'] as num?,
      json['viewOrderLink'] as String?,
      json['orderDiscount'] as num?,
      json['finalTotalAmount'] as num?,
      json['isShippingOnCustomer'] as bool?,
      json['shippingCharge'] as num?,
      json['additionalDeliveryCharge'] as num?,
      json['promotionalOrderDiscount'] as num?,
    );

Map<String, dynamic> _$OrderListingModelResponseToJson(
        OrderListingModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerName': instance.customerName,
      'totalAmount': instance.totalAmount,
      'fulfilledTotalAmount': instance.fulfilledTotalAmount,
      'orderQuantity': instance.orderQuantity,
      'orderPrice': instance.orderPrice,
      'orderFulfilledQuantity': instance.orderFulfilledQuantity,
      'orderDate': instance.orderDate?.toIso8601String(),
      'orderStatus': _$OrderStatusEnumEnumMap[instance.orderStatus],
      'orderStatusUpdateDate':
          instance.orderStatusUpdateDate?.toIso8601String(),
      'unit': instance.unit,
      'photoUrl': instance.photoUrl,
      'orderNo': instance.orderNo,
      'isWalkInCustomer': instance.isWalkInCustomer,
      'notes': instance.notes,
      'orderType': _$OrderTypeEnumEnumMap[instance.orderType],
      'paymentStatus': _$PaymentStatusEnumEnumMap[instance.paymentStatus],
      'paymentMethodId': instance.paymentMethodId,
      'refundedAmount': instance.refundedAmount,
      'storeURL': instance.storeURL,
      'totalCount': instance.totalCount,
      'organizationId': instance.organizationId,
      'viewOrderLink': instance.viewOrderLink,
      'orderDiscount': instance.orderDiscount,
      'finalTotalAmount': instance.finalTotalAmount,
      'isShippingOnCustomer': instance.isShippingOnCustomer,
      'shippingCharge': instance.shippingCharge,
      'additionalDeliveryCharge': instance.additionalDeliveryCharge,
      'promotionalOrderDiscount': instance.promotionalOrderDiscount,
    };

FeedbackModelResponse _$FeedbackModelResponseFromJson(
        Map<String, dynamic> json) =>
    FeedbackModelResponse(
      json['title'] as String?,
      json['description'] as String?,
      json['rating'] as num?,
    );

Map<String, dynamic> _$FeedbackModelResponseToJson(
        FeedbackModelResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'rating': instance.rating,
    };
