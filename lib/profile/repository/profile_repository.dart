import 'package:appwrite/appwrite.dart';
import 'package:dartcompiler/authentication/repositories/user_repository.dart';
import 'package:dartcompiler/global/res/appwrite_constants.dart';
import 'package:dartcompiler/global/services/appwrite.dart';
import 'package:dartcompiler/profile/models/profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileRepository {
  ProfileRepository._internal();
  static ProfileRepository? _instance;
  static ProfileRepository get getInstance =>
      _instance ??= ProfileRepository._internal();

  UserProfile? currentUserProfile;
  final UserRepository _userRepository = UserRepository.getInstance;
  final Database _database = AppwriteModules.getModules.database;

  Future<void> createUserProfile(UserProfile profile) async {
    try {
      var response = await _database.createDocument(
        collectionId: AppwriteConstants.profileCollectionId,
        data: profile.toMap(),
        read: ['user:${profile.uid}'],
        write: ['user:${profile.uid}'],
      );
      await fetchUserDetail();
    } on AppwriteException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserProfile?> fetchUserDetail() async {
    try {
      var response = await _database.listDocuments(
        collectionId: AppwriteConstants.profileCollectionId,
        filters: ['uid=${_userRepository.currentUser!.id}'],
      );

      if (response.statusCode == 200) {
        if (response.data['sum'] > 0) {
          currentUserProfile =
              UserProfile.fromMap(response.data['documents'][0]);
        } else {
          throw Exception('User Profile not found');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }

    return currentUserProfile;
  }
}
