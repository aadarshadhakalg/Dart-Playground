import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartcompiler/global/services/image_picker.dart';
import 'package:dartcompiler/profile/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_photo_event.dart';
part 'profile_photo_state.dart';

class ProfilePhotoBloc extends Bloc<ProfilePhotoEvent, ProfilePhotoState> {
  ProfilePhotoBloc() : super(ProfilePhotoInitial()) {
    profileRepository = ProfileRepository.getInstance;
  }

  late final ProfileRepository profileRepository;

  @override
  Stream<ProfilePhotoState> mapEventToState(
    ProfilePhotoEvent event,
  ) async* {
    if (event is ProfilePhotoUploadButtonPressedEvent) {
      try {
        var pickedImage = await ImagePickerService.getInstance.getImage();
        yield ProfilePhotoPickedState(pickedImage: pickedImage.path);
        try {
          await profileRepository.updateUserPhoto(pickedImage.path);
          await profileRepository.fetchUserDetail();
          yield ProfilePhotoUploadSuccessState(
            message: 'Profile Picture Updated',
          );
          await Future.delayed(const Duration(seconds: 1));
          yield ProfilePhotoInitial();
        } catch (e) {
          yield ProfilePhotoUploadFailureState(message: e.toString());
          await Future.delayed(const Duration(seconds: 1));
          yield ProfilePhotoInitial();
        }
      } catch (e) {
        yield ProfilePhotoUploadFailureState(message: e.toString());
        await Future.delayed(const Duration(seconds: 1));
          yield ProfilePhotoInitial();
      }
    }
  }
}
