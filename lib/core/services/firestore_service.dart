import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // add data to firestore
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
     String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
  await firestore.collection(path).add(data);
}
  }
// get data from firestore
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }
  // check if document exists
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
