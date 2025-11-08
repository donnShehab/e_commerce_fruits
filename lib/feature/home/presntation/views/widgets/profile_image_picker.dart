// import 'dart:io';
// import 'package:e_coomerce_fruit/core/helper_functions/user_profile_helper.dart';
// import 'package:e_coomerce_fruit/core/repos/images_repo/images_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ProfileImagePicker {
//   final ImagesRepo imagesRepo;

//   ProfileImagePicker(this.imagesRepo);

//   Future<void> pickAndUploadImage(BuildContext context) async {
//     final ImagePicker picker = ImagePicker();

//     final XFile? pickedFile = await picker.pickImage(
//       source: ImageSource.gallery, // يمكن تغييره لكاميرا ImageSource.camera
//       imageQuality: 80,
//     );

//     if (pickedFile == null) return;

//     File file = File(pickedFile.path);
//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId == null) return;

//     final result = await imagesRepo.uploadUserProfileImage(file, userId);

//     result.fold(
//       (failure) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(failure.message)));
//       },
//       (imageUrl) async {
//         await updateUserProfileImage(imageUrl);
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text('تم تحديث الصورة بنجاح')));
//       },
//     );
//   }
// }
