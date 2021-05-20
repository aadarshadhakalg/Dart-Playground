import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileEditingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSubmitLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSubmitSuccessState extends ProfileState {
  ProfileSubmitSuccessState({required this.message});
  final String? message;

  @override
  List<Object?> get props => [];
}

class ProfileSubmitFailureState extends ProfileState {
  ProfileSubmitFailureState({required this.message});
  final String? message;

  @override
  List<Object?> get props => [];
}
