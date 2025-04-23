import 'package:k_distribution/data/network/app_api.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/auth_response/auth_responses.dart';
import 'package:k_distribution/data/responses/product_response/product_response.dart';
import 'package:k_distribution/data/responses/user_response/user_response.dart';

import '../../domain/model/user_model.dart';
import '../responses/base_response/base_response.dart';
import '../responses/order_response/order_response.dart';

abstract class RemoteDataSource {
  Future<BaseResponse<LoginResponse, LoginRequest>> login(
      LoginRequest loginRequest);
  Future<BaseResponse<UserResponse, dynamic>> getUserData();

  Future<
      BaseResponse<PaginatedResponse<List<ProductListViewModelResponse>>,
          GetAllProductsFilterReq>> getAllProduct(
      GetAllProductsFilterReq getAllProductsFilterReq);

  Future<BaseResponse<List<ShippingAddressResponse>, void>> getAllAddresses();

  Future<BaseResponse<List<ShippingsChargeResponse>, ShippingChargeRequest>>
      getShippingCharges(ShippingChargeRequest shippingChargesRequest);

  Future<BaseResponse<List<SettingValueResponse>, DynamicFormRequest>>
      getDynamicFormDataByControlKeys(DynamicFormRequest dynamicFormRequest);

  Future<BaseResponse<List<StatesResponse>, String>> getAllStates(
      String country);

  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      addUserShippingAddress(ShippingAddress shippingAddress);

  Future<BaseResponse<String, String>> markAsDefaultApi(int id);

  Future<BaseResponse<List<PaymentMethodResponse>, String>>
      getAllPaymentMethods(String area);

  Future<BaseResponse<CreateMyOrderResponse, CreateMyOrder>> createMyOrderApi(
      CreateMyOrder createMyOrder);

  Future<BaseResponse<ViewOrderResponse, String>> getOrderById(String id);

  Future<BaseResponse<bool, CancelMyOrder>> cancelMyOrder(
      CancelMyOrder request);
  Future<BaseResponse<List<TransactionByOrderIdResponse>, String>>
      getTransactionByOrderId(String orderId);

  Future<BaseResponse<ShipmentModelResponse, String>> getShipmentById(
    String id,
  );

  Future<
      BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
          BaseFilterRequest>> getAllMyOrders(BaseFilterRequest request);

  Future<BaseResponse<FeedbackModelResponse, FeedbackModelResponse>>
      createFeedBack(FeedbackModelResponse request);

  Future<BaseResponse<UserResponse, UserResponse>> updateUserProfile(
      UserResponse request);

