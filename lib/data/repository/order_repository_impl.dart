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
import '../network/network_info.dart';

class OrderRepositoryImpl extends OrderRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  OrderRepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, CreateOrderResponse>> createMyOrderApi(
      CreateMyOrder createMyOrder) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.createMyOrderApi(createMyOrder);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data.toDomain());
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ViewOrder>> getOrderById(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getOrderById(id);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data.toDomain());
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> cancelMyOrder(CancelMyOrder request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.cancelMyOrder(request);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!);
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<TransactionByOrderId>>> getTransactionByOrderId(
      String orderId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getTransactionByOrderId(orderId);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data?.map((t) => t.toDomain()).toList() ?? []);
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ShipmentModel>> getShipmentById(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getShipmentById(id);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data.toDomain());
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderListingModel>>> getAllMyOrders(
      BaseFilterRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getAllMyOrders(request);
        response.request = request;

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.data!.map((e) => e.toDomain()).toList());
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, FeedbackModel>> createFeedback(
      FeedbackModelResponse request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.createFeedBack(request);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data.toDomain());
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
