import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/data_source/remote_data_source.dart';
import 'package:k_distribution/data/mapper/auth_mapper.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/domain/model/auth_model.dart';
import 'package:k_distribution/domain/repository/auth_repository.dart';

import '../network/error_handler.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      response.request = loginRequest;
      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.data.toDomain());
      } else {
        return Left(
            Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST));
      }
    } catch (error) {
      return (Left(ErrorHandler.handle(error).failure));
    }
  }
}
