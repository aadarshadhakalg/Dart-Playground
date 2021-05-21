part of 'profile_photo_bloc.dart';

abstract class ProfilePhotoState extends Equatable {}

class ProfilePhotoInitial extends ProfilePhotoState {
  @override
  List<Object?> get props => [];
}

class ProfilePhotoPickedState extends ProfilePhotoState {
  ProfilePhotoPickedState({required this.pickedImage});

  final String pickedImage;

  @override
  List<Object?> get props => [];
}

class ProfilePhotoUploadFailureState extends ProfilePhotoState {
  ProfilePhotoUploadFailureState({required this.message});
  final String message;

  @override
  List<Object> get props => [];
}

class ProfilePhotoUploadSuccessState extends ProfilePhotoState {
  ProfilePhotoUploadSuccessState(
      {required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
