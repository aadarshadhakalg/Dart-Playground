import 'package:dartcompiler/authentication/model/user_model.dart';
import 'package:equatable/equatable.dart';

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
