import 'package:equatable/equatable.dart';

abstract class PasswordResetEvent extends Equatable{}

class ResetPasswordButtonPressed extends PasswordResetEvent{

  ResetPasswordButtonPressed({required this.email});
  
  final String email;

  @override
  List<Object?> get props => [email];
}

class ResetPasswordResetStateEvent extends PasswordResetEvent{

  @override
  List<Object?> get props => [];
}