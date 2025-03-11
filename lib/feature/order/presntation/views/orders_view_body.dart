import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/helper_function/get_order_dummy_data.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/widget/filter_section.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/widget/order_item.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/widget/orders_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          FilterSection(),
          SizedBox(height: 16),
          Expanded(
            child: OrdersItemsListView(
              orderModels: [
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
