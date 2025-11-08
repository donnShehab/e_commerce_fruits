abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
  // إضافة getDataWhere للبحث بناءً على شروط (مثل رقم الهاتف)

  Future<List<Map<String, dynamic>>> getDataWhere({
    required String path,
    required Map<String, dynamic> query,
  });
}
