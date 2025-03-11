
import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/core/services/data_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_dashboard/feature/order/domain/entities/data/models/order_entity.dart';
import 'package:fruit_dashboard/feature/order/domain/repos/orders_repo.dart';

import '../models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _databaseService;

  OrdersRepoImpl({required DatabaseService databaseService})
      : _databaseService = databaseService;

  @override
  Future<Either<Failures, List<OrderEntity>>> fetchOrders() async {
    try {
      final data =
          await _databaseService.getData(path: BackendEndpoint.getOrders);
      List<OrderEntity> orders = (data as List<dynamic>)
          .map((e) => OrderModel.fromJson(e).toEntity())
          .toList() as List<OrderEntity> ;
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch orders'));
    }
  }
}
