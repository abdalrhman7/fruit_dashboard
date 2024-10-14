import 'package:bloc/bloc.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_dashboard/feature/add_product/domain/entity/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({ required this.imagesRepo, required this.productsRepo})
      : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);

    result.fold(
      (f) {
        emit(AddProductFailure(errMessage: f.message));
      },
      (url) async {
        print('+++++++++++++++++++++');
        print(url);
        print('+++++++++++++++++++++');
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(AddProductFailure(errMessage: f.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
