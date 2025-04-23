import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/order_response/order_response.dart';
import 'package:k_distribution/domain/model/order_model.dart';

import '../../data/network/failure.dart';
import '../../data/responses/base_response/base_response.dart';

abstract class OrderRepository {
  Future<Either<Failure, CreateOrderResponse>> createMyOrderApi(
      CreateMyOrder createMyOrder);

  Future<Either<Failure, ViewOrder>> getOrderById(String id);

  Future<Either<Failure, bool>> cancelMyOrder(CancelMyOrder request);
  Future<Either<Failure, List<TransactionByOrderId>>> getTransactionByOrderId(
      String orderId);
  Future<Either<Failure, ShipmentModel>> getShipmentById(String id);

  Future<Either<Failure, List<OrderListingModel>>> getAllMyOrders(
      BaseFilterRequest request);
  Future<Either<Failure, FeedbackModel>> createFeedback(
      FeedbackModelResponse request);
}
