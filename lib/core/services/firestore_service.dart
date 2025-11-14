import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_coomerce_fruit/core/services/database_service.dart';

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
  // @override
  // Future<dynamic> getData({
  //   required String path,
  //   String? documentId,
  //   Map<String, dynamic>? query,
  // }) async {
  //   if (documentId != null) {
  //     var data = await firestore.collection(path).doc(documentId).get();
  //     return data.data();
  //   } else {
  //     Query<Map<String, dynamic>> data = firestore.collection(path);
  //     if (query != null) {
  //       if (query['orderBy'] != null) {
  //         var orderByField = query['orderBy'];
  //         var descending = query['descending'];
  //         data = data.orderBy(orderByField, descending: descending);
  //       }
  //       if (query['limit'] != null) {
  //         var limit = query['limit'];
  //         data = data.limit(limit);
  //       }
  //     }
  //     var result = await data.get();
  //     return result.docs.map((e) => e.data()).toList();
  //   }
  // }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    try {
      print('📡 Fetching data from Firestore path: $path');

      if (documentId != null) {
        var data = await firestore.collection(path).doc(documentId).get();
        print('✅ Got single document: ${data.data()}');
        return data.data();
      } else {
        Query<Map<String, dynamic>> data = firestore.collection(path);

        if (query != null) {
          if (query['orderBy'] != null) {
            var orderByField = query['orderBy'];
            var descending = query['descending'] ?? false;
            print(
              '🔽 Applying orderBy: $orderByField (descending: $descending)',
            );
            data = data.orderBy(orderByField, descending: descending);
          }
          if (query['limit'] != null) {
            var limit = query['limit'];
            print('🔢 Applying limit: $limit');
            data = data.limit(limit);
          }
        }

        var result = await data.get();
        print('✅ Firestore returned ${result.docs.length} documents');

        for (var doc in result.docs) {
          print('📄 Doc ID: ${doc.id}, data: ${doc.data()}');
        }

        return result.docs.map((e) => e.data()).toList();
      }
    } catch (e, stack) {
      print('🔥 FirestoreService.getData ERROR: $e');
      print(stack);
      rethrow;
    }
  }

  // check if document exists
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  // استعلام للبحث عن بيانات بناءً على شرط (مثل رقم الهاتف)
  Future<List<Map<String, dynamic>>> getDataWhere({
    required String path,

    required Map<String, dynamic> query, // مثال: {'phoneNumber': '+1234567890'}
  }) async {
    try {
      print('🔍 البحث في Firestore عن: $query في المسار: $path');
      Query<Map<String, dynamic>> firestoreQuery = firestore.collection(path);

      // تطبيق الشرط (يمكن توسيعها لشروط متعددة إذا لزم الأمر)

      query.forEach((key, value) {
        firestoreQuery = firestoreQuery.where(key, isEqualTo: value);
      });

      QuerySnapshot snapshot = await firestoreQuery.get();
      List<Map<String, dynamic>> results = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      print('✅ تم العثور على ${results.length} نتيجة');
      return results;
    } catch (e) {
      print('❌ خطأ في FirestoreService.getDataWhere: $e');
      throw Exception('فشل في استرجاع البيانات: $e');
    }
  }
  
}
