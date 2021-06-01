import 'package:appwrite/appwrite.dart';
import 'package:dartcompiler/global/res/appwrite_constants.dart';
import 'package:dartcompiler/global/services/appwrite.dart';

class FunctionCollectionRepository {
  FunctionCollectionRepository._internal();

  static FunctionCollectionRepository? _instance;

  static FunctionCollectionRepository get getInstance =>
      _instance ??= FunctionCollectionRepository._internal();

  final Database _database = AppwriteModules.getModules.database;

  Future<void> addCollection(String uid, String fid) async {
    try {
      var result = await _database.createDocument(
        collectionId: AppwriteConstants.functionsCollectionId,
        data: {
          'uid': uid,
          'fid': fid,
        },
        read: const ['*'],
        write: const ['*'],
      );
    } on AppwriteException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<String?> getFunctionId(String uid) async {
    String? fid;

    try {
      var result = await _database.listDocuments(
        collectionId: AppwriteConstants.functionsCollectionId,
        filters: ['uid=$uid'],
      );
      
      fid = result.data['documents'][0]['fid'];
    } on AppwriteException catch (e) {
      print(e.message);
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
    return fid;
  }
}
