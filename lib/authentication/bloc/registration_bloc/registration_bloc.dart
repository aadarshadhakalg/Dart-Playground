import 'package:bloc/bloc.dart';
import 'package:dartcompiler/home/repositories/function_collection_repository.dart';
import 'package:dartcompiler/home/repositories/functions_repositories.dart';
import '../../repositories/user_repository.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class UserRegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  UserRegistrationBloc() : super(UserRegistrationInitialState()) {
    userRepository = UserRepository.getInstance;
    functionsRepository = FunctionsRepository.getInstance;
    functionCollectionRepository = FunctionCollectionRepository.getInstance;
  }

  late UserRepository userRepository;
  late FunctionsRepository functionsRepository;
  late FunctionCollectionRepository functionCollectionRepository;

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is SignupButtonPressedEvent) {
      yield UserRegistrationLoadingState();
      try {
        await userRepository.createUser(
            event.email, event.password, event.name);
        var fid = await functionsRepository.createFunctions(
          userRepository.currentUser!.name,
          ['*', 'user:${userRepository.currentUser!.id}'],
          'dart-2.10',
        );
        print(fid);
        
        await functionCollectionRepository.addCollection(
            userRepository.currentUser!.id, fid!);
        print('reached here');
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
