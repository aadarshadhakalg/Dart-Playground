part of 'profile_photo_bloc.dart';

abstract class ProfilePhotoEvent extends Equatable {
  const ProfilePhotoEvent();

  @override
  List<Object> get props => [];
}


class ProfilePhotoUploadButtonPressedEvent extends ProfilePhotoEvent{}