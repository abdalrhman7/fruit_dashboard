import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/core/widgets/build_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/feature/add_product/presntation/manger/add_product_cubit.dart';
import 'package:fruit_dashboard/feature/add_product/presntation/widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add_product_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          productsRepo: getIt<ProductsRepo>(),
          imagesRepo: getIt<ImagesRepo>(),
        ),
        child: const AddProductViewBodyBlocBuilder(),
      ),
    );
  }
}
