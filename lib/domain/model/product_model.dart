import 'coupon_discount_model.dart';

class ProductViewModel {
  final int cartQty;
  int id;
  String productBatchNo;
  String productName;
  String brandName;
  double price;
  num oldPrice;
  num availableStock;
  num committedStock;
  String unit;
  String photoUrl;
  bool isPublished;
  String status;
  String productNo;
  String slugName;
  num minimumCartQuantity;
  num maximumCartQuantity;
  num weight;
  double tax;
  int hypolocalDiscountId;
  num hypolocalDiscount;
  num discountValue;
  num discountedPrice;
  double baseCombinationPrice;
  String baseCombinationName;
  num inventoryStock;
  bool allowTracking;
  bool allowNegative;
  bool isTierPriceProduct;
  bool isAttributeOrCombinationProduct;
  UnitListModel? selectedProductUnit;
  bool allowDecimal;
  num stepQuantity;
  num stepUnit;
  bool isProductAvailable;
  bool hasRelatedProducts;
  List<CouponDiscount>? getProductDiscounts;
  String type;
  String inventoryStatus;
  bool isShowErrorMinCartQtyError;
  bool isShowErrorMaxCartQtyError;

  ProductViewModel(
      this.id,
      this.productBatchNo,
      this.productName,
      this.brandName,
      this.price,
      this.oldPrice,
      this.availableStock,
      this.committedStock,
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
      this.allowNegative,
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
      this.cartQty);

  ProductViewModel copyWith({
    int? cartQty,
    int? id,
    String? productBatchNo,
    String? productName,
    String? brandName,
    double? price,
    num? oldPrice,
    num? availableStock,
    num? committedStock,
    String? unit,
    String? photoUrl,
    bool? isPublished,
    String? status,
    String? productNo,
    String? slugName,
    num? minimumCartQuantity,
    num? maximumCartQuantity,
    num? weight,
    double? tax,
    int? hypolocalDiscountId,
    num? hypolocalDiscount,
    num? discountValue,
    num? discountedPrice,
    double? baseCombinationPrice,
    String? baseCombinationName,
    num? inventoryStock,
    bool? allowTracking,
    bool? allowNegative,
    bool? isTierPriceProduct,
    bool? isAttributeOrCombinationProduct,
    UnitListModel? selectedProductUnit,
    bool? allowDecimal,
    num? stepQuantity,
    num? stepUnit,
    bool? isProductAvailable,
    bool? hasRelatedProducts,
    List<CouponDiscount>? getProductDiscounts,
    String? type,
    String? inventoryStatus,
    bool? isShowErrorMinCartQtyError,
    bool? isShowErrorMaxCartQtyError,
  }) {
    return ProductViewModel(
      id ?? this.id,
      productBatchNo ?? this.productBatchNo,
      productName ?? this.productName,
      brandName ?? this.brandName,
      price ?? this.price,
      oldPrice ?? this.oldPrice,
      availableStock ?? this.availableStock,
      committedStock ?? this.committedStock,
      unit ?? this.unit,
      photoUrl ?? this.photoUrl,
      isPublished ?? this.isPublished,
      status ?? this.status,
      productNo ?? this.productNo,
      slugName ?? this.slugName,
      minimumCartQuantity ?? this.minimumCartQuantity,
      maximumCartQuantity ?? this.maximumCartQuantity,
      weight ?? this.weight,
      tax ?? this.tax,
      hypolocalDiscountId ?? this.hypolocalDiscountId,
      hypolocalDiscount ?? this.hypolocalDiscount,
      discountValue ?? this.discountValue,
      discountedPrice ?? this.discountedPrice,
      baseCombinationPrice ?? this.baseCombinationPrice,
      baseCombinationName ?? this.baseCombinationName,
      inventoryStock ?? this.inventoryStock,
      allowTracking ?? this.allowTracking,
      allowNegative ?? this.allowNegative,
      isTierPriceProduct ?? this.isTierPriceProduct,
      isAttributeOrCombinationProduct ?? this.isAttributeOrCombinationProduct,
      selectedProductUnit ?? this.selectedProductUnit,
      allowDecimal ?? this.allowDecimal,
      stepQuantity ?? this.stepQuantity,
      stepUnit ?? this.stepUnit,
      isProductAvailable ?? this.isProductAvailable,
      hasRelatedProducts ?? this.hasRelatedProducts,
      getProductDiscounts ?? this.getProductDiscounts,
      type ?? this.type,
      inventoryStatus ?? this.inventoryStatus,
      isShowErrorMinCartQtyError ?? this.isShowErrorMinCartQtyError,
      isShowErrorMaxCartQtyError ?? this.isShowErrorMaxCartQtyError,
      cartQty ?? this.cartQty,
    );
  }
}

class UnitListModel {
  int id;
  String name;
  bool isCustom;
  String group;
  int adjustQuantity;
  int parentUnitId;
  int parentId;

  UnitListModel(
    this.id,
    this.name,
    this.isCustom,
    this.group,
    this.adjustQuantity,
    this.parentUnitId,
    this.parentId,
  );
}
