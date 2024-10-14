import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/helper_function/build_error_bar.dart';
import 'package:fruit_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruit_dashboard/feature/add_product/presntation/manger/add_product_cubit.dart';
import 'add_product_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildSnackBar(context, 'Product Added Successfully');
        }
        if (state is AddProductFailure) {
          buildSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
