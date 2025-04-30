// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomePageState {
  List<ProductViewModel> get products;
  List<ShippingCharge> get shippingCharges;
  List<PaymentMethod> get paymentMethods;
  List<ShippingAddress> get shippingAddresses;
  CreateOrderResponse? get createOrderResponse;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      _$HomePageStateCopyWithImpl<HomePageState>(
          this as HomePageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageState &&
            const DeepCollectionEquality().equals(other.products, products) &&
            const DeepCollectionEquality()
                .equals(other.shippingCharges, shippingCharges) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethods, paymentMethods) &&
            const DeepCollectionEquality()
                .equals(other.shippingAddresses, shippingAddresses) &&
            (identical(other.createOrderResponse, createOrderResponse) ||
                other.createOrderResponse == createOrderResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      const DeepCollectionEquality().hash(shippingCharges),
      const DeepCollectionEquality().hash(paymentMethods),
      const DeepCollectionEquality().hash(shippingAddresses),
      createOrderResponse);

  @override
  String toString() {
    return 'HomePageState(products: $products, shippingCharges: $shippingCharges, paymentMethods: $paymentMethods, shippingAddresses: $shippingAddresses, createOrderResponse: $createOrderResponse)';
  }
}

/// @nodoc
abstract mixin class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) _then) =
      _$HomePageStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductViewModel> products,
      List<ShippingCharge> shippingCharges,
      List<PaymentMethod> paymentMethods,
      List<ShippingAddress> shippingAddresses,
      CreateOrderResponse? createOrderResponse});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._self, this._then);

  final HomePageState _self;
  final $Res Function(HomePageState) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? shippingCharges = null,
    Object? paymentMethods = null,
    Object? shippingAddresses = null,
    Object? createOrderResponse = freezed,
  }) {
    return _then(_self.copyWith(
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductViewModel>,
      shippingCharges: null == shippingCharges
          ? _self.shippingCharges
          : shippingCharges // ignore: cast_nullable_to_non_nullable
              as List<ShippingCharge>,
      paymentMethods: null == paymentMethods
          ? _self.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
      shippingAddresses: null == shippingAddresses
          ? _self.shippingAddresses
          : shippingAddresses // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>,
      createOrderResponse: freezed == createOrderResponse
          ? _self.createOrderResponse
          : createOrderResponse // ignore: cast_nullable_to_non_nullable
              as CreateOrderResponse?,
    ));
  }
}

/// @nodoc

class _HomePageState implements HomePageState {
  const _HomePageState(
      {final List<ProductViewModel> products = const [],
      final List<ShippingCharge> shippingCharges = const [],
      final List<PaymentMethod> paymentMethods = const [],
      final List<ShippingAddress> shippingAddresses = const [],
      this.createOrderResponse})
      : _products = products,
        _shippingCharges = shippingCharges,
        _paymentMethods = paymentMethods,
        _shippingAddresses = shippingAddresses;

  final List<ProductViewModel> _products;
  @override
  @JsonKey()
  List<ProductViewModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ShippingCharge> _shippingCharges;
  @override
  @JsonKey()
  List<ShippingCharge> get shippingCharges {
    if (_shippingCharges is EqualUnmodifiableListView) return _shippingCharges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingCharges);
  }

  final List<PaymentMethod> _paymentMethods;
  @override
  @JsonKey()
  List<PaymentMethod> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  final List<ShippingAddress> _shippingAddresses;
  @override
  @JsonKey()
  List<ShippingAddress> get shippingAddresses {
    if (_shippingAddresses is EqualUnmodifiableListView)
      return _shippingAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingAddresses);
  }

  @override
  final CreateOrderResponse? createOrderResponse;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomePageStateCopyWith<_HomePageState> get copyWith =>
      __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomePageState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._shippingCharges, _shippingCharges) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            const DeepCollectionEquality()
                .equals(other._shippingAddresses, _shippingAddresses) &&
            (identical(other.createOrderResponse, createOrderResponse) ||
                other.createOrderResponse == createOrderResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_shippingCharges),
      const DeepCollectionEquality().hash(_paymentMethods),
      const DeepCollectionEquality().hash(_shippingAddresses),
      createOrderResponse);

  @override
  String toString() {
    return 'HomePageState(products: $products, shippingCharges: $shippingCharges, paymentMethods: $paymentMethods, shippingAddresses: $shippingAddresses, createOrderResponse: $createOrderResponse)';
  }
}

