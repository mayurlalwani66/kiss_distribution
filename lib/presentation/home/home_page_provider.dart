import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/extension.dart';
import 'package:k_distribution/data/mapper/user_mapper.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/domain/model/user_model.dart';
import 'package:k_distribution/domain/usecase/order_usecase.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:k_distribution/presentation/common/common_provider/shipping_provider.dart';
import 'package:k_distribution/presentation/common/freezed_data_classes/freezed_data_class.dart';

import '../../app/di.dart';
import '../../data/request/request.dart';
import '../../domain/model/product_model.dart';
import '../../domain/usecase/product_usecase.dart';
import '../common/common_provider/form_data_provider.dart';

class HomePageNotifier extends StateNotifier<AsyncValue<HomePageState>> {
  final Ref ref;
  final List<AddToCartReqModel> cartItems = [];

  HomePageNotifier(this.ref) : super(const AsyncValue.loading());

  Future<void> getAllProducts(ProductUseCaseInput input) async {
    state = const AsyncValue.loading();
    final result = await ref.read(productUseCaseProvider).execute(input);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (products) {
        final current = state.valueOrNull ?? const HomePageState();
        state = AsyncValue.data(current.copyWith(products: products));
      },
    );
  }

// Future Get shipping Charges
  Future<void> getAllShippingCharges() async {
    final result = await ref.read(shippingChargeUseCaseProvider).execute(
        ShippingChargeInput(getTotalWeight(), getTotalAmount(),
            ref.read(formDataStoreProvider).shippingAppId));

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (charges) {
        final current = state.valueOrNull ?? const HomePageState();
        state = AsyncValue.data(current.copyWith(shippingCharges: charges));
      },
    );
  }

// Future get all payment methods
  Future<void> getAllPaymentMethods(String area) async {
    final result = await ref.read(paymentMethodUseCaseProvider).execute(area);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (methods) {
        final current = state.valueOrNull ?? const HomePageState();
        state = AsyncValue.data(current.copyWith(paymentMethods: methods));

        for (var method in methods) {
          final int id = ref.watch(formDataStoreProvider).offlinePaymentAppId;

          if (id == method.id) {
            ref.watch(appPreferencesProvider).setPaymentType(method.type);
          }
        }
      },
    );
  }

  void updateCart(ProductViewModel product) {
    final index = cartItems.indexWhere((item) => item.productId == product.id);

    if (product.cartQty > 0) {
      final itemTotal = product.price * product.cartQty;
      final taxAmount = itemTotal * product.tax / 100;
      final totalAmount = itemTotal + taxAmount;

      final cartItem = AddToCartReqModel(
          product.id,
          product.cartQty,
          "",
          [],
          totalAmount.roundToTwo(),
          null,
          null,
          product.type,
          product.hasRelatedProducts,
          product.weight * product.cartQty);

      if (index != -1) {
        cartItems[index] = cartItem;
      } else {
        cartItems.add(cartItem);
      }
    } else {
      if (index != -1) {
        cartItems.removeAt(index);
      }
    }
  }

