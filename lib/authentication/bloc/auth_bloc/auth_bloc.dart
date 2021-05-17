import 'package:dartcompiler/authentication/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    userRepository = UserRepository();
  }

  late UserRepository userRepository;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (!isSignedIn) {
          var user = userRepository.currentUser!;
          yield AuthenticatedState(user: user);
        } else {
          yield UnAuthenticatedState();
        }
      } catch (e) {
        yield UnAuthenticatedState();
      }
    } else if (event is UserLogoutButtonPressedEvent) {
      yield LogoutLoadingState();
      try {
        await userRepository.signOut();
        yield UnAuthenticatedState();
      } catch (e) {
        yield LogoutFailedState(
          message: e.toString(),
        );
      }
    }
  }
}
