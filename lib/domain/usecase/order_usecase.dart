import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/base_response/base_response.dart';
import 'package:k_distribution/data/responses/order_response/order_response.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/domain/repository/order_repository.dart';
import 'package:k_distribution/domain/usecase/base_usecase.dart';

import '../../data/responses/user_response/user_response.dart';

class CreateOrderUseCase
    extends BaseUseCase<CreateOrderUseCaseInput, CreateOrderResponse> {
  final OrderRepository _orderRepository;
  CreateOrderUseCase(this._orderRepository);
  @override
  Future<Either<Failure, CreateOrderResponse>> execute(input) async {
    return await _orderRepository.createMyOrderApi(CreateMyOrder(
        input.orderType,
        input.billingAddress,
        input.shippingAddress,
        input.orderDiscountAmount,
        input.notes,
        input.additionalDeliveryCharge,
        input.totalAmount,
        input.orderDetails,
        input.paymentMethodId,
        input.paymentMethodType,
        input.packingEstimate,
        input.shippingCharge,
        input.shippingIntegrationId,
        input.shippingNotes,
        input.orderDiscountId,
        input.currentAddress,
        input.fromNative));
  }
}

class CreateOrderUseCaseInput {
  OrderTypeEnum? orderType;
  ShippingAddressResponse? billingAddress;
  ShippingAddressResponse? shippingAddress;
  num? orderDiscountAmount;
  String? notes;
  num? additionalDeliveryCharge;
  num? totalAmount;
  List<MyOrderDetails> orderDetails;
  int? paymentMethodId;
  String? paymentMethodType;
  DateTime? packingEstimate;
  num? shippingCharge;
  int? shippingIntegrationId;
  ShippingNotes? shippingNotes;
  int? orderDiscountId;
  CurrentAddress? currentAddress;
  bool? fromNative;

  CreateOrderUseCaseInput(
      this.orderType,
      this.billingAddress,
      this.shippingAddress,
      this.orderDiscountAmount,
      this.notes,
      this.additionalDeliveryCharge,
      this.totalAmount,
      this.orderDetails,
      this.paymentMethodId,
      this.paymentMethodType,
      this.packingEstimate,
      this.shippingCharge,
      this.shippingIntegrationId,
      this.shippingNotes,
      this.orderDiscountId,
      this.currentAddress,
      this.fromNative);
}

class ViewOrderUseCase extends BaseUseCase<String, ViewOrder> {
  final OrderRepository _orderRepository;
  ViewOrderUseCase(this._orderRepository);
  @override
  Future<Either<Failure, ViewOrder>> execute(String input) async {
    return await _orderRepository.getOrderById(input);
  }
}

class CancelOrderUseCase extends BaseUseCase<CancelOrderUseCaseInput, bool> {
  final OrderRepository _orderRepository;
  CancelOrderUseCase(this._orderRepository);

  @override
  Future<Either<Failure, bool>> execute(CancelOrderUseCaseInput input) async {
    return await _orderRepository.cancelMyOrder(
        CancelMyOrder(input.orderId, input.orderDetailIds, input.refundReason));
  }
}

class CancelOrderUseCaseInput {
  int orderId;
  List<int> orderDetailIds;
  String refundReason;

  CancelOrderUseCaseInput(this.orderId, this.orderDetailIds, this.refundReason);
}

class TransactionByOrderIdUseCase
    extends BaseUseCase<String, List<TransactionByOrderId>> {
  final OrderRepository _orderRepository;
  TransactionByOrderIdUseCase(this._orderRepository);
  @override
  Future<Either<Failure, List<TransactionByOrderId>>> execute(
      String input) async {
    return await _orderRepository.getTransactionByOrderId(input);
  }
}

class ShipmentByIdUseCase extends BaseUseCase<String, ShipmentModel> {
  final OrderRepository _orderRepository;
  ShipmentByIdUseCase(this._orderRepository);
  @override
  Future<Either<Failure, ShipmentModel>> execute(String input) async {
    return await _orderRepository.getShipmentById(input);
  }
}

class AllOrdersUseCase
    extends BaseUseCase<AllOrdersUseCaseInput, List<OrderListingModel>> {
  final OrderRepository _orderRepository;
  AllOrdersUseCase(this._orderRepository);
  @override
  Future<Either<Failure, List<OrderListingModel>>> execute(
      AllOrdersUseCaseInput input) async {
    return await _orderRepository.getAllMyOrders(BaseFilterRequest(
        pageCount: input.pageCount,
        pageSize: input.pageSize,
        search: input.search,
        sortOrder: input.sortOrder,
        sortBy: input.sortBy,
        filterBy: input.filterBy));
  }
}

class AllOrdersUseCaseInput {
  int pageCount;
  int pageSize;
  String search;
  String sortOrder;
  String sortBy;
  String filterBy;

  AllOrdersUseCaseInput(this.pageCount, this.pageSize, this.search,
      this.sortOrder, this.sortBy, this.filterBy);
}

class FeedbackUseCase extends BaseUseCase<FeedbackUseCaseInput, FeedbackModel> {
  final OrderRepository _orderRepository;
  FeedbackUseCase(this._orderRepository);
  @override
  Future<Either<Failure, FeedbackModel>> execute(
      FeedbackUseCaseInput input) async {
    return await _orderRepository.createFeedback(
        FeedbackModelResponse(input.title, input.description, input.rating));
  }
}

class FeedbackUseCaseInput {
  String title;
  String description;
  double rating;

  FeedbackUseCaseInput(this.title, this.description, this.rating);
}
