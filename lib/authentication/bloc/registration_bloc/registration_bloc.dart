import 'package:bloc/bloc.dart';
import 'package:dartcompiler/profile/models/profile_model.dart';
import 'package:dartcompiler/profile/repository/profile_repository.dart';
import '../../repositories/user_repository.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class UserRegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  UserRegistrationBloc() : super(UserRegistrationInitialState()) {
    userRepository = UserRepository.getInstance;
    profileRepository = ProfileRepository.getInstance;
  }

  late UserRepository userRepository;
  late ProfileRepository profileRepository;

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is SignupButtonPressedEvent) {
      yield UserRegistrationLoadingState();
      try {
        await userRepository.createUser(
            event.email, event.password, event.name);
        await profileRepository.createUserProfile(
          UserProfile(
            uid: userRepository.currentUser!.id,
            name: userRepository.currentUser!.name,
            email: userRepository.currentUser!.email,
            photo: 'http://dartcompiler.aadarshadhakal.com.np/images/photo.png',
          ),
        );
        yield UserRegistrationSuccessState(
            currentUser: userRepository.currentUser!);
      } catch (e) {
        yield UserRegistrationFailureState(
          message: e.toString(),
        );
      }
    }
  }
}
