import 'package:dartz/dartz.dart';
import 'package:k_distribution/data/network/failure.dart';
import 'package:k_distribution/data/request/request.dart';
import 'package:k_distribution/domain/repository/product_repository.dart';
import 'package:k_distribution/domain/usecase/base_usecase.dart';

import '../model/product_model.dart';

class ProductUseCase
    extends BaseUseCase<ProductUseCaseInput, List<ProductViewModel>> {
  final ProductRepository _productRepository;
  ProductUseCase(this._productRepository);
  @override
  Future<Either<Failure, List<ProductViewModel>>> execute(
      ProductUseCaseInput input) async {
    return await _productRepository.getAllProducts(
      GetAllProductsFilterReq(
        categoryId: input.categoryId,
        slugName: input.slugName,
        tagId: input.tagId,
        includingSubCategory: input.includingSubCategory,
        status: input.status,
        pageCount: input.pageCount,
        pageNo: input.pageNo,
        pageSize: input.pageSize,
        search: input.search,
        sortOrder: input.sortOrder,
        sortBy: input.sortBy,
        filterBy: input.filterBy,
      ),
    );
  }
}

class ProductUseCaseInput {
  int categoryId;
  String slugName;
  int tagId;
  bool includingSubCategory;
  List<String> status;
  int pageCount;
  int pageSize;
  int pageNo;
  String search;
  String sortOrder;
  String sortBy;
  String filterBy;

  ProductUseCaseInput(
    this.categoryId,
    this.slugName,
    this.tagId,
    this.includingSubCategory,
    this.status,
    this.pageCount,
    this.pageNo,
    this.pageSize,
    this.search,
    this.sortOrder,
    this.sortBy,
    this.filterBy,
  );
}
