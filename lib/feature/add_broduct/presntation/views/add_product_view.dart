

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruit_dashboard/feature/add_broduct/presntation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add_product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: const AddProductViewBody(),
    );
  }


}
