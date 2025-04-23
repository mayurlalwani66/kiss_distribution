import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/data_source/remote_data_source.dart';
import 'package:k_distribution/data/mapper/order_mapper.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/base_response/base_response.dart';
import 'package:k_distribution/data/responses/order_response/order_response.dart';
import 'package:k_distribution/domain/model/order_model.dart';
import 'package:k_distribution/domain/repository/order_repository.dart';

import '../network/error_handler.dart';

class OrderRepositoryImpl extends OrderRepository {
  final RemoteDataSource _remoteDataSource;
  OrderRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, CreateOrderResponse>> createMyOrderApi(
      CreateMyOrder createMyOrder) async {
    try {
      final response = await _remoteDataSource.createMyOrderApi(createMyOrder);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data.toDomain());
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }

  @override
  Future<Either<Failure, ViewOrder>> getOrderById(String id) async {
    try {
      final response = await _remoteDataSource.getOrderById(id);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data.toDomain());
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelMyOrder(CancelMyOrder request) async {
    try {
      final response = await _remoteDataSource.cancelMyOrder(request);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data!);
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }

  @override
  Future<Either<Failure, List<TransactionByOrderId>>> getTransactionByOrderId(
      String orderId) async {
    try {
      final response = await _remoteDataSource.getTransactionByOrderId(orderId);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data?.map((t) => t.toDomain()).toList() ?? []);
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }

  @override
  Future<Either<Failure, ShipmentModel>> getShipmentById(String id) async {
    try {
      final response = await _remoteDataSource.getShipmentById(id);
      print(response.data!.sourceAddress?.address);
      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data.toDomain());
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }

  @override
  Future<Either<Failure, List<OrderListingModel>>> getAllMyOrders(
      BaseFilterRequest request) async {
    try {
      final response = await _remoteDataSource.getAllMyOrders(request);
      response.request = request;
      print(response.data);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data!.data!.map((e) => e.toDomain()).toList());
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }

  @override
  Future<Either<Failure, FeedbackModel>> createFeedback(
      FeedbackModelResponse request) async {
    try {
      final response = await _remoteDataSource.createFeedBack(request);
      print(response.data);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data.toDomain());
      } else {
        return Left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }
}
