import 'package:bloc/bloc.dart';
import 'package:dartcompiler/authentication/bloc/registration_bloc/registration_event.dart';
import 'package:dartcompiler/authentication/bloc/registration_bloc/registration_state.dart';
import 'package:dartcompiler/authentication/repositories/user_repository.dart';

class UserRegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  UserRegistrationBloc() : super(UserRegistrationInitialState()) {
    userRepository = UserRepository();
  }

  late UserRepository userRepository;

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is SignupButtonPressedEvent) {
      yield UserRegistrationLoadingState();
      try {
        await userRepository.createUser(
            event.email, event.password, event.name);
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
