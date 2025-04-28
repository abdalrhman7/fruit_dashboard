import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruit_dashboard/feature/order/domain/entities/data/models/order_entity.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/widget/filter_section.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/widget/orders_items_list_view.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/widget/update_order_builder.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderEntity> orders ;

  @override
  Widget build(BuildContext context) {
    return UpdateOrderBuilder(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24),
            FilterSection(),
            SizedBox(height: 16),
            Expanded(
              child: OrdersItemsListView(
                orderModels: orders,
              ),
            )
          ],
        ),
      ),
    );
  }
}
