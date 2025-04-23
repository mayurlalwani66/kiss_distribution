import 'coupon_discount_model.dart';

class ProductViewModel {
  int cartQty;
  int id;
  String productBatchNo;
  String productName;
  String brandName;
  double price;
  num oldPrice;
  num availableStock;
  num commitedStock;
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
  bool allowNegetive;
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
      this.cartQty);
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
