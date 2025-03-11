import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/feature/order/domain/repos/orders_repo.dart';
import 'package:fruit_dashboard/feature/order/presntation/manger/fetch_order_cubit.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: OrdersViewBody(),
      ),
    );
  }
}
