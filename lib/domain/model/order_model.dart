import 'package:k_distribution/domain/model/user_model.dart';

import '../../data/responses/base_response/base_response.dart';
import 'product_model.dart';

class CreateOrderResponse {
  String merchantId;
  String logo;
  int cartId;
  int orderId;
  num amount;
  String orderType;
  String paymentMethodType;
  String link;
  String transactionId;
  String token;
  String checkoutUrl;
  String flowType;
  String script;

  CreateOrderResponse(
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
}

class ViewOrder {
  int id;
  String orderNo;
  String orderNote;
  String orderType;
  DateTime orderStatusUpdateDate;
  String lastOrderUpdate;
  DateTime createDate;
  String status;
  double totalAmount;
  String userName;
  String userPhoneNumber;
  List<OrderDetails> orderDetails;
  String state;
  String paymentStatus;
  int paymentMethodId;
  ShippingAddress? shippingAddress;
  ShippingAddress? billingAddress;
  bool isShippingOnCustomer;
  double shippingCharges;
  num totalGrossAmount;
  num oldGrossAmount;
  num fulfilledAmount;
  String deliveryCode;
  bool isEligibleForOffer;
  List<UnitListModel> unitList;
  num orderCouponDiscount;
  num additionalDeliveryCharge;
  DateTime packingEstimate;
  DateTime expectedDeliveryDate;
  String otp;
  bool isDeleted;
  num gstiN_Number;
  String org_Name;
  String uniqueCode;
  num storeId;
  String deliveryBoyName;
  String phoneNumber;
  num shipmentId;
  String orderShippingNotes;

  ViewOrder(
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
}

class OrderDetails {
  num availableStock;
  String brandName;
  String childCategoryName;
  num finalPrice;
  num gst;
  num cgst;
  num sgst;
  num igst;
  num utgst;
  int id;
  num memberDiscount;
  num orderFulfilledQuantity;
  String displayOrderFulfilledQuantity;
  DateTime orderStatusUpdateDate;
  num orderedQuantity;
  String displayOrderedQuantity;
  String parentCategoryName;
  String photoUrl;
  num price;
  int productId;
  String productModel;
  String productName;
  String status;
  num unit;
  List<OrderAttributes> attributes;
  int productAttributeValueCombinationId;
  int appliedTierPriceId;
  num appliedTierPrice;
  num totalPrice;
  num discountAmount;
  bool allowNegetive;
  bool allowTracking;
  num stockAvailable;
  num refundedAmount;
  num fulfilledAmount;
  UnitListModel? selectedUnit;
  bool isDeleted;
  String sku;
  bool allowDecimal;
  num stepQuantity;
  num stepUnit;
  num totalAmount;
  num couponId;
  List<int> attributeValueIds;

  OrderDetails(
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
}

class OrderAttributes {
  int id;
  String name;
  List<ListIdNameModel> productAttributeValues;

  OrderAttributes(this.id, this.name, this.productAttributeValues);
}

class TransactionByOrderId {
  int id;
  String refrenceNo;
  DateTime paymentDate;
  num amount;
  String paymentType;
  String refundReason;
  String transactionType; // eg. net-banking / upi /
  String paymentMethodName;
  int paymentMethodTypeId;
  String paymentMethodTypeName;
  String paymentProcessStatus;

  TransactionByOrderId(
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
}

class SourceAddress {
  String sourceVillage;
  String sourcePincode;
  String sourceState;
  String sourcePhoneNumberTwo;
  String address;
  String sourcePhoneNumberOne;
  String sourceDistrict;
  SourceAddress(
      this.sourceVillage,
      this.sourcePincode,
      this.sourceState,
      this.sourcePhoneNumberTwo,
      this.address,
      this.sourcePhoneNumberOne,
      this.sourceDistrict);
}

class ShipmentModel {
  int id;
  int shipmentId;
  int orderId;
  num deliveryAmount;
  DateTime deliveryDate;
  num parsalHight;
  num parsalWidth;
  num parsalDepth;
  num parcelWeight;
  num parcelLength;
  String notes;
  String trackingLink;
  String invoiceLink;
  String providerName;
  String uniqueId;
  String status;
  bool isCOD;
  SourceAddress? sourceAddress;
  ShipmentModel(
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
}

class OrderListingModel {
  int id;
  String customerName;
  num totalAmount;
  num fulfilledTotalAmount;
  num orderQuantity;
  num orderPrice;
  num orderFulfilledQuantity;
  DateTime orderDate;
  String orderStatus;
  DateTime orderStatusUpdateDate;
  String unit;
  String photoUrl;
  String orderNo;
  bool isWalkInCustomer;
  String notes;
  String orderType;
  String paymentStatus;
  num paymentMethodId;
  num refundedAmount;
  String storeURL;
  num totalCount;
  num organizationId;
  String viewOrderLink;
  num orderDiscount;
  num finalTotalAmount;
  bool isShippingOnCustomer;
  num shippingCharge;
  num additionalDeliveryCharge;
  num promotionalOrderDiscount;

  OrderListingModel(
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
}

class FeedbackTitle {
  String title;
  bool isChecked;
  String imgUrl;

  FeedbackTitle(this.title, this.isChecked, this.imgUrl);

  FeedbackTitle copyWith({bool? isChecked}) {
    return FeedbackTitle(
      title,
      isChecked ?? this.isChecked,
      imgUrl,
    );
  }
}

class FeedbackModel {
  String title;
  String description;

  double rating;

  FeedbackModel(this.title, this.description, this.rating);
}
