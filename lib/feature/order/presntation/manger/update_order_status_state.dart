part of 'update_order_status_cubit.dart';

@immutable
sealed class UpdateOrderStatusState {}

final class UpdateOrderStatusInitial extends UpdateOrderStatusState {}
final class UpdateOrderStatusLoading extends UpdateOrderStatusState {}
final class UpdateOrderStatusFailure extends UpdateOrderStatusState {
  final String message;
  UpdateOrderStatusFailure(this.message);
}
final class UpdateOrderStatusSuccess extends UpdateOrderStatusState {}
