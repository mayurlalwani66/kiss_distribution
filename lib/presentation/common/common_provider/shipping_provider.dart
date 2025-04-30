import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/domain/model/user_model.dart';

import '../../../app/di.dart';
import '../../../domain/usecase/user_usecase.dart';
import '../freezed_data_class/freezed_data_class.dart';
import 'form_data_provider.dart';

class ShippingAddressNotifier extends StateNotifier<AsyncValue<ShippingState>> {
  final Ref ref;

  ShippingAddressNotifier(this.ref) : super(const AsyncValue.loading());

  Future<void> getAllShippingAddress() async {
    state = const AsyncValue.loading();

    final result = await ref.read(addressUseCaseProvider).execute(null);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (addresses) async {
        ShippingAddress? defaultAddress;

        try {
          for (final address in addresses) {
            if (address.isDefault == true) {
              defaultAddress = address;
              break;
            }
          }
        } catch (_) {
          defaultAddress = null;
        }

        state = AsyncValue.data(
          state.value?.copyWith(
                  shippingAddresses: addresses,
                  selectedAddress: defaultAddress) ??
              ShippingState(
                  shippingAddresses: addresses,
                  selectedAddress: defaultAddress),
        );
      },
    );
  }

  void setSelectedAddress(ShippingAddress address) {
    state = state.whenData(
      (data) => data.copyWith(selectedAddress: address),
    );
  }

  // Add shipping address method
  Future<void> addShippingAddress(AddShippingAddressInput input) async {
    state = const AsyncValue.loading();

    final result = await ref.watch(addAddressUseCaseProvider).execute(input);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (address) {
        ref.read(appPreferencesProvider).setAddressId(address.id!);

        final current = state.valueOrNull ?? ShippingState();
        final updatedAddresses = [...current.shippingAddresses, address];

        state = AsyncValue.data(
          current.copyWith(shippingAddresses: updatedAddresses),
        );
      },
    );
  }

  void updateDefaultLocally(int newDefaultId) {
    state = state.whenData((data) {
      final updatedList = data.shippingAddresses.map((a) {
        return ShippingAddress(
            a.id,
            a.fullName,
            a.phoneNumber,
            a.pincode,
            a.state,
            a.city,
            a.addressLineOne,
            a.addressLineTwo,
            a.typeOfAddress,
            a.userId,
            a.id == newDefaultId,
            a.isDeliveryAvailable);
      }).toList();
      return data.copyWith(shippingAddresses: updatedList);
    });
  }

  Future<void> getAllStates() async {
    state = const AsyncValue.loading();
    final result = await ref.read(statesUseCaseProvider).execute(
          ref.watch(formDataStoreProvider).addressLevel1,
        );

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (statesList) {
        final current = state.valueOrNull ?? ShippingState();
        state = AsyncValue.data(current.copyWith(states: statesList));
      },
    );
  }

  Future<void> deleteShippingAddress(
      DeleteShippingAddressUseCaseInput input, BuildContext context) async {
    final result =
        await ref.watch(deleteShippingAddressUseCaseProvider).execute(input);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      if (data.isNotEmpty) {
        context.pop();
      }
    });
  }

  Future<void> updateShippingAddress(
      UpdateShippingAddressUseCaseInput input) async {
    final result =
        await ref.watch(updateShippingAddressUseCaseProvider).execute(input);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      print(data);
    });
  }
}

final shippingAddressProvider =
    StateNotifierProvider<ShippingAddressNotifier, AsyncValue<ShippingState?>>(
        (ref) {
  return ShippingAddressNotifier(ref);
});

// Mark As Default Provider
class MarkAsDefaultNotifier extends StateNotifier<AsyncValue<num>> {
  final MarkAsDefaultUseCase _markAsDefaultUseCase;

  MarkAsDefaultNotifier(this._markAsDefaultUseCase)
      : super(AsyncValue.loading());

  Future<void> markAsDefault(int id) async {
    final result = await _markAsDefaultUseCase.execute(id);

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      state = AsyncValue.data(data);
    });
  }
}

final markAsDefaultProvider =
    StateNotifierProvider<MarkAsDefaultNotifier, AsyncValue<num>>((ref) {
  return MarkAsDefaultNotifier(ref.watch(markAsDefaultUseCaseProvider));
});
