import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/app_prefs.dart';
import 'package:k_distribution/data/data_source/remote_data_source.dart';
import 'package:k_distribution/data/network/app_api.dart';
import 'package:k_distribution/data/network/dio_factory.dart';
import 'package:k_distribution/data/repository/auth_repository_impl.dart';
import 'package:k_distribution/data/repository/order_repository_impl.dart';
import 'package:k_distribution/data/repository/product_repository_impl.dart';
import 'package:k_distribution/data/repository/user_repository_impl.dart';
import 'package:k_distribution/domain/usecase/order_usecase.dart';
import 'package:k_distribution/domain/usecase/product_usecase.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/auth_usecase.dart';

// shared prefs instance
final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// app prefs instance
final appPreferencesProvider = Provider<AppPreferences>(
    (ref) => AppPreferences(ref.watch(sharedPrefsProvider)));

// dio factory
final dioFactoryProvider = Provider<DioFactory>(
    (ref) => DioFactory(ref.watch(appPreferencesProvider)));

// app service client
final dioProvider = Provider<Dio>((ref) {
  final dioFactory = ref.watch(dioFactoryProvider);
  return dioFactory.getDio();
});

final appServiceClientProvider = Provider<AppServiceClient>(
    (ref) => AppServiceClient(ref.watch(dioProvider)));

// remote data source
final remoteDataSourceProvider = Provider<RemoteDataSource>(
    (ref) => RemoteDataSourceImpl(ref.watch(appServiceClientProvider)));

// auth repository
final authRepositoryProvider =
    Provider((ref) => AuthRepositoryImpl(ref.watch(remoteDataSourceProvider)));

// user repository
final userRepositoryProvider =
    Provider((ref) => UserRepositoryImpl(ref.watch(remoteDataSourceProvider)));

// product repository
final productRepositoryProvider = Provider(
    (ref) => ProductRepositoryImpl(ref.watch(remoteDataSourceProvider)));

// order repository
final orderRepositoryProvider =
    Provider((ref) => OrderRepositoryImpl(ref.watch(remoteDataSourceProvider)));

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserUseCase(repository);
});

final productUseCaseProvider = Provider<ProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductUseCase(repository);
});

final addressUseCaseProvider = Provider<AddressUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return AddressUseCase(repository);
});
final statesUseCaseProvider = Provider<StatesUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return StatesUseCase(repository);
});

final shippingChargeUseCaseProvider = Provider<ShippingChargeUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return ShippingChargeUseCase(repository);
});

final formDataUseCaseProvider = Provider<DynamicFormUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return DynamicFormUseCase(repository);
});

final addAddressUseCaseProvider = Provider<AddShippingAddressUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return AddShippingAddressUseCase(repository);
});

final markAsDefaultUseCaseProvider = Provider<MarkAsDefaultUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return MarkAsDefaultUseCase(repository);
});

final paymentMethodUseCaseProvider = Provider<PaymentMethodUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return PaymentMethodUseCase(repository);
});

final createOrderUseCaseProvider = Provider<CreateOrderUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return CreateOrderUseCase(repository);
});

final viewOrderUseCaseProvider = Provider<ViewOrderUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return ViewOrderUseCase(repository);
});

final cancelOrderUseCaseProvider = Provider<CancelOrderUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return CancelOrderUseCase(repository);
});

final transactionByOrderIdUseCaseProvider =
    Provider<TransactionByOrderIdUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return TransactionByOrderIdUseCase(repository);
});

final shipmentByIdUseCaseProvider = Provider<ShipmentByIdUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return ShipmentByIdUseCase(repository);
});

final allOrdersUseCaseProvider = Provider<AllOrdersUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return AllOrdersUseCase(repository);
});

final feedbackUseCaseProvider = Provider<FeedbackUseCase>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return FeedbackUseCase(repository);
});

final updateUserUseCaseProvider = Provider<UpdateUserUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UpdateUserUseCase(repository);
});

final deleteShippingAddressUseCaseProvider =
    Provider<DeleteShippingAddressUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return DeleteShippingAddressUseCase(repository);
});

final updateShippingAddressUseCaseProvider =
    Provider<UpdateShippingAddressUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UpdateShippingAddressUseCase(repository);
});
