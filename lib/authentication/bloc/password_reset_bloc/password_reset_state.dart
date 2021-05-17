import 'package:equatable/equatable.dart';

abstract class PasswordResetState extends Equatable{}

class PasswordResetInitialState extends PasswordResetState{
  @override
  List<Object?> get props => [];
}

class PasswordResetLinkSendLoadingState extends PasswordResetState{
  @override
  List<Object?> get props => [];
}

class PasswordResetLinkSendSuccessState extends PasswordResetState{
  PasswordResetLinkSendSuccessState({required this.message});
  
  final String message;


  @override
  List<Object?> get props => [message];
}

class PasswordResetLinkSendFailureState extends PasswordResetState{
  PasswordResetLinkSendFailureState({required this.message});
  
  final String message;

  @override
  List<Object?> get props => [message];  
}