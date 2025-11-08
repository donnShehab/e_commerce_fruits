import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(File file, String path) async {
    try {
      final Reference ref = _storage
          .ref()
          .child(path)
          .child(DateTime.now().millisecondsSinceEpoch.toString());

      final UploadTask uploadTask = ref.putFile(file);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      print('✅ Upload successful, URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      print('❌ Upload failed: $e');
      throw Exception('Failed to upload image');
    }
  }
}
