import 'package:dartcompiler/profile/models/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{}

class UserLoginInitialState extends LoginState{
  @override
  List<Object?> get props => [];
}

class UserLoginLoadingState extends LoginState{
  @override
  List<Object?> get props => [];
}

class UserLoginSuccessState extends LoginState{

  UserLoginSuccessState({required this.currentUser});
  final UserProfile currentUser;

  @override
  List<Object?> get props => [];
}
class UserLoginFailureState extends LoginState{
  UserLoginFailureState({required this.message});
  
  final String message;
  @override
  List<Object?> get props => [];
}
