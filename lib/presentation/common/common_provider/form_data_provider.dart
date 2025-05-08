import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/functions.dart';
import 'package:k_distribution/domain/model/user_model.dart';

import '../../../app/di.dart';
import '../../../domain/usecase/user_usecase.dart';

final formDataStoreProvider = Provider<FormDataStore>((ref) {
  return FormDataStore();
});

class FormDataNotifier extends StateNotifier<AsyncValue<List<SettingValue?>>> {
  final DynamicFormUseCase _dynamicFormUseCase;
  FormDataNotifier(this._dynamicFormUseCase) : super(AsyncValue.data([]));

  Future<void> getDynamicFormDataByControlKeys(WidgetRef ref) async {
    state = AsyncValue.loading();

    final store = ref.read(formDataStoreProvider);

    final appSettingKeys = AppSettingsEnum.values.map((e) => e.name);
    final storeProfileKeys = StoreProfileEnum.values.map((e) => e.name);
    final helpAndSupportKeys = HelpAndSupportEnum.values.map((e) => e.name);
    final generalOrderSettingKeys =
        GeneralOrderSettingEnum.values.map((e) => e.name);

    final allKeys = [
      ...appSettingKeys,
      ...storeProfileKeys,
      ...helpAndSupportKeys,
      ...generalOrderSettingKeys
    ];

    final result =
        await _dynamicFormUseCase.execute(DynamicFormUseCaseInput(allKeys));

    result.fold((failure) {
      state = AsyncValue.error(failure.message, StackTrace.current);
    }, (data) {
      for (final setting in data) {
        final key = setting.controlKey;
        final value = setting.value.replaceAll('"', '');

        switch (key) {
          case 'AppDefaultShippingAppId':
            store.shippingAppId = int.tryParse(value) ?? 0;
            break;

          case 'AppDefaultOfflinePaymentAppId':
            store.offlinePaymentAppId = int.tryParse(value) ?? 0;
            break;

          case 'StoreAddressLevel1':
            store.addressLevel1 = value;
            break;

          case 'StoreAddressLevel2':
            store.addressLevel2 = value;
            break;

          case 'StoreAddressLevel4':
            store.addressLevel4 = value;
            break;

          case 'StorePostalcode':
            store.postalCode = value;
            break;

          case 'StoreName':
            store.storeName = value;
            break;

          case 'StoreSupportPhoneNumber':
            store.supportPhone = value;
            break;

          case 'StoreSupportEmail':
            store.supportEmail = value;
            break;

          case 'canCancelOrder':
            store.canCancelOrder = value.toLowerCase() == 'true';
            break;

          case 'canCancelOrderItems':
            store.canCancelOrderItems = value.toLowerCase() == 'true';
            break;
        }
      }

      state = AsyncValue.data(data);
    });
  }
}

final formDataControlKeyProvider =
    StateNotifierProvider<FormDataNotifier, AsyncValue<List<SettingValue?>>>(
        (ref) {
  return FormDataNotifier(ref.watch(formDataUseCaseProvider));
});
