import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/feature/add_product/domain/entity/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  );
}
