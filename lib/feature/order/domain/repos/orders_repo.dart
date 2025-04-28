
import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/enums/order_enum.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/feature/order/domain/entities/data/models/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders();

  Future<Either<Failures, void>> updateOrder({required OrderStatus status , required String orderId});
}
