// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://kissdistribution.meralift.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<LoginResponse, LoginRequest>> login(
    String phoneNumber,
    String email,
    String password,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
    final _options = _setStreamType<BaseResponse<LoginResponse, LoginRequest>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<LoginResponse, LoginRequest> _value;
    try {
      _value = BaseResponse<LoginResponse, LoginRequest>.fromJson(
        _result.data!,
        (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
        (json) => LoginRequest.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<UserResponse, dynamic>> getUserData() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<UserResponse, dynamic>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/getUserDetailForNative',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UserResponse, dynamic> _value;
    try {
      _value = BaseResponse<UserResponse, dynamic>.fromJson(
        _result.data!,
        (json) => UserResponse.fromJson(json as Map<String, dynamic>),
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<
      BaseResponse<PaginatedResponse<List<ProductListViewModelResponse>>,
          GetAllProductsFilterReq>> getAllProduct(
    int categoryId,
    String slugName,
    int tagId,
    bool includingSubCategory,
    List<String> status,
    int pageCount,
    int pageNo,
    int pageSize,
    String search,
    String sortOrder,
    String sortBy,
    String filterBy,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'categoryId': categoryId,
      'slugName': slugName,
      'tagId': tagId,
      'includingSubCategory': includingSubCategory,
      'status': status,
      'pageCount': pageCount,
      'pageNo': pageNo,
      'pageSize': pageSize,
      'search': search,
      'sortOrder': sortOrder,
      'sortBy': sortBy,
      'filterBy': filterBy,
    };
    final _options = _setStreamType<
        BaseResponse<PaginatedResponse<List<ProductListViewModelResponse>>,
            GetAllProductsFilterReq>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Product/getAllProductForMemberViewNew',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<PaginatedResponse<List<ProductListViewModelResponse>>,
        GetAllProductsFilterReq> _value;
    try {
      _value = BaseResponse<
          PaginatedResponse<List<ProductListViewModelResponse>>,
          GetAllProductsFilterReq>.fromJson(
        _result.data!,
        (json) =>
            PaginatedResponse<List<ProductListViewModelResponse>>.fromJson(
          json as Map<String, dynamic>,
          (json) => json is List<dynamic>
              ? json
                  .map<ProductListViewModelResponse>(
                    (i) => ProductListViewModelResponse.fromJson(
                      i as Map<String, dynamic>,
                    ),
                  )
                  .toList()
              : List.empty(),
        ),
        (json) =>
            GetAllProductsFilterReq.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ShippingAddressResponse>, void>>
      getAllAddresses() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<BaseResponse<List<ShippingAddressResponse>, void>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/getCurrentUserShippingAddresses',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(
            baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
          ),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ShippingAddressResponse>, void> _value;
    try {
      _value = BaseResponse<List<ShippingAddressResponse>, void>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ShippingAddressResponse>(
                  (i) => ShippingAddressResponse.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
        (json) => () {}(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<ShippingsChargeResponse>, ShippingChargeRequest>>
      getShippingCharges(double weight, double amount, int addressId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'weight': weight, 'amount': amount, 'addressId': addressId};
    final _options = _setStreamType<
        BaseResponse<List<ShippingsChargeResponse>, ShippingChargeRequest>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Order/getShippingsForOrder',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<ShippingsChargeResponse>, ShippingChargeRequest>
        _value;
    try {
      _value = BaseResponse<List<ShippingsChargeResponse>,
          ShippingChargeRequest>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<ShippingsChargeResponse>(
                  (i) => ShippingsChargeResponse.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
        (json) => ShippingChargeRequest.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<SettingValueResponse>, DynamicFormRequest>>
      getDynamicFormDataByControlKeys(List<String> controlKeys) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'controlKeys': controlKeys};
    final _options = _setStreamType<
        BaseResponse<List<SettingValueResponse>, DynamicFormRequest>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/DynamicForm/getDynamicFormDataByControlKeys',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<SettingValueResponse>, DynamicFormRequest> _value;
    try {
      _value =
          BaseResponse<List<SettingValueResponse>, DynamicFormRequest>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<SettingValueResponse>(
                  (i) => SettingValueResponse.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
        (json) => DynamicFormRequest.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<StatesResponse>, String>> getAllStates(
    String country,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'country': country};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<List<StatesResponse>, String>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Store/getAllStates',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<StatesResponse>, String> _value;
    try {
      _value = BaseResponse<List<StatesResponse>, String>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<StatesResponse>(
                  (i) => StatesResponse.fromJson(i as Map<String, dynamic>),
                )
                .toList()
            : List.empty(),
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      addUserShippingAddress(
    String fullName,
    String phoneNumber,
    String pincode,
    String state,
    String addressLineOne,
    String addressLineTwo,
    String typeOfAddress,
    bool isDefault,
    int userId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'pincode': pincode,
      'state': state,
      'addressLineOne': addressLineOne,
      'addressLineTwo': addressLineTwo,
      'typeOfAddress': typeOfAddress,
      'isDefault': isDefault,
      'userId': userId,
    };
    final _options = _setStreamType<
        BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/addUserShippingAddress',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ShippingAddressResponse, ShippingAddressResponse> _value;
    try {
      _value = BaseResponse<ShippingAddressResponse,
          ShippingAddressResponse>.fromJson(
        _result.data!,
        (json) =>
            ShippingAddressResponse.fromJson(json as Map<String, dynamic>),
        (json) =>
            ShippingAddressResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<String, String>> markAsDefaultAddress(String id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<String, String>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/markAsDefaultAddress/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<String, String> _value;
    try {
      _value = BaseResponse<String, String>.fromJson(
        _result.data!,
        (json) => json as String,
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<PaymentMethodResponse>, String>>
      getAllPaymentMethods(String area) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'area': area};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<BaseResponse<List<PaymentMethodResponse>, String>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Payment/getAllPaymentMethod',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(
            baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
          ),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<PaymentMethodResponse>, String> _value;
    try {
      _value = BaseResponse<List<PaymentMethodResponse>, String>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<PaymentMethodResponse>(
                  (i) => PaymentMethodResponse.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<CreateMyOrderResponse, CreateMyOrder>> createMyOrderApi(
    CreateMyOrder request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options =
        _setStreamType<BaseResponse<CreateMyOrderResponse, CreateMyOrder>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Order/createMyOrder',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(
            baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
          ),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<CreateMyOrderResponse, CreateMyOrder> _value;
    try {
      _value = BaseResponse<CreateMyOrderResponse, CreateMyOrder>.fromJson(
        _result.data!,
        (json) => CreateMyOrderResponse.fromJson(json as Map<String, dynamic>),
        (json) => CreateMyOrder.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ViewOrderResponse, String>> getOrderById(
    String id,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseResponse<ViewOrderResponse, String>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Order/getMyOrderById/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ViewOrderResponse, String> _value;
    try {
      _value = BaseResponse<ViewOrderResponse, String>.fromJson(
        _result.data!,
        (json) => ViewOrderResponse.fromJson(json as Map<String, dynamic>),
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<bool, CancelMyOrder>> cancelMyOrder(
    CancelMyOrder request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<BaseResponse<bool, CancelMyOrder>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Order/CancelOrderAndRefundByMember',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<bool, CancelMyOrder> _value;
    try {
      _value = BaseResponse<bool, CancelMyOrder>.fromJson(
        _result.data!,
        (json) => json as bool,
        (json) => CancelMyOrder.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<List<TransactionByOrderIdResponse>, String>>
      getTransactionByOrderId(String orderId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'orderId': orderId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<
        BaseResponse<List<TransactionByOrderIdResponse>, String>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Payment/getAllTransactionByOrderId',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<List<TransactionByOrderIdResponse>, String> _value;
    try {
      _value =
          BaseResponse<List<TransactionByOrderIdResponse>, String>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<TransactionByOrderIdResponse>(
                  (i) => TransactionByOrderIdResponse.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ShipmentModelResponse, String>> getShipmentById(
    String orderId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': orderId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<BaseResponse<ShipmentModelResponse, String>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Shipment/getShipmentById',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(
            baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
          ),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ShipmentModelResponse, String> _value;
    try {
      _value = BaseResponse<ShipmentModelResponse, String>.fromJson(
        _result.data!,
        (json) => ShipmentModelResponse.fromJson(json as Map<String, dynamic>),
        (json) => json as String,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<
      BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
          BaseFilterRequest>> getAllMyOrders(BaseFilterRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<
        BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
            BaseFilterRequest>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Order/getAllMyOrders',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
        BaseFilterRequest> _value;
    try {
      _value = BaseResponse<PaginatedResponse<List<OrderListingModelResponse>>,
          BaseFilterRequest>.fromJson(
        _result.data!,
        (json) => PaginatedResponse<List<OrderListingModelResponse>>.fromJson(
          json as Map<String, dynamic>,
          (json) => json is List<dynamic>
              ? json
                  .map<OrderListingModelResponse>(
                    (i) => OrderListingModelResponse.fromJson(
                      i as Map<String, dynamic>,
                    ),
                  )
                  .toList()
              : List.empty(),
        ),
        (json) => BaseFilterRequest.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<FeedbackModelResponse, FeedbackModelResponse>>
      createFeedBack(FeedbackModelResponse request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<
        BaseResponse<FeedbackModelResponse, FeedbackModelResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/Feedback/createFeedback',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<FeedbackModelResponse, FeedbackModelResponse> _value;
    try {
      _value =
          BaseResponse<FeedbackModelResponse, FeedbackModelResponse>.fromJson(
        _result.data!,
        (json) => FeedbackModelResponse.fromJson(json as Map<String, dynamic>),
        (json) => FeedbackModelResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<UserResponse, UserResponse>> updateUserProfile(
    UserResponse request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<BaseResponse<UserResponse, UserResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/updateUserProfile',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UserResponse, UserResponse> _value;
    try {
      _value = BaseResponse<UserResponse, UserResponse>.fromJson(
        _result.data!,
        (json) => UserResponse.fromJson(json as Map<String, dynamic>),
        (json) => UserResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<String, DeleteUserShippingAddress>> deleteShippingAddress(
    DeleteUserShippingAddress request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options =
        _setStreamType<BaseResponse<String, DeleteUserShippingAddress>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/deleteUserShippingAddress',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(
            baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
          ),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<String, DeleteUserShippingAddress> _value;
    try {
      _value = BaseResponse<String, DeleteUserShippingAddress>.fromJson(
        _result.data!,
        (json) => json as String,
        (json) =>
            DeleteUserShippingAddress.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>
      updateUserShippingAddress(
    String addressid,
    int id,
    String fullName,
    String phoneNumber,
    String pincode,
    String state,
    String addressLineOne,
    String addressLineTwo,
    String typeOfAddress,
    bool isDefault,
    int userId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'addressId': addressid};
    final _headers = <String, dynamic>{};
    final _data = {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'pincode': pincode,
      'state': state,
      'addressLineOne': addressLineOne,
      'addressLineTwo': addressLineTwo,
      'typeOfAddress': typeOfAddress,
      'isDefault': isDefault,
      'userId': userId,
    };
    final _options = _setStreamType<
        BaseResponse<ShippingAddressResponse, ShippingAddressResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NativeApp/addUserShippingAddress',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ShippingAddressResponse, ShippingAddressResponse> _value;
    try {
      _value = BaseResponse<ShippingAddressResponse,
          ShippingAddressResponse>.fromJson(
        _result.data!,
        (json) =>
            ShippingAddressResponse.fromJson(json as Map<String, dynamic>),
        (json) =>
            ShippingAddressResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
