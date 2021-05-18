import 'package:equatable/equatable.dart';
import '../../model/user_model.dart';

abstract class RegistrationState extends Equatable{}

class UserRegistrationInitialState extends RegistrationState{
  @override
  List<Object?> get props => [];
}

class UserRegistrationLoadingState extends RegistrationState{
  @override
  List<Object?> get props => [];
}

class UserRegistrationSuccessState extends RegistrationState{

  UserRegistrationSuccessState({required this.currentUser});
  final User currentUser;

  @override
  List<Object?> get props => [];
}
class UserRegistrationFailureState extends RegistrationState{
  UserRegistrationFailureState({required this.message});
  
  final String message;
  @override
  List<Object?> get props => [];
}
