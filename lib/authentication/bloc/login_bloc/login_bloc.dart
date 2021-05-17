import 'package:bloc/bloc.dart';
import 'package:dartcompiler/authentication/bloc/login_bloc/login_event.dart';
import 'package:dartcompiler/authentication/bloc/login_bloc/login_state.dart';
import 'package:dartcompiler/authentication/repositories/user_repository.dart';

class UserLoginBloc extends Bloc<LoginEvent, LoginState> {
  UserLoginBloc() : super(UserLoginInitialState()) {
    userRepository = UserRepository();
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
