import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/enums/order_enum.dart';
import 'package:fruit_dashboard/feature/order/domain/entities/data/models/order_entity.dart';
import 'package:fruit_dashboard/feature/order/presntation/manger/update_order_status_cubit.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
            visible: orderEntity.status == OrderStatus.pending,
            child: ElevatedButton(
              onPressed: () {
                context.read<UpdateOrderStatusCubit>().updateOrder(
                      status: OrderStatus.accepted,
                      orderId: orderEntity.orderId,
                    );
              },
              child: const Text('Accept'),
            )),
        Visibility(
            visible: orderEntity.status == OrderStatus.pending,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Reject'),
            )),
        Visibility(
            visible: orderEntity.status == OrderStatus.accepted,
            child: ElevatedButton(
              onPressed: () {
                context.read<UpdateOrderStatusCubit>().updateOrder(
                  status: OrderStatus.delivered,
                  orderId: orderEntity.orderId,
                );
              },
              child: const Text('Delivered'),
            )),
      ],
    );
  }
}
