import 'package:bloc/bloc.dart';
import '../../repositories/user_repository.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class UserRegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  UserRegistrationBloc() : super(UserRegistrationInitialState()) {
    userRepository = UserRepository.getInstance;
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
