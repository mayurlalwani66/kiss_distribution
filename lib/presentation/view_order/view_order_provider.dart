import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/di.dart';
import 'package:k_distribution/domain/usecase/order_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/functions.dart';
import '../common/freezed_data_class/freezed_data_class.dart';

class ViewOrderNotifier extends StateNotifier<AsyncValue<ViewOrderState>> {
  final ViewOrderUseCase _viewOrderUseCase;
  final CancelOrderUseCase _cancelOrderUseCase;
  final TransactionByOrderIdUseCase _transactionByOrderIdUseCase;
  final ShipmentByIdUseCase _shipmentByIdUseCase;
  final FeedbackUseCase _feedbackUseCase;

  ViewOrderNotifier(
    this._viewOrderUseCase,
    this._cancelOrderUseCase,
    this._transactionByOrderIdUseCase,
    this._shipmentByIdUseCase,
    this._feedbackUseCase,
  ) : super(const AsyncValue.loading());

  Future<void> getOrderById(String id) async {
    final result = await _viewOrderUseCase.execute(id);
    state = AsyncValue.loading();

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      final updatedOrder = data;

      if (updatedOrder.fulfilledAmount > 0) {
        updatedOrder.totalGrossAmount = updatedOrder.orderDetails
            .map((e) => e.fulfilledAmount)
            .fold(0.0, (a, b) => a + b);
      } else {
        updatedOrder.totalGrossAmount = updatedOrder.orderDetails
            .where((e) =>
                e.status != 'Cancelled' && updatedOrder.status != 'Cancelled')
            .map((e) => e.finalPrice)
            .fold(0.0, (a, b) => a + b);
      }

      // Compute oldGrossAmount
      updatedOrder.oldGrossAmount = updatedOrder.orderDetails
          .map((e) => (e.orderedQuantity)! * (e.price))
          .fold(0.0, (a, b) => a + b);

      // Update each order detail
      updatedOrder.orderDetails = updatedOrder.orderDetails.map((orderDetail) {
        final quantity = orderDetail.status == 'Cancelled'
            ? (orderDetail.orderedQuantity)
            : (orderDetail.orderFulfilledQuantity ??
                orderDetail.orderedQuantity);

        orderDetail.totalPrice = (orderDetail.price) * quantity!;

        final matchingUnits = updatedOrder.unitList
            .where((u) => u.group == orderDetail.selectedUnit?.group)
            .toList();

        orderDetail.displayOrderedQuantity = getDisplayUnit(
          matchingUnits,
          orderDetail.orderedQuantity ?? 0,
        );

        orderDetail.displayOrderFulfilledQuantity = getDisplayUnit(
          matchingUnits,
          orderDetail.orderFulfilledQuantity ?? 0,
        );

        return orderDetail;
      }).toList();

      // Update state
      final current = state.valueOrNull ?? const ViewOrderState();
      state = AsyncValue.data(current.copyWith(viewOrder: updatedOrder));
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');
    final Uri phoneUri = Uri(scheme: 'tel', path: '+91$cleanNumber');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $phoneUri');
    }
  }

  Future<void> makeEmail(String phoneNumber) async {
    final cleanEmail = phoneNumber.replaceAll(RegExp(r'\s+'), '');
    final Uri phoneUri = Uri(scheme: 'mailto', path: cleanEmail);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $phoneUri');
    }
  }

  Future<void> cancelOrder(int id, int orderid) async {
    final result = await _cancelOrderUseCase
        .execute(CancelOrderUseCaseInput(orderid, [id], ""));

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      print(data);
    });
  }

  Future<void> getTransactionByOrderId(String id) async {
    final result = await _transactionByOrderIdUseCase.execute(id);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      final current = state.valueOrNull ?? const ViewOrderState();
      state = AsyncValue.data(current.copyWith(listTransactionById: data));
    });
  }

  Future<void> getShipmentById(String id) async {
    final result = await _shipmentByIdUseCase.execute(id);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      final current = state.valueOrNull ?? const ViewOrderState();
      state = AsyncValue.data(current.copyWith(shipmentModel: data));
    });
  }

  Future<void> createFeedback(FeedbackUseCaseInput request) async {
    final result = await _feedbackUseCase.execute(request);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      print(data);
    });
  }

  int getShipmentId() {
    return state.asData?.value.viewOrder?.shipmentId.toInt() ?? 0;
  }
}

final viewOrderProvider = StateNotifierProvider.autoDispose<ViewOrderNotifier,
    AsyncValue<ViewOrderState>>((ref) {
  return ViewOrderNotifier(
    ref.read(viewOrderUseCaseProvider),
    ref.watch(cancelOrderUseCaseProvider),
    ref.watch(transactionByOrderIdUseCaseProvider),
    ref.watch(shipmentByIdUseCaseProvider),
    ref.watch(feedbackUseCaseProvider),
  );
});
