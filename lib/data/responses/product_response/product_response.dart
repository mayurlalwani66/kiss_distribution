import 'package:json_annotation/json_annotation.dart';

import '../../../app/functions.dart';
import '../coupon_discount/coupon_discount.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductListViewModelResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "productBatchNo")
  String? productBatchNo;
  @JsonKey(name: "productName")
  String? productName;
  @JsonKey(name: "brandName")
  String? brandName;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "oldPrice")
  num? oldPrice;
  @JsonKey(name: "availableStock")
  num? availableStock;
  @JsonKey(name: "commitedStock")
  num? commitedStock;
  @JsonKey(name: "unit")
  String? unit;
  @JsonKey(name: "photoUrl")
  String? photoUrl;
  @JsonKey(name: "isPublished")
  bool? isPublished;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "productNo")
  String? productNo;
  @JsonKey(name: "slugName")
  String? slugName;
  @JsonKey(name: "minimumCartQuantity")
  num? minimumCartQuantity;
  @JsonKey(name: "maximumCartQuantity")
  num? maximumCartQuantity;
  @JsonKey(name: "weight")
  num? weight;
  @JsonKey(name: "tax")
  num? tax;
  @JsonKey(name: "hypolocalDiscountId")
  int? hypolocalDiscountId;
  @JsonKey(name: "hypolocalDiscount")
  num? hypolocalDiscount;
  @JsonKey(name: "discountValue")
  num? discountValue;
  @JsonKey(name: "discountedPrice")
  num? discountedPrice;
  @JsonKey(name: "baseCombinationPrice")
  double? baseCombinationPrice;
  @JsonKey(name: "baseCombinationName")
  String? baseCombinationName;
  @JsonKey(name: "inventoryStock")
  num? inventoryStock;
  @JsonKey(name: "allowTracking")
  bool? allowTracking;
  @JsonKey(name: "allowNegetive")
  bool? allowNegetive;
  @JsonKey(name: "isTierPriceProduct")
  bool? isTierPriceProduct;
  @JsonKey(name: "isAttributeOrCombinationProduct")
  bool? isAttributeOrCombinationProduct;
  @JsonKey(name: "selectedProductUnit")
  UnitListModelResponse? selectedProductUnit;
  @JsonKey(name: "allowDecimal")
  bool? allowDecimal;
  @JsonKey(name: "stepQuantity")
  num? stepQuantity;
  @JsonKey(name: "stepUnit")
  num? stepUnit;
  @JsonKey(name: "isProductAvailable")
  bool? isProductAvailable;
  @JsonKey(name: "hasRelatedProducts")
  bool? hasRelatedProducts;
  @JsonKey(name: "getProductDiscounts")
  List<CouponDiscountResponse>? getProductDiscounts;
  @JsonKey(name: "type")
  ProductType? type;
  @JsonKey(name: "inventoryStatus")
  String? inventoryStatus;
  @JsonKey(name: "isShowErrorMinCartQtyError")
  bool? isShowErrorMinCartQtyError;
  @JsonKey(name: "isShowErrorMaxCartQtyError")
  bool? isShowErrorMaxCartQtyError;
  @JsonKey(name: "cartQty")
  int? cartQty;

  ProductListViewModelResponse(
    this.id,
    this.productBatchNo,
    this.productName,
    this.brandName,
    this.price,
    this.oldPrice,
    this.availableStock,
    this.commitedStock,
    this.unit,
    this.photoUrl,
    this.isPublished,
    this.status,
    this.productNo,
    this.slugName,
    this.minimumCartQuantity,
    this.maximumCartQuantity,
    this.weight,
    this.tax,
    this.hypolocalDiscountId,
    this.hypolocalDiscount,
    this.discountValue,
    this.discountedPrice,
    this.baseCombinationPrice,
    this.baseCombinationName,
    this.inventoryStock,
    this.allowTracking,
    this.allowNegetive,
    this.isTierPriceProduct,
    this.isAttributeOrCombinationProduct,
    this.selectedProductUnit,
    this.allowDecimal,
    this.stepQuantity,
    this.stepUnit,
    this.isProductAvailable,
    this.hasRelatedProducts,
    this.getProductDiscounts,
    this.type,
    this.inventoryStatus,
    this.isShowErrorMinCartQtyError,
    this.isShowErrorMaxCartQtyError,
  );

  factory ProductListViewModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListViewModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListViewModelResponseToJson(this);
}

@JsonSerializable()
class UnitListModelResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "isCustom")
  bool? isCustom;
  @JsonKey(name: "group")
  String? group;
  @JsonKey(name: "adjustQuantity")
  int? adjustQuantity;
  @JsonKey(name: "parentUnitId")
  int? parentUnitId;
  @JsonKey(name: "parentId")
  int? parentId;

  UnitListModelResponse(
    this.id,
    this.name,
    this.isCustom,
    this.group,
    this.adjustQuantity,
    this.parentUnitId,
    this.parentId,
  );

  factory UnitListModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitListModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitListModelResponseToJson(this);
}
