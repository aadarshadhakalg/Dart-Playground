import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dartcompiler/global/services/appwrite_server.dart';

class FunctionsRepository {
  FunctionsRepository._internal() {
    functions = AppwriteServerModules.getModules.functions;
  }
  static FunctionsRepository? _instance;
  static FunctionsRepository get getInstance =>
      _instance ??= FunctionsRepository._internal();

  late final Functions functions;

  Future<String?> createFunctions(
      String name, List<String> execute, String env) async {
    String? functionid;

    try {
      var result =
          await functions.create(name: name, execute: execute, env: env);
      functionid = result.data['\$id'];
    } on AppwriteException catch (e) {
      print(e.message! + 'code' + e.code.toString());
      throw Exception(e.message);
    }
    return functionid;
  }

  Future<void> deployTag(String fid, String command, String path) async {
    try {
      var result = await functions.createTag(
          functionId: fid,
          command: command,
          code: await MultipartFile.fromFile(path));
      await functions.updateTag(functionId: fid, tag: result.data['\$id']);
    } on AppwriteException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> getResult(String fid) async {
    try {} on AppwriteException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> executeFunctions(String fid) async {
    String? eid;
    try {
      var result = await functions.createExecution(functionId: fid);
      print(result.data);
      eid = result.data['\$id'];
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    }

    return eid;
  }

  Future<String?> getExecution(String fid, String eid) async {
    String? message;

    try {
      var result =
          await functions.getExecution(functionId: fid, executionId: eid);

      if (result.data['status'] == 'waiting') {
        await Future.delayed(const Duration(seconds: 1), () async {
          message = await getExecution(fid, eid);
        });
      } else if (result.data['status'] == 'completed') {
        message = result.data['stdout'];
      } else {
        message = result.data['stderr'];
      }
      print(result.data);
    } on AppwriteException catch (e) {
      message = 'Error ${e.message}';
    } catch (e) {
      message = 'Error $e';
    }

    return message;
  }
}
