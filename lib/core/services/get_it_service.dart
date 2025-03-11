import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruit_dashboard/core/services/data_service.dart';
import 'package:fruit_dashboard/core/services/fire_storage.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/services/supabase_stoarge.dart';
import 'package:fruit_dashboard/feature/order/data/repos/orders_repo_impl.dart';
import 'package:fruit_dashboard/feature/order/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getIt<StorageService>()),
  );

  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(databaseService: FireStoreService()),
  );
}
