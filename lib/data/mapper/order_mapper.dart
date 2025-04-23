import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/data/mapper/auth_mapper.dart';
import 'package:k_distribution/data/mapper/product_mapper.dart';
import 'package:k_distribution/data/mapper/user_mapper.dart';

import '../../domain/model/order_model.dart';
import '../responses/order_response/order_response.dart';

extension CreateMyOrderResponseMapper on CreateMyOrderResponse? {
  CreateOrderResponse toDomain() {
    return CreateOrderResponse(
        this?.merchantId.orEmpty() ?? EMPTY,
        this?.logo.orEmpty() ?? EMPTY,
        this?.cartId.orNum().toInt() ?? ZERO,
        this?.orderId.orNum().toInt() ?? ZERO,
        this?.amount.orNum() ?? ZERO,
        this?.orderType?.name.orEmpty() ?? EMPTY,
        this?.paymentMethodType.orEmpty() ?? EMPTY,
        this?.link.orEmpty() ?? EMPTY,
        this?.transactionId.orEmpty() ?? EMPTY,
        this?.token.orEmpty() ?? EMPTY,
        this?.checkoutUrl.orEmpty() ?? EMPTY,
        this?.flowType.orEmpty() ?? EMPTY,
        this?.script.orEmpty() ?? EMPTY);
  }
}

extension OrderDetailsResponseMapper on OrderDetailsResponse? {
  OrderDetails toDomain() {
    return OrderDetails(
        this?.availableStock.orNum() ?? ZEROPOINTZERO,
        this?.brandName.orEmpty() ?? EMPTY,
        this?.childCategoryName.orEmpty() ?? EMPTY,
        this?.finalPrice.orNum() ?? ZEROPOINTZERO,
        this?.gst.orNum() ?? ZEROPOINTZERO,
        this?.cgst.orNum() ?? ZEROPOINTZERO,
        this?.sgst.orNum() ?? ZEROPOINTZERO,
        this?.igst.orNum() ?? ZEROPOINTZERO,
        this?.utgst.orNum() ?? ZEROPOINTZERO,
        this?.id.orZero() ?? ZERO,
        this?.memberDiscount.orNum() ?? ZEROPOINTZERO,
        this?.orderFulfilledQuantity.orNum() ?? ZERO,
        this?.displayOrderFulfilledQuantity.orEmpty() ?? EMPTY,
        this?.orderStatusUpdateDate.orDate() ?? DATE,
        this?.orderedQuantity.orNum() ?? ZERO,
        this?.displayOrderedQuantity.orEmpty() ?? EMPTY,
        this?.parentCategoryName.orEmpty() ?? EMPTY,
        this?.photoUrl.orEmpty() ?? EMPTY,
        this?.price.orNum() ?? ZEROPOINTZERO,
        this?.productId.orZero() ?? ZERO,
        this?.productModel.orEmpty() ?? EMPTY,
        this?.productName.orEmpty() ?? EMPTY,
        this?.status.orEmpty() ?? EMPTY,
        this?.unit.orNum() ?? ZEROPOINTZERO,
        this?.attributes!.map((a) => a.toDomain()).toList() ?? [],
        this?.productAttributeValueCombinationId.orZero() ?? ZERO,
        this?.appliedTierPriceId.orZero() ?? ZERO,
        this?.unit.orNum() ?? ZEROPOINTZERO,
        this?.totalPrice.orNum() ?? ZEROPOINTZERO,
        this?.discountAmount.orNum() ?? ZEROPOINTZERO,
        this?.allowNegetive.orFalse() ?? FALSE,
        this?.allowTracking.orFalse() ?? FALSE,
        this?.stockAvailable.orNum() ?? ZEROPOINTZERO,
        this?.refundedAmount.orNum() ?? ZEROPOINTZERO,
        this?.fulfilledAmount.orNum() ?? ZEROPOINTZERO,
        this?.selectedUnit.toDomain(),
        this?.isDeleted.orFalse() ?? FALSE,
        this?.sku.orEmpty() ?? EMPTY,
        this?.allowDecimal.orFalse() ?? FALSE,
        this?.stepQuantity.orNum() ?? ZERO,
        this?.stepUnit.orNum() ?? ZEROPOINTZERO,
        this?.totalAmount.orNum() ?? ZEROPOINTZERO,
        this?.couponId.orNum() ?? ZERO,
        this?.attributeValueIds?.map((e) => e.orZero()).toList() ?? []);
  }
}

