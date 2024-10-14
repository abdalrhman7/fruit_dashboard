import 'dart:io';

import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ImagesRepo {
  Future<Either<Failures, String>> uploadImage(File image);
}