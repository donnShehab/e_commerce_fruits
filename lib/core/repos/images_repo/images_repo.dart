import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage(File image);
  Future<Either<Failure, String>> uploadUserProfileImage(
    File image,
    String userId,
  );
}
