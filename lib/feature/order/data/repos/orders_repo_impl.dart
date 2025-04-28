import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/enums/order_enum.dart';
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
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data
          in _databaseService.streamData(path: BackendEndpoint.getOrders)) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>(
              (e) => OrderModel.fromJson(e).toEntity(),
            )
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('Failed to fetch orders'));
    }
  }

  @override
  Future<Either<Failures, void>> updateOrder(
      {required OrderStatus status, required String orderId}) async {
    try {
      await _databaseService.updateData(
        path: BackendEndpoint.updateOrder,
        data: {'status': status.name},
        documentId: orderId,
      );
      return right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update order'));
    }
  }
}
