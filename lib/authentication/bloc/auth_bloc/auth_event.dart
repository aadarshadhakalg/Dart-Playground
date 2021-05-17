import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable{} 

class AppStartedEvent extends AuthEvent{
  @override
  List<Object?> get props => [];
}