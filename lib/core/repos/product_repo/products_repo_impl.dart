import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_dashboard/core/services/data_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_dashboard/feature/add_product/data/model/add_product_input_model.dart';
import 'package:fruit_dashboard/feature/add_product/domain/entity/add_product_input_entity.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failures, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addProducts,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure('failed to add product'));
    }
  }
}
