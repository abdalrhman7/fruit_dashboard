
import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/feature/order/domain/entities/data/models/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, List<OrderEntity>>> fetchOrders();
}