extension OrderAttributesResponseMapper on OrderAttributesResponse? {
  OrderAttributes toDomain() {
    return OrderAttributes(this?.id.orZero() ?? ZERO,
        this?.name.orEmpty() ?? EMPTY, this?.productAttributeValues ?? []);
  }
}

extension ViewOrderResponseMapper on ViewOrderResponse? {
  ViewOrder toDomain() {
    return ViewOrder(
        this?.id.orZero() ?? ZERO,
        this?.orderNo.orEmpty() ?? EMPTY,
        this?.orderNote.orEmpty() ?? EMPTY,
        this?.orderType?.name.orEmpty() ?? EMPTY,
        this?.orderStatusUpdateDate.orDate() ?? DATE,
        this?.lastOrderUpdate.orEmpty() ?? EMPTY,
        this?.createDate.orDate() ?? DATE,
        this?.status?.name.orEmpty() ?? EMPTY,
        this?.totalAmount.orNum().toDouble() ?? ZEROPOINTZERO,
        this?.userName.orEmpty() ?? EMPTY,
        this?.userPhoneNumber.orEmpty() ?? EMPTY,
        this
                ?.orderDetails
                ?.map((orderDetail) => orderDetail.toDomain())
                .toList() ??
            [],
        this?.state.orEmpty() ?? EMPTY,
        this!.paymentStatus?.name.orEmpty() ?? EMPTY,
        this?.paymentMethodId.orZero() ?? ZERO,
        this!.shippingAddress?.toDomain(),
        this!.billingAddress?.toDomain(),
        this?.isShippingOnCustomer.orFalse() ?? FALSE,
        this?.shippingCharges.orNum().toDouble() ?? ZEROPOINTZERO,
        this?.totalGrossAmount.orNum() ?? ZEROPOINTZERO,
        this?.oldGrossAmount.orNum() ?? ZEROPOINTZERO,
        this?.fulfilledAmount.orNum() ?? ZEROPOINTZERO,
        this?.deliveryCode.orEmpty() ?? EMPTY,
        this?.isEligibleForOffer.orFalse() ?? FALSE,
        this?.unitList?.map((unit) => unit.toDomain()).toList() ?? [],
        this?.orderCouponDiscount.orNum() ?? ZEROPOINTZERO,
        this?.additionalDeliveryCharge.orNum() ?? ZEROPOINTZERO,
        this?.packingEstimate.orDate() ?? DATE,
        this?.expectedDeliveryDate.orDate() ?? DATE,
        this?.otp.orEmpty() ?? EMPTY,
        this?.isDeleted.orFalse() ?? FALSE,
        this?.gstiN_Number.orNum() ?? ZEROPOINTZERO,
        this?.org_Name.orEmpty() ?? EMPTY,
        this?.uniqueCode.orEmpty() ?? EMPTY,
        this?.storeId.orNum() ?? ZERO,
        this?.deliveryBoyName.orEmpty() ?? EMPTY,
        this?.phoneNumber.orEmpty() ?? EMPTY,
        this?.shipmentId.orNum() ?? ZERO,
        this?.orderShippingNotes.orEmpty() ?? EMPTY);
  }
}

extension TransactionByOrderIdResponseMapper on TransactionByOrderIdResponse? {
  TransactionByOrderId toDomain() {
    return TransactionByOrderId(
        this?.id.orZero() ?? ZERO,
        this?.refrenceNo.orEmpty() ?? EMPTY,
        this?.paymentDate.orDate() ?? DATE,
        this?.amount.orNum() ?? ZEROPOINTZERO,
        this?.paymentType?.name.orEmpty() ?? EMPTY,
        this?.refundReason.orEmpty() ?? EMPTY,
        this?.transactionType.orEmpty() ?? EMPTY,
        this?.paymentMethodName.orEmpty() ?? EMPTY,
        this?.paymentMethodTypeId.orZero() ?? ZERO,
        this?.paymentMethodTypeName.orEmpty() ?? EMPTY,
        this?.paymentProcessStatus?.name.orEmpty() ?? EMPTY);
  }
}

