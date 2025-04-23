// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListViewModelResponse _$ProductListViewModelResponseFromJson(
        Map<String, dynamic> json) =>
    ProductListViewModelResponse(
      (json['id'] as num?)?.toInt(),
      json['productBatchNo'] as String?,
      json['productName'] as String?,
      json['brandName'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['oldPrice'] as num?,
      json['availableStock'] as num?,
      json['commitedStock'] as num?,
      json['unit'] as String?,
      json['photoUrl'] as String?,
      json['isPublished'] as bool?,
      json['status'] as String?,
      json['productNo'] as String?,
      json['slugName'] as String?,
      json['minimumCartQuantity'] as num?,
      json['maximumCartQuantity'] as num?,
      json['weight'] as num?,
      json['tax'] as num?,
      (json['hypolocalDiscountId'] as num?)?.toInt(),
      json['hypolocalDiscount'] as num?,
      json['discountValue'] as num?,
      json['discountedPrice'] as num?,
      (json['baseCombinationPrice'] as num?)?.toDouble(),
      json['baseCombinationName'] as String?,
      json['inventoryStock'] as num?,
      json['allowTracking'] as bool?,
      json['allowNegetive'] as bool?,
      json['isTierPriceProduct'] as bool?,
      json['isAttributeOrCombinationProduct'] as bool?,
      json['selectedProductUnit'] == null
          ? null
          : UnitListModelResponse.fromJson(
              json['selectedProductUnit'] as Map<String, dynamic>),
      json['allowDecimal'] as bool?,
      json['stepQuantity'] as num?,
      json['stepUnit'] as num?,
      json['isProductAvailable'] as bool?,
      json['hasRelatedProducts'] as bool?,
      (json['getProductDiscounts'] as List<dynamic>?)
          ?.map(
              (e) => CouponDiscountResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecodeNullable(_$ProductTypeEnumMap, json['type']),
      json['inventoryStatus'] as String?,
      json['isShowErrorMinCartQtyError'] as bool?,
      json['isShowErrorMaxCartQtyError'] as bool?,
    )..cartQty = (json['cartQty'] as num?)?.toInt();

Map<String, dynamic> _$ProductListViewModelResponseToJson(
        ProductListViewModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productBatchNo': instance.productBatchNo,
      'productName': instance.productName,
      'brandName': instance.brandName,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'availableStock': instance.availableStock,
      'commitedStock': instance.commitedStock,
      'unit': instance.unit,
      'photoUrl': instance.photoUrl,
      'isPublished': instance.isPublished,
      'status': instance.status,
      'productNo': instance.productNo,
      'slugName': instance.slugName,
      'minimumCartQuantity': instance.minimumCartQuantity,
      'maximumCartQuantity': instance.maximumCartQuantity,
      'weight': instance.weight,
      'tax': instance.tax,
      'hypolocalDiscountId': instance.hypolocalDiscountId,
      'hypolocalDiscount': instance.hypolocalDiscount,
      'discountValue': instance.discountValue,
      'discountedPrice': instance.discountedPrice,
      'baseCombinationPrice': instance.baseCombinationPrice,
      'baseCombinationName': instance.baseCombinationName,
      'inventoryStock': instance.inventoryStock,
      'allowTracking': instance.allowTracking,
      'allowNegetive': instance.allowNegetive,
      'isTierPriceProduct': instance.isTierPriceProduct,
      'isAttributeOrCombinationProduct':
          instance.isAttributeOrCombinationProduct,
      'selectedProductUnit': instance.selectedProductUnit,
      'allowDecimal': instance.allowDecimal,
      'stepQuantity': instance.stepQuantity,
      'stepUnit': instance.stepUnit,
      'isProductAvailable': instance.isProductAvailable,
      'hasRelatedProducts': instance.hasRelatedProducts,
      'getProductDiscounts': instance.getProductDiscounts,
      'type': _$ProductTypeEnumMap[instance.type],
      'inventoryStatus': instance.inventoryStatus,
      'isShowErrorMinCartQtyError': instance.isShowErrorMinCartQtyError,
      'isShowErrorMaxCartQtyError': instance.isShowErrorMaxCartQtyError,
      'cartQty': instance.cartQty,
    };

const _$ProductTypeEnumMap = {
  ProductType.previousOrder: 'previousOrder',
  ProductType.mostLoved: 'mostLoved',
  ProductType.menu: 'menu',
};

UnitListModelResponse _$UnitListModelResponseFromJson(
        Map<String, dynamic> json) =>
    UnitListModelResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['isCustom'] as bool?,
      json['group'] as String?,
      (json['adjustQuantity'] as num?)?.toInt(),
      (json['parentUnitId'] as num?)?.toInt(),
      (json['parentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UnitListModelResponseToJson(
        UnitListModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isCustom': instance.isCustom,
      'group': instance.group,
      'adjustQuantity': instance.adjustQuantity,
      'parentUnitId': instance.parentUnitId,
      'parentId': instance.parentId,
    };