  Future<BaseResponse<String, DeleteUserShippingAddress>> deleteShippingAddress(
      DeleteUserShippingAddress request);

  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      updateUserShippingAddress(
          String addressId, ShippingAddress shippingAddress);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<BaseResponse<LoginResponse, LoginRequest>> login(
      LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.phoneNumber, loginRequest.email, loginRequest.password);
  }

  @override
  Future<BaseResponse<UserResponse, dynamic>> getUserData() async {
    return await _appServiceClient.getUserData();
  }

  @override
  Future<
      BaseResponse<PaginatedResponse<List<ProductListViewModelResponse>>,
          GetAllProductsFilterReq>> getAllProduct(
      GetAllProductsFilterReq getAllProductsFilterReq) async {
    return await _appServiceClient.getAllProduct(
        getAllProductsFilterReq.categoryId!,
        getAllProductsFilterReq.slugName!,
        getAllProductsFilterReq.tagId!,
        getAllProductsFilterReq.includingSubCategory!,
        getAllProductsFilterReq.status!,
        getAllProductsFilterReq.pageCount!,
        getAllProductsFilterReq.pageNo!,
        getAllProductsFilterReq.pageSize!,
        getAllProductsFilterReq.search!,
        getAllProductsFilterReq.sortOrder!,
        getAllProductsFilterReq.sortBy!,
        getAllProductsFilterReq.filterBy!);
  }

  @override
  Future<BaseResponse<List<ShippingAddressResponse>, void>>
      getAllAddresses() async {
    return await _appServiceClient.getAllAddresses();
  }

  @override
  Future<BaseResponse<List<ShippingsChargeResponse>, ShippingChargeRequest>>
      getShippingCharges(ShippingChargeRequest shippingChargesRequest) async {
    return await _appServiceClient.getShippingCharges(
        shippingChargesRequest.weight!,
        shippingChargesRequest.amount!,
        shippingChargesRequest.addressId!);
  }

  @override
  Future<BaseResponse<List<SettingValueResponse>, DynamicFormRequest>>
      getDynamicFormDataByControlKeys(
          DynamicFormRequest dynamicFormRequest) async {
    return await _appServiceClient
        .getDynamicFormDataByControlKeys(dynamicFormRequest.controlKeys);
  }

  @override
  Future<BaseResponse<List<StatesResponse>, String>> getAllStates(
      String country) async {
    return await _appServiceClient.getAllStates(country);
  }

  @override
  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      addUserShippingAddress(ShippingAddress shippingAddress) async {
    return await _appServiceClient.addUserShippingAddress(
        shippingAddress.fullName,
        shippingAddress.phoneNumber,
        shippingAddress.pincode,
        shippingAddress.state,
        shippingAddress.addressLineOne,
        shippingAddress.addressLineTwo,
        shippingAddress.typeOfAddress,
        shippingAddress.isDefault,
        shippingAddress.userId);
  }

  @override
  Future<BaseResponse<String, String>> markAsDefaultApi(int id) async {
    return await _appServiceClient.markAsDefaultAddress((id.toString()));
  }

  @override
  Future<BaseResponse<List<PaymentMethodResponse>, String>>
      getAllPaymentMethods(String area) async {
    return await _appServiceClient.getAllPaymentMethods(area);
  }

  @override
  Future<BaseResponse<CreateMyOrderResponse, CreateMyOrder>> createMyOrderApi(
      CreateMyOrder createMyOrder) async {
    return await _appServiceClient.createMyOrderApi(createMyOrder);
  }

  @override
  Future<BaseResponse<ViewOrderResponse, String>> getOrderById(
      String id) async {
    return await _appServiceClient.getOrderById(id);
  }

  @override
  Future<BaseResponse<bool, CancelMyOrder>> cancelMyOrder(
      CancelMyOrder request) async {
    return await _appServiceClient.cancelMyOrder(request);
  }

  @override
  Future<BaseResponse<List<TransactionByOrderIdResponse>, String>>
      getTransactionByOrderId(String orderId) async {
    return await _appServiceClient.getTransactionByOrderId(orderId);
  }

  @override
  Future<BaseResponse<ShipmentModelResponse, String>> getShipmentById(
      String id) async {
    return await _appServiceClient.getShipmentById(id);
  }

  @override
  Future<
      BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
          BaseFilterRequest>> getAllMyOrders(BaseFilterRequest request) async {
    return await _appServiceClient.getAllMyOrders(request);
  }

  @override
  Future<BaseResponse<FeedbackModelResponse, FeedbackModelResponse>>
      createFeedBack(FeedbackModelResponse request) async {
    return await _appServiceClient.createFeedBack(request);
  }

  @override
  Future<BaseResponse<UserResponse, UserResponse>> updateUserProfile(
      UserResponse request) async {
    return await _appServiceClient.updateUserProfile(request);
  }

  @override
  Future<BaseResponse<String, DeleteUserShippingAddress>> deleteShippingAddress(
      DeleteUserShippingAddress request) async {
    return await _appServiceClient.deleteShippingAddress(request);
  }

  @override
  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      updateUserShippingAddress(
          String addressId, ShippingAddress shippingAddress) async {
    return await _appServiceClient.updateUserShippingAddress(
        addressId,
        shippingAddress.id!,
        shippingAddress.fullName,
        shippingAddress.phoneNumber,
        shippingAddress.pincode,
        shippingAddress.state,
        shippingAddress.addressLineOne,
        shippingAddress.addressLineTwo,
        shippingAddress.typeOfAddress,
        shippingAddress.isDefault,
        shippingAddress.userId);
  }
}