extension SourceAddressResponseMapper on SourceAddressResponse? {
  SourceAddress toDomain() {
    return SourceAddress(
        this?.sourceVillage.orEmpty() ?? EMPTY,
        this?.sourcePincode.orEmpty() ?? EMPTY,
        this?.sourceState.orEmpty() ?? EMPTY,
        this?.sourcePhoneNumberTwo.orEmpty() ?? EMPTY,
        this?.address.orEmpty() ?? EMPTY,
        this?.sourcePhoneNumberOne.orEmpty() ?? EMPTY,
        this?.sourceDistrict.orEmpty() ?? EMPTY);
  }
}

extension ShipmentModelResponseMapper on ShipmentModelResponse? {
  ShipmentModel toDomain() {
    return ShipmentModel(
        this?.id.orZero() ?? ZERO,
        this?.shipmentId.orZero() ?? ZERO,
        this?.orderId.orZero() ?? ZERO,
        this?.deliveryAmount.orNum() ?? ZEROPOINTZERO,
        this?.deliveryDate.orDate() ?? DATE,
        this?.parsalHight.orNum() ?? ZEROPOINTZERO,
        this?.parsalWidth.orNum() ?? ZEROPOINTZERO,
        this?.parsalDepth.orNum() ?? ZEROPOINTZERO,
        this?.parcelWeight.orNum() ?? ZEROPOINTZERO,
        this?.parcelLength.orNum() ?? ZEROPOINTZERO,
        this?.notes.orEmpty() ?? EMPTY,
        this?.trackingLink.orEmpty() ?? EMPTY,
        this?.invoiceLink.orEmpty() ?? EMPTY,
        this?.providerName.orEmpty() ?? EMPTY,
        this?.uniqueId.orEmpty() ?? EMPTY,
        this?.status.name.orEmpty() ?? EMPTY,
        this?.isCOD.orFalse() ?? FALSE,
        this?.sourceAddress.toDomain());
  }
}

extension OrderListingModelResponseMapper on OrderListingModelResponse? {
  OrderListingModel toDomain() {
    return OrderListingModel(
        this?.id.orZero() ?? ZERO,
        this?.customerName.orEmpty() ?? EMPTY,
        this?.totalAmount.orNum() ?? ZEROPOINTZERO,
        this?.fulfilledTotalAmount.orNum() ?? ZEROPOINTZERO,
        this?.orderQuantity.orNum() ?? ZEROPOINTZERO,
        this?.orderPrice.orNum() ?? ZEROPOINTZERO,
        this?.orderFulfilledQuantity.orNum() ?? ZEROPOINTZERO,
        this?.orderDate.orDate() ?? DATE,
        this?.orderStatus?.name.orEmpty() ?? EMPTY,
        this?.orderStatusUpdateDate.orDate() ?? DATE,
        this?.unit.orEmpty() ?? EMPTY,
        this?.photoUrl.orEmpty() ?? EMPTY,
        this?.orderNo.orEmpty() ?? EMPTY,
        this?.isWalkInCustomer.orFalse() ?? FALSE,
        this?.notes.orEmpty() ?? EMPTY,
        this?.orderType?.name.orEmpty() ?? EMPTY,
        this?.paymentStatus?.name.orEmpty() ?? EMPTY,
        this?.paymentMethodId.orNum() ?? ZEROPOINTZERO,
        this?.refundedAmount.orNum() ?? ZEROPOINTZERO,
        this?.storeURL.orEmpty() ?? EMPTY,
        this?.totalCount.orNum() ?? ZEROPOINTZERO,
        this?.organizationId.orNum() ?? ZEROPOINTZERO,
        this?.viewOrderLink.orEmpty() ?? EMPTY,
        this?.orderDiscount.orNum() ?? ZEROPOINTZERO,
        this?.finalTotalAmount.orNum() ?? ZEROPOINTZERO,
        this?.isShippingOnCustomer.orFalse() ?? FALSE,
        this?.shippingCharge.orNum() ?? ZEROPOINTZERO,
        this?.additionalDeliveryCharge.orNum() ?? ZEROPOINTZERO,
        this?.promotionalOrderDiscount.orNum() ?? ZEROPOINTZERO);
  }
}

extension FeedbackModelResponseMapper on FeedbackModelResponse? {
  FeedbackModel toDomain() {
    return FeedbackModel(
        this?.title.orEmpty() ?? EMPTY,
        this?.description.orEmpty() ?? EMPTY,
        this?.rating.orNum().toDouble() ?? ZEROPOINTZERO);
  }
}
