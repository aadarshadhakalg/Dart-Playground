import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/user_repository.dart';
import 'password_reset_event.dart';
import 'password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  PasswordResetBloc() : super(PasswordResetInitialState()) {
    userRepository = UserRepository.getInstance;
  }

  late final UserRepository userRepository;

  @override
  Stream<PasswordResetState> mapEventToState(PasswordResetEvent event) async* {
    if (event is ResetPasswordButtonPressed) {
      yield PasswordResetLinkSendLoadingState();
      try {
        await userRepository.resetPassword(event.email);
        yield PasswordResetLinkSendSuccessState(
            message:
                '''
Password reset link has been sent to ${event.email}. Please check you inbox to proceed further.''');
      } catch (e) {
        yield PasswordResetLinkSendFailureState(message: e.toString());
      }
    }else if(event is ResetPasswordResetStateEvent){
      print('object');
      yield PasswordResetInitialState();
    }
  }
}
