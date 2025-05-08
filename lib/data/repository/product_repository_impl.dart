import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/data_source/remote_data_source.dart';
import 'package:k_distribution/data/mapper/product_mapper.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/network/network_info.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/domain/model/product_model.dart';
import 'package:k_distribution/domain/repository/product_repository.dart';

import '../network/error_handler.dart';

class ProductRepositoryImpl extends ProductRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  ProductRepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, List<ProductViewModel>>> getAllProducts(
      GetAllProductsFilterReq getAllProductsFilterReq) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getAllProduct(getAllProductsFilterReq);
        response.request = getAllProductsFilterReq;

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.data!.data!.map((e) => e.toDomain()).toList());
        } else {
          final errorMessage =
              response.errors?.first.message ?? ResponseMessage.DEFAULT;
          return Left(Failure(ResponseCode.BAD_REQUEST, errorMessage));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
