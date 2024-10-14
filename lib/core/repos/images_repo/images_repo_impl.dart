import 'dart:io';

import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoint.dart';

import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      String url =
      await storageService.uploadImage(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to uoload image'),
      );
    }
  }
}
