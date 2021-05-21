import 'package:bloc/bloc.dart';
import 'package:dartcompiler/profile/repository/profile_repository.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc() : super(ProfileInitialState()){
    profileRepository = ProfileRepository.getInstance;
  }

  late final ProfileRepository profileRepository ;

  @override
  Stream<ProfileState> mapEventToState(event) async* {
   if(event is EditProfileButtonPressedEvent){
     yield ProfileEditingState();
   }else if(event is SaveProfileButtonPressedEvent){
     yield ProfileSubmitLoadingState();
     try{
       yield ProfileSubmitLoadingState();
     await profileRepository.updateUserInfo(event.name);
     yield ProfileSubmitSuccessState(message: 'Edited Profile Successfully.');
     }catch(e){
       yield ProfileSubmitFailureState(message: e.toString());
     }
   }
  }

}