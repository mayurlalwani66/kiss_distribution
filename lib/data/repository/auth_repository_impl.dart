import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/data_source/remote_data_source.dart';
import 'package:k_distribution/data/mapper/auth_mapper.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/network/network_info.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/domain/model/auth_model.dart';
import 'package:k_distribution/domain/repository/auth_repository.dart';

import '../network/error_handler.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  AuthRepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        response.request = loginRequest;
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
  Future<Either<Failure, Authentication>> loginWithQrCode(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.loginWithQrCode(token);
        response.request = token;
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
