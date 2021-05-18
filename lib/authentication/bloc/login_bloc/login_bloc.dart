import 'package:bloc/bloc.dart';
import '../../repositories/user_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class UserLoginBloc extends Bloc<LoginEvent, LoginState> {
  UserLoginBloc() : super(UserLoginInitialState()) {
    userRepository = UserRepository.getInstance;
  }

  late UserRepository userRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield UserLoginLoadingState();
      try {
        await userRepository.loginUser(
            event.email, event.password);
        yield UserLoginSuccessState(
            currentUser: userRepository.currentUser!);
      } catch (e) {
        yield UserLoginFailureState(
          message: e.toString(),
        );
      }
    }
  }
}
