part of 'profile_photo_bloc.dart';

abstract class ProfilePhotoState extends Equatable {}

class ProfilePhotoInitial extends ProfilePhotoState {
  ProfilePhotoInitial({required this.currentImage});
  final String? currentImage;

  @override
  List<Object?> get props => [currentImage];
}

class ProfilePhotoPickedState extends ProfilePhotoState {
  ProfilePhotoPickedState({required this.pickedImage});

  final String? pickedImage;

  @override
  List<Object?> get props => [];
}

class ProfilePhotoUploadingState extends ProfilePhotoState {
  @override
  List<Object?> get props => [];
}

class ProfilePhotoUploadFailureState extends ProfilePhotoState {
  @override
  List<Object> get props => [];
}

class ProfilePhotoUploadingSuccessState extends ProfilePhotoState {
  @override
  List<Object> get props => [];
}
