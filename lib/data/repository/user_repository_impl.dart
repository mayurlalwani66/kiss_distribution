import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/data/responses/user_response/user_response.dart';
import 'package:k_distribution/domain/repository/user_repository.dart';
import 'package:k_distribution/data/mapper/user_mapper.dart';

import '../../domain/model/user_model.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  UserRepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, User>> getUserData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getUserData();

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
  Future<Either<Failure, List<ShippingAddress>>> getAllAddresses() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getAllAddresses();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.map((e) => e.toDomain()).toList());
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
  Future<Either<Failure, List<ShippingCharge>>> getShippingCharges(
      ShippingChargeRequest shippingChargeRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getShippingCharges(shippingChargeRequest);
        response.request = shippingChargeRequest;
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.map((e) => e.toDomain()).toList());
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
  Future<Either<Failure, List<SettingValue>>> getDynamicFormDataByControlKeys(
      DynamicFormRequest dynamicFormRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .getDynamicFormDataByControlKeys(dynamicFormRequest);
        response.request = dynamicFormRequest;
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.map((e) => e.toDomain()).toList());
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
  Future<Either<Failure, List<States>>> getAllStates(String country) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getAllStates(country);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.map((e) => e.toDomain()).toList());
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
  Future<Either<Failure, ShippingAddress>> addUserShippingAddress(
      ShippingAddress shippingAddress) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.addUserShippingAddress(shippingAddress);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.toDomain());
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
  Future<Either<Failure, int>> markAsDefaultApi(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.markAsDefaultApi(id);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(id);
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
  Future<Either<Failure, List<PaymentMethod>>> getAllPaymentMethod(
      String area) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getAllPaymentMethods(area);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.map((p) => p.toDomain()).toList());
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
  Future<Either<Failure, User>> updateUserProfile(UserResponse request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.updateUserProfile(request);

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
  Future<Either<Failure, String>> deleteShippingAddress(
      DeleteUserShippingAddress request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.deleteShippingAddress(request);

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
  Future<Either<Failure, ShippingAddress>> updateUserShippingAddress(
      String addressId, ShippingAddress shippingAddress) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.updateUserShippingAddress(
            addressId, shippingAddress);

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
