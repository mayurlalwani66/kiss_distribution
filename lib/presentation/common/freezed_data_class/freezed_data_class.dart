import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:k_distribution/domain/model/order_model.dart';

import '../../../domain/model/product_model.dart';
import '../../../domain/model/user_model.dart';
part 'freezed_data_class.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<ProductViewModel> products,
    @Default([]) List<ShippingCharge> shippingCharges,
    @Default([]) List<PaymentMethod> paymentMethods,
    @Default([]) List<ShippingAddress> shippingAddresses,
    @Default(false) bool screenLoader,
    CreateOrderResponse? createOrderResponse,
  }) = _HomePageState;
}

@freezed
abstract class ShippingState with _$ShippingState {
  const factory ShippingState({
    @Default([]) List<ShippingAddress> shippingAddresses,
    @Default([]) List<States> states,
    ShippingAddress? selectedAddress,
    @Default(false) bool screenLoader,
  }) = _ShippingState;
}

@freezed
abstract class ViewOrderState with _$ViewOrderState {
  const factory ViewOrderState({
    ViewOrder? viewOrder,
    @Default([]) List<TransactionByOrderId> listTransactionById,
    ShipmentModel? shipmentModel,
  }) = _ViewOrderState;
}
