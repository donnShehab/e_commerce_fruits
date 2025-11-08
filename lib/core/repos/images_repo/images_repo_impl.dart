import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';
import 'package:e_coomerce_fruit/core/services/storage_service.dart';
import 'package:e_coomerce_fruit/core/utils/backend_endpoint.dart';

import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        image,
        BackendEndpoint.images,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to upload image'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadUserProfileImage(
    File image,
    String userId,
  ) async {
    try {
      String path = 'user_profiles/$userId/profile.jpg';
      String url = await storageService.uploadFile(image, path);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure(message: 'Failed to upload user profile image'),
      );
    }
  }
}