/// @nodoc
abstract mixin class _$HomePageStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(
          _HomePageState value, $Res Function(_HomePageState) _then) =
      __$HomePageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ProductViewModel> products,
      List<ShippingCharge> shippingCharges,
      List<PaymentMethod> paymentMethods,
      List<ShippingAddress> shippingAddresses,
      CreateOrderResponse? createOrderResponse});
}

/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(this._self, this._then);

  final _HomePageState _self;
  final $Res Function(_HomePageState) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? shippingCharges = null,
    Object? paymentMethods = null,
    Object? shippingAddresses = null,
    Object? createOrderResponse = freezed,
  }) {
    return _then(_HomePageState(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductViewModel>,
      shippingCharges: null == shippingCharges
          ? _self._shippingCharges
          : shippingCharges // ignore: cast_nullable_to_non_nullable
              as List<ShippingCharge>,
      paymentMethods: null == paymentMethods
          ? _self._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
      shippingAddresses: null == shippingAddresses
          ? _self._shippingAddresses
          : shippingAddresses // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>,
      createOrderResponse: freezed == createOrderResponse
          ? _self.createOrderResponse
          : createOrderResponse // ignore: cast_nullable_to_non_nullable
              as CreateOrderResponse?,
    ));
  }
}

/// @nodoc
mixin _$ShippingState {
  List<ShippingAddress> get shippingAddresses;
  List<States> get states;
  ShippingAddress? get selectedAddress;

  /// Create a copy of ShippingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShippingStateCopyWith<ShippingState> get copyWith =>
      _$ShippingStateCopyWithImpl<ShippingState>(
          this as ShippingState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShippingState &&
            const DeepCollectionEquality()
                .equals(other.shippingAddresses, shippingAddresses) &&
            const DeepCollectionEquality().equals(other.states, states) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shippingAddresses),
      const DeepCollectionEquality().hash(states),
      selectedAddress);

  @override
  String toString() {
    return 'ShippingState(shippingAddresses: $shippingAddresses, states: $states, selectedAddress: $selectedAddress)';
  }
}

/// @nodoc
abstract mixin class $ShippingStateCopyWith<$Res> {
  factory $ShippingStateCopyWith(
          ShippingState value, $Res Function(ShippingState) _then) =
      _$ShippingStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ShippingAddress> shippingAddresses,
      List<States> states,
      ShippingAddress? selectedAddress});
}

/// @nodoc
class _$ShippingStateCopyWithImpl<$Res>
    implements $ShippingStateCopyWith<$Res> {
  _$ShippingStateCopyWithImpl(this._self, this._then);

  final ShippingState _self;
  final $Res Function(ShippingState) _then;

  /// Create a copy of ShippingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shippingAddresses = null,
    Object? states = null,
    Object? selectedAddress = freezed,
  }) {
    return _then(_self.copyWith(
      shippingAddresses: null == shippingAddresses
          ? _self.shippingAddresses
          : shippingAddresses // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>,
      states: null == states
          ? _self.states
          : states // ignore: cast_nullable_to_non_nullable
              as List<States>,
      selectedAddress: freezed == selectedAddress
          ? _self.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as ShippingAddress?,
    ));
  }
}

/// @nodoc

class _ShippingState implements ShippingState {
  const _ShippingState(
      {final List<ShippingAddress> shippingAddresses = const [],
      final List<States> states = const [],
      this.selectedAddress})
      : _shippingAddresses = shippingAddresses,
        _states = states;

