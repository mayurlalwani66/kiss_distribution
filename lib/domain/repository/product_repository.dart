import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/request/request.dart';

import '../../data/network/failure.dart';
import '../model/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductViewModel>>> getAllProducts(
      GetAllProductsFilterReq getAllProductsFilterReq);
}
