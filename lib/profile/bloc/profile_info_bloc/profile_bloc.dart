import 'package:bloc/bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc() : super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(event) async* {
    yield ProfileInitialState();
  }

}