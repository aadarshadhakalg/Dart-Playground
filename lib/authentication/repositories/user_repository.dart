import 'package:appwrite/appwrite.dart';
import 'package:dartcompiler/authentication/model/user_model.dart';
import 'package:dartcompiler/global/res/app_constants.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  UserRepository._internal() {
    client = Client()
      ..setEndpoint(AppConstant.endpoint)
      ..setProject(AppConstant.projectId).setSelfSigned();
    account = Account(client);
  }

  static UserRepository get getInstance =>
      _instance ??= UserRepository._internal();

  static UserRepository? _instance;
  late final Client client;
  late final Account account;
  User? currentUser;

  Future createUser(String email, String password, String name) async {
    try {
      await account.create(
        email: email,
        password: password,
        name: name,
      );
      await account.createSession(email: email, password: password);
      await account.createVerification(
          url: 'https://dartcompiler.aadarshadhakal.com.np/verify/');
      await getCurrentUser();
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future loginUser(String email, String password) async {
    try {
      await account.createSession(email: email, password: password);
      await getCurrentUser();
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }

  Future resetPassword(String email) async {
    try {
      await account.createRecovery(
          email: email,
          url: 'https://dartcompiler.aadarshadhakal.com.np/reset/');
    } on AppwriteException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future signOut() async {
    try {
      await account.deleteSessions();
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> isSignedIn() async {
    try {
      var result = await account.get();
      if (result.statusCode == 200) {
        currentUser = User.fromMap(result.data);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
    var result = await account.get();

    if (result.statusCode == 200) {
      print(result.data);
      currentUser = User.fromMap(result.data);
    }

    return currentUser;
  }

  Future verifyEmail() async {
    await account.createVerification(
        url: 'https://dartcompiler.aadarshadhakal.com.np/verify');
  }
}
