import 'package:bloc/bloc.dart';
import 'package:dartcompiler/profile/repository/profile_repository.dart';
import '../../repositories/user_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class UserLoginBloc extends Bloc<LoginEvent, LoginState> {
  UserLoginBloc() : super(UserLoginInitialState()) {
    userRepository = UserRepository.getInstance;
    profileRepository = ProfileRepository.getInstance;
  }

  late UserRepository userRepository;
  late ProfileRepository profileRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield UserLoginLoadingState();
      try {
        await userRepository.loginUser(event.email, event.password);
        await profileRepository.fetchUserDetail();
        yield UserLoginSuccessState(
          currentUser: profileRepository.currentUserProfile!,
        );
      } catch (e) {
        yield UserLoginFailureState(
          message: e.toString(),
        );
      }
    }
  }
}
