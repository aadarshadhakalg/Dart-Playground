import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_photo_event.dart';
part 'profile_photo_state.dart';

class ProfilePhotoBloc extends Bloc<ProfilePhotoEvent, ProfilePhotoState> {
  ProfilePhotoBloc() : super(ProfilePhotoInitial(currentImage: ''));

  @override
  Stream<ProfilePhotoState> mapEventToState(
    ProfilePhotoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
