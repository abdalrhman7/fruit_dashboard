import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/feature/order/domain/repos/orders_repo.dart';
import 'package:fruit_dashboard/feature/order/presntation/manger/fetch_order_cubit.dart';
import 'package:fruit_dashboard/feature/order/presntation/manger/update_order_status_cubit.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FetchOrderCubit(getIt.get<OrdersRepo>())..fetchOrders()),
        BlocProvider(
            create: (context) =>
                UpdateOrderStatusCubit(getIt.get<OrdersRepo>())),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: OrdersViewBodyBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBuilder extends StatelessWidget {
  const OrdersViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrderCubit, FetchOrderState>(
      builder: (context, state) {
        if (state is FetchOrderSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrderFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
              child: OrdersViewBody(
            orders: [
              getDummyOrder(),
              getDummyOrder(),
            ],
          ));
        }
      },
    );
  }
}
