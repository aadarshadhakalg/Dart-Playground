import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {}

class SignupButtonPressedEvent extends RegistrationEvent {

  SignupButtonPressedEvent(
      {required this.email, required this.name, required this.password});

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => throw UnimplementedError();
}
