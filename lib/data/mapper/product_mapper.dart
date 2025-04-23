import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/data/mapper/auth_mapper.dart';
import 'package:k_distribution/data/responses/coupon_discount/coupon_discount.dart';
import 'package:k_distribution/data/responses/product_response/product_response.dart';
import 'package:k_distribution/domain/model/coupon_discount_model.dart';

import '../../domain/model/product_model.dart';
// import '../responses/base_response/base_response.dart';

extension UnitListModelResponseMapper on UnitListModelResponse? {
  UnitListModel toDomain() {
    return UnitListModel(
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.isCustom.orFalse() ?? FALSE,
      this?.group.orEmpty() ?? EMPTY,
      this?.adjustQuantity.orZero() ?? ZERO,
      this?.parentUnitId.orZero() ?? ZERO,
      this?.parentId.orZero() ?? ZERO,
    );
  }
}

extension CouponDiscountResponseMapper on CouponDiscountResponse? {
  CouponDiscount toDomain() {
    return CouponDiscount(
      this?.couponId.orZero() ?? ZERO,
      this?.couponCode.orEmpty() ?? EMPTY,
      this?.description.orEmpty() ?? EMPTY,
      this?.name.orEmpty() ?? EMPTY,
      this?.type.orEmpty() ?? EMPTY,
      this?.maxDiscountAmount.orNum() ?? ZEROPOINTZERO,
      this?.discountType.orEmpty() ?? EMPTY,
      this?.discountValue.orNum() ?? ZEROPOINTZERO,
      this?.isNotApplicable.orFalse() ?? FALSE,
      this!.productIds?.map((id) => id.toInt()).toList() ?? [],
      this?.onOrderDiscount.orFalse() ?? FALSE,
      this?.isDeliveryChargeIncluded.orFalse() ?? FALSE,
      this?.minOrderAmount.orNum() ?? ZERO,
      this?.validFrom.orDate() ?? DATE,
      this?.validTo.orDate() ?? DATE,
      this?.renewInDays.orZero() ?? ZERO,
      this?.showDetail.orFalse() ?? FALSE,
    );
  }
}

extension ProductListViewModelResponseMapper on ProductListViewModelResponse? {
  ProductViewModel toDomain() {
    return ProductViewModel(
        this?.id.orZero() ?? ZERO,
        this?.productBatchNo.orEmpty() ?? EMPTY,
        this?.productName.orEmpty() ?? EMPTY,
        this?.brandName.orEmpty() ?? EMPTY,
        this?.price.orZeroPointZero() ?? ZEROPOINTZERO,
        this?.oldPrice.orNum() ?? ZEROPOINTZERO,
        this?.availableStock.orNum() ?? ZEROPOINTZERO,
        this?.commitedStock.orNum() ?? ZEROPOINTZERO,
        this?.unit.orEmpty() ?? EMPTY,
        this?.photoUrl.orEmpty() ?? EMPTY,
        this?.isPublished.orFalse() ?? FALSE,
        this?.status.orEmpty() ?? EMPTY,
        this?.productNo.orEmpty() ?? EMPTY,
        this?.slugName.orEmpty() ?? EMPTY,
        this?.minimumCartQuantity.orNum() ?? ZEROPOINTZERO,
        this?.maximumCartQuantity.orNum() ?? ZEROPOINTZERO,
        this?.weight.orNum() ?? ZEROPOINTZERO,
        this?.tax.orNum().toDouble() ?? ZEROPOINTZERO,
        this?.hypolocalDiscountId.orZero() ?? ZERO,
        this?.hypolocalDiscount.orNum() ?? ZEROPOINTZERO,
        this?.discountValue.orNum() ?? ZEROPOINTZERO,
        this?.discountedPrice.orNum() ?? ZEROPOINTZERO,
        this?.baseCombinationPrice.orZeroPointZero() ?? ZEROPOINTZERO,
        this?.baseCombinationName.orEmpty() ?? EMPTY,
        this?.inventoryStock.orNum() ?? ZEROPOINTZERO,
        this?.allowTracking.orFalse() ?? FALSE,
        this?.allowNegetive.orFalse() ?? FALSE,
        this?.isTierPriceProduct.orFalse() ?? FALSE,
        this?.isAttributeOrCombinationProduct.orFalse() ?? FALSE,
        this?.selectedProductUnit?.toDomain(),
        this?.allowDecimal.orFalse() ?? FALSE,
        this?.stepQuantity.orNum() ?? ZEROPOINTZERO,
        this?.stepUnit.orNum() ?? ZEROPOINTZERO,
        this?.isProductAvailable.orFalse() ?? FALSE,
        this?.hasRelatedProducts.orFalse() ?? FALSE,
        (this?.getProductDiscounts?.map((discount) => discount.toDomain()) ??
                Iterable.empty())
            .cast<CouponDiscount>()
            .toList(),
        this?.type?.name.orEmpty() ?? EMPTY,
        this?.inventoryStatus.orEmpty() ?? EMPTY,
        this?.isShowErrorMinCartQtyError.orFalse() ?? FALSE,
        this?.isShowErrorMaxCartQtyError.orFalse() ?? FALSE,
        this?.cartQty.orZero() ?? ZERO);
  }
}
