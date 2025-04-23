import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/di.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/domain/usecase/order_usecase.dart';

class OrderListNotifier
    extends StateNotifier<AsyncValue<List<OrderListingModel>>> {
  final AllOrdersUseCase _allOrdersUseCase;
  OrderListNotifier(this._allOrdersUseCase) : super(const AsyncValue.loading());

  Future<void> getAllMyOrders() async {
    final result = await _allOrdersUseCase
        .execute(AllOrdersUseCaseInput(1, 1000, "", 'desc', "", ""));

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      state = AsyncValue.data(data);
    });
  }
}

final orderListProvider = StateNotifierProvider<OrderListNotifier,
    AsyncValue<List<OrderListingModel>>>((ref) {
  return OrderListNotifier(ref.watch(allOrdersUseCaseProvider));
});
