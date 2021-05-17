import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressedEvent extends LoginEvent {

  LoginButtonPressedEvent(
      {required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email,password];
}