  final List<ShippingAddress> _shippingAddresses;
  @override
  @JsonKey()
  List<ShippingAddress> get shippingAddresses {
    if (_shippingAddresses is EqualUnmodifiableListView)
      return _shippingAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingAddresses);
  }

  final List<States> _states;
  @override
  @JsonKey()
  List<States> get states {
    if (_states is EqualUnmodifiableListView) return _states;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_states);
  }

  @override
  final ShippingAddress? selectedAddress;

  /// Create a copy of ShippingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShippingStateCopyWith<_ShippingState> get copyWith =>
      __$ShippingStateCopyWithImpl<_ShippingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShippingState &&
            const DeepCollectionEquality()
                .equals(other._shippingAddresses, _shippingAddresses) &&
            const DeepCollectionEquality().equals(other._states, _states) &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shippingAddresses),
      const DeepCollectionEquality().hash(_states),
      selectedAddress);

  @override
  String toString() {
    return 'ShippingState(shippingAddresses: $shippingAddresses, states: $states, selectedAddress: $selectedAddress)';
  }
}

/// @nodoc
abstract mixin class _$ShippingStateCopyWith<$Res>
    implements $ShippingStateCopyWith<$Res> {
  factory _$ShippingStateCopyWith(
          _ShippingState value, $Res Function(_ShippingState) _then) =
      __$ShippingStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ShippingAddress> shippingAddresses,
      List<States> states,
      ShippingAddress? selectedAddress});
}

/// @nodoc
class __$ShippingStateCopyWithImpl<$Res>
    implements _$ShippingStateCopyWith<$Res> {
  __$ShippingStateCopyWithImpl(this._self, this._then);

  final _ShippingState _self;
  final $Res Function(_ShippingState) _then;

  /// Create a copy of ShippingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shippingAddresses = null,
    Object? states = null,
    Object? selectedAddress = freezed,
  }) {
    return _then(_ShippingState(
      shippingAddresses: null == shippingAddresses
          ? _self._shippingAddresses
          : shippingAddresses // ignore: cast_nullable_to_non_nullable
              as List<ShippingAddress>,
      states: null == states
          ? _self._states
          : states // ignore: cast_nullable_to_non_nullable
              as List<States>,
      selectedAddress: freezed == selectedAddress
          ? _self.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as ShippingAddress?,
    ));
  }
}

/// @nodoc
mixin _$ViewOrderState {
  ViewOrder? get viewOrder;
  List<TransactionByOrderId> get listTransactionById;
  ShipmentModel? get shipmentModel;

  /// Create a copy of ViewOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewOrderStateCopyWith<ViewOrderState> get copyWith =>
      _$ViewOrderStateCopyWithImpl<ViewOrderState>(
          this as ViewOrderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewOrderState &&
            (identical(other.viewOrder, viewOrder) ||
                other.viewOrder == viewOrder) &&
            const DeepCollectionEquality()
                .equals(other.listTransactionById, listTransactionById) &&
            (identical(other.shipmentModel, shipmentModel) ||
                other.shipmentModel == shipmentModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewOrder,
      const DeepCollectionEquality().hash(listTransactionById), shipmentModel);

  @override
  String toString() {
    return 'ViewOrderState(viewOrder: $viewOrder, listTransactionById: $listTransactionById, shipmentModel: $shipmentModel)';
  }
}

/// @nodoc
abstract mixin class $ViewOrderStateCopyWith<$Res> {
  factory $ViewOrderStateCopyWith(
          ViewOrderState value, $Res Function(ViewOrderState) _then) =
      _$ViewOrderStateCopyWithImpl;
  @useResult
  $Res call(
      {ViewOrder? viewOrder,
      List<TransactionByOrderId> listTransactionById,
      ShipmentModel? shipmentModel});
}

/// @nodoc
class _$ViewOrderStateCopyWithImpl<$Res>
    implements $ViewOrderStateCopyWith<$Res> {
  _$ViewOrderStateCopyWithImpl(this._self, this._then);

  final ViewOrderState _self;
  final $Res Function(ViewOrderState) _then;

  /// Create a copy of ViewOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewOrder = freezed,
    Object? listTransactionById = null,
    Object? shipmentModel = freezed,
  }) {
    return _then(_self.copyWith(
      viewOrder: freezed == viewOrder
          ? _self.viewOrder
          : viewOrder // ignore: cast_nullable_to_non_nullable
              as ViewOrder?,
      listTransactionById: null == listTransactionById
          ? _self.listTransactionById
          : listTransactionById // ignore: cast_nullable_to_non_nullable
              as List<TransactionByOrderId>,
      shipmentModel: freezed == shipmentModel
          ? _self.shipmentModel
          : shipmentModel // ignore: cast_nullable_to_non_nullable
              as ShipmentModel?,
    ));
  }
}