// Future create my order
  Future<void> createOrderApi() async {
    final String? serviceCode = getShippingChargeProperty((x) => x.serviceCode);
    final String? deliveryTime =
        getShippingChargeProperty((x) => x.deliveryTime);

    final selectedAddress =
        ref.read(shippingAddressProvider).asData?.value.selectedAddress;
    if (selectedAddress == null) {
      state = AsyncValue.error("No address selected", StackTrace.current);
      return;
    }

    final result = await ref.read(createOrderUseCaseProvider).execute(
        CreateOrderUseCaseInput(
            getOrderType(),
            selectedAddress.toResponse(),
            selectedAddress.toResponse(),
            0,
            "",
            0,
            getGrandTotal().roundToTwo(),
            getOrderDetails(),
            ref.watch(formDataStoreProvider).offlinePaymentAppId,
            ref.read(appPreferencesProvider).getPaymentType(),
            null,
            getShippingCharge(),
            ref.watch(formDataStoreProvider).shippingAppId,
            ShippingNotes(deliveryTime, serviceCode),
            null,
            null,
            null));

    print(result);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      final current = state.valueOrNull ?? const HomePageState();
      state = AsyncValue.data(current.copyWith(createOrderResponse: data));
    });
  }

  int getOrderId() {
    int orderId = 0;

    state.whenData((homePageState) {
      orderId = homePageState.createOrderResponse?.orderId ?? 0;
    });

    return orderId;
  }

  List<MyOrderDetails> getOrderDetails() {
    return cartItems.map((cartItem) {
      return MyOrderDetails(
        cartItem.productId,
        cartItem.quantity,
        cartItem.totalAmount,
      );
    }).toList();
  }

  OrderTypeEnum getOrderType() {
    final integrationName = getShippingChargeProperty((x) => x.integrationName);
    if (integrationName.toUpperCase() == "LOCAL PICKUP") {
      return OrderTypeEnum.Pickup;
    } else {
      return OrderTypeEnum.Delivery;
    }
  }

  void increment(int productId) {
    state = state.whenData((homePageState) {
      homePageState.products.map((product) {
        if (product.id == productId) {
          product.cartQty++;
          updateCart(product);
        }
        return product;
      }).toList();
      return homePageState;
    });
  }

  void decrement(int productId) {
    state = state.whenData((homePageState) {
      homePageState.products.map((product) {
        if (product.id == productId && product.cartQty > 0) {
          product.cartQty--;
          updateCart(product);
        }
        return product;
      }).toList();
      return homePageState;
    });
  }

  double getSingleProductTotalAmount(int productId) {
    final product =
        state.asData?.value.products.firstWhere((p) => p.id == productId);

    if (product == null || product.cartQty <= 0) return 0.0;

    final itemTotal = product.price * product.cartQty;
    final taxAmount = itemTotal * product.tax / 100;
    return itemTotal + taxAmount;
  }

  double getTotalAmount() {
    double totalAmount = 0.0;

    state.whenData((homePageState) {
      final products = homePageState.products;
      for (var product in products) {
        if (product.cartQty > 0) {
          final itemTotal = product.price * product.cartQty;
          final taxAmount = itemTotal * product.tax / 100;
          totalAmount += itemTotal + taxAmount;
        }
      }
    });

    return totalAmount;
  }

  void resetCartQuantities() {
    state = state.whenData((homePageState) {
      for (var product in homePageState.products) {
        product.cartQty = 0;
      }
      return homePageState;
    });
  }

  double getTotalWeight() {
    double totalWeight = 0.0;

    state.whenData((homePageState) {
      final products = homePageState.products;
      for (var product in products) {
        if (product.cartQty > 0) {
          totalWeight += product.cartQty * product.weight;
        }
      }
    });

    return totalWeight;
  }

  int getTotalItems() {
    return state.asData?.value.products.where((p) => p.cartQty > 0).length ?? 0;
  }

  double getShippingCharge() {
    return state.asData?.value.shippingCharges
            .firstWhere((x) =>
                x.integrationId ==
                ref.watch(formDataStoreProvider).shippingAppId)
            .deliveryCharge ??
        0.0;
  }

  double getGrandTotal() {
    return getTotalAmount() + getShippingCharge();
  }

  T getShippingChargeProperty<T>(T Function(ShippingCharge) selector) {
    final charge = state.asData?.value.shippingCharges.firstWhere(
      (x) => x.integrationId == ref.watch(formDataStoreProvider).shippingAppId,
    );

    if (charge == null) return defaultValue<T>();
    return selector(charge);
  }

  void prefillCartQuantities(List<OrderDetails> reorderedProducts) {
    for (var item in reorderedProducts) {
      state = state.whenData((homePageState) {
        for (var product in homePageState.products) {
          if (product.id == item.productId) {
            product.cartQty = item.orderedQuantity.toInt();
            print("sdsdsdsd=> ${product.cartQty}");
          }
        }
        return homePageState;
      });
    }
  }

  T defaultValue<T>() {
    if (T == double) return 0.0 as T;
    if (T == int) return 0 as T;
    if (T == String) return "" as T;
    if (T == bool) return false as T;
    throw UnimplementedError("No default fallback for type $T");
  }
}

final homePageProvider =
    StateNotifierProvider<HomePageNotifier, AsyncValue<HomePageState>>((ref) {
  return HomePageNotifier(ref);
});
