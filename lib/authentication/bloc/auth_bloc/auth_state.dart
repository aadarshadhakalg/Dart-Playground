import 'package:equatable/equatable.dart';
import '../../model/user_model.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  AuthenticatedState({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LogoutLoadingState extends AuthState{
  @override
  List<Object?> get props => [];
}

class LogoutFailedState extends AuthState{
  LogoutFailedState({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];

}