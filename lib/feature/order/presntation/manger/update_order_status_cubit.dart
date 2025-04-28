import 'package:bloc/bloc.dart';
import 'package:fruit_dashboard/core/enums/order_enum.dart';
import 'package:fruit_dashboard/feature/order/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_status_state.dart';

class UpdateOrderStatusCubit extends Cubit<UpdateOrderStatusState> {
  UpdateOrderStatusCubit(this.ordersRepo) : super(UpdateOrderStatusInitial());
  final OrdersRepo ordersRepo;

  Future<void> updateOrder(
      {required OrderStatus status, required String orderId}) async {
    emit(UpdateOrderStatusLoading());
    final result =
        await ordersRepo.updateOrder(status: status, orderId: orderId);
    result.fold(
      (failure) => emit(UpdateOrderStatusFailure(failure.message)),
      (r) => emit(
        UpdateOrderStatusSuccess(),
      ),
    );
  }
}
