import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/feature/add_product/presntation/views/add_product_view.dart';
import 'package:fruit_dashboard/feature/order/presntation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductView.routeName);
            },
            text: 'Add Data',
          ),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrdersView.routeName);
            },
            text: 'View Orders',
          ),
        ],
      ),
    );
  }
}