/// @nodoc

class _ViewOrderState implements ViewOrderState {
  const _ViewOrderState(
      {this.viewOrder,
      final List<TransactionByOrderId> listTransactionById = const [],
      this.shipmentModel})
      : _listTransactionById = listTransactionById;

  @override
  final ViewOrder? viewOrder;
  final List<TransactionByOrderId> _listTransactionById;
  @override
  @JsonKey()
  List<TransactionByOrderId> get listTransactionById {
    if (_listTransactionById is EqualUnmodifiableListView)
      return _listTransactionById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTransactionById);
  }

  @override
  final ShipmentModel? shipmentModel;

  /// Create a copy of ViewOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ViewOrderStateCopyWith<_ViewOrderState> get copyWith =>
      __$ViewOrderStateCopyWithImpl<_ViewOrderState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewOrderState &&
            (identical(other.viewOrder, viewOrder) ||
                other.viewOrder == viewOrder) &&
            const DeepCollectionEquality()
                .equals(other._listTransactionById, _listTransactionById) &&
            (identical(other.shipmentModel, shipmentModel) ||
                other.shipmentModel == shipmentModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewOrder,
      const DeepCollectionEquality().hash(_listTransactionById), shipmentModel);

  @override
  String toString() {
    return 'ViewOrderState(viewOrder: $viewOrder, listTransactionById: $listTransactionById, shipmentModel: $shipmentModel)';
  }
}

/// @nodoc
abstract mixin class _$ViewOrderStateCopyWith<$Res>
    implements $ViewOrderStateCopyWith<$Res> {
  factory _$ViewOrderStateCopyWith(
          _ViewOrderState value, $Res Function(_ViewOrderState) _then) =
      __$ViewOrderStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ViewOrder? viewOrder,
      List<TransactionByOrderId> listTransactionById,
      ShipmentModel? shipmentModel});
}

/// @nodoc
class __$ViewOrderStateCopyWithImpl<$Res>
    implements _$ViewOrderStateCopyWith<$Res> {
  __$ViewOrderStateCopyWithImpl(this._self, this._then);

  final _ViewOrderState _self;
  final $Res Function(_ViewOrderState) _then;

  /// Create a copy of ViewOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? viewOrder = freezed,
    Object? listTransactionById = null,
    Object? shipmentModel = freezed,
  }) {
    return _then(_ViewOrderState(
      viewOrder: freezed == viewOrder
          ? _self.viewOrder
          : viewOrder // ignore: cast_nullable_to_non_nullable
              as ViewOrder?,
      listTransactionById: null == listTransactionById
          ? _self._listTransactionById
          : listTransactionById // ignore: cast_nullable_to_non_nullable
              as List<TransactionByOrderId>,
      shipmentModel: freezed == shipmentModel
          ? _self.shipmentModel
          : shipmentModel // ignore: cast_nullable_to_non_nullable
              as ShipmentModel?,
    ));
  }
}

// dart format on
